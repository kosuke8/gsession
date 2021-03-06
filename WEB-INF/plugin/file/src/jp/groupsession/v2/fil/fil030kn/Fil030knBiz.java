package jp.groupsession.v2.fil.fil030kn;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.io.IOToolsException;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.MlCountMtController;
import jp.groupsession.v2.cmn.dao.base.CmnBinfDao;
import jp.groupsession.v2.cmn.exception.TempFileException;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnBinfModel;
import jp.groupsession.v2.fil.GSConstFile;
import jp.groupsession.v2.fil.dao.FileAccessConfDao;
import jp.groupsession.v2.fil.dao.FileCabinetAdminDao;
import jp.groupsession.v2.fil.dao.FileCabinetDao;
import jp.groupsession.v2.fil.dao.FileDAccessConfDao;
import jp.groupsession.v2.fil.dao.FileDirectoryDao;
import jp.groupsession.v2.fil.model.FileAccessConfModel;
import jp.groupsession.v2.fil.model.FileCabinetModel;
import jp.groupsession.v2.fil.model.FileDirectoryModel;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

/**
 * キャビネット登録・編集確認画面で使用するビジネスロジッククラス
 * @author JTS
 */
public class Fil030knBiz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Fil030knBiz.class);
    /** リクエスト情報 */
    private RequestModel reqMdl__ = null;

    /**
     * <p>コンストラクタ
     * @param reqMdl RequestModel
     */
    public Fil030knBiz(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }

    /**
     * <br>初期表示画面情報を取得します
     * @param paramMdl Fil030knParamModel
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    public void setInitData(Fil030knParamModel paramMdl,
            Connection con) throws SQLException {

        log__.debug("キャビネット登録初期表示");

        //アクセス権限 フルアクセス一覧
        paramMdl.setFil030AcFullLavel(__getAccessFullLavle(paramMdl, con));
        //アクセス権限 閲覧アクセス一覧
        paramMdl.setFil030AcReadLavel(__getAccessReadLavle(paramMdl, con));
        //管理者権限 管理者一覧
        paramMdl.setFil030AdmLavel(__getAdmLavle(paramMdl, con));
        //容量設定
        if (NullDefault.getInt(
                paramMdl.getFil030CapaKbn(), GSConstFile.CAPA_KBN_OFF)
                == GSConstFile.CAPA_KBN_OFF) {
            paramMdl.setFil030knDspCapaSize("");
        } else {
            paramMdl.setFil030knDspCapaSize(paramMdl.getFil030CapaSize() + GSConstFile.TEXT_MB);
        }

        //備考
        paramMdl.setFil030knDspBiko(
                StringUtilHtml.transToHTmlPlusAmparsant(paramMdl.getFil030Biko()));
    }

    /**
     * <br>キャビネット情報の登録・更新を行います。
     * @param paramMdl Fil030knParamModel
     * @param cntCon 採番コントロール
     * @param tempDir テンポラリディレクトリ
     * @param appRoot アプリケーションルート
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     * @throws IOToolsException ファイルアクセス例外
     * @throws TempFileException 添付ファイルUtil内での例外
     */
    public void doOk(Fil030knParamModel paramMdl,
            MlCountMtController cntCon, String tempDir, String appRoot, Connection con)
    throws SQLException, IOToolsException, TempFileException {

        HttpSession session = reqMdl__.getSession();
        BaseUserModel umodel =
            (BaseUserModel) session.getAttribute(GSConst.SESSION_KEY);
        int usrSid = umodel.getUsrsid();
        int fcbSid = -1;
        int fdrSid = -1;
        UDate now = new UDate();
        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_EDT)) {
            FileCabinetDao dao = new FileCabinetDao(con);
            FileCabinetModel model
            = dao.select(NullDefault.getInt(paramMdl.getFil030SelectCabinet(), -1));
            if (model.getFcbMark() > 0) {
                CmnBinfDao binDao = new CmnBinfDao(con);
                CmnBinfModel mdl = new CmnBinfModel();
                mdl.setBinUpuser(usrSid);
                mdl.setBinUpdate(now);
                mdl.setBinJkbn(GSConst.JTKBN_DELETE);
                mdl.setBinSid(model.getFcbMark());
                //論理削除実行
                binDao.removeBinData(mdl);
            }
        }

        //アイコンが登録されている場合は画像をバイナリー情報として登録する
        Long binSid = new Long(0);
        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT) == false
        && !StringUtil.isNullZeroString(paramMdl.getFil030ImageName())
        && !StringUtil.isNullZeroString(paramMdl.getFil030ImageSaveName())) {
            //マーク添付ファイルを新たに登録
            CommonBiz biz = new CommonBiz();

            String filePath =
                IOTools.replaceFileSep(
                tempDir + GSConstFile.TEMP_DIR_MARK + File.separator
                + paramMdl.getFil030ImageSaveName() + GSConstCommon.ENDSTR_SAVEFILE);

            binSid = biz.insertBinInfo(
                    con, appRoot, cntCon, usrSid, now, filePath, paramMdl.getFil030ImageName());
        }

        FileDirectoryDao fdDao = new FileDirectoryDao(con);

        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_ADD)) {
            //登録処理
            //キャビネットSID採番
            fcbSid =
                (int) cntCon.getSaibanNumber(
                        GSConstFile.PLUGIN_ID_FILE,
                        GSConstFile.SBNSID_SUB_CABINET,
                        usrSid);
            //ディレクトリSID採番
            fdrSid =
                (int) cntCon.getSaibanNumber(
                        GSConstFile.PLUGIN_ID_FILE,
                        GSConstFile.SBNSID_SUB_DIRECTORY,
                        usrSid);
            //キャビネット情報登録
            __insertFileCabinet(
                    __getFileCabinetModel(paramMdl, fcbSid, umodel, now, con, binSid), con);
            //ディレクトリ情報登録(root)
            __insertFileDirectory(
                    __getFileDirectoryModel(paramMdl, fcbSid, fdrSid, umodel, now, con), con);
        } else if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_EDT)) {
            //更新処理
            fcbSid = NullDefault.getInt(paramMdl.getFil030SelectCabinet(), -1);
            //キャビネット情報登録
            __updateFileCabinet(
                    __getFileCabinetModel(paramMdl, fcbSid, umodel, now, con, binSid), con);
            //ディレクトリ情報登録(root)
            __updateFileDirectory(
                    __getFileDirectoryModel(paramMdl, fcbSid, fdrSid, umodel, now, con),
                    con, false);
            //ディレクトリSID取得
            fdrSid = fdDao.getRootDirectory(fcbSid).getFdrSid();
        } else if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT)) {

            if (paramMdl.getFil220sltCheck().length == 1) {
                //単一SIDなら編集モードに移行

                //更新処理
                fcbSid = NullDefault.getInt(paramMdl.getFil030SelectCabinet(), -1);
                //キャビネット情報登録
                __updateFileCabinet(
                        __getFileCabinetModel(
                                paramMdl, fcbSid, umodel, now, con, new Long(0)), con);
                //ディレクトリ情報登録(root)
                __updateFileDirectory(
                        __getFileDirectoryModel(paramMdl, fcbSid, fdrSid, umodel, now, con),
                        con, false);
                //ディレクトリSID取得
                fdrSid = fdDao.getRootDirectory(fcbSid).getFdrSid();

            } else if (paramMdl.getFil220sltCheck().length > 1) {
                //SIDが2つ以上なら一括編集モード

                String[] sidlist = paramMdl.getFil220sltCheck();

                for (String sid : sidlist) {
                    fcbSid = NullDefault.getInt(sid, -1);

                    //キャビネット情報登録
                    __updateFileCabinetNoName(
                        __getFileCabinetModel(
                                paramMdl, fcbSid, umodel, now, con, new Long(0)), con);
                    //ディレクトリ情報登録(root)
                    __updateFileDirectory(
                            __getFileDirectoryModel(paramMdl, fcbSid, fdrSid, umodel, now, con),
                            con, true);

                    //キャビネット管理者
                    __insertCabinetAdmin(fcbSid, paramMdl, con);
                    //ディレクトリSID取得
                    fdrSid = fdDao.getRootDirectory(fcbSid).getFdrSid();
                    //キャビネットアクセス設定
                    __insertAccessConf(fcbSid, fdrSid, paramMdl, con);
                    fdDao.updateAccessSid(fdrSid);
                }
                //添付ファイルディレクトリ削除
                IOTools.deleteDir(tempDir);
            }

        }
        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT) == false) {
            //キャビネット管理者
            __insertCabinetAdmin(fcbSid, paramMdl, con);
            //キャビネットアクセス設定
            __insertAccessConf(fcbSid, fdrSid, paramMdl, con);
            fdDao.updateAccessSid(fdrSid);

            //添付ファイルディレクトリ削除
            IOTools.deleteDir(tempDir);
        }


    }
    /**
     * キャビネット情報を新規登録します。
     * @param paramMdl Fil030knParamModel
     * @param fcbSid キャビネットSID
     * @param umodel 登録ユーザモデル
     * @param now 更新日時
     * @param con コネクション
     * @param binSid マークbinSid
     * @throws SQLException SQL実行時例外
     * @return FileCabinetModel
     */
    private FileCabinetModel __getFileCabinetModel(
            Fil030knParamModel paramMdl, int fcbSid,
            BaseUserModel umodel, UDate now, Connection con, Long binSid)
    throws SQLException {

        FileCabinetModel cabMdl = new FileCabinetModel();
        cabMdl.setFcbSid(fcbSid);
        cabMdl.setFcbName(paramMdl.getFil030CabinetName());
        cabMdl.setFcbAccessKbn(
                NullDefault.getInt(paramMdl.getFil030AccessKbn(), GSConstFile.ACCESS_KBN_OFF));
        cabMdl.setFcbCapaKbn(NullDefault.getInt(
                paramMdl.getFil030CapaKbn(), GSConstFile.CAPA_KBN_OFF));
        cabMdl.setFcbCapaSize(NullDefault.getInt(paramMdl.getFil030CapaSize(), 0));
        cabMdl.setFcbCapaWarn(NullDefault.getInt(paramMdl.getFil030CapaWarn(), 0));

        if (paramMdl.getAdmVerKbn() == GSConstFile.VERSION_KBN_ON) {
            cabMdl.setFcbVerKbn(
                    NullDefault.getInt(paramMdl.getFil030VerKbn(), GSConstFile.VERSION_KBN_OFF));
            cabMdl.setFcbVerallKbn(
                    NullDefault.getInt(
                            paramMdl.getFil030VerAllKbn(), GSConstFile.VERSION_ALL_KBN_OFF));
        } else {
            //バージョン管理しない場合
            cabMdl.setFcbVerKbn(GSConstFile.VERSION_KBN_OFF);
            cabMdl.setFcbVerallKbn(GSConstFile.VERSION_ALL_KBN_ON);
        }
        cabMdl.setFcbBiko(NullDefault.getString(paramMdl.getFil030Biko(), ""));
        cabMdl.setFcbSort(0);
        cabMdl.setFcbAuid(umodel.getUsrsid());
        cabMdl.setFcbAdate(now);
        cabMdl.setFcbEuid(umodel.getUsrsid());
        cabMdl.setFcbEdate(now);

        if (paramMdl.getCmnMode().equals(GSConstFile.CMN_MODE_MLT) == false) {
            //マーク
            cabMdl.setFcbMark(binSid);
        }
        cabMdl.setFcbPersonalFlg(paramMdl.getFil030PersonalFlg());
        if (paramMdl.getFil030PersonalFlg() == GSConstFile.CABINET_KBN_PRIVATE) {
            cabMdl.setFcbOwnerSid(umodel.getUsrsid());
        }
        return cabMdl;

    }

    /**
     * キャビネット情報を新規登録します。
     * @param cabMdl キャビネット情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __insertFileCabinet(FileCabinetModel cabMdl, Connection con)
    throws SQLException {

        FileCabinetDao cabDao = new FileCabinetDao(con);
        cabDao.insert(cabMdl);
    }
    /**
     * キャビネット情報を更新します。
     * @param cabMdl キャビネット情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __updateFileCabinet(FileCabinetModel cabMdl, Connection con)
    throws SQLException {
        FileCabinetDao cabDao = new FileCabinetDao(con);
        cabDao.update(cabMdl);
    }

    /**
     * キャビネット情報を更新します。
     * @param cabMdl キャビネット情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __updateFileCabinetNoName(FileCabinetModel cabMdl, Connection con)
    throws SQLException {
        FileCabinetDao cabDao = new FileCabinetDao(con);
        cabDao.updateNoName(cabMdl);
    }

    /**
     * ディレクトリ情報を新規登録します。
     * @param paramMdl Fil030knParamModel
     * @param fcbSid キャビネットSID
     * @param fdrSid ディレクトリSID
     * @param umodel 登録ユーザモデル
     * @param now 更新日時
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     * @return FileCabinetModel
     */
    private FileDirectoryModel __getFileDirectoryModel(
            Fil030knParamModel paramMdl, int fcbSid, int fdrSid, BaseUserModel umodel,
            UDate now, Connection con)
    throws SQLException {

        FileDirectoryModel bean = new FileDirectoryModel();
        bean.setFdrSid(fdrSid);
        bean.setFdrVersion(GSConstFile.FOLDER_VERSION);
        bean.setFcbSid(fcbSid);
        bean.setFdrParentSid(GSConstFile.DIRECTORY_ROOT);
        bean.setFdrKbn(GSConstFile.DIRECTORY_FOLDER);
        bean.setFdrVerKbn(GSConstFile.VERSION_KBN_OFF);
        bean.setFdrLevel(GSConstFile.DIRECTORY_LEVEL_0);
        bean.setFdrName(paramMdl.getFil030CabinetName());
        bean.setFdrBiko(paramMdl.getFil030Biko());
        bean.setFdrJtkbn(GSConstFile.JTKBN_NORMAL);
        bean.setFdrAuid(umodel.getUsrsid());
        bean.setFdrAdate(now);
        bean.setFdrEuid(umodel.getUsrsid());
        bean.setFdrEdate(now);

        return bean;

    }
    /**
     * ディレクトリ情報を新規登録します。
     * @param bean ディレクトリ情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __insertFileDirectory(FileDirectoryModel bean, Connection con)
    throws SQLException {

        FileDirectoryDao dao = new FileDirectoryDao(con);
        dao.insert(bean);
    }
    /**
     * ディレクトリ情報を更新します。
     * @param bean ディレクトリ情報
     * @param con コネクション
     * @param noNameFlg true:名前の更新無し false:通常
     * @throws SQLException SQL実行時例外
     */
    private void __updateFileDirectory(FileDirectoryModel bean, Connection con, boolean noNameFlg)
    throws SQLException {
        FileDirectoryDao dao = new FileDirectoryDao(con);
        dao.updateRootFolder(bean, noNameFlg);
    }

    /**
     * キャビネット管理者情報を新規登録します。
     * @param fcbSid キャビネットSID
     * @param paramMdl パラメータモデル
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __insertCabinetAdmin(int fcbSid, Fil030knParamModel paramMdl, Connection con)
    throws SQLException {

        ArrayList<Integer> userList = new ArrayList<Integer>();
        String[] users = paramMdl.getFil030SvAdm();
        if (users != null) {
            for (int i = 0; i < users.length; i++) {
                int sid = NullDefault.getInt(users[i], -1);
                userList.add(new Integer(sid));
            }
        }

        //個人キャビネットの場合、所有ユーザは必ず管理者
        BaseUserModel usModel = reqMdl__.getSmodel();
        int ownerSid = usModel.getUsrsid();
        if (paramMdl.getFil030PersonalFlg() == Integer.parseInt(GSConstFile.DSP_CABINET_PRIVATE)
                && !userList.contains(new Integer(ownerSid))) {
            userList.add(ownerSid);
        }

        FileCabinetAdminDao dao = new FileCabinetAdminDao(con);
        dao.delete(fcbSid);
        dao.insert(fcbSid, userList);

    }

    /**
     * キャビネットアクセス設定を登録します。
     * @param fcbSid キャビネットSID
     * @param dirSid ディレクトリSID
     * @param paramMdl パラメータモデル
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __insertAccessConf(
            int fcbSid, int dirSid, Fil030knParamModel paramMdl, Connection con)
    throws SQLException {

        //キャビネットアクセス制限
        FileAccessConfDao dao = new FileAccessConfDao(con);
        //削除
        dao.delete(fcbSid);

        //ディレクトリアクセス制限
        FileDAccessConfDao daConfdao = new FileDAccessConfDao(con);
        //削除
        daConfdao.delete(dirSid);

        //個人キャビネット判定
        int personalFlg = paramMdl.getFil030PersonalFlg();

        if (paramMdl.getFile030AdaptIncFile().equals(GSConstFile.ADAPT_FILE_INC_KBN_ON)) {
            //下位フォルダに適用
            daConfdao.deleteSubDirectoriesFiles(dirSid, false);
        }

        //個別設定を行わない場合
        if (paramMdl.getFil030AccessKbn().equals(String.valueOf(GSConstFile.ACCESS_KBN_OFF))) {
            //共有キャビネットの場合、ここで終了
            if (personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
                //個別設定しない
                return;
            //個人キャビネットの場合、閲覧アクセスユーザセレクトボックスを空にする
            } else if (personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
                paramMdl.setFil030SvAcRead(new String[0]);
            }
        }

        ArrayList<Integer> groupFullList = new ArrayList<Integer>();
        ArrayList<Integer> userFullList = new ArrayList<Integer>();
        String[] full = paramMdl.getFil030SvAcFull();
        if (full != null) {
            for (int i = 0; i < full.length; i++) {
                String str = NullDefault.getString(full[i], "-1");
                if (str.contains(new String("G").subSequence(0, 1))) {
                    //グループ
                    groupFullList.add(new Integer(str.substring(1, str.length())));
                } else {
                    //ユーザ
                    userFullList.add(new Integer(str));
                }
            }
        }
        //フルアクセスユーザ登録
        //個人キャビネットの場合、個人キャビネット所有者のみフルアクセス権限を与えられる
        if (personalFlg == GSConstFile.CABINET_KBN_PRIVATE) {
            BaseUserModel usModel = reqMdl__.getSmodel();
            int ownerSid = usModel.getUsrsid();
            dao.insert(fcbSid, ownerSid,
                    GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
            daConfdao.insert(dirSid, ownerSid,
                    GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
        //共有キャビネットの場合、選択したユーザ・グループに対してフルアクセス権限を与える
        } else if (personalFlg == GSConstFile.CABINET_KBN_PUBLIC) {
            dao.insert(fcbSid, userFullList,
                    GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
            daConfdao.insert(dirSid, userFullList,
                    GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
            //フルアクセスグループ登録
            dao.insert(fcbSid, groupFullList,
                    GSConstFile.USER_KBN_GROUP, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
            daConfdao.insert(dirSid, groupFullList,
                    GSConstFile.USER_KBN_GROUP, Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
        }

        ArrayList<Integer> groupReadList = new ArrayList<Integer>();
        ArrayList<Integer> userReadList = new ArrayList<Integer>();
        String[] read = paramMdl.getFil030SvAcRead();
        if (read != null) {
            for (int i = 0; i < read.length; i++) {
                String str = NullDefault.getString(read[i], "-1");
                if (str.contains(new String("G").subSequence(0, 1))) {
                    //グループ
                    groupReadList.add(new Integer(str.substring(1, str.length())));
                } else {
                    //ユーザ
                    userReadList.add(new Integer(str));
                }
            }
        }
        //閲覧アクセスユーザ登録
        dao.insert(fcbSid, userReadList,
                GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));
        daConfdao.insert(dirSid, userReadList,
                GSConstFile.USER_KBN_USER, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));
        //閲覧アクセスグループ登録
        dao.insert(fcbSid, groupReadList,
                GSConstFile.USER_KBN_GROUP, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));
        daConfdao.insert(dirSid, groupReadList,
                GSConstFile.USER_KBN_GROUP, Integer.parseInt(GSConstFile.ACCESS_KBN_READ));

        //下位フォルダに適用しない場合、共有キャビネットであれば下位権限の論理チェックを行う
        if (paramMdl.getFile030AdaptIncFile().equals(GSConstFile.ADAPT_FILE_INC_KBN_OFF)
                && personalFlg == Integer.parseInt(GSConstFile.DSP_CABINET_PUBLIC)) {
            List<FileAccessConfModel> subList = daConfdao.getAccessSubDirectoriesFiles(dirSid);
            if (subList == null || subList.size() <= 0) {
                return;
            }
            groupReadList.addAll(groupFullList);
            userReadList.addAll(userFullList);
            List<Integer> delSids = new ArrayList<Integer>();
            for (FileAccessConfModel confMdl : subList) {
                //親ディレクトリの権限に含まれないグループ・ユーザを削除
                boolean delFlg = false;
                int subSid = confMdl.getFcbSid();
                if (confMdl.getFaaAuth() == Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE)) {
                    //追加・変更・削除
                    if (confMdl.getUsrKbn() == GSConstFile.USER_KBN_GROUP) {
                        //グループ
                        delFlg = __deleteNotInc(daConfdao,
                                                groupReadList,
                                                subSid,
                                                confMdl.getUsrSid(),
                                                GSConstFile.USER_KBN_GROUP);
                    } else if (confMdl.getUsrKbn() == GSConstFile.USER_KBN_USER) {
                        //ユーザ
                        delFlg = __deleteNotInc(daConfdao,
                                                userReadList,
                                                subSid,
                                                confMdl.getUsrSid(),
                                                GSConstFile.USER_KBN_USER);
                    }

                } else if (confMdl.getFaaAuth() == Integer.parseInt(GSConstFile.ACCESS_KBN_READ)) {
                    //閲覧
                    if (confMdl.getUsrKbn() == GSConstFile.USER_KBN_GROUP) {
                        //グループ
                        delFlg = __deleteNotInc(daConfdao,
                                                groupReadList,
                                                subSid,
                                                confMdl.getUsrSid(),
                                                GSConstFile.USER_KBN_GROUP);
                    } else if (confMdl.getUsrKbn() == GSConstFile.USER_KBN_USER) {
                        //ユーザ
                        delFlg = __deleteNotInc(daConfdao,
                                                userReadList,
                                                subSid,
                                                confMdl.getUsrSid(),
                                                GSConstFile.USER_KBN_USER);
                    }
                }

                //削除したSIDを追加
                if (delFlg && !delSids.contains(subSid)) {
                    delSids.add(subSid);
                }
            }

            //削除したフォルダ・ファイルのアクセス権限をチェック
            for (int subSid : delSids) {
                int count = daConfdao.getCount(subSid);
                if (count <= 0) {
                    //アクセス権限が一切なくなったフォルダ、ファイルを管理者のみの閲覧にする
                    daConfdao.deleteSubDirectoriesFiles(subSid, false);
                    FileAccessConfModel daConfMdl = new FileAccessConfModel();
                    daConfMdl.setFcbSid(subSid);
                    daConfMdl.setUsrSid(0);
                    daConfMdl.setUsrKbn(GSConstFile.USER_KBN_USER);
                    daConfMdl.setFaaAuth(Integer.parseInt(GSConstFile.ACCESS_KBN_WRITE));
                    daConfdao.insert(daConfMdl);
                }
            }
        }
    }

    /**
     * 親の権限に含まれていないグループ・ユーザを削除する
     * @param dao FileDAccessConfDao
     * @param sids 親権限SIDリスト
     * @param fdrSid ディレクトリSID
     * @param usrSid ユーザSID
     * @param usrKbn ユーザ区分
     * @return true:削除実行 false:削除対象でない
     * @throws SQLException 実行例外
     */
    private boolean __deleteNotInc(FileDAccessConfDao dao,
                                   ArrayList<Integer> sids,
                                   int fdrSid,
                                   int usrSid,
                                   int usrKbn) throws SQLException {

        if (!sids.contains(new Integer(usrSid))) {
            //削除
            dao.delete(fdrSid, usrSid, usrKbn);
            return true;
        }
        return false;
    }


    /**
     * アクセス権限のフルアクセス用一覧を取得する
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAccessFullLavle(
            Fil030knParamModel paramMdl, Connection con)
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
            Fil030knParamModel paramMdl, Connection con)
    throws SQLException {

        //取得するユーザSID・グループSID
        String[] leftRead = paramMdl.getFil030SvAcRead();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        return selBiz.getSelectedLabel(leftRead, con);

    }
    /**
     * 管理者権限の管理者一覧を取得する
     * @param paramMdl Fil030knParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getAdmLavle(
            Fil030knParamModel paramMdl, Connection con)
    throws SQLException {

        //取得するユーザSID・グループSID
        String[] leftAdm = paramMdl.getFil030SvAdm();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        return selBiz.getSelectedLabel(leftAdm, con);
    }

    /**
     * <br>[機  能] 添付ファイル情報をセット
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param paramMdl Fil030knParamModel
     * @param tempDir テンポラリディレクトリ
     * @param con コネクション
     * @throws IOToolsException
     * @throws IOToolsException ファイルアクセス時例外
     */
    public void setTempFiles(Fil030knParamModel paramMdl, String tempDir, Connection con)
        throws IOToolsException {

        /** 画面に表示するファイルのリストを作成、セット **********************/
        CommonBiz commonBiz = new CommonBiz();
        paramMdl.setFil030FileLabelList(commonBiz.getTempFileLabelList(tempDir));
    }
    /**
     * <br>[機  能] マークファイル情報をセット
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param paramMdl Fil030knParamModel
     * @param tempDir テンポラリディレクトリ
     * @param con コネクション
     * @throws IOToolsException
     * @throws IOToolsException ファイルアクセス時例外
     */
    public void setTempFilesMark(Fil030knParamModel paramMdl, String tempDir, Connection con)
        throws IOToolsException {

        /** 画面に表示するファイルのリストを作成、セット **********************/
        CommonBiz commonBiz = new CommonBiz();
        paramMdl.setFil030FileLabelListMark(
                commonBiz.getTempFileLabelList(
                        tempDir + GSConstFile.TEMP_DIR_MARK + File.separator));
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
