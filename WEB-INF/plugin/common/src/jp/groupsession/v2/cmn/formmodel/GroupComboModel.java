package jp.groupsession.v2.cmn.formmodel;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;
/**
 *
 * <br>[機  能] グループ選択コンボ モデル
 * <br>[解  説] グループ選択コンボで扱う、表示情報と画面からの入力情報を格納する
 * <br>[備  考]
 *
 * @author JTS
 */
public class GroupComboModel implements IFormModel {
    /** 選択済みSID*/
    String selected__ = "-1";
    /** 選択候補 */
    List<UsrLabelValueBean> list__ = new ArrayList<UsrLabelValueBean>();
    /**
     * <p>selected を取得します。
     * @return selected
     */
    public String getSelected() {
        return selected__;
    }
    /**
     * <p>selected をセットします。
     * @param selected selected
     */
    public void setSelected(String selected) {
        selected__ = selected;
    }
    /**
     * <p>list を取得します。
     * @return list
     */
    public List<UsrLabelValueBean> getList() {
        return list__;
    }
    /**
     * <p>list をセットします。
     * @param list list
     */
    public void setList(List<UsrLabelValueBean> list) {
        list__ = list;
    }
    /**
     *
     * <br>[機  能] グループコンボの初期化
     * <br>[解  説]
     * <br>[備  考]
     * @param grplist グループリスト
     * @param defGroupSid 選択要素がない場合のデフォルトSID
     */
    public void init(
            List<UsrLabelValueBean> grplist,
            String defGroupSid) {
        list__ = grplist;
        selected__ = __getEnableSelectGroup(grplist, selected__, defGroupSid);

    }
    /**
    *
    * <br>[機  能] 選択した値がグループコンボ上にない場合に有効な値を返す
    * <br>[解  説]
    * <br>[備  考]
    * @param list ラベルリスト
    * @param nowSel 選択中ラベルID
    * @param defSel 初期ラベルID
    * @return 有効な選択値
    */
   private String __getEnableSelectGroup(List<UsrLabelValueBean> list
           , String nowSel
           , String defSel) {
       boolean nowVar = false;
       boolean defVar = false;
       if (list == null || list.size() <= 0) {
           return "";
       }
       for (LabelValueBean label : list) {
           if (label.getValue().equals(nowSel)) {
               nowVar = true;
               break;
           }
           if (label.getValue().equals(defSel)) {
               defVar = true;
           }
       }
       if (nowVar) {
           return nowSel;
       }
       if (defVar) {
           return defSel;
       }
       return list.get(0).getValue();
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
      //選択済みSID
      msgForm.addHiddenParam(paramName + ".selected", this.getSelected());
  }

}
