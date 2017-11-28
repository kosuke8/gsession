package jp.groupsession.v2.cmn.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.ValidateUtil;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.UsidSelectGrpNameDao;
import jp.groupsession.v2.cmn.dao.base.CmnCmbsortConfDao;
import jp.groupsession.v2.cmn.dao.base.CmnGroupmDao;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnCmbsortConfModel;
import jp.groupsession.v2.cmn.model.base.CmnGroupmModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * <br>[機  能] ユーザ・グループ選択を行う画面用共通処理
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class UserGroupSelectBiz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(UserGroupSelectBiz.class);

    /** コンボボックス グループ一覧 */
    public static final int GROUP_GRPLIST = -9;
    /** グループ一覧の接頭辞 */
    public static final String GROUP_PREFIX = "G";
    /** マイグループの接頭辞 */
    public static final String MYGROUP_PREFIX = "M";

    /**
     * <br>[機  能] 指定したグループが、削除されていないかチェック
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param grpSid グループSID
     * @return true:存在する、false:存在しない
     * @throws SQLException SQL実行例外
     */
    public boolean checkGroup(Connection con, long grpSid) throws SQLException {

        boolean ret = false;
        CmnGroupmModel mdl = new CmnGroupmModel();
        CmnGroupmDao dao = new CmnGroupmDao(con);
        mdl = dao.select((int) grpSid);
        if (mdl != null && mdl.getGrpJkbn() == GSConst.JTKBN_TOROKU) {
            ret = true;
        }
        return ret;
    }
    /**
     * <br>[機  能] 指定したユーザが、削除されていないかチェック
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param usrSid ユーザSID
     * @return true:存在する、false:存在しない
     * @throws SQLException SQL実行例外
     */
    public boolean checkUser(Connection con, long usrSid) throws SQLException {

        boolean ret = false;
        CmnUsrmDao dao = new CmnUsrmDao(con);
        int kbn = dao.getUserJkbn((int) usrSid);
        if (kbn == GSConst.JTKBN_TOROKU) {
            ret = true;
        }
        return ret;
    }
    /**
     * <br>[機  能] 対象者一覧(未選択)を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param grpSid 表示中グループSID
     * @param selectList 選択済みSIDリスト
     * @param con コネクション
     * @return 対象者一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<UsrLabelValueBean> getNonSelectLabel(
            int grpSid,
            String[] selectList,
            Connection con)
    throws SQLException {


        ArrayList<UsrLabelValueBean> ansCombo = new ArrayList<UsrLabelValueBean>();

        if (grpSid == GROUP_GRPLIST) {
            //グループを全て取得
            GroupDao dao = new GroupDao(con);
            CmnCmbsortConfDao sortDao = new CmnCmbsortConfDao(con);
            CmnCmbsortConfModel sortMdl = sortDao.getCmbSortData();
            ArrayList<GroupModel> allGpList = dao.getGroupTree(sortMdl);

            //選択済みのグループを除外
            List<String> selectGrpList = new ArrayList<String>();
            if (selectList != null) {
                selectGrpList = Arrays.asList(selectList);
            }

            for (GroupModel bean : allGpList) {
                if (!selectGrpList.contains(GROUP_PREFIX + bean.getGroupSid())) {
                    ansCombo.add(new UsrLabelValueBean(
                            bean.getGroupName(),
                            String.valueOf(GROUP_PREFIX + bean.getGroupSid())));
                }
            }
        } else {

            //除外するユーザSID
            ArrayList<Integer> usrSids = new ArrayList<Integer>();
            if (selectList != null) {
                for (String selectSid : selectList) {
                    usrSids.add(new Integer(NullDefault.getInt(selectSid, -1)));
                }
            }

            UserBiz userBiz = new UserBiz();
            List<CmnUsrmInfModel> userList
                = userBiz.getBelongUserList(con, grpSid, usrSids);

            for (CmnUsrmInfModel userMdl : userList) {
                ansCombo.add(
                        new UsrLabelValueBean(userMdl));
            }
        }

        return ansCombo;
    }
    /**
     * フォーム情報のグループコンボ値がグループSIDかマイグループSIDかを判定する
     * <br>[機  能]先頭文字に"M"が有る場合、マイグループSID
     * <br>[解  説]
     * <br>[備  考]
     * @param gpSid グループSID
     * @return boolean true:マイグループ false=通常のグループ
     */
    private boolean __isMyGroupSid(String gpSid) {
        boolean ret = false;
        if (gpSid == null) {
            return ret;
        }
        return gpSid.startsWith(MYGROUP_PREFIX);
    }

    /**
     * <br>[機  能] 対象者一覧(未選択)を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param grpSid 表示中グループSID
     * @param selectList 選択済みSIDリスト
     * @param sessionUsrSid セッションユーザSID
     * @param con コネクション
     * @return 対象者一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<UsrLabelValueBean> getNonSelectLabel(
            String grpSid,
            String[] selectList,
            int sessionUsrSid,
            Connection con)
    throws SQLException {


        ArrayList<UsrLabelValueBean> ansCombo = new ArrayList<UsrLabelValueBean>();
        if (__isMyGroupSid(grpSid)) {
            int myGrpSid = Integer.valueOf(grpSid.substring(MYGROUP_PREFIX.length()));
            UserBiz userBiz = new UserBiz();
            return new ArrayList<UsrLabelValueBean>(
                    userBiz.getMyGroupUserLabelList(con, sessionUsrSid,
                        myGrpSid, selectList));
        } else {
            ansCombo = getNonSelectLabel(Integer.valueOf(grpSid), selectList, con);
        }

        return ansCombo;
    }

    /**
     * <br>[機  能] グループラベルを取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエストモデル
     * @param con コネクション
     * @return グループラベルリスト
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<UsrLabelValueBean> getGroupLabel(RequestModel reqMdl,
                                                         Connection con) throws SQLException {

        log__.debug("グループラベル取得処理");

        ArrayList<UsrLabelValueBean> groupLabel = new ArrayList<UsrLabelValueBean>();
        GsMessage gsMsg = new GsMessage(reqMdl);

        // グループリスト取得
        GroupBiz grpBiz = new GroupBiz();
        ArrayList<GroupModel> grpList = grpBiz.getGroupCombList(con);

        // グループラベル作成
        groupLabel.add(new UsrLabelValueBean(gsMsg.getMessage("cmn.grouplist"),
                                          String.valueOf(GROUP_GRPLIST)));
        for (GroupModel grpBean : grpList) {
            groupLabel.add(new UsrLabelValueBean(grpBean.getGroupName(),
                                             String.valueOf(grpBean.getGroupSid())));
        }

        return groupLabel;
    }
    /**
     * <br>[機  能] 対象者一覧を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param selectList 選択済みSIDリスト
     * @param con コネクション
     * @return 対象者一覧
     * @throws SQLException SQL実行時例外
     */
    public ArrayList<UsrLabelValueBean> getSelectedLabel(String[] selectList
            , Connection con) throws SQLException {

        ArrayList<UsrLabelValueBean> ansCombo = new ArrayList<UsrLabelValueBean>();

        ArrayList<Integer> grpSids = new ArrayList<Integer>();
        ArrayList<String> usrSids = new ArrayList<String>();

        //ユーザSIDとグループSIDを分離
        String[] selectAnsList = selectList;
        if (selectAnsList == null) {
            return ansCombo;
        }
        for (String ansSid : selectAnsList) {
            String str = NullDefault.getString(ansSid, "-1");
            if (str.contains(new String(GROUP_PREFIX).subSequence(0, 1))) {
                //グループ
                grpSids.add(new Integer(str.substring(1, str.length())));
            } else {
                if (ValidateUtil.isNumber(str)) {
                    //ユーザ
                    usrSids.add(str);
                }
            }
        }

        //グループ情報取得
        UsidSelectGrpNameDao gdao = new UsidSelectGrpNameDao(con);
        ArrayList<GroupModel> grpList = gdao.selectGroupNmListOrderbyConf(grpSids);
        for (GroupModel grpMdl : grpList) {
            ansCombo.add(new UsrLabelValueBean(
                    grpMdl.getGroupName(), GROUP_PREFIX + grpMdl.getGroupSid()));
        }

        //ユーザ情報取得
        UserBiz userBiz = new UserBiz();
        List<CmnUsrmInfModel> userList
                = userBiz.getUserList(con,
                                        (String[]) usrSids.toArray(new String[usrSids.size()]));
        for (CmnUsrmInfModel usrMdl : userList) {
            ansCombo.add(
                    new UsrLabelValueBean(usrMdl));
        }

        return ansCombo;
    }
    /**
     * <br>[機  能] リスト中で選択されている発信対象者を追加する
     * <br>[解  説]
     * <br>[備  考]
     * @param list 元のグループリスト
     * @param selectSids 選択グループリスト
     * @return 選択グループを追加したグループリスト
     * @throws Exception 実行例外
     */
    public String[] getListToAdd(String[] list, String[] selectSids) throws Exception {

        log__.debug("リスト中で選択されている発信対象者の追加処理");

        String[] retList = null;
        List<String> newList = new ArrayList<String>();
        // 選択中リストの件数チェック
        if (selectSids == null || selectSids.length < 1) {
            return list;
        }

        // 元のリストに、選択されている発信対象者を追加したリストを作成する
        if (list != null && list.length > 0) {
            for (String str : list) {
                newList.add(str);
            }
        }
        for (String str : selectSids) {
            newList.add(str);
        }
        if (newList.size() > 0) {
            retList = (String[]) newList.toArray(new String[newList.size()]);
        }

        return retList;
    }
    /**
     * <br>[機  能] リスト中で選択されている発信対象者を削除する
     * <br>[解  説]
     * <br>[備  考]
     * @param list 元のリスト
     * @param selectSids 選択中のリスト
     * @return 選択中のリストを削除したリスト
     * @throws Exception 実行例外
     */
    public String[] getListToRemove(String[] list, String[] selectSids) throws Exception {

        log__.debug("リスト中で選択されている発信対象者の削除処理");

        String[] retList = null;
        String[] select = null;
        List<String> newList = new ArrayList<String>();

        // 元のリスト、選択中リストの件数チェック
        if (list == null || list.length < 1) {
            return list;
        }
        if (selectSids == null || selectSids.length < 1) {
            return list;
        }

        // 元のリストから、選択されている発信対象者を除外したリストを作成する
        select = Arrays.copyOf(selectSids, selectSids.length);
        Arrays.sort(select);
        for (String str : list) {
            if (Arrays.binarySearch(select, str) < 0) {
                newList.add(str);
            }
        }
        if (newList.size() > 0) {
            retList = (String[]) newList.toArray(new String[newList.size()]);
        }

        return retList;
    }



}
