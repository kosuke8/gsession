package jp.groupsession.v2.fil.fil010;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDateUtil;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.fil.FilCommonBiz;
import jp.groupsession.v2.fil.GSConstFile;
import jp.groupsession.v2.fil.dao.FileAconfDao;
import jp.groupsession.v2.fil.dao.FileCabinetDao;
import jp.groupsession.v2.fil.dao.FileCallConfDao;
import jp.groupsession.v2.fil.dao.FileCallDataDao;
import jp.groupsession.v2.fil.dao.FileDao;
import jp.groupsession.v2.fil.dao.FilePcbOwnerDao;
import jp.groupsession.v2.fil.dao.FileShortcutConfDao;
import jp.groupsession.v2.fil.dao.FileUconfDao;
import jp.groupsession.v2.fil.model.FileAconfModel;
import jp.groupsession.v2.fil.model.FileDirectoryModel;
import jp.groupsession.v2.fil.model.FileUconfModel;

/**
 * キャビネット一覧で使用するビジネスロジッククラス
 * @author JTS
 */
public class Fil010Biz {
    /** 備考改行区分 改行なし */
    public static final int FIL_CMT_BR_NO = 0;
    /** 備考改行区分 改行あり */
    public static final int FIL_CMT_BR_YES = 1;

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Fil010Biz.class);
    /** リクエスト情報 */
    private RequestModel reqMdl__ = null;
    /** 管理者設定情報 */
    private FileAconfModel aconfMdl__ = null;

    /**
     * <p>Set Connection
     * @param reqMdl RequestModel
     */
    public Fil010Biz(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }

    /**
     * <br>初期表示画面情報を取得します
     * @param paramMdl Fil010ParamModel
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    public void setInitData(Fil010ParamModel paramMdl, Connection con) throws SQLException {

        //セッション情報を取得
        HttpSession session = reqMdl__.getSession();
        BaseUserModel usModel =
            (BaseUserModel) session.getAttribute(GSConst.SESSION_KEY);
        int sessionUsrSid = usModel.getUsrsid(); //セッションユーザSID
        FilCommonBiz cmnBiz = new FilCommonBiz(con, reqMdl__);

        //画面制御設定
        CommonBiz  commonBiz = new CommonBiz();
        boolean adminUser = commonBiz.isPluginAdmin(con, usModel, GSConstFile.PLUGIN_ID_FILE);

        if (adminUser) {
            paramMdl.setFil010DspAdminConfBtn(GSConstFile.DSP_KBN_ON);
            paramMdl.setFil010DspCabinetAddBtn(GSConstFile.DSP_KBN_ON);
        } else if (cmnBiz.isCanCreateCabinetUser(usModel, con)) {
            paramMdl.setFil010DspCabinetAddBtn(GSConstFile.DSP_KBN_ON);
        }

        //セッションユーザが個人キャビネットの使用を許可されているか判定
        FileAconfModel aconfMdl = __getFileAconf(con);

        //マイキャビネットを取得
        FileCabinetDspModel myCabMdl = null;
        if (cmnBiz.isCanMyCabinet(con, usModel.getUsrsid())) {
            FileCabinetDao fcbDao = new FileCabinetDao(con);
            myCabMdl = fcbDao.getMyCabinet(usModel.getUsrsid());
            if (myCabMdl != null) {
                myCabMdl.setFileAconf(aconfMdl); // 個人キャビネット情報に管理者設定を反映
                __setCabinetExInfo(usModel.getUsrsid(), myCabMdl, con);
                myCabMdl.setAccessIconKbn(GSConstFile.ACCESS_KBN_WRITE);
                paramMdl.setMyCabinet(myCabMdl);
            }
        }

        // 閲覧可能な個人キャビネットが存在するか判定
        int dspPersonalFlg = GSConstFile.NOT_DSP_PERSONAL_CAB;
        ArrayList<FileCabinetDspModel> dspPersonalCabList = null;

        if (myCabMdl != null) {
            // マイキャビネットがある場合常に表示
            dspPersonalFlg = GSConstFile.DSP_PERSONAL_CAB;
        } else if (aconfMdl.getFacPersonalKbn() == GSConstFile.CABINET_PRIVATE_USE) {
            // 個人キャビネットの使用権限ある場合のみ、チェック
            dspPersonalCabList =
                    getAccessCabinetList(usModel, con, true, GSConstFile.CABINET_KBN_PRIVATE);
            if (dspPersonalCabList != null && !dspPersonalCabList.isEmpty()) {
                dspPersonalFlg = GSConstFile.DSP_PERSONAL_CAB;
            }
        }

        int personalFlg = Integer.parseInt(paramMdl.getFil010DspCabinetKbn());
        if (dspPersonalFlg == GSConstFile.NOT_DSP_PERSONAL_CAB) {
            if (personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
                // 個人キャビネット一覧が表示可能かチェック → 表示できない場合は共有キャビネットへ変更
                personalFlg = GSConstFile.CABINET_KBN_PUBLIC;
                paramMdl.setFil010DspCabinetKbn(String.valueOf(personalFlg));
            }
        }

        //アクセス可能なキャビネット一覧を取得
        ArrayList<FileCabinetDspModel> cabinetList = null;
        if (myCabMdl == null && personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
            cabinetList = dspPersonalCabList;
        } else {
            cabinetList = getAccessCabinetList(usModel, con, true, personalFlg);
        }

        // 個人キャビネット表示の際に一覧からマイキャビネットは除外
        if (cabinetList != null && myCabMdl != null
         && personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
            for (FileCabinetDspModel cabinet : cabinetList) {
                if (myCabMdl.getFcbSid() == cabinet.getFcbSid()) {
                    cabinetList.remove(cabinet);
                    break;
                }
            }
        }

        paramMdl.setDspPersonalCabFlg(dspPersonalFlg);
        paramMdl.setMyCabinet(myCabMdl);
        paramMdl.setCabinetList(cabinetList);

        //ショートカット一覧を取得
        paramMdl.setShortcutList(getShortcutInfoList(sessionUsrSid, -1, con));

        //更新通知情報を取得
        paramMdl.setCallList(getCallInfoList(sessionUsrSid, personalFlg, con));

        //管理者設定で個人キャビネットを使用する設定としている場合
        if (aconfMdl.getFacPersonalKbn() == GSConstFile.CABINET_PRIVATE_USE) {
            FilePcbOwnerDao fpoDao = new FilePcbOwnerDao(con);
            List<Integer> authList = fpoDao.getUserSidList();
            //ユーザが個人キャビネットの使用を許可されている場合
            if (authList.contains(new Integer(sessionUsrSid))
                    || aconfMdl.getFacUseKbn() == GSConstFile.CABINET_AUTH_ALL) {
                paramMdl.setPersonalCabAuthFlg(GSConstFile.CABINET_PRIVATE_USE);
            }
        }

        if (paramMdl.getShortcutList().size() == 0 && paramMdl.getCallList().size() == 0) {
            paramMdl.setShortcutCallListFlg(1);
        } else {
            paramMdl.setShortcutCallListFlg(0);
        }
    }

    /**
     * ユーザを指定しアクセス可能なキャビネット一覧を取得します。
     * @param umodel セッションユーザ情報
     * @param con コネクション
     * @param exInfo true:負荷情報を設定 false:キャビネット一覧情報のみを取得
     * @return ret キャビネット一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<FileCabinetDspModel> getAccessCabinetList(BaseUserModel umodel, Connection con,
                                                                boolean exInfo)
    throws SQLException {
        int dspPublic = Integer.parseInt(GSConstFile.DSP_CABINET_PUBLIC);
        return getCabinetList(umodel, con, exInfo, false, dspPublic);
    }

    /**
     * ユーザを指定しアクセス可能なキャビネット一覧を取得します。
     * @param umodel セッションユーザ情報
     * @param con コネクション
     * @param exInfo true:負荷情報を設定 false:キャビネット一覧情報のみを取得
     * @param personalFlg 個人キャビネット判定フラグ 0: 共有キャビネット 1:個人キャビネット
     * @return ret キャビネット一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<FileCabinetDspModel> getAccessCabinetList(BaseUserModel umodel, Connection con,
                                                                boolean exInfo, int personalFlg)
    throws SQLException {
        return getCabinetList(umodel, con, exInfo, false, personalFlg);
    }

    /**
     * ユーザを指定し利用可能なキャビネット一覧を取得します。
     * @param umodel セッションユーザ情報
     * @param con コネクション
     * @param exInfo true:負荷情報を設定 false:キャビネット一覧情報のみを取得
     * @param writeOnly true: 編集可能なキャビネットのみ false: 利用可能なキャビネット
     * @param personalFlg 個人キャビネット判定フラグ 0: 共有キャビネット 1:個人キャビネット
     * @return ret キャビネット一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<FileCabinetDspModel> getCabinetList(BaseUserModel umodel,
            Connection con, boolean exInfo, boolean writeOnly, int personalFlg)
    throws SQLException {

        int userSid = umodel.getUsrsid();
        FileCabinetDao cabDao = new FileCabinetDao(con);
        CommonBiz  commonBiz = new CommonBiz();
        boolean isAdmin = commonBiz.isPluginAdmin(con, umodel, GSConstFile.PLUGIN_ID_FILE);

        ArrayList<FileCabinetDspModel> ret = null;
        //システム管理者権限有の場合、全ての共有キャビネットOK
        if (isAdmin && personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
            //全ての共有キャビネット
            ret = cabDao.getFileCabinetDspModelsAll(personalFlg);
        } else {
            HashMap<Integer, FileCabinetDspModel> map = new HashMap<Integer, FileCabinetDspModel>();

            //キャビネット情報のアクセス権限を制限しないキャビネット情報を取得
            ArrayList<FileCabinetDspModel> freeList
                                               = cabDao.getFreeAccessCabinet(userSid, personalFlg);
            __setMapForCabinetList(map, freeList);

            if (personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
                // 共有キャビネットのみ使用
                //セッション情報のユーザSIDがキャビネット管理者情報になっているキャビネット
                ArrayList<FileCabinetDspModel> admList =
                        cabDao.getAdminCabinet(userSid, personalFlg);
                __setMapForCabinetList(map, admList);

                //ユーザSIDがキャビネットアクセス設定に登録(追加・変更・削除)
                ArrayList<FileCabinetDspModel> usrCanWriteList = cabDao.getCanAccessCabinet(
                        userSid, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE), personalFlg);
                __setMapForCabinetList(map, usrCanWriteList);

                //所属しているグループSIDがキャビネットアクセス設定に登録(追加・変更・削除)
                ArrayList<FileCabinetDspModel> grpCanWriteList = cabDao.getCanAccessGpCabinet(
                        userSid, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE), personalFlg);
                __setMapForCabinetList(map, grpCanWriteList);
            }

            if (!writeOnly) {
                //ユーザSIDがキャビネットアクセス設定に登録(閲覧)
                ArrayList<FileCabinetDspModel> usrCanReadList = cabDao.getCanAccessCabinet(
                        userSid, Integer.parseInt(GSConstFile.ACCESS_KBN_READ), personalFlg);
                __setMapForCabinetList(map, usrCanReadList);

                //所属しているグループSIDがキャビネットアクセス設定に登録(閲覧)
                ArrayList<FileCabinetDspModel> grpCanReadList = cabDao.getCanAccessGpCabinet(
                        userSid, Integer.parseInt(GSConstFile.ACCESS_KBN_READ), personalFlg);
                __setMapForCabinetList(map, grpCanReadList);

                //個人キャビネットのサブディレクトリにアクセス可能なものがあれば許可
                if (personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
                    ArrayList<FileCabinetDspModel> dspList;
                    dspList = cabDao.getFileCabinetDspModels(userSid, GSConstFile.USER_KBN_USER,
                                        personalFlg, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));
                    __setMapForCabinetList(map, dspList);

                    dspList = cabDao.getFileCabinetDspModels(userSid, GSConstFile.USER_KBN_GROUP,
                                        personalFlg, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));
                    __setMapForCabinetList(map, dspList);
                }
            }

            // 個人キャビネットの場合のみキャビネット名をユーザ名へ変更
            if (personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
                // ユーザSID一覧作成
                ArrayList<Integer> usrSids = new ArrayList<Integer>();
                for (Integer cabSid : map.keySet()) {
                    FileCabinetDspModel mdl = map.get(cabSid);
                    mdl.setFileAconf(__getFileAconf(con)); // 共通設定値(管理者設定)を更新
                    usrSids.add(Integer.valueOf(mdl.getFcbOwnerSid())); // キャビネット名更新の為、ユーザSID取得
                }

                // ユーザ名一覧取得
                FileDao filDao = new FileDao(con);
                HashMap<Integer, String> userNameMap = filDao.getUserNameMap(usrSids);

                // キャビネット名を更新
                if (userNameMap.size() > 0) {
                    for (Integer cabSid : map.keySet()) {
                        FileCabinetDspModel mdl = map.get(cabSid);
                        Integer usrSid = Integer.valueOf(mdl.getFcbOwnerSid());
                        if (userNameMap.containsKey(usrSid)) {
                            mdl.setFcbName(userNameMap.get(usrSid));
                        }
                    }
                }
            }

            //ソート順に並べ替え
            ret = __doCabinetSort(map);
        }

        //キャビネット情報に付加情報を追加
        if (exInfo) {
            __setCabinetExInfo(userSid, ret, con);
        }

        return ret;
    }

    /**
     * キャビネットlistをallの順で並び替えたリストを生成します。
     * @param map 並び変え対象配列
     * @return 並び変え済み配列
     */
    private ArrayList<FileCabinetDspModel> __doCabinetSort(
            HashMap<Integer, FileCabinetDspModel> map) {

        /*
        ArrayList<FileCabinetDspModel> ret = new ArrayList<FileCabinetDspModel>();
        for (FileCabinetDspModel bean : all) {
            if (map.containsKey(new Integer(bean.getFcbSid()))) {

                ret.add(map.get(new Integer(bean.getFcbSid())));
            }
        }
        */
        // リスト化
        ArrayList<FileCabinetDspModel> ret = new ArrayList<FileCabinetDspModel>();
        for (Integer key : map.keySet()) {
            ret.add(map.get(key));
        }

        // 昇順で並び替え
        Collections.sort(ret, new Comparator<FileCabinetDspModel>() {
            public int compare(FileCabinetDspModel o1, FileCabinetDspModel o2) {
                return o1.getFcbSort() - o2.getFcbSort();
            }
        });
        return ret;
    }

    /**
     * ディスク使用率やアクセス権限、通知設定情報を付加する
     * @param userSid ユーザSID
     * @param list 表示用キャビネット一覧情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __setCabinetExInfo(
            int userSid, ArrayList<FileCabinetDspModel> list, Connection con)
    throws SQLException {

        for (FileCabinetDspModel bean : list) {
            __setUsedDiskSizeString(bean, con);
            __setCallIconInfo(userSid, bean, con);
            __setRootDirSid(bean, con);
            bean.setDspfcbName(StringUtilHtml.transToHTml(bean.getFcbName()));
            bean.setDspBikoString(StringUtilHtml.transToHTmlPlusAmparsant(bean.getFcbBiko()));

            //コメント改行区分
            if (bean.getDspBikoString().indexOf("<BR>") >= 0
                    || bean.getDspBikoString().indexOf("<br>") >= 0) {
                bean.setDspBikoBrKbn(FIL_CMT_BR_YES);
            } else {
                bean.setDspBikoBrKbn(FIL_CMT_BR_NO);
            }
        }
    }

    /**
     * ディスク使用率やアクセス権限、通知設定情報を付加する
     * @param userSid ユーザSID
     * @param model 表示用キャビネット一覧情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __setCabinetExInfo(
            int userSid, FileCabinetDspModel model, Connection con)
    throws SQLException {

            __setUsedDiskSizeString(model, con);
            __setCallIconInfo(userSid, model, con);
            __setRootDirSid(model, con);
            model.setDspfcbName(StringUtilHtml.transToHTml(model.getFcbName()));
            model.setDspBikoString(StringUtilHtml.transToHTmlPlusAmparsant(model.getFcbBiko()));

            //コメント改行区分
            if (model.getDspBikoString().indexOf("<BR>") >= 0
                    || model.getDspBikoString().indexOf("<br>") >= 0) {
                model.setDspBikoBrKbn(FIL_CMT_BR_YES);
            } else {
                model.setDspBikoBrKbn(FIL_CMT_BR_NO);
            }
    }

    /**
     * キャビネット毎の通知設定アイコン表示情報を設定します
     * @param userSid ユーザSID
     * @param bean FileCabinetDspModel
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __setCallIconInfo(int userSid, FileCabinetDspModel bean, Connection con)
    throws SQLException {

        String callIconKbn = GSConstFile.DSP_KBN_OFF;

        FileCallConfDao dao = new FileCallConfDao(con);
        if (dao.isCabinetCallSetting(bean.getFcbSid(), userSid)) {
            callIconKbn = GSConstFile.DSP_KBN_ON;
        }
        bean.setCallIconKbn(callIconKbn);

    }

    /**
     * キャビネットのRootディレクトリSIDを取得し設定する
     * @param bean FileCabinetDspModel
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __setRootDirSid(FileCabinetDspModel bean, Connection con)
    throws SQLException {
       FilCommonBiz filBiz = new FilCommonBiz(con);
       bean.setRootDirSid(filBiz.getRootDirSid(bean, con));
    }
    /**
     * キャビネット毎のファイルサイズ合計や警告を設定します
     * @param bean FileCabinetDspModel
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __setUsedDiskSizeString(FileCabinetDspModel bean, Connection con)
    throws SQLException {

        if (bean == null) {
            return;
        }
        StringBuilder ret = new StringBuilder();
        String warnKbn = GSConstFile.DSP_KBN_OFF;

        int fcbSid = bean.getFcbSid();
        FileCabinetDao dao = new FileCabinetDao(con);
        BigDecimal sum = dao.getCabinetUsedSize(fcbSid);
        BigDecimal convSum = null;

        //集計値が1MB以上か判定
        if (sum.compareTo(GSConstFile.B_TO_MB) == -1) {
            //BからKBへ変換
            convSum = sum.divide(GSConstFile.KB_TO_MB, 1, RoundingMode.HALF_UP);
            ret.append(StringUtil.toCommaFromBigDecimal(convSum));

            if (bean.getFcbCapaKbn() == GSConstFile.CAPA_KBN_ON) {
                BigDecimal capaSize = new BigDecimal(bean.getFcbCapaSize());
                //MB→KBへ変換
                capaSize = capaSize.multiply(GSConstFile.KB_TO_MB);
                //キャパ制限有り
                ret.append("/" + StringUtil.toCommaFromBigDecimal(capaSize));
                ret.append("KB<br>(");
                if (capaSize.intValue() == 0) {
                    ret.append("-");
                } else {
                    BigDecimal par =  convSum.divide(capaSize, 3, RoundingMode.HALF_UP);
                    BigDecimal persent = par.multiply(new BigDecimal(100));
                    persent = persent.setScale(1, RoundingMode.HALF_UP);
                    ret.append(StringUtil.toCommaFromBigDecimal(persent));
                    if (bean.getFcbCapaWarn() > 0) {
                        if (persent.compareTo(new BigDecimal(bean.getFcbCapaWarn())) > 0) {
                            warnKbn = GSConstFile.DSP_KBN_ON;
                        }
                    }

                }
                ret.append("%)");
            } else {
                //キャパ制限無し
                ret.append("KB");
            }
        } else {
            //BからMBへ変換
            convSum = sum.divide(GSConstFile.B_TO_MB, 1, RoundingMode.HALF_UP);
            ret.append(StringUtil.toCommaFromBigDecimal(convSum));

            if (bean.getFcbCapaKbn() == GSConstFile.CAPA_KBN_ON) {
                BigDecimal capaSize = new BigDecimal(bean.getFcbCapaSize());
                //キャパ制限有り
                ret.append("/" + StringUtil.toCommaFromBigDecimal(capaSize));
                ret.append("MB<br>(");
                if (capaSize.intValue() == 0) {
                    ret.append("-");
                } else {
                    BigDecimal par =  convSum.divide(capaSize, 3, RoundingMode.HALF_UP);
                    BigDecimal persent = par.multiply(new BigDecimal(100));
                    persent = persent.setScale(1, RoundingMode.HALF_UP);
                    ret.append(StringUtil.toCommaFromBigDecimal(persent));
                    if (bean.getFcbCapaWarn() > 0) {
                        if (persent.compareTo(new BigDecimal(bean.getFcbCapaWarn())) > 0) {
                            warnKbn = GSConstFile.DSP_KBN_ON;
                        }
                    }

                }
                ret.append("%)");
            } else {
                //キャパ制限無し
                ret.append("MB");
            }
        }

        bean.setDiskUsedString(ret.toString());
        bean.setDiskUsedWarning(warnKbn);
    }

    /**
     * 配列に格納されたFileCabinetDspModelをHashMapに設定する
     * @param map HashMap
     * @param list FileCabinetDspModelの配列
     */
    private void __setMapForCabinetList(
            HashMap<Integer, FileCabinetDspModel> map, ArrayList<FileCabinetDspModel> list) {

        for (FileCabinetDspModel bean : list) {
            if (map.containsKey(new Integer(bean.getFcbSid()))) {
                if (bean.getAccessIconKbn().equals(GSConstFile.ACCESS_KBN_WRITE)) {
                    map.put(new Integer(bean.getFcbSid()), bean);
                }
            } else {
                map.put(new Integer(bean.getFcbSid()), bean);
            }
        }
    }

    /**
     * ショートカット一覧を取得します
     * @param userSid ユーザSID
     * @param personalFlg 個人キャビネット判定フラグ -1:全て / 0:共有キャビネット / 1:個人キャビネット
     * @param con コネクション
     * @return ショートカット一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<FileLinkSimpleModel> getShortcutInfoList(
            int userSid, int personalFlg, Connection con)
    throws SQLException {
        ArrayList<FileLinkSimpleModel> ret = new ArrayList<FileLinkSimpleModel>();
        FileShortcutConfDao dao = new FileShortcutConfDao(con);

        //ショートカット情報を取得
        ArrayList<FileDirectoryModel> shortCutList = new ArrayList<FileDirectoryModel>();
        if (personalFlg == -1 || personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
            shortCutList.addAll(dao.getShortCutList(userSid, GSConstFile.CABINET_KBN_PUBLIC));
        }
        if (personalFlg == -1 || personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
            shortCutList.addAll(dao.getShortCutList(userSid, GSConstFile.CABINET_KBN_PRIVATE));
        }

        FilCommonBiz filCmnBiz = new FilCommonBiz(con, reqMdl__);
        FileLinkSimpleModel dspModel = null;
        String path = "";
        for (FileDirectoryModel bean : shortCutList) {
            path = filCmnBiz.getDirctoryPath(bean.getFdrSid(), con);
            dspModel = new FileLinkSimpleModel();
            dspModel.setDirectoryFullPathName(path);
            dspModel.setDirectoryKbn(bean.getFdrKbn());
            dspModel.setDirectoryName(bean.getFdrName());
            dspModel.setCabinetSid(bean.getFcbSid());
            dspModel.setDirectorySid(bean.getFdrSid());
            dspModel.setBinSid(bean.getBinSid());
            dspModel.setDirectoryUpdateStr(
                    UDateUtil.getSlashYYMD(bean.getFdrEdate())
                    + " "
                    + UDateUtil.getSeparateHMS(bean.getFdrEdate()));
            ret.add(dspModel);
        }
        return ret;
    }

    /**
     * 更新通知一覧を取得します
     * @param userSid ユーザSID
     * @param personalFlg 個人キャビネット判定フラグ 0:共有キャビネット 1:個人キャビネット
     * @param con コネクション
     * @return 更新通知一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<FileLinkSimpleModel> getCallInfoList(
            int userSid, int personalFlg, Connection con)
    throws SQLException {
        ArrayList<FileLinkSimpleModel> ret = new ArrayList<FileLinkSimpleModel>();

        //共有キャビネット表示時のみ、更新通知一覧を取得
        if (personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
            FileCallDataDao dao = new FileCallDataDao(con);

            //個人設定を取得
            FileUconfDao uconfDao = new FileUconfDao(con);
            FileUconfModel uconfModel = uconfDao.select(userSid);
            int limit = uconfModel.getFucCall();
            int offset = 1;

            //更新通知情報を取得
            ArrayList<FileDirectoryModel> updateList
                            = dao.getUpdateCallData(userSid, offset, limit);

            FilCommonBiz filCmnBiz = new FilCommonBiz(con, reqMdl__);
            FileLinkSimpleModel dspModel = null;
            String path = "";
            for (FileDirectoryModel bean : updateList) {
                path = filCmnBiz.getDirctoryPath(bean.getFdrSid(), con);
                dspModel = new FileLinkSimpleModel();
                dspModel.setDirectoryFullPathName(path);
                dspModel.setDirectoryKbn(bean.getFdrKbn());
                dspModel.setDirectoryName(bean.getFdrName());
                dspModel.setCabinetSid(bean.getFcbSid());
                dspModel.setDirectorySid(bean.getFdrSid());
                dspModel.setDirectoryUpdateStr(
                        UDateUtil.getSlashYYMD(bean.getFdrEdate())
                        + " "
                        + UDateUtil.getSeparateHMS(bean.getFdrEdate()));
                dspModel.setFcbMark(bean.getFcbMark());
                ret.add(dspModel);
            }
        }
        return ret;
    }

    /**
     * <br>[機  能] 削除するショートカットのタイトルを取得する
     * <br>[解  説] 複数存在する場合は改行を挿入する
     * <br>[備  考]
     * @param paramMdl Fil010ParamModel
     * @param userSid ユーザSID
     * @param con コネクション
     * @return String 削除するショートカット名称
     * @throws SQLException SQL実行例外
     */
    public String getDeleteShortName(Fil010ParamModel paramMdl, int userSid, Connection con)
    throws SQLException {

        //ショートカット名称取得
        StringBuilder deleteShort = new StringBuilder();
        List <FileDirectoryModel> fdList = __getConfList(paramMdl, userSid, con);

        FilCommonBiz filCmnBiz = new FilCommonBiz(con, reqMdl__);

        for (int i = 0; i < fdList.size(); i++) {
            FileDirectoryModel model = fdList.get(i);
            //フルパスで名称を取得
            deleteShort.append(filCmnBiz.getDirctoryPath(model.getFdrSid(), con));

            //改行を挿入
            if (i < fdList.size() - 1) {
                deleteShort.append(GSConst.NEW_LINE_STR);
            }
        }
        return deleteShort.toString();
    }

    /**
     * <br>[機  能] 選択したディレクトリSID(複数)からショートカット情報を取得
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Fil010ParamModel
     * @param userSid ユーザSID
     * @param con コネクション
     * @return ショートカット情報
     * @throws SQLException SQL実行例外
     */
    private List<FileDirectoryModel> __getConfList(
            Fil010ParamModel paramMdl, int userSid, Connection con)
    throws SQLException {

        String[] delInfSid = paramMdl.getFil010SelectDelLink();
        List<FileDirectoryModel> ret = new ArrayList<FileDirectoryModel>();

        for (int i = 0; i < delInfSid.length; i++) {
            //SID
            int shortSid = Integer.parseInt(delInfSid[i]);
            FileShortcutConfDao dao = new FileShortcutConfDao(con);
            ret.add(dao.getShortCutInfo(userSid, shortSid));
        }
        return ret;
    }

    /**
     * <br>[機  能] 削除実行
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Fil010ParamModel
     * @param userSid ユーザSID
     * @param con コネクション
     * @throws SQLException SQL実行例外
     */
    public void deleteShort(Fil010ParamModel paramMdl, int userSid, Connection con)
    throws SQLException {

        String[] delInfSid = paramMdl.getFil010SelectDelLink();

        try {
            con.setAutoCommit(false);
            FileShortcutConfDao dao = new FileShortcutConfDao(con);

            for (int i = 0; i < delInfSid.length; i++) {
                //SID
                int shortSid = Integer.parseInt(delInfSid[i]);
                //削除処理
                dao.delete(shortSid, userSid);
                //削除チェックボックスクリア
                paramMdl.setFil010SelectDelLink(null);
            }
            con.commit();

        } catch (SQLException e) {
            log__.warn("ショートカット削除に失敗", e);
            JDBCUtil.rollback(con);
            throw e;
        }
    }

    /**
     *
     * <br>[機  能] 表示キャビネットを切り替えます。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータモデル
     */
    public void changeDspCabinet(Fil010ParamModel paramMdl) {
        String personalFlg = paramMdl.getFil010DspCabinetKbn();

        if (personalFlg.equals(GSConstFile.DSP_CABINET_PUBLIC)) {
            paramMdl.setFil010DspCabinetKbn(GSConstFile.DSP_CABINET_PRIVATE);
        } else if (personalFlg.equals(GSConstFile.DSP_CABINET_PRIVATE)) {
            paramMdl.setFil010DspCabinetKbn(GSConstFile.DSP_CABINET_PUBLIC);
        }
    }

    /**
     *
     * <br>[機  能] 管理者設定情報を取得
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @return FileAconfModel 管理者設定情報
     * @throws SQLException SQL実行例外
     */
    private FileAconfModel __getFileAconf(Connection con) throws SQLException {
        if (aconfMdl__ == null) {
            //セッションユーザが個人キャビネットの使用を許可されているか判定
            FileAconfDao aconfDao = new FileAconfDao(con);
            aconfMdl__ = aconfDao.select();
            if (aconfMdl__ == null) {
                aconfMdl__ = new FileAconfModel();
                aconfMdl__.init();
            }
        }
        return aconfMdl__;
    }
}
