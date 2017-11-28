package jp.groupsession.v2.fil.fil030;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.io.IOToolsException;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.biz.GroupBiz;
import jp.groupsession.v2.cmn.biz.UserBiz;
import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.base.CmnCmbsortConfDao;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmInfDao;
import jp.groupsession.v2.cmn.exception.TempFileException;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnBinfModel;
import jp.groupsession.v2.cmn.model.base.CmnCmbsortConfModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.fil.FilCommonBiz;
import jp.groupsession.v2.fil.GSConstFile;
import jp.groupsession.v2.fil.dao.FileAccessConfDao;
import jp.groupsession.v2.fil.dao.FileAconfDao;
import jp.groupsession.v2.fil.dao.FileCabinetAdminDao;
import jp.groupsession.v2.fil.dao.FileCabinetDao;
import jp.groupsession.v2.fil.dao.FileDao;
import jp.groupsession.v2.fil.model.FileAconfModel;
import jp.groupsession.v2.fil.model.FileCabinetModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

/**
 * キャビネット登録・編集画面で使用するビジネスロジッククラス
 * @author JTS
 */
public class Fil030Biz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Fil030Biz.class);
    /** リクエスト情報 */
    private RequestModel reqMdl__ = null;
    /** リクエスト情報 */
    private Connection con__ = null;

    /**
     * <p>コンストラクタ
     * @param con Connection
     * @param reqMdl RequestModel
     */
    public Fil030Biz(Connection con, RequestModel reqMdl) {
        con__ = con;
        reqMdl__ = reqMdl;
    }

    /**
     * <br>初期表示画面情報を取得します
     * @param paramMdl Fil030ParamModel
     * @param tempDir テンポラリディレクトリパス
     * @param appRoot アプリケーションルートパス
     * @param cmd コマンド
     * @throws SQLException SQL実行時例外
     * @throws IOToolsException ファイル操作時例外
     * @throws IOException ファイル操作時例外
     * @throws TempFileException 添付ファイルUtil内での例外
     */
    public void setInitData(Fil030ParamModel paramMdl,
            String tempDir, String appRoot,
            String cmd)
    throws SQLException, IOToolsException, IOException, TempFileException {

        log__.debug("キャビネット登録初期表示");

        FileCabinetDao cabDao = new FileCabinetDao(con__);

        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_ADD)) {
            //新規
            setInitDataNew(paramMdl, tempDir, appRoot);

        } else if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_EDT)) {
            //編集
            setInitDataEdit(paramMdl, tempDir, appRoot, cmd);

        } else if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT)) {
            //一括編集
            if (paramMdl.getFil220sltCheck().length == 1) {

                //単一SIDなら編集モードに移行
                //編集
                setInitDataEdit(paramMdl, tempDir, appRoot, cmd);

            } else if (paramMdl.getFil220sltCheck().length > 1) {
                //SIDが2つ以上なら一括編集モード
                setInitDataNew(paramMdl, tempDir, appRoot);

                String[] sidlist = paramMdl.getFil220sltCheck();
                ArrayList<FileCabinetModel> ret = new ArrayList<FileCabinetModel>();

                //複数SIDからキャビネットリストを作成
                for (String sid : sidlist) {
                    FileCabinetModel mdl = cabDao.select(Integer.parseInt(sid));
                    if (mdl != null && mdl.getFcbPersonalFlg() == paramMdl.getFil030PersonalFlg()) {
                        // 表示中のキャビネット区分(共有or個人)に該当するキャビネット情報のみ配列へ追加
                        ret.add(mdl);
                    }
                }

                StringBuilder cabinetsName = new StringBuilder();

                if (paramMdl.getFil030PersonalFlg() == GSConstFile.CABINET_KBN_PRIVATE) {
                    //個人キャビネットの場合
                    ArrayList<Integer> usrSids = new ArrayList<Integer>();
                    for (FileCabinetModel mdl : ret) {
                        usrSids.add(Integer.valueOf(mdl.getFcbOwnerSid()));
                    }

                    // ユーザ名一覧取得
                    FileDao filDao = new FileDao(con__);
                    HashMap<Integer, String> userNameMap = filDao.getUserNameMap(usrSids);

                    // キャビネット名を更新
                    if (userNameMap.size() > 0) {
                        for (FileCabinetModel mdl : ret) {
                            Integer usrSid = Integer.valueOf(mdl.getFcbOwnerSid());
                            if (userNameMap.containsKey(usrSid)) {
                                mdl.setFcbName(userNameMap.get(usrSid));
                            }
                        }
                    }
                }

                for (FileCabinetModel mdl : ret) {
                    if (cabinetsName.length() > 0) {
                        cabinetsName.append(", ");
                    }
                    cabinetsName.append(mdl.getFcbName());
                }

                paramMdl.setFil030CabinetName(cabinetsName.toString());
            }

        }

        //個人キャビネットの場合
        if (paramMdl.getFil030PersonalFlg() == GSConstFile.CABINET_KBN_PRIVATE) {
            //管理者設定を反映
            FileAconfDao facDao = new FileAconfDao(con__);
            FileAconfModel facMdl = facDao.select();
            //容量設定
            paramMdl.setFil030CapaKbn(String.valueOf(facMdl.getFacPersonalCapa()));
            paramMdl.setFil030CapaSize(String.valueOf(facMdl.getFacPersonalSize()));
            paramMdl.setFil030CapaWarn(String.valueOf(facMdl.getFacPersonalWarn()));
            //バージョン管理
            paramMdl.setFil030VerKbn(String.valueOf(facMdl.getFacPersonalVer()));
            paramMdl.setFil030VerAllKbn(String.valueOf(GSConstFile.VERSION_ALL_KBN_ON));
        }

        //アクセス権限 グループコンボ
        paramMdl.setFil030AcGroupLavel(__getAccessGroupLavle(con__, true));
        //アクセス権限 候補一覧
        paramMdl.setFil030AcRightLavel(__getAccessRightLavle(paramMdl, con__));
        //アクセス権限 フルアクセス一覧
        paramMdl.setFil030AcFullLavel(__getAccessFullLavle(paramMdl, con__));
        //アクセス権限 閲覧アクセス一覧
        paramMdl.setFil030AcReadLavel(__getAccessReadLavle(paramMdl, con__));

        //管理者権限 グループコンボ
        paramMdl.setFil030AdmGroupLavel(__getAccessGroupLavle(con__, false));
        //管理者権限 候補一覧
        paramMdl.setFil030AdmRightLavel(__getAdmRightLavle(paramMdl, con__));
        //管理者権限 管理者一覧
        paramMdl.setFil030AdmLavel(__getAdmLavle(paramMdl, con__));


        FilCommonBiz cmnBiz = new FilCommonBiz(con__, reqMdl__);

        //使用率ラベル
        paramMdl.setFil030CapaWarnLavel(cmnBiz.getCapaWarnLabelList());

        //管理者設定バージョン管理区分
        int verKbnAdm = __setVerKbnAdmin(paramMdl, con__);

        if (verKbnAdm == GSConstFile.VERSION_KBN_ON) {
            //バージョン世代ラベル設定
            paramMdl.setFil030VerKbnLavel(cmnBiz.getVersionLabelList());
        }
    }
    /**
     * <br>新規モード時の初期表示を設定します
     * @param paramMdl Fil030ParamModel
     * @param tempDir テンポラリディレクトリパス
     * @param appRoot アプリケーションルートパス
     * @throws SQLException SQL実行時例外
     * @throws IOToolsException ファイル操作時例外
     * @throws IOException ファイル操作時例外
     */
    public void setInitDataNew(Fil030ParamModel paramMdl,
            String tempDir, String appRoot)
    throws SQLException, IOToolsException, IOException {

        //個人キャビネット判定フラグ
        paramMdl.setFil030PersonalFlg(Integer.parseInt(paramMdl.getFil010DspCabinetKbn()));

        //新規
        paramMdl.setFil030AccessKbn(
                NullDefault.getString(
                        paramMdl.getFil030AccessKbn(),
                        String.valueOf(GSConstFile.ACCESS_KBN_OFF)));
        paramMdl.setFil030CapaKbn(
                NullDefault.getString(
                        paramMdl.getFil030CapaKbn(),
                        String.valueOf(GSConstFile.CAPA_KBN_OFF)));

      //個人キャビネットの場合
        if (paramMdl.getFil030PersonalFlg() == Integer.parseInt(GSConstFile.DSP_CABINET_PRIVATE)) {
            //キャビネット名はユーザ名と同じ
            BaseUserModel usModel = reqMdl__.getSmodel();
            int sessionUsrSid = usModel.getUsrsid();
            CmnUsrmInfDao usrDao = new CmnUsrmInfDao(con__);
            CmnUsrmInfModel usrMdl = usrDao.select(sessionUsrSid);
            String personalCabName = usrMdl.getUsiSei() + usrMdl.getUsiMei();
            paramMdl.setFil030CabinetName(personalCabName);
            //キャビネット所有者SID
            int userSid = usrMdl.getUsrSid();
            paramMdl.setOwnerSid(String.valueOf(userSid));
        }

    }

    /**
     * <br>編集モード時の初期表示を設定します
     * @param paramMdl Fil030ParamModel
     * @param tempDir テンポラリディレクトリパス
     * @param appRoot アプリケーションルートパス
     * @param cmd コマンド
     * @throws SQLException SQL実行時例外
     * @throws IOToolsException ファイル操作時例外
     * @throws IOException ファイル操作時例外
     * @throws TempFileException 添付ファイルUtil内での例外
     */
    public void setInitDataEdit(Fil030ParamModel paramMdl,
            String tempDir, String appRoot, String cmd)
    throws SQLException, IOToolsException, IOException, TempFileException {

        CommonBiz cmnBiz = new CommonBiz();

        //編集
        int cabSid = 0;
        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT)) {
            cabSid = NullDefault.getInt(paramMdl.getFil220sltCheck()[0], -1);
            paramMdl.setFil030SelectCabinet(paramMdl.getFil220sltCheck()[0]);
            paramMdl.setCmnMode(GSConstFile.CMN_MODE_EDT);
        } else {
            cabSid = NullDefault.getInt(paramMdl.getFil030SelectCabinet(), -1);
        }

        FileCabinetDao cabDao = new FileCabinetDao(con__);
        FileCabinetModel cabModel = cabDao.select(cabSid);

        if (cabModel != null) {
            int personalFlg = cabModel.getFcbPersonalFlg();
            paramMdl.setFil030PersonalFlg(personalFlg);

            paramMdl.setFil030CabinetName(
                    NullDefault.getString(paramMdl.getFil030CabinetName(), cabModel.getFcbName()));

            paramMdl.setFil030AccessKbn(
                    NullDefault.getString(
                            paramMdl.getFil030AccessKbn(),
                            String.valueOf(cabModel.getFcbAccessKbn())));
            //アクセス制御情報
            FileAccessConfDao acDao = new FileAccessConfDao(con__);
            if (paramMdl.getFil030Biko() == null) {
                paramMdl.setFil030SvAcRead(
                        acDao.getAccessUser(cabModel.getFcbSid(),
                                Integer.parseInt(GSConstFile.ACCESS_KBN_READ)));

                FileCabinetAdminDao admDao = new FileCabinetAdminDao(con__);
                paramMdl.setFil030SvAdm(admDao.getAdminUserSid(cabModel.getFcbSid()));
                //共有キャビネットの場合のみ、フルアクセス権限をユーザ・グループを取得
                if (personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
                paramMdl.setFil030SvAcFull(
                        acDao.getAccessUser(cabModel.getFcbSid(),
                                Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE)));
                //個人キャビネットの場合
                } else {
                    //キャビネット名は常にユーザ名と一致する
                    if (personalFlg == Integer.parseInt(GSConstFile.DSP_CABINET_PRIVATE)) {
                        cabModel = cabDao.getPersonalCab(cabSid, personalFlg);
                        //キャビネット所有者SID
                        paramMdl.setOwnerSid(paramMdl.getFil030SvAdm()[0]);
                    }
                }
            }

            paramMdl.setFil030CapaKbn(
                    NullDefault.getString(
                            paramMdl.getFil030CapaKbn(),
                            String.valueOf(cabModel.getFcbCapaKbn())));
            paramMdl.setFil030CapaSize(
                    NullDefault.getString(
                            paramMdl.getFil030CapaSize(),
                            String.valueOf(cabModel.getFcbCapaSize())));
            paramMdl.setFil030CapaWarn(
                    NullDefault.getString(
                            paramMdl.getFil030CapaWarn(),
                            String.valueOf(cabModel.getFcbCapaWarn())));
            paramMdl.setFil030VerKbn(
                    NullDefault.getString(
                            paramMdl.getFil030VerKbn(),
                            String.valueOf(cabModel.getFcbVerKbn())));
            paramMdl.setFil030VerAllKbn(
                    NullDefault.getString(
                            paramMdl.getFil030VerAllKbn(),
                            String.valueOf(cabModel.getFcbVerallKbn())));
            paramMdl.setFil030Biko(
                    NullDefault.getString(paramMdl.getFil030Biko(), cabModel.getFcbBiko()));

            if (paramMdl.getFil030VerAllKbn().equals(
                    String.valueOf(GSConstFile.VERSION_ALL_KBN_OFF))) {
                paramMdl.setFil030VerKbn(String.valueOf(GSConstFile.VERSION_KBN_OFF));
            }

            if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_EDT)
                    && cabModel.getFcbMark() > 0 && !paramMdl.getFil030InitFlg().equals("1")) {
                if (cabModel.getFcbMark() > 0) {
                    CmnBinfModel binMdl = cmnBiz.getBinInfo(con__, cabModel.getFcbMark(),
                            reqMdl__.getDomain());
                    if (binMdl != null) {

                        //アイコンのテンポラリディレクトリパス
                        String markTempDir =
                                IOTools.replaceFileSep(tempDir + GSConstFile.TEMP_DIR_MARK + "/");

                        //添付ファイルをテンポラリディレクトリに格納する。
                        String imageSaveName =
                                cmnBiz.saveSingleTempFile(binMdl, appRoot, markTempDir);
                        paramMdl.setFil030ImageName(binMdl.getBinFileName());
                        paramMdl.setFil030ImageSaveName(imageSaveName);
                    }
                }
            }

            //添付ファイルのラベルを設定する。
            paramMdl.setFil030SelectTempFiles(null);
            //添付ファイルのラベルを設定する。
            paramMdl.setFil030SelectTempFilesMark(null);

            //個人キャビネットかどうかを判定
            paramMdl.setFil010DspCabinetKbn(String.valueOf(cabModel.getFcbPersonalFlg()));
        }
    }

    /**
     * アクセス権限の候補抽出用グループ一覧を取得する
     * @param con コネクション
     * @param comboflg true:コンボ用 false:候補用
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<LabelValueBean> __getAccessGroupLavle(
            Connection con, boolean comboflg)
    throws SQLException {
        ArrayList<LabelValueBean> ret = new ArrayList<LabelValueBean>();

        GroupBiz groupBiz = new GroupBiz();
        ArrayList<GroupModel> gpList = groupBiz.getGroupCombList(con);
        LabelValueBean lavelBean = new LabelValueBean();

        GsMessage gsMsg = new GsMessage(reqMdl__);

        if (comboflg) {
            String textGroup = gsMsg.getMessage("cmn.grouplist");
            lavelBean.setLabel(textGroup);
            lavelBean.setValue(GSConstFile.GROUP_COMBO_VALUE);
            ret.add(lavelBean);
        } else {
            String textSelect = gsMsg.getMessage("cmn.select.plz");
            lavelBean.setLabel(textSelect);
            lavelBean.setValue("-1");
            ret.add(lavelBean);
        }

        for (GroupModel gmodel : gpList) {
            lavelBean = new LabelValueBean();
            lavelBean.setLabel(gmodel.getGroupName());
            lavelBean.setValue(String.valueOf(gmodel.getGroupSid()));
            ret.add(lavelBean);
        }
        return ret;
    }

    /**
     * アクセス権限の候補用一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAccessRightLavle(
            Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        ArrayList<UsrLabelValueBean> ret = new ArrayList<UsrLabelValueBean>();
        //アクセス権限 グループコンボ選択値
        int acSltGp = NullDefault.getInt(
                paramMdl.getFil030AcSltGroup(), Integer.parseInt(GSConstFile.GROUP_COMBO_VALUE));
        //除外するグループSID
        String[] leftFull = paramMdl.getFil030SvAcFull();
        String[] leftRead = paramMdl.getFil030SvAcRead();

        if (acSltGp == Integer.parseInt(GSConstFile.GROUP_COMBO_VALUE)) {
            //グループを全て取得
            GroupDao dao = new GroupDao(con);
            CmnCmbsortConfDao sortDao = new CmnCmbsortConfDao(con);
            CmnCmbsortConfModel sortMdl = sortDao.getCmbSortData();
            ArrayList<GroupModel> allGpList = dao.getGroupTree(sortMdl);

            //除外するグループSID(フルアクセス選択済み)
            List<String> fullGrepList = new ArrayList<String>();
            if (paramMdl.getFil030SvAcFull() != null) {
                fullGrepList = Arrays.asList(paramMdl.getFil030SvAcFull());
            }
            //除外するグループSID(閲覧アクセス選択済み)
            List<String> readGrepList = new ArrayList<String>();
            if (paramMdl.getFil030SvAcRead() != null) {
                readGrepList = Arrays.asList(paramMdl.getFil030SvAcRead());
            }

            for (GroupModel bean : allGpList) {
                if (!fullGrepList.contains(String.valueOf("G" + bean.getGroupSid()))
                &&  !readGrepList.contains(String.valueOf("G" + bean.getGroupSid()))) {
                    ret.add(new UsrLabelValueBean(
                            bean.getGroupName(), String.valueOf("G" + bean.getGroupSid())));
                }
            }

        } else {

            //除外するユーザSID
            ArrayList<Integer> usrSids = new ArrayList<Integer>();
            //個人キャビネットの場合、個人キャビネット所有ユーザは除外
            if (paramMdl.getFil030PersonalFlg()
                    == Integer.parseInt(GSConstFile.DSP_CABINET_PRIVATE)) {
                FileCabinetDao fcbDao = new FileCabinetDao(con__);
                int selectCabSid = NullDefault.getInt(paramMdl.getFil010SelectCabinet(), 0);
                FileCabinetModel fcbMdl = fcbDao.select(selectCabSid);
                int ownerSid = 0;
                BaseUserModel usModel = reqMdl__.getSmodel();
                //セッションユーザが対象個人キャビネットの所有者ではない場合
                if (fcbMdl != null && ownerSid != usModel.getUsrsid()) {
                    ownerSid = fcbMdl.getFcbOwnerSid();
                //所有者の場合
                } else {
                    ownerSid = usModel.getUsrsid();
                }
                usrSids.add(ownerSid);
            }
            if (leftFull != null) {
                for (int i = 0; i < leftFull.length; i++) {
                    usrSids.add(new Integer(NullDefault.getInt(leftFull[i], -1)));
                }
            }
            if (leftRead != null) {
                for (int i = 0; i < leftRead.length; i++) {
                    usrSids.add(new Integer(NullDefault.getInt(leftRead[i], -1)));
                }
            }
            UserBiz userBiz = new UserBiz();
            List<CmnUsrmInfModel> usList
                = userBiz.getBelongUserList(con, acSltGp, usrSids);

            UsrLabelValueBean lavelBean = null;
            for (int i = 0; i < usList.size(); i++) {
                CmnUsrmInfModel cuiMdl = usList.get(i);
                lavelBean = new UsrLabelValueBean(cuiMdl);
                ret.add(lavelBean);
            }
        }

        return ret;
    }

    /**
     * アクセス権限のフルアクセス用一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAccessFullLavle(
            Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        //取得するユーザSID・グループSID
        String[] leftFull = paramMdl.getFil030SvAcFull();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        return selBiz.getSelectedLabel(leftFull, con);
    }

    /**
     * アクセス権限のフルアクセス用一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAccessReadLavle(
            Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        //取得するユーザSID・グループSID
        String[] leftRead = paramMdl.getFil030SvAcRead();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        return selBiz.getSelectedLabel(leftRead, con);

    }
    /**
     * 管理者権限の候補用一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAdmRightLavle(
            Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        ArrayList<UsrLabelValueBean> ret = new ArrayList<UsrLabelValueBean>();
        //アクセス権限 グループコンボ選択値
        int admSltGp = NullDefault.getInt(
                paramMdl.getFil030AdmSltGroup(), -1);
        //除外するユーザSID
        String[] leftAdm = paramMdl.getFil030SvAdm();


        if (admSltGp > -1) {

            //除外するユーザSID
            ArrayList<Integer> usrSids = new ArrayList<Integer>();
            if (leftAdm != null) {
                for (int i = 0; i < leftAdm.length; i++) {
                    usrSids.add(new Integer(NullDefault.getInt(leftAdm[i], -1)));
                }
            }
            //個人キャビネットの場合、個人キャビネット所有ユーザは除外
            if (paramMdl.getFil030PersonalFlg()
                    == Integer.parseInt(GSConstFile.DSP_CABINET_PRIVATE)) {
                BaseUserModel usModel = reqMdl__.getSmodel();
                int ownerSid = usModel.getUsrsid();
                usrSids.add(ownerSid);
            }
            UserBiz userBiz = new UserBiz();
            List<CmnUsrmInfModel> usList
                = userBiz.getBelongUserList(con, admSltGp, usrSids);

            UsrLabelValueBean lavelBean = null;
            for (int i = 0; i < usList.size(); i++) {
                CmnUsrmInfModel cuiMdl = usList.get(i);
                lavelBean = new UsrLabelValueBean(cuiMdl);
                ret.add(lavelBean);
            }
        }

        return ret;
    }
    /**
     * 管理者権限の管理者一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAdmLavle(Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        //取得するユーザSID・グループSID
        String[] leftAdm = paramMdl.getFil030SvAdm();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        return selBiz.getSelectedLabel(leftAdm, con);
    }

    /**
     * <br>管理者設定のバージョン管理区分を取得します。
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return verKbn バージョン管理区分（管理者設定）
     * @throws SQLException SQL実行時例外
     */
    private int __setVerKbnAdmin(Fil030ParamModel paramMdl, Connection con)
    throws SQLException {

        FileAconfDao aconfDao = new FileAconfDao(con);
        FileAconfModel aconfMdl = aconfDao.select();

        if (aconfMdl == null) {
            return GSConstFile.VERSION_KBN_ON;
        }
        paramMdl.setAdmVerKbn(aconfMdl.getFacVerKbn());

        return aconfMdl.getFacVerKbn();
    }

    /**
     * <br>[機  能] テンポラリディレクトリのファイル削除を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param tempDir テンポラリディレクトリパス
     * @throws IOToolsException ファイルアクセス時例外
     */
    public void doDeleteFile(String tempDir) throws IOToolsException {

        //テンポラリディレクトリのファイルを削除する
        IOTools.deleteDir(tempDir);
        log__.debug("テンポラリディレクトリのファイル削除");
    }

}
