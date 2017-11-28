package jp.groupsession.v2.sch.sch081;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.cmn.GSConstSchedule;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.sch.biz.SchCommonBiz;
import jp.groupsession.v2.sch.dao.SchAdmConfDao;
import jp.groupsession.v2.sch.dao.SchColMsgDao;
import jp.groupsession.v2.sch.model.SchAdmConfModel;
import jp.groupsession.v2.sch.model.SchColMsgModel;

/**
 * <br>[機  能] スケジュール基本設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Sch081Biz {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Sch081Biz.class);

    /** リクエスモデル */
    public RequestModel reqMdl__ = null;

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl RequestModel
     */
    public Sch081Biz(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }

    /**
     * <br>[機  能] 初期表示を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Sch081ParamModel
     * @param con コネクション
     * @throws SQLException SQL実行エラー
     */
    public void setInitData(Sch081ParamModel paramMdl,
            Connection con) throws SQLException {
        // DBより現在の設定を取得する。(なければデフォルト)
        SchCommonBiz biz = new SchCommonBiz(reqMdl__);
        SchAdmConfModel conf = biz.getAdmConfModel(con);

        // 共有範囲設定
        paramMdl.setSch081Crange(
                NullDefault.getString(
                        paramMdl.getSch081Crange(),
                        String.valueOf(conf.getSadCrange())));
        // スケジュール時間単位
        paramMdl.setSch081HourDiv(
                NullDefault.getString(
                        paramMdl.getSch081HourDiv(),
                        String.valueOf(conf.getSadHourDiv())));

        // タイトルカラー区分
        paramMdl.setSch081colorKbn(conf.getSadMsgColorKbn());

        //タイトルカラーコメント情報を取得
        SchColMsgDao msgDao = new SchColMsgDao(con);
        ArrayList<SchColMsgModel> msgList = msgDao.select();
        if (msgList.size() > 0) {
            paramMdl.setSch081ColorComment1(
                    NullDefault.getString(
                            paramMdl.getSch081ColorComment1(), msgList.get(0).getScmMsg()));
            paramMdl.setSch081ColorComment2(
                    NullDefault.getString(
                            paramMdl.getSch081ColorComment2(), msgList.get(1).getScmMsg()));
            paramMdl.setSch081ColorComment3(
                    NullDefault.getString(
                            paramMdl.getSch081ColorComment3(), msgList.get(2).getScmMsg()));
            paramMdl.setSch081ColorComment4(
                    NullDefault.getString(
                            paramMdl.getSch081ColorComment4(), msgList.get(3).getScmMsg()));
            paramMdl.setSch081ColorComment5(
                    NullDefault.getString(
                            paramMdl.getSch081ColorComment5(), msgList.get(4).getScmMsg()));

            if (conf.getSadMsgColorKbn() == GSConstSchedule.SAD_MSG_ADD && msgList.size() > 5) {
                paramMdl.setSch081ColorComment6(
                        NullDefault.getString(
                                paramMdl.getSch081ColorComment6(), msgList.get(5).getScmMsg()));
                paramMdl.setSch081ColorComment7(
                        NullDefault.getString(
                                paramMdl.getSch081ColorComment7(), msgList.get(6).getScmMsg()));
                paramMdl.setSch081ColorComment8(
                        NullDefault.getString(
                                paramMdl.getSch081ColorComment8(), msgList.get(7).getScmMsg()));
                paramMdl.setSch081ColorComment9(
                        NullDefault.getString(
                                paramMdl.getSch081ColorComment9(), msgList.get(8).getScmMsg()));
                paramMdl.setSch081ColorComment10(
                        NullDefault.getString(
                                paramMdl.getSch081ColorComment10(), msgList.get(9).getScmMsg()));
            }

        }

        // 時・分のリスト取得
        ArrayList<LabelValueBean> hourComb = new ArrayList<LabelValueBean>();
        ArrayList<LabelValueBean> minuteComb = new ArrayList<LabelValueBean>();
        SchCommonBiz schbiz = new SchCommonBiz(reqMdl__);
        hourComb = schbiz.getHourLabel(false);
        minuteComb = schbiz.getMinuteLabel(con, false);
        // 午前開始時コンボ
        paramMdl.setSch081AmFrHourLabel(hourComb);
        // 午前開始分コンボ
        paramMdl.setSch081AmFrMinuteLabel(minuteComb);
        // 午前終了時コンボ
        paramMdl.setSch081AmToHourLabel(hourComb);
        // 午前終了分コンボ
        paramMdl.setSch081AmToMinuteLabel(minuteComb);
        // 午後開始時コンボ
        paramMdl.setSch081PmFrHourLabel(hourComb);
        // 午後開始分コンボ
        paramMdl.setSch081PmFrMinuteLabel(minuteComb);
        // 午後終了時コンボ
        paramMdl.setSch081PmToHourLabel(hourComb);
        // 午後終了分コンボ
        paramMdl.setSch081PmToMinuteLabel(minuteComb);
        // 終日開始時コンボ
        paramMdl.setSch081AllDayFrHourLabel(hourComb);
        // 終日開始分コンボ
        paramMdl.setSch081AllDayFrMinuteLabel(minuteComb);
        // 終日終了時コンボ
        paramMdl.setSch081AllDayToHourLabel(hourComb);
        // 終日終了分コンボ
        paramMdl.setSch081AllDayToMinuteLabel(minuteComb);

        /********** 午前設定 **********/
        //開始
        // 午前開始時
        paramMdl.setSch081AmFrHour(
                NullDefault.getString(paramMdl.getSch081AmFrHour(),
                        String.valueOf(conf.getSadAmFrH())));
        // 午前開始分
        paramMdl.setSch081AmFrMin(
                NullDefault.getString(paramMdl.getSch081AmFrMin(),
                        String.valueOf(conf.getSadAmFrM())));

        //終了
        // 午前終了時
        paramMdl.setSch081AmToHour(
                NullDefault.getString(paramMdl.getSch081AmToHour(),
                        String.valueOf(conf.getSadAmToH())));
        // 午前終了分
        paramMdl.setSch081AmToMin(
                NullDefault.getString(paramMdl.getSch081AmToMin(),
                        String.valueOf(conf.getSadAmToM())));


        /********** 午後設定 **********/
        //開始
        // 午後開始時
        paramMdl.setSch081PmFrHour(
                NullDefault.getString(paramMdl.getSch081PmFrHour(),
                        String.valueOf(conf.getSadPmFrH())));
        // 午後開始分
        paramMdl.setSch081PmFrMin(
                NullDefault.getString(paramMdl.getSch081PmFrMin(),
                        String.valueOf(conf.getSadPmFrM())));
        // 午後終了時
        paramMdl.setSch081PmToHour(
                NullDefault.getString(paramMdl.getSch081PmToHour(),
                        String.valueOf(conf.getSadPmToH())));
        // 午後終了分
        paramMdl.setSch081PmToMin(
                NullDefault.getString(paramMdl.getSch081PmToMin(),
                        String.valueOf(conf.getSadPmToM())));


        /********** 終日設定 **********/
        // 終日開始時
        paramMdl.setSch081AllDayFrHour(
                NullDefault.getString(paramMdl.getSch081AllDayFrHour(),
                        String.valueOf(conf.getSadAllFrH())));
        // 終日開始分
        paramMdl.setSch081AllDayFrMin(
                NullDefault.getString(paramMdl.getSch081AllDayFrMin(),
                        String.valueOf(conf.getSadAllFrM())));
        // 終日終了時
        paramMdl.setSch081AllDayToHour(
                NullDefault.getString(paramMdl.getSch081AllDayToHour(),
                        String.valueOf(conf.getSadAllToH())));
        // 終日終了分
        paramMdl.setSch081AllDayToMin(
                NullDefault.getString(paramMdl.getSch081AllDayToMin(),
                        String.valueOf(conf.getSadAllToM())));

    }

    /**
     * <br>[機  能] 共有範囲設定をDBに登録する。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Sch081ParamModel
     * @param reqMdl リクエスト情報
     * @param umodel ユーザモデル
     * @param con コネクション
     * @throws SQLException SQL実行エラー
     */
    public void setCrange(Sch081ParamModel paramMdl,
            RequestModel reqMdl,
            BaseUserModel umodel, Connection con) throws SQLException {

        // 既存のデータを取得
        // DBより現在の設定を取得する。(なければデフォルト)
        SchCommonBiz biz = new SchCommonBiz(reqMdl);
        SchAdmConfModel conf = biz.getAdmConfModel(con);

        // データを設定
        conf.setSadCrange(
                NullDefault.getInt(paramMdl.getSch081Crange(), GSConstSchedule.CRANGE_SHARE_ALL));
        conf.setSadHourDiv(
                NullDefault.getInt(paramMdl.getSch081HourDiv(), GSConstSchedule.DF_HOUR_DIVISION));
        conf.setSadMsgColorKbn(paramMdl.getSch081colorKbn());
        conf.setSadEuid(umodel.getUsrsid());
        UDate now = new UDate();
        conf.setSadEdate(now);

        //時間マスタ設定
        //午前
        conf.setSadAmFrH(Integer.parseInt(paramMdl.getSch081AmFrHour()));
        conf.setSadAmFrM(Integer.parseInt(paramMdl.getSch081AmFrMin()));
        conf.setSadAmToH(Integer.parseInt(paramMdl.getSch081AmToHour()));
        conf.setSadAmToM(Integer.parseInt(paramMdl.getSch081AmToMin()));
        //午後
        conf.setSadPmFrH(Integer.parseInt(paramMdl.getSch081PmFrHour()));
        conf.setSadPmFrM(Integer.parseInt(paramMdl.getSch081PmFrMin()));
        conf.setSadPmToH(Integer.parseInt(paramMdl.getSch081PmToHour()));
        conf.setSadPmToM(Integer.parseInt(paramMdl.getSch081PmToMin()));
        //終日
        conf.setSadAllFrH(Integer.parseInt(paramMdl.getSch081AllDayFrHour()));
        conf.setSadAllFrM(Integer.parseInt(paramMdl.getSch081AllDayFrMin()));
        conf.setSadAllToH(Integer.parseInt(paramMdl.getSch081AllDayToHour()));
        conf.setSadAllToM(Integer.parseInt(paramMdl.getSch081AllDayToMin()));

        // DB更新
        boolean commitFlg = false;
        try {
            // 管理者設定を更新
            SchAdmConfDao dao = new SchAdmConfDao(con);
            int count = dao.updateCrange(conf);
            if (count <= 0) {
                conf.setSadAuid(umodel.getUsrsid());
                conf.setSadAdate(now);
                dao.insert(conf);
            }
            // カラーコメント更新
            SchColMsgDao msgDao = new SchColMsgDao(con);
            msgDao.delete();
            SchColMsgModel msgBean = new SchColMsgModel();
            msgBean.setScmAuid(umodel.getUsrsid());
            msgBean.setScmAdate(now);
            msgBean.setScmEuid(umodel.getUsrsid());
            msgBean.setScmEdate(now);

            if (conf.getSadMsgColorKbn() == GSConstSchedule.SAD_MSG_NO_ADD) {
                for (int i = 1; i <= 5; i++) {
                    msgBean.setScmId(i);
                    switch (i) {
                    case 1:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment1(), ""));
                        break;
                    case 2:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment2(), ""));
                        break;
                    case 3:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment3(), ""));
                        break;
                    case 4:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment4(), ""));
                        break;
                    case 5:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment5(), ""));
                        break;
                    default:
                        break;
                    }
                    msgDao.insert(msgBean);
                }
            } else {
                for (int i = 1; i <= 10; i++) {
                    msgBean.setScmId(i);
                    switch (i) {
                    case 1:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment1(), ""));
                        break;
                    case 2:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment2(), ""));
                        break;
                    case 3:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment3(), ""));
                        break;
                    case 4:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment4(), ""));
                        break;
                    case 5:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment5(), ""));
                        break;
                    case 6:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment6(), ""));
                        break;
                    case 7:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment7(), ""));
                        break;
                    case 8:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment8(), ""));
                        break;
                    case 9:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment9(), ""));
                        break;
                    case 10:
                        msgBean.setScmMsg(NullDefault.getString(
                                paramMdl.getSch081ColorComment10(), ""));
                        break;
                    default:
                        break;
                    }
                    msgDao.insert(msgBean);
                }
            }

            commitFlg = true;
        } catch (SQLException e) {
            log__.error("共有範囲設定の更新に失敗", e);
            throw e;
        } finally {
            if (commitFlg) {
                con.commit();
            }
        }
    }
}
