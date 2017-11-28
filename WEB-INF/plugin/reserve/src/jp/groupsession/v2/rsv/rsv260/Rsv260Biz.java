package jp.groupsession.v2.rsv.rsv260;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.io.ObjectFile;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.biz.GroupBiz;
import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.cmn110.Cmn110FileModel;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.rsv.AbstractReserveBiz;
import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

/**
 * <br>[機  能] 施設予約 グループ・施設一括登録画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv260Biz extends AbstractReserveBiz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Rsv260Biz.class);
    /** リクエスト情報 */
    protected RequestModel reqMdl_ = null;
    /** コネクション */
    protected Connection con_ = null;

    /**
     * <br>[機  能] コンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param reqMdl リクエスト情報
     * @param con コネクション
     */
    public Rsv260Biz(RequestModel reqMdl, Connection con) {
        reqMdl_ = reqMdl;
        con_ = con;
    }

    /**
     * <br>[機  能] 処理権限判定
     * <br>[解  説]
     * <br>[備  考]
     * @return true:処理実行可 false:処理実行不可
     * @throws SQLException SQL実行時例外
     */
    public boolean isPossibleToProcess()
        throws SQLException {

        //管理者である
        return _isAdmin(reqMdl_, con_);
    }

    /**
     * <br>[機  能] 初期表示情報を画面にセットする
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param paramMdl Rsv260ParamModel
     * @param tempDir テンポラリディレクトリパス
     * @throws SQLException SQL実行例外
     * @throws IOToolsException ファイルアクセス時例外
     */
    public void setInitData(Rsv260ParamModel paramMdl, String tempDir)
        throws SQLException, IOToolsException {

        //施設区分コンボ生成
        ArrayList<LabelValueBean> grpKbnList = _getGroupKbnComboList(con_);
        paramMdl.setRsv260SisetuLabelList(grpKbnList);
        if (paramMdl.getRsv260SelectedSisetuKbn() < 0) {
            LabelValueBean lbl = grpKbnList.get(0);
            paramMdl.setRsv260SelectedSisetuKbn(Integer.parseInt(lbl.getValue()));
        }

        //グループコンボ生成
        ArrayList<LabelValueBean> grpList = __getGroupComboList(true);
        paramMdl.setRsv260GrpLabelList(grpList);

        //管理者リスト作成
        String[] saveUser = paramMdl.getSaveUser();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();

        if (saveUser != null && saveUser.length > 0) {
            paramMdl.setRsv260AdmUser(selBiz.getSelectedLabel(saveUser, con_));
        }

        //グループコンボで選択されているグループのユーザ取得
        int grpComboSid = paramMdl.getRsv260SelectedGrpComboSid();
        ArrayList<UsrLabelValueBean> notAdminLabelList =
                selBiz.getNonSelectLabel(grpComboSid, saveUser, con_);
        paramMdl.setRsv260NotAdmUser(notAdminLabelList);

        if (paramMdl.getRsv260GrpAdmKbn() < 0) {
            //権限設定デフォルト値
            paramMdl.setRsv260GrpAdmKbn(GSConstReserve.RSG_ADM_KBN_OK);
        }

        //サンプルファイルダウンロード区分
        paramMdl.setRsv260RskSid(paramMdl.getRsv260SelectedSisetuKbn());

        //テンポラリディレクトリにあるファイル名称を取得
        List<String> fileList = IOTools.getFileNames(tempDir);

        //画面に表示するファイルのリストを作成
        ArrayList<LabelValueBean> fileLblList = new ArrayList<LabelValueBean>();

        if (fileList != null) {

            log__.debug("ファイルの数×２(オブジェクトと本体) = " + fileList.size());

            for (int i = 0; i < fileList.size(); i++) {

                //ファイル名を取得
                String fileName = fileList.get(i);
                if (!fileName.endsWith(GSConstCommon.ENDSTR_OBJFILE)) {
                    continue;
                }

                //オブジェクトファイルを取得
                ObjectFile objFile = new ObjectFile(tempDir, fileName);
                Object fObj = objFile.load();
                if (fObj == null) {
                    continue;
                }

                String[] value = fileName.split(GSConstCommon.ENDSTR_OBJFILE);

                //表示用リストへ追加
                Cmn110FileModel fMdl = (Cmn110FileModel) fObj;
                fileLblList.add(new LabelValueBean(fMdl.getFileName(), value[0]));
                log__.debug("ファイル名 = " + fMdl.getFileName());
                log__.debug("保存ファイル名 = " + fMdl.getSaveFileName());
            }
        }
        paramMdl.setRsv260FileLabelList(fileLblList);
    }

    /**
     * <br>[機  能] グループコンボリストを取得する
     * <br>[解  説]
     * <br>[備  考]
     *
     *@param addGgrpListFlg 『グループ一覧』表示フラグ true:表示する
     * @return ret グループコンボリスト
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<LabelValueBean> __getGroupComboList(boolean addGgrpListFlg)
        throws SQLException {

        log__.debug("グループコンボリストを取得");

        GroupBiz groupBiz = new GroupBiz();
        List <GroupModel> groupList = groupBiz.getGroupCombList(con_);

        ArrayList<LabelValueBean> labelList = new ArrayList<LabelValueBean>();
        GsMessage gsMsg = new GsMessage(reqMdl_);
        labelList.add(new LabelValueBean(gsMsg.getMessage("cmn.select.plz"), "-1"));

        /** メッセージ グループ一覧 **/
        String strGroupList = gsMsg.getMessage("cmn.grouplist");
        if (addGgrpListFlg) {
            labelList.add(
                    new LabelValueBean(strGroupList,
                            GSConstReserve.GROUP_COMBO_VALUE));
        }

        for (GroupModel mdl : groupList) {
            labelList.add(
                    new LabelValueBean(mdl.getGroupName(),
                            String.valueOf(mdl.getGroupSid())));
        }

        return labelList;
    }

    /**
     * <br>[機  能] ユーザ追加処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param paramMdl Rsv260ParamModel
     * @throws SQLException SQL実行時例外
     */
    public void doUserAdd(Rsv260ParamModel paramMdl) throws SQLException {

        paramMdl.setSaveUser(
                getAddMember(paramMdl.getRsv260SelectedRight(), paramMdl.getSaveUser()));
    }

    /**
     * <br>[機  能] ユーザ削除処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param paramMdl Rsv260ParamModel
     * @throws SQLException SQL実行時例外
     */
    public void doUserDel(Rsv260ParamModel paramMdl) throws SQLException {

        CommonBiz cmnBiz = new CommonBiz();
        paramMdl.setSaveUser(
                cmnBiz.getDeleteMember(paramMdl.getRsv260SelectedLeft(), paramMdl.getSaveUser()));
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
    }
}