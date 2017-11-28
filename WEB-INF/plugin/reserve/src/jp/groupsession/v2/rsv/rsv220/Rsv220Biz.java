package jp.groupsession.v2.rsv.rsv220;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.rsv.biz.RsvCommonBiz;
import jp.groupsession.v2.rsv.dao.RsvAdmConfDao;
import jp.groupsession.v2.rsv.model.RsvAdmConfModel;

/**
 * <br>[機  能] 施設予約 管理者設定 施設予約基本設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv220Biz {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Rsv220Biz.class);
    /** リクエスト情報 */
    protected RequestModel reqMdl_ = null;
    /** コネクション */
    protected Connection con_ = null;

    /**
     * <br>[機  能] コンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param reqMdl RequestModel
     * @param con コネクション
     */
    public Rsv220Biz(RequestModel reqMdl, Connection con) {
        reqMdl_ = reqMdl;
        con_ = con;
    }

    /**
     * <br>[機  能] 初期表示を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Rsv220ParamModel
     * @param con コネクション
     * @throws SQLException SQL実行エラー
     */
    public void setInitData(Rsv220ParamModel paramMdl,
            Connection con) throws SQLException {
        log__.debug(" start ");

        //DBより現在の設定を取得する。(なければデフォルト)
        RsvAdmConfDao confDao = new RsvAdmConfDao(con);
        RsvAdmConfModel confModel = confDao.select();
        if (confModel == null) {
            RsvCommonBiz biz = new RsvCommonBiz();
            confModel = biz.setInitAdminnConfModel();
        }

        //施設予約時間単位
        paramMdl.setRsv220HourDiv(
                NullDefault.getString(
                        paramMdl.getRsv220HourDiv(),
                        String.valueOf(confModel.getRacHourDiv())));

        // 時・分のリスト取得
        RsvCommonBiz biz = new RsvCommonBiz();
        ArrayList<LabelValueBean> hourComb = new ArrayList<LabelValueBean>();
        ArrayList<LabelValueBean> minuteComb = new ArrayList<LabelValueBean>();
        hourComb = biz.getHourCombo();
        minuteComb = biz.getMinuteCombo(con);
        // 午前開始時コンボ
        paramMdl.setRsv220AmFrHourLabel(hourComb);
        // 午前開始分コンボ
        paramMdl.setRsv220AmFrMinuteLabel(minuteComb);
        // 午前終了時コンボ
        paramMdl.setRsv220AmToHourLabel(hourComb);
        // 午前終了分コンボ
        paramMdl.setRsv220AmToMinuteLabel(minuteComb);
        // 午後開始時コンボ
        paramMdl.setRsv220PmFrHourLabel(hourComb);
        // 午後開始分コンボ
        paramMdl.setRsv220PmFrMinuteLabel(minuteComb);
        // 午後終了時コンボ
        paramMdl.setRsv220PmToHourLabel(hourComb);
        // 午後終了分コンボ
        paramMdl.setRsv220PmToMinuteLabel(minuteComb);
        // 終日開始時コンボ
        paramMdl.setRsv220AllDayFrHourLabel(hourComb);
        // 終日開始分コンボ
        paramMdl.setRsv220AllDayFrMinuteLabel(minuteComb);
        // 終日終了時コンボ
        paramMdl.setRsv220AllDayToHourLabel(hourComb);
        // 終日終了分コンボ
        paramMdl.setRsv220AllDayToMinuteLabel(minuteComb);

        //午前
        int frAmTimeH = confModel.getRacAmTimeFrH();
        int frAmTimeM = confModel.getRacAmTimeFrM();
        paramMdl.setRsv220AmFrHour(
                NullDefault.getString(paramMdl.getRsv220AmFrHour(),
                        String.valueOf(frAmTimeH)));
        paramMdl.setRsv220AmFrMin(
                NullDefault.getString(paramMdl.getRsv220AmFrMin(),
                        String.valueOf(frAmTimeM)));

        int toAmTimeH = confModel.getRacAmTimeToH();
        int toAmTimeM = confModel.getRacAmTimeToM();
        paramMdl.setRsv220AmToHour(
                NullDefault.getString(paramMdl.getRsv220AmToHour(),
                        String.valueOf(toAmTimeH)));
        paramMdl.setRsv220AmToMin(
                NullDefault.getString(paramMdl.getRsv220AmToMin(),
                        String.valueOf(toAmTimeM)));

        //午後
        int frPmTimeH = confModel.getRacPmTimeFrH();
        int frPmTimeM = confModel.getRacPmTimeFrM();
        paramMdl.setRsv220PmFrHour(
                NullDefault.getString(paramMdl.getRsv220PmFrHour(),
                        String.valueOf(frPmTimeH)));
        paramMdl.setRsv220PmFrMin(
                NullDefault.getString(paramMdl.getRsv220PmFrMin(),
                        String.valueOf(frPmTimeM)));

        int toPmTimeH = confModel.getRacPmTimeToH();
        int toPmTimeM = confModel.getRacPmTimeToM();
        paramMdl.setRsv220PmToHour(
                NullDefault.getString(paramMdl.getRsv220PmToHour(),
                        String.valueOf(toPmTimeH)));
        paramMdl.setRsv220PmToMin(
                NullDefault.getString(paramMdl.getRsv220PmToMin(),
                        String.valueOf(toPmTimeM)));

        //終日
        int frAllTimeH = confModel.getRacAllDayTimeFrH();
        int frAllTimeM = confModel.getRacAllDayTimeFrM();
        paramMdl.setRsv220AllDayFrHour(
                NullDefault.getString(paramMdl.getRsv220AllDayFrHour(),
                        String.valueOf(frAllTimeH)));
        paramMdl.setRsv220AllDayFrMin(
                NullDefault.getString(paramMdl.getRsv220AllDayFrMin(),
                        String.valueOf(frAllTimeM)));

        int toAllDayTimeH = confModel.getRacAllDayTimeToH();
        int toAllDayTimeM = confModel.getRacAllDayTimeToM();
        paramMdl.setRsv220AllDayToHour(
                NullDefault.getString(paramMdl.getRsv220AllDayToHour(),
                        String.valueOf(toAllDayTimeH)));
        paramMdl.setRsv220AllDayToMin(
                NullDefault.getString(paramMdl.getRsv220AllDayToMin(),
                        String.valueOf(toAllDayTimeM)));

        log__.debug(" end ");
    }

}
