package jp.groupsession.v2.tcd.tcd110;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.cmn.biz.GroupBiz;
import jp.groupsession.v2.cmn.biz.UserBiz;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.UsidSelectGrpNameDao;
import jp.groupsession.v2.cmn.dao.base.CmnCmbsortConfDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnCmbsortConfModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.sml.sml390.Sml390Form;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.tcd.TimecardBiz;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;


/**
 * <br>[機  能] タイムカード 管理者設定 基本設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Tcd110Biz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Tcd110Biz.class);

    /** リクエスト */
    private RequestModel reqMdl__ = null;

    /**
     * <br>[機  能] コンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param reqMdl リクエスト情報
     */
    public Tcd110Biz(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }

    /**
     * <br>[機  能] 初期表示画面情報を設定します
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータ情報
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    public void setInitData(Tcd110ParamModel paramMdl, Connection con)
    throws SQLException {


        TimecardBiz tcBiz = new TimecardBiz(reqMdl__);
        //年コンボ
        List<LabelValueBean> yearList = tcBiz.getYearLabelList(con);
        paramMdl.setTcd110YearLabelList(yearList);
        //月コンボ
        paramMdl.setTcd110MonthLabelList(tcBiz.getMonthLabelList());

        //出力対象月
        if (paramMdl.getTcd110initFlg() == 0) {
            paramMdl.setTcd110initFlg(1);

            //初期表示時 現在年 or 最新のタイムカード登録年を年に設定
            int initYear = Integer.parseInt(yearList.get(yearList.size() - 1).getValue());
            UDate date = new UDate();
            int nowYear = date.getYear();
            if (initYear > nowYear) {
                initYear = nowYear;
            }
            paramMdl.setTcd110Year(initYear);
            paramMdl.setTcd110Month(1);
        }

        //出力対象部分を取得
        __getOutputTarget(paramMdl, con);
    }

    /**
     * <br>[機  能] 勤務表出力対象ユーザのユーザID/ユーザ名Mappingを取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param targetList 勤務表出力対象グループ・ユーザ
     * @param reqMdl リクエスト情報
     * @return ユーザID/ユーザ名Mapping
     * @throws SQLException SQL実行時例外
     */
    public Map<Integer, String> getOutputUserMap(
            Connection con, String[] targetList, RequestModel reqMdl)
    throws SQLException {
        //ユーザID/ユーザ名Mapping
        Map<Integer, String> targetMap = new HashMap<Integer, String>();
        //ユーザ名/連番Mapping
        Map<String, Integer> userNameMap = new HashMap<String, Integer>();

        UserBiz usrBiz = new UserBiz();
        for (String target : targetList) {
            List<CmnUsrmInfModel> userList = null;
            if (target.startsWith("G")) {
                //グループの所属ユーザを取得
                int grpSid = Integer.parseInt(target.substring(1));
                userList =
                        usrBiz.getBelongUserList(con, grpSid, null,
                                                        reqMdl.getSmodel().getUsrsid(), false);
            } else {
                userList = usrBiz.getUserList(con, new String[] {target});
            }

            if (userList != null && !userList.isEmpty()) {
                for (CmnUsrmInfModel usrMdl : userList) {
                    int targetUserSid = usrMdl.getUsrSid();
                    //設定済みのユーザ情報は除外する
                    if (targetMap.containsKey(targetUserSid)) {
                        continue;
                    }

                    String userName = usrMdl.getUsiSei() + "_" + usrMdl.getUsiMei();
                    //同名のユーザが存在する場合、ユーザ名に連番を付与する
                    if (userNameMap.containsKey(userName)) {
                        int userNameCount = userNameMap.get(userName);
                        userNameMap.put(userName, userNameCount + 1);
                        userName += "_" + userNameCount;
                    }
                    userNameMap.put(userName, 1);

                    targetMap.put(targetUserSid, userName);
                }
            }
        }

        return targetMap;
    }

    /**
     * <br>[機  能] 出力対象部分を返します。
     * <br>[解  説]
     * <br>[備  考] ユーザ・グループ選択部分を作成します。
     * @param paramMdl パラメータモデル
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __getOutputTarget(
            Tcd110ParamModel paramMdl, Connection con)
                    throws SQLException {
        GsMessage gsMsg = new GsMessage(reqMdl__);
        int usrSid = reqMdl__.getSmodel().getUsrsid();

        //グループコンボを設定
        GroupBiz grpBiz = new GroupBiz();
        List<LabelValueBean> groupCombo = new ArrayList<LabelValueBean>();
        groupCombo.add(
                new LabelValueBean(gsMsg.getMessage("cmn.grouplist"),
                        String.valueOf(Sml390Form.GROUP_COMBO_VALUE)));

        ArrayList<GroupModel> grpList = grpBiz.getGroupCombList(con);
        for (GroupModel grpMdl : grpList) {
            LabelValueBean label = new LabelValueBean(
                    grpMdl.getGroupName(), String.valueOf(grpMdl.getGroupSid()));
            groupCombo.add(label);
        }
        paramMdl.setGroupCombo(groupCombo);

        //グループコンボの初期値を設定
        int defGrp = paramMdl.getTcd110targetGroup();
        if (defGrp == -1) {
            GroupBiz grpBz = new GroupBiz();
            defGrp = grpBz.getDefaultGroupSid(usrSid, con);
            paramMdl.setTcd110targetGroup(defGrp);
        }

        //選択中
        String[] targetSelect = paramMdl.getTcd110target();

        //選択中コンボを作成
        paramMdl.setTcd110targetSelectCombo(
                _getSelectUserLabelList(targetSelect, con));

        //未選択コンボを作成
        paramMdl.setTcd110targetNoSelectCombo(
                __getNonSelectUserLabelList(targetSelect, defGrp, con));

    }

    /**
     * <br>[機  能] ユーザ、グループの一覧を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param userList 取得するユーザSID・グループSID
     * @return ユーザ、グループ一覧
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    protected ArrayList<LabelValueBean> _getSelectUserLabelList(
            String[] userList, Connection con)
                    throws SQLException {

        ArrayList<LabelValueBean> ret = new ArrayList<LabelValueBean>();

        ArrayList<Integer> grpSids = new ArrayList<Integer>();
        ArrayList<String> usrSids = new ArrayList<String>();

        //ユーザSIDとグループSIDを分離
        if (userList != null) {
            for (String userId : userList) {
                String str = NullDefault.getString(userId, "-1");
                log__.debug("str==>" + str);
                log__.debug("G.index==>" + str.indexOf("G"));
                if (str.contains(new String("G").subSequence(0, 1))) {
                    //グループ
                    grpSids.add(new Integer(str.substring(1, str.length())));
                } else {
                    //ユーザ
                    usrSids.add(str);
                }
            }
        }

        //グループ情報取得
        UsidSelectGrpNameDao gdao = new UsidSelectGrpNameDao(con);
        ArrayList<GroupModel> glist = gdao.selectGroupNmListOrderbyClass(grpSids);
        LabelValueBean label = null;
        for (GroupModel gmodel : glist) {
            label = new LabelValueBean();
            label.setLabel(gmodel.getGroupName());
            label.setValue("G" + String.valueOf(gmodel.getGroupSid()));
            ret.add(label);
        }

        //ユーザ情報取得
        UserBiz userBiz = new UserBiz();
        ArrayList<BaseUserModel> ulist = userBiz.getBaseUserList(
                con, (String[]) usrSids.toArray(new String[usrSids.size()]));
        for (BaseUserModel umodel : ulist) {
            label = new LabelValueBean();
            label.setLabel(umodel.getUsisei() + " " + umodel.getUsimei());
            label.setValue(String.valueOf(umodel.getUsrsid()));
            ret.add(label);
        }

        return ret;
    }

    /**
     * <br>[機  能] 指定したユーザ・グループを除いた分の一覧を取得します。
     * <br>[解  説]
     * <br>[備  考]
     * @param excludedList 除外するユーザ、グループ
     * @param groupSid 選択グループ
     * @param con コネクション
     * @return ユーザまたはグループ一覧
     * @throws SQLException SQL実行時例外
     */
    private ArrayList<LabelValueBean> __getNonSelectUserLabelList(
            String[] excludedList, int groupSid, Connection con) throws SQLException {

        ArrayList<LabelValueBean> ret = new ArrayList<LabelValueBean>();
        if (groupSid == Sml390Form.GROUP_COMBO_VALUE) {
            //グループを全て取得
            GroupDao dao = new GroupDao(con);
            CmnCmbsortConfDao sortDao = new CmnCmbsortConfDao(con);
            CmnCmbsortConfModel sortMdl = sortDao.getCmbSortData();
            ArrayList<GroupModel> allGpList = dao.getGroupTree(sortMdl);

            //除外するユーザ、グループのSIDを除外する
            List<String> excludeList = new ArrayList<String>();
            if (excludedList != null && excludedList.length > 0) {
                excludeList.addAll(Arrays.asList(excludedList));
            }

            for (GroupModel bean : allGpList) {
                if (!excludeList.contains(String.valueOf("G" + bean.getGroupSid()))) {
                    ret.add(new LabelValueBean(
                            bean.getGroupName(), String.valueOf("G" + bean.getGroupSid())));
                }
            }

        } else {

            //除外するユーザSID
            ArrayList<Integer> excludeList = new ArrayList<Integer>();
            if (excludedList != null) {
                for (String usrSid : excludedList) {
                    excludeList.add(new Integer(NullDefault.getInt(usrSid, -1)));
                }
            }
            UserBiz userBiz = new UserBiz();
            List<CmnUsrmInfModel> userList
                = userBiz.getBelongUserList(con, groupSid, excludeList);

            LabelValueBean label = null;
            for (CmnUsrmInfModel userData : userList) {
                label = new LabelValueBean();
                label.setLabel(userData.getUsiSei() + " " + userData.getUsiMei());
                label.setValue(String.valueOf(userData.getUsrSid()));
                ret.add(label);
            }
        }

        return ret;
    }


    /**
     * <br>[機  能] 追加側のコンボで選択中のメンバーをメンバーリストに追加する
     * <br>[解  説] 画面右側のコンボ表示に必要なSID(複数)をメンバーリスト(memberSid)で持つ。
     *              画面で追加矢印ボタンをクリックした場合、
     *              追加側のコンボで選択中の値(addSelectSid)をメンバーリストに追加する。
     * <br>[備  考] 追加側のコンボで値が選択されていない場合はメンバーリストをそのまま返す
     *
     * @param addSelectSid 追加側のコンボで選択中の値
     * @param memberSid メンバーリスト
     * @return 追加済みのメンバーリスト
     */
    public String[] getAddMember(String[] addSelectSid, String[] memberSid) {

        if (addSelectSid == null) {
            return memberSid;
        }
        if (addSelectSid.length < 1) {
            return memberSid;
        }

        //追加後に画面にセットするメンバーリストを作成
        ArrayList<String> list = new ArrayList<String>();

        if (memberSid != null) {
            for (int j = 0; j < memberSid.length; j++) {
                if (!memberSid[j].equals("-1")) {
                    list.add(memberSid[j]);
                }
            }
        }

        for (int i = 0; i < addSelectSid.length; i++) {
            if (!addSelectSid[i].equals("-1")) {
                list.add(addSelectSid[i]);
            }
        }

        log__.debug("追加後メンバーリストサイズ = " + list.size());
        return list.toArray(new String[list.size()]);
    }
}
