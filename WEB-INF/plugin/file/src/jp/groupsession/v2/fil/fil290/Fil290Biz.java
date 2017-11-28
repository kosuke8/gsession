package jp.groupsession.v2.fil.fil290;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jp.co.sjts.util.NullDefault;
import jp.groupsession.v2.cmn.biz.GroupBiz;
import jp.groupsession.v2.cmn.biz.UserBiz;
import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.base.CmnCmbsortConfDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnCmbsortConfModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.fil.FilCommonBiz;
import jp.groupsession.v2.fil.GSConstFile;
import jp.groupsession.v2.fil.dao.FileAconfDao;
import jp.groupsession.v2.fil.dao.FilePcbOwnerDao;
import jp.groupsession.v2.fil.model.FileAconfModel;
import jp.groupsession.v2.fil.model.FilePcbOwnerModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

/**
 * <br>[機  能] 管理者設定 基本設定画面のビジネスロジック
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Fil290Biz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Fil290Biz.class);

    /** DBコネクション */
    private Connection con__ = null;
    /** リクエスト情報 */
    private RequestModel reqMdl__ = null;

    /**
     * <p>Set Connection
     * @param con Connection
     * @param reqMdl RequestModel
     */
    public Fil290Biz(Connection con, RequestModel reqMdl) {
        con__ = con;
        reqMdl__ = reqMdl;
    }

    /**
     * <br>[機  能] 初期表示を設定する。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Fil210ParamModel
     * @param req リクエスト
     * @throws SQLException SQL実行例外
     */
    public void setInitData(Fil290ParamModel paramMdl, HttpServletRequest req)
    throws SQLException {

        log__.debug("fil290Biz Start");

        //初期表示かどうか
        if (paramMdl.getFil290initFlg() == 0) {
            __setData(paramMdl);
        }

        //画面表示項目を設定する。
        __setDsp(paramMdl, req);


    }

    /**
     * <br>[機  能] 画面表示を設定する。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Fil210ParamModel
     * @param req リクエスト
     * @throws SQLException SQL実行例外
     */
    private void __setDsp(Fil290ParamModel paramMdl, HttpServletRequest req) throws SQLException {

        //
        paramMdl.setFil290CabinetGroupLabel(__getCabinetAuthGroupLabel(con__));
        paramMdl.setFil290CabinetRightLabel(__getCabinetAuthRightLabel(paramMdl, con__));

        //取得するユーザSID・グループSID
        String[] leftList = paramMdl.getFil290CabinetSv();
        UserGroupSelectBiz selBiz = new UserGroupSelectBiz();
        paramMdl.setFil290CabinetAuthLabel(selBiz.getSelectedLabel(leftList, con__));

        //バージョン世代ラベル設定
        FilCommonBiz cmnBiz = new FilCommonBiz(con__, reqMdl__);

        //使用率ラベル
        paramMdl.setFil290CapaWarnLavel(cmnBiz.getCapaWarnLabelList());

        //バージョン世代ラベル設定
        paramMdl.setFil290VerKbnLavel(cmnBiz.getVersionLabelList());
    }

    /**
     * <br>[機  能] DBからデータを設定する。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Fil210ParamModel
     * @throws SQLException SQL実行例外
     */
    private void __setData(Fil290ParamModel paramMdl) throws SQLException {


        FileAconfDao aconfDao = new FileAconfDao(con__);
        FileAconfModel aconf = aconfDao.select();
        if (aconf == null) {
            aconf = new FileAconfModel();
            aconf.init();
        }

        ArrayList<String> userSidList  = new ArrayList<String>();
        if (aconf.getFacUseKbn() == GSConstFile.CABINET_AUTH_USER) {
            // キャビネット使用許可が指定ユーザの場合 → 許可されたユーザ一覧取得
            FilePcbOwnerDao pcbUsrDao = new FilePcbOwnerDao(con__);
            List <FilePcbOwnerModel> pcbUsrList = pcbUsrDao.select();
            if (pcbUsrList != null && pcbUsrList.size() > 0) {
                for (FilePcbOwnerModel pcbUsr : pcbUsrList) {
                    String userSid = String.valueOf(pcbUsr.getUsrSid());
                    if (pcbUsr.getUsrKbn() == GSConstFile.USER_KBN_GROUP) {
                        userSid = UserGroupSelectBiz.GROUP_PREFIX + userSid;
                    }
                    userSidList.add(userSid);
                }
            }
        }

        if (aconf.getFacPersonalCapa() != GSConstFile.CAPA_KBN_ON) {
            // 容量制限が無い場合、関連する値を初期化
            aconf.setFacPersonalSize(0);
            aconf.setFacPersonalWarn(0);
        }

        paramMdl.setFil290CabinetUseKbn(String.valueOf(aconf.getFacPersonalKbn()));
        paramMdl.setFil290CabinetAuthKbn(String.valueOf(aconf.getFacUseKbn()));
        paramMdl.setFil290CapaKbn(String.valueOf(aconf.getFacPersonalCapa()));
        paramMdl.setFil290CapaSize(String.valueOf(aconf.getFacPersonalSize()));
        paramMdl.setFil290CapaWarn(String.valueOf(aconf.getFacPersonalWarn()));
        paramMdl.setFil290VerVisible(String.valueOf(aconf.getFacVerKbn()));
        paramMdl.setFil290VerKbn(String.valueOf(aconf.getFacPersonalVer()));
        paramMdl.setFil290CabinetSv(
                (String[]) userSidList.toArray(new String[userSidList.size()]));

        // 容量制限
        paramMdl.setFil290CapaKbn(NullDefault.getString(
                                  paramMdl.getFil290CapaKbn(),
                                  String.valueOf(GSConstFile.CAPA_KBN_OFF)));

        paramMdl.setFil290initFlg(1); // 初期データ取得完了
    }

    /**
     * コンボボックスで選択可能なグループ一覧取得
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<LabelValueBean> __getCabinetAuthGroupLabel(Connection con)
    throws SQLException {
        ArrayList<LabelValueBean> ret = new ArrayList<LabelValueBean>();

        GroupBiz groupBiz = new GroupBiz();
        ArrayList<GroupModel> gpList = groupBiz.getGroupCombList(con);
        LabelValueBean lavelBean = new LabelValueBean();

        GsMessage gsMsg = new GsMessage(reqMdl__);

        String textGroup = gsMsg.getMessage("cmn.grouplist");
        lavelBean.setLabel(textGroup);
        lavelBean.setValue(GSConstFile.GROUP_COMBO_VALUE);
        ret.add(lavelBean);

        for (GroupModel gmodel : gpList) {
            lavelBean = new LabelValueBean();
            lavelBean.setLabel(gmodel.getGroupName());
            lavelBean.setValue(String.valueOf(gmodel.getGroupSid()));
            ret.add(lavelBean);
        }
        return ret;
    }

    /**
     * コンボボックスにより選択されたリスト(ユーザ一覧 or グループ一覧)を取得
     * @param paramMdl Fil030ParamModel
     * @param con コネクション
     * @return グループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<UsrLabelValueBean> __getCabinetAuthRightLabel(
            Fil290ParamModel paramMdl, Connection con)
    throws SQLException {

        ArrayList<UsrLabelValueBean> ret = new ArrayList<UsrLabelValueBean>();
        //グループコンボ選択値
        int cbSltGp = NullDefault.getInt(
                paramMdl.getFil290CabinetSltGroup(),
                Integer.parseInt(GSConstFile.GROUP_COMBO_VALUE));
        //除外するグループSID
        String[] leftList = paramMdl.getFil290CabinetSv();

        if (cbSltGp == Integer.parseInt(GSConstFile.GROUP_COMBO_VALUE)) {
            // [グループ一覧]選択 → グループを全て取得
            GroupDao dao = new GroupDao(con);
            CmnCmbsortConfDao sortDao = new CmnCmbsortConfDao(con);
            CmnCmbsortConfModel sortMdl = sortDao.getCmbSortData();
            ArrayList<GroupModel> allGpList = dao.getGroupTree(sortMdl);

            //除外するグループSID(選択済みグループ)
            if (leftList != null) {
                List<String> cbGrpList = Arrays.asList(leftList);
                for (GroupModel bean : allGpList) {
                    String grpSid = UserGroupSelectBiz.GROUP_PREFIX
                                    + String.valueOf(bean.getGroupSid());
                    if (!cbGrpList.contains(grpSid)) {
                        ret.add(new UsrLabelValueBean(bean.getGroupName(), grpSid));
                    }
                }
            }

        } else {
            // [グループ一覧]以外を選択 → グループに所属するユーザ一覧取得

            //除外するユーザSID(選択済みユーザ)
            ArrayList<Integer> usrSids = new ArrayList<Integer>();
            if (leftList != null) {
                for (int i = 0; i < leftList.length; i++) {
                    usrSids.add(new Integer(NullDefault.getInt(leftList[i], -1)));
                }
            }
            UserBiz userBiz = new UserBiz();
            List<CmnUsrmInfModel> usList = userBiz.getBelongUserList(con, cbSltGp, usrSids);
            for (CmnUsrmInfModel cuiMdl : usList) {
                ret.add(new UsrLabelValueBean(cuiMdl));
            }
        }

        return ret;
    }
}
