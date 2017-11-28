package jp.groupsession.v2.rsv.rsv050;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.rsv.dao.RsvSisGrpDao;
import jp.groupsession.v2.rsv.model.RsvSisGrpModel;
import jp.groupsession.v2.rsv.rsv030.Rsv030Form;

/**
 * <br>[機  能] 施設予約 施設グループ情報設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv050Form extends Rsv030Form {

    /** 施設グループリスト */
    private ArrayList<Rsv050Model> rsv050GroupList__ = null;
    /** ラジオ選択値 */
    private String rsv050SortRadio__ = null;
    /** 画面表示全キーリスト */
    private String[] rsv050KeyList__ = null;
    /** 編集対象施設グループSID */
    private int rsv050EditGrpSid__ = -1;

    /**
     * <p>rsv050SortRadio__ を取得します。
     * @return rsv050SortRadio
     */
    public String getRsv050SortRadio() {
        return rsv050SortRadio__;
    }
    /**
     * <p>rsv050SortRadio__ をセットします。
     * @param rsv050SortRadio rsv050SortRadio__
     */
    public void setRsv050SortRadio(String rsv050SortRadio) {
        rsv050SortRadio__ = rsv050SortRadio;
    }
    /**
     * <p>rsv050GroupList__ を取得します。
     * @return rsv050GroupList
     */
    public ArrayList<Rsv050Model> getRsv050GroupList() {
        return rsv050GroupList__;
    }
    /**
     * <p>rsv050GroupList__ をセットします。
     * @param rsv050GroupList rsv050GroupList__
     */
    public void setRsv050GroupList(ArrayList<Rsv050Model> rsv050GroupList) {
        rsv050GroupList__ = rsv050GroupList;
    }
    /**
     * <p>rsv050KeyList__ を取得します。
     * @return rsv050KeyList
     */
    public String[] getRsv050KeyList() {
        return rsv050KeyList__;
    }
    /**
     * <p>rsv050KeyList__ をセットします。
     * @param rsv050KeyList rsv050KeyList__
     */
    public void setRsv050KeyList(String[] rsv050KeyList) {
        rsv050KeyList__ = rsv050KeyList;
    }
    /**
     * <p>rsv050EditGrpSid__ を取得します。
     * @return rsv050EditGrpSid
     */
    public int getRsv050EditGrpSid() {
        return rsv050EditGrpSid__;
    }
    /**
     * <p>rsv050EditGrpSid__ をセットします。
     * @param rsv050EditGrpSid rsv050EditGrpSid__
     */
    public void setRsv050EditGrpSid(int rsv050EditGrpSid) {
        rsv050EditGrpSid__ = rsv050EditGrpSid;
    }

    /**
     *
     * <br>[機  能]上へ、下への入力チェックを行う。
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param req リクエスト
     * @param changeKbn 0:上へ 1:下へ
     * @return アクションエラー
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateForm050Move(
            Connection con, HttpServletRequest req, int changeKbn) throws SQLException {

        ActionErrors errors = new ActionErrors();
        ActionMessage msg = null;

        String[] keyList = getRsv050KeyList();

        //DB上の施設数と画面上の施設数の違いがある場合はエラー
        RsvSisGrpDao dao = new RsvSisGrpDao(con);
        List<RsvSisGrpModel> rsdMdlList = dao.select();
        if (rsdMdlList.size() != keyList.length) {
            msg = new ActionMessage("error.input.changed.rsv");
            StrutsUtil.addMessage(errors, msg, "rsv050SortRadio");
            return errors;
        }

        //施設が一つもない場合はチェックを行わない。
        if (keyList == null || keyList.length < 1) {
            return errors;
        }

        //選択したラジオのSIDと表示順を取得
        String selectedKey = getRsv050SortRadio();
        int selectSid = Integer.parseInt(selectedKey.substring(0, 10));
        int selectSort = Integer.parseInt(selectedKey.substring(10, 20));
        int targetSortDisp = Integer.parseInt(selectedKey.substring(20));
        int targetSortDb = -1;

        //入れ替え先の画面ソート番号を計算する
        if (changeKbn == GSConstReserve.SORT_UP) {
            targetSortDisp -= 1;
        } else if (changeKbn == GSConstReserve.SORT_DOWN) {
            targetSortDisp += 1;
        }

        //移動先が存在しない場合はチェックを行わない
        if (targetSortDisp <= 0 || targetSortDisp > keyList.length) {
            return errors;
        }

        //画面表示全キーから入れ替え先のデータのSidとDB上のソート順を取得する
        int targetSid = -1;
        for (String allKey : keyList) {
            int allKeyDispNum = Integer.parseInt(allKey.substring(20));
            if (allKeyDispNum == targetSortDisp) {
                targetSid = Integer.parseInt(allKey.substring(0, 10));
                targetSortDb = Integer.parseInt(allKey.substring(10, 20));
                break;
            }
        }

        boolean errorFlg = false;
        //移動先が入手できなかった場合はエラー
        if (targetSid == -1) {
            errorFlg = true;
        }

        //入れ替え元、先の施設グループを取得
        RsvSisGrpModel moveRsgMdl = dao.select(selectSid);
        RsvSisGrpModel toRsgMdl = dao.select(targetSid);

        //選択した施設、入れ替え先施設が存在しない場合はエラー
        if (moveRsgMdl == null || toRsgMdl == null) {
            errorFlg = true;
        }
        if (!errorFlg) {
            //入れ替え元のソート順がDBと一致するか確認
            if (moveRsgMdl.getRsgSort() != selectSort) {
                errorFlg = true;
            }

            //入れ替え先のソード順がDBと一致するか確認
            if (toRsgMdl.getRsgSort() != targetSortDb) {
                errorFlg = true;
            }
        }
        if (errorFlg) {
            msg = new ActionMessage("error.input.changed.rsv");
            StrutsUtil.addMessage(errors, msg, "rsv050SortRadio");
            return errors;
        }
        return errors;
    }
}