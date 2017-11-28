package jp.groupsession.v2.cmn.formmodel;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;
/**
*
* <br>[機  能] ユーザグループ選択コンボ モデル
* <br>[解  説] ユーザグループ選択で扱う、表示情報と画面からの入力情報を格納する
* <br>[備  考]
*
* @author JTS
*/
public class UserGroupSelectModel implements IFormModel {
    /**定数 アクション部 選択済みへ追加*/
    public static final String CMDACTION_ADD_SELECT = "addSelect";
    /**定数 アクション部 選択済みから除去*/
    public static final String CMDACTION_REM_SELECT = "removeSelect";

    /**選択済みリスト参照キー*/
    private String[] keys__;
    /** 選択済みリスト 表示用タイトル*/
    private HashMap<String , String> selectedListName__ = new HashMap<String, String>();
    /** 選択済みリスト 表示用*/
    private HashMap<String , List<UsrLabelValueBean>> selectedList__ =
            new HashMap<String, List<UsrLabelValueBean>>();
    /** 未選択リスト 表示用*/
    private List<UsrLabelValueBean> noselectList__ = new ArrayList<UsrLabelValueBean>();

    /** 選択済みID リスト*/
    private HashMap<String , String[]> selected__ = new HashMap<String, String[]>();

    /** グループコンボ*/
    private GroupComboModel group__ = new GroupComboModel();
    /** 縦スクロール位置*/
    private int scrollY__;
    /** 選択済みリスト利用区分*/
    private HashMap<String , String> selectedListUse__ = new HashMap<String, String>();
    /** 一時選択対象*/
    private String[] targetSelected__;
    /** 一時選択対象*/
    private String[] targetNoSelected__;
    /** 表示非表示*/
    private boolean hide__ = false;
    /** 選択除外ユーザ*/
    private String[] banUsrSid__;


    /**
     * <p>selectedList を取得します。
     * @return selectedList
     */
    public HashMap<String, List<UsrLabelValueBean>> getSelectedList() {
        return selectedList__;
    }
    /**
     * <p>selectedList を取得します。
     * @param key 参照ID
     * @return selectedList
     */
    public List<UsrLabelValueBean> getSelectedList(String key) {
        if (selectedList__.containsKey(key)) {
            return selectedList__.get(key);
        }
        return new ArrayList<UsrLabelValueBean>();
    }

    /**
     * <p>selectedList をセットします。
     * @param selectedList selectedList
     */
    public void setSelectedList(
            HashMap<String, List<UsrLabelValueBean>> selectedList) {
        selectedList__ = selectedList;
    }
    /**
     * <p>selectedList をセットします。
     * @param key 参照ID
     * @param selectedList selectedList
     */
    public void setSelectedList(
            String key, List<UsrLabelValueBean> selectedList) {
        selectedList__.put(key, selectedList);
    }

    /**
     * <p>noselectList を取得します。
     * @return noselectList
     */
    public List<UsrLabelValueBean> getNoselectList() {
        return noselectList__;
    }

    /**
     * <p>noselectList をセットします。
     * @param noselectList noselectList
     */
    public void setNoselectList(List<UsrLabelValueBean> noselectList) {
        noselectList__ = noselectList;
    }

    /**
     * <p>selected を取得します。
     * @return selected
     */
    public HashMap<String, String[]> getSelected() {
        return selected__;
    }
    /**
     * <p>selected を取得します。
     * @param key 参照ID
     * @return selected
     */
    public String[] getSelected(String key) {
        if (selected__.containsKey(key)) {
            String[] ret = selected__.get(key);
            if (ret == null) {
                return  new String[0];
            }
            return ret;
        }
        return new String[0];
    }

    /**
     * <p>selected をセットします。
     * @param selected selected
     */
    public void setSelected(HashMap<String, String[]> selected) {
        selected__ = selected;
    }
    /**
     * <p>selected をセットします。
     * @param key 参照ID
     * @param selected selected
     */
    public void setSelected(String key, String[] selected) {
        selected__.put(key, selected);
    }
    /**
     * <p>selected をセットします。
     * @param key 参照ID
     * @param selected selected
     */
    public void setSelected(String key, String selected) {
        selected__.put(key, new String[] {selected});
    }

