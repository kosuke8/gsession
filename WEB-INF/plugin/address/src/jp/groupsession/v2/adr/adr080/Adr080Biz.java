package jp.groupsession.v2.adr.adr080;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.groupsession.v2.adr.dao.AdrTypeindustryDao;
import jp.groupsession.v2.adr.model.AdrTypeindustryModel;
import jp.groupsession.v2.cmn.model.RequestModel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <br>[機  能] アドレス帳 業種一覧画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Adr080Biz {

    /** リクエスト */
    protected RequestModel reqMdl_ = null;

    /**
     * <br>[機  能] コンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl RequestModel
     */
    public Adr080Biz(RequestModel reqMdl) {
        reqMdl_ = reqMdl;
    }

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Adr080Biz.class);

    /** 並び順分割文字列 */
    private static final String SORT_SEPARATE = "-";
    /** 順序変更処理区分 順序をあげる */
    public static final int SORT_UP = 0;
    /** 順序変更処理区分 順序を下げる */
    public static final int SORT_DOWN = 1;

    /**
     * <br>[機  能] 初期表示画面情報を取得
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Adr080ParamModel
     * @param con コネクション
     * @return Adr080Form アクションフォーム
     * @throws SQLException SQL実行時例外
     */
    public Adr080ParamModel getInitData(Adr080ParamModel paramMdl, Connection con)
    throws SQLException {

        //業種一覧を取得
        AdrTypeindustryDao dao = new AdrTypeindustryDao(con);
        List<AdrTypeindustryModel> gyosyuList = dao.select();

        //役職情報を画面表示用に加工する
        List<Adr080TypeindustryModel> atiList = new ArrayList<Adr080TypeindustryModel>();
        int count = 0;
        for (AdrTypeindustryModel gyosyuMdl : gyosyuList) {

            String biko = NullDefault.getString(
                    StringUtilHtml.transToHTmlPlusAmparsant(gyosyuMdl.getAtiBiko()), "");

            Adr080TypeindustryModel atiMdl = new Adr080TypeindustryModel();

            atiMdl.setAtiSid(gyosyuMdl.getAtiSid());
            atiMdl.setAtiValue(
                    __getRadioValueStr(gyosyuMdl.getAtiSid(), gyosyuMdl.getAtiSort(), count));
            atiMdl.setAtiName(gyosyuMdl.getAtiName());
            atiMdl.setAtiBiko(biko);
            atiList.add(atiMdl);
            count++;
        }
        paramMdl.setAdr080GyosyuList(atiList);

        //チェックされているラジオがNULLの場合、初期値設定
        if (StringUtil.isNullZeroString(paramMdl.getAdr080SortRadio())
        && gyosyuList.size() > 0) {
            AdrTypeindustryModel model = gyosyuList.get(0);
            paramMdl.setAdr080SortRadio(
                    __getRadioValueStr(model.getAtiSid(), model.getAtiSort(), 0));
        }

        return paramMdl;
    }

    /**
     * <br>[機  能] radioにセットする値(文字列)を取得する
     * <br>[解  説] 「業種SID-表示順-画面上の表示順」のフォーマットの文字列を返す
     * <br>[備  考]
     * @param atiSid 業種SID
     * @param atiSort 表示順
     * @param index 画面上の表示順
     * @return String radioにセットする値
     */
    private String __getRadioValueStr(int atiSid, int atiSort, int index) {

        String sort = atiSid + SORT_SEPARATE
                    + atiSort + SORT_SEPARATE
                    + index;
        return sort;
    }

    /**
     * <br>[機  能] 順序変更処理
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param paramMdl Adr080ParamModel
     * @param changeKbn 処理区分 0:順序をあげる 1:順序を下げる
     * @throws SQLException SQL実行時例外
     */
    public void updateSort(Connection con, Adr080ParamModel paramMdl, int changeKbn)
        throws SQLException {

        //画面表示全キーリスト取得
        String[] keyList = paramMdl.getAdr080KeyList();
        if (keyList == null || keyList.length < 1) {
            return;
        }

        //ラジオ選択値取得
        String selectedKey = paramMdl.getAdr080SortRadio();
        if (StringUtil.isNullZeroString(selectedKey)) {
            return;
        }

        String[] selectKeyList = selectedKey.split(SORT_SEPARATE);

        //画面表示順
        int selectedKeyDispNum = Integer.parseInt(selectKeyList[2]);
        log__.debug("画面表示順 = " + selectedKeyDispNum);

        //画面の最初に表示されている項目 + 順位を上げる
        if (selectedKeyDispNum == 0 && changeKbn == SORT_UP) {
            return;
        //画面の最後に表示されている項目 + 順位を下げる
        } else if (selectedKeyDispNum == keyList.length - 1
                && changeKbn == SORT_DOWN) {
            return;
        }

        //選択された項目の施設グループSID + ソート順
        int motoSid = Integer.parseInt(selectKeyList[0]);
        int motoSort = Integer.parseInt(selectKeyList[1]);

        int sakiSid = -1;
        int sakiSort = -1;
        int target = selectedKeyDispNum;

        if (changeKbn == SORT_UP) {
            target -= 1;
        } else if (changeKbn == SORT_DOWN) {
            target += 1;
        }

        //画面表示全キーから入れ替え先のデータを探す
        for (String allKey : keyList) {

            String[] allKeyList = allKey.split(SORT_SEPARATE);
            int allKeyDispNum = Integer.parseInt(allKeyList[2]);

            if (allKeyDispNum == target) {
                sakiSid = Integer.parseInt(allKeyList[0]);
                sakiSort = Integer.parseInt(allKeyList[1]);
                break;
            }
        }

        if (sakiSid == -1 || sakiSort == -1) {
            return;
        }

        //順序入れ替え
        AdrTypeindustryDao dao = new AdrTypeindustryDao(con);
        dao.updateSort(motoSid, motoSort, sakiSid, sakiSort);

        //新しいキーを設定
        paramMdl.setAdr080SortRadio(__getRadioValueStr(motoSid, sakiSort, target));
    }
}
