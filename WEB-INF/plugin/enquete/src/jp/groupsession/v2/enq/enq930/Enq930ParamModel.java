package jp.groupsession.v2.enq.enq930;

import java.util.ArrayList;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.enq.enq900.Enq900ParamModel;

/**
 * <br>[機  能] 管理者設定 表示設定画面のパラメータモデル
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Enq930ParamModel extends Enq900ParamModel {

    /** 表示区分 */
    private int enq930DspKbn__ = 0;
    /** 表示件数選択値 */
    private int enq930SelectCnt__ = 0;
    /** 表示件数一覧 */
    private ArrayList<LabelValueBean> enq930CntListLabel__ = null;
    /** 初期表示フォルダ選択値 */
    private String enq930SelectFolder__ = null;
    /** 初期表示フォルダ一覧 */
    private ArrayList<LabelValueBean> enq930FolderListLabel__ = null;
    /** 回答可能のみ表示 */
    private boolean enq930CanAnswer__ = false;

    /**
     * <p>表示区分 を取得します。
     * @return 表示区分
     */
    public int getEnq930DspKbn() {
        return enq930DspKbn__;
    }
    /**
     * <p>表示区分 をセットします。
     * @param enq930DspKbn 表示区分
     */
    public void setEnq930DspKbn(int enq930DspKbn) {
        enq930DspKbn__ = enq930DspKbn;
    }
    /**
     * <p>表示件数選択値 を取得します。
     * @return 表示件数選択値
     */
    public int getEnq930SelectCnt() {
        return enq930SelectCnt__;
    }
    /**
     * <p>表示件数選択値 をセットします。
     * @param enq930SelectCnt 表示件数選択値
     */
    public void setEnq930SelectCnt(int enq930SelectCnt) {
        enq930SelectCnt__ = enq930SelectCnt;
    }
    /**
     * <p>表示件数一覧 を取得します。
     * @return 表示件数一覧
     */
    public ArrayList<LabelValueBean> getEnq930CntListLabel() {
        return enq930CntListLabel__;
    }
    /**
     * <p>表示件数一覧 をセットします。
     * @param enq930CntList 表示件数一覧
     */
    public void setEnq930CntListLabel(ArrayList<LabelValueBean> enq930CntList) {
        enq930CntListLabel__ = enq930CntList;
    }
    /**
     * <p>enq930SelectFolder を取得します。
     * @return enq930SelectFolder
     */
    public String getEnq930SelectFolder() {
        return enq930SelectFolder__;
    }
    /**
     * <p>enq930SelectFolder をセットします。
     * @param enq930SelectFolder enq930SelectFolder
     */
    public void setEnq930SelectFolder(String enq930SelectFolder) {
        enq930SelectFolder__ = enq930SelectFolder;
    }
    /**
     * <p>enq930FolderListLabel を取得します。
     * @return enq930FolderListLabel
     */
    public ArrayList<LabelValueBean> getEnq930FolderListLabel() {
        return enq930FolderListLabel__;
    }
    /**
     * <p>enq930FolderListLabel をセットします。
     * @param enq930FolderListLabel enq930FolderListLabel
     */
    public void setEnq930FolderListLabel(
            ArrayList<LabelValueBean> enq930FolderListLabel) {
        enq930FolderListLabel__ = enq930FolderListLabel;
    }
    /**
     * <p>enq930CanAnswer を取得します。
     * @return enq930CanAnswer
     */
    public boolean getEnq930CanAnswer() {
        return enq930CanAnswer__;
    }
    /**
     * <p>enq930CanAnswer をセットします。
     * @param enq930CanAnswer enq930CanAnswer
     */
    public void setEnq930CanAnswer(boolean enq930CanAnswer) {
        enq930CanAnswer__ = enq930CanAnswer;
    }
}