    /**
     * <p>keys を取得します。
     * @return keys
     */
    public String[] getKeys() {
        return keys__;
    }

    /**
     * <p>keys をセットします。
     * @param keys keys
     */
    public void setKeys(String[] keys) {
        keys__ = keys;
    }

    /**
     * <p>selectedListName を取得します。
     * @return selectedListName
     */
    public HashMap<String, String> getSelectedListName() {
        return selectedListName__;
    }

    /**
     * <p>selectedListName をセットします。
     * @param selectedListName selectedListName
     */
    public void setSelectedListName(HashMap<String, String> selectedListName) {
        selectedListName__ = selectedListName;
    }

    /**
     * <p>group を取得します。
     * @return group
     */
    public GroupComboModel getGroup() {
        return group__;
    }

    /**
     * <p>group をセットします。
     * @param group group
     */
    public void setGroup(GroupComboModel group) {
        group__ = group;
    }
    /**
     * <p>scrollY を取得します。
     * @return scrollY
     */
    public int getScrollY() {
        return scrollY__;
    }
    /**
     * <p>scrollY をセットします。
     * @param scrollY scrollY
     */
    public void setScrollY(int scrollY) {
        scrollY__ = scrollY;
    }
    /**
     * <p>selectedListUse を取得します。
     * @return selectedListUse
     */
    public HashMap<String, String> getSelectedListUse() {
        return selectedListUse__;
    }
    /**
     * <p>selectedListUse をセットします。
     * @param selectedListUse selectedListUse
     */
    public void setSelectedListUse(HashMap<String, String> selectedListUse) {
        selectedListUse__ = selectedListUse;
    }
    /**
     * <p>selectedListUse をセットします。
     * @param key key
     * @param value value
     */
    public void setSelectedListUse(String key, String value) {
        selectedListUse__.put(key, value);
    }
    /**
     * <p>targetSelected を取得します。
     * @return targetSelected
     */
    public String[] getTargetSelected() {
        return targetSelected__;
    }
    /**
     * <p>targetSelected をセットします。
     * @param targetSelected targetSelected
     */
    public void setTargetSelected(String[] targetSelected) {
        targetSelected__ = targetSelected;
    }
    /**
     * <p>targetNoSelected を取得します。
     * @return targetNoSelected
     */
    public String[] getTargetNoSelected() {
        return targetNoSelected__;
    }
    /**
     * <p>targetNoSelected をセットします。
     * @param targetNoSelected targetNoSelected
     */
    public void setTargetNoSelected(String[] targetNoSelected) {
        targetNoSelected__ = targetNoSelected;
    }
    /**
     * <p>hide を取得します。
     * @return hide
     */
    public boolean isHide() {
        return hide__;
    }
    /**
     * <p>hide をセットします。
     * @param hide hide
     */
    public void setHide(boolean hide) {
        hide__ = hide;
    }
    /**
     *
     * <br>[機  能] hideに応じてCSSのdisplay記述を返します。
     * <br>[解  説]
     * <br>[備  考]
     * @return CSSのdisplay記述
     */
    public String getStyleDisplay() {
        if (isHide()) {
            return "display:none;";
        } else {
            return "display:block;";
        }
    }

    /**
     * <p>banUsrSid を取得します。
     * @return banUsrSid
     */
    public String[] getBanUsrSid() {
        return banUsrSid__;
    }
    /**
     * <p>banUsrSid をセットします。
     * @param banUsrSid banUsrSid
     */
    public void setBanUsrSid(String[] banUsrSid) {
        banUsrSid__ = banUsrSid;
    }
    /**
     *
     * <br>[機  能] ユーザ選択フォーム初期化処理
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param reqMdl リクエストモデル
     * @param keys 選択済みリスト参照キー
     * @param selectedListName 選択済みリスト表示タイトル
     * @param defGroupSid デフォルトグループSID
     * @param grplist グループ選択リスト nullの場合はグループ一覧を含むグループツリー
     * @param banSids 選択対象に含まないSID
     * @throws SQLException SQL実行時例外
     */
    public void init(Connection con, RequestModel reqMdl,
            String[] keys , String[] selectedListName,
            String defGroupSid, List<UsrLabelValueBean> grplist,
            String[] banSids) throws SQLException {
        if (keys == null) {
            return;
        }
        banUsrSid__ = banSids;
        Set<String> selectedIDList = new HashSet<String>();

        setKeys(keys);
        UserGroupSelectBiz biz = new UserGroupSelectBiz();

        if (grplist == null) {
            grplist = biz.getGroupLabel(reqMdl, con);
        }
        group__.init(grplist, defGroupSid);

        //選択済みリスト参照キーごとにリストを初期化
        for (int i = 0; i < keys.length; i++) {
            if (i < selectedListName.length) {
                selectedListName__.put(keys[i], selectedListName[i]);
                String[] selected = getSelected(keys[i]);
                List<String> selectSidList = new ArrayList<String>(Arrays.asList(selected));
                selectSidList.removeAll(Arrays.asList(banUsrSid__));
                selectedIDList.addAll(Arrays.asList(banUsrSid__));
                selected = selectSidList.toArray(new String[selectSidList.size()]);
                List<UsrLabelValueBean> selectedList = biz.getSelectedLabel(
                        selected, con);
                selectedIDList.addAll(Arrays.asList(selected));
                selectedList__.put(keys[i], selectedList);
                selectedListUse__.put(keys[i], String.valueOf(true));
            }
        }

        noselectList__ = biz.getNonSelectLabel(group__.getSelected(),
                selectedIDList.toArray(new String[selectedIDList.size()]) ,
                reqMdl.getSmodel().getUsrsid(), con);

    }
    /**
     *
     * <br>[機  能] 選択の追加変更の実行
     * <br>[解  説] コマンドから処理を切り替える
     * <br>[備  考]
     * @param cmd コマンド文字列
     * @param paramName ユーザ選択フォームのパラメータ名
     * @throws Exception 実行時例外
     */
    public void executeCmd(String cmd, String paramName) throws Exception {
        if (cmd == null || paramName == null || !cmd.startsWith(paramName)) {
            return;
        }
        //コマンド（paramName.アクション(参照ID) からparamName.を除去）
        String action = cmd.substring(paramName.length() + 1);
        if (action.startsWith(CMDACTION_ADD_SELECT)) {
            String key = action.substring(CMDACTION_ADD_SELECT.length() + 1,
                    action.indexOf(")"));
            __addSelect(key);

        } else if (action.startsWith(CMDACTION_REM_SELECT)) {
            String key = action.substring(CMDACTION_REM_SELECT.length() + 1,
                    action.indexOf(")"));
            __remSelect(key);
        }
    }
    /**
     *
     * <br>[機  能] 選択リストから選択済みを設定
     * <br>[解  説]
     * <br>[備  考]
     * @param key 参照ID
     * @throws Exception 実行時例外
     */
    private void __addSelect(String key) throws Exception {
        UserGroupSelectBiz biz = new UserGroupSelectBiz();
        String[] newSelected = biz.getListToAdd(getSelected(key), targetNoSelected__);
        setSelected(key, newSelected);
    }
    /**
     *
     * <br>[機  能] 選択リストから選択済みを設定
     * <br>[解  説]
     * <br>[備  考]
     * @param key 参照ID
     * @throws Exception 実行時例外
     */
    private void __remSelect(String key) throws Exception {
        UserGroupSelectBiz biz = new UserGroupSelectBiz();
        String[] newSelected = biz.getListToRemove(getSelected(key), targetSelected__);
        setSelected(key, newSelected);
    }
    /**
    *
    * <br>[機  能] 共通メッセージフォームのパラメータ設定 管理者設定アドレス管理画面用のみ
    * <br>[解  説]
    * <br>[備  考]
    * @param msgForm 共通メッセージフォーム
    * @param paramName フォーム要素へのパラメータ指定
    */
   public void setHiddenParam(
           Cmn999Form msgForm, String paramName) {
       //グループコンボ
       group__.setHiddenParam(msgForm, paramName + ".group");
       //選択済みID
       for (String key : selectedList__.keySet()) {
           String[] selected = selected__.get(key);
           if (selected != null && selected.length > 0) {
               msgForm.addHiddenParam(paramName + ".selected(" + key + ")", selected);
           }
       }
   }
}
