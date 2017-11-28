package jp.groupsession.v2.bbs;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.groupsession.v2.batch.DayJob;
import jp.groupsession.v2.batch.IBatchListener;
import jp.groupsession.v2.batch.IBatchModel;
import jp.groupsession.v2.bbs.dao.BbsLogCountSumDao;
import jp.groupsession.v2.bbs.dao.BbsThreRsvDao;
import jp.groupsession.v2.bbs.dao.BulletinDao;
import jp.groupsession.v2.bbs.model.BbsAdmConfModel;
import jp.groupsession.v2.bbs.model.BbsLogCountSumModel;
import jp.groupsession.v2.bbs.model.BbsThreRsvModel;
import jp.groupsession.v2.cmn.GSContext;
import jp.groupsession.v2.cmn.biz.StatisticsBiz;
import jp.groupsession.v2.man.GSConstMain;
import jp.groupsession.v2.man.dao.base.BbsLogCountAdelDao;
import jp.groupsession.v2.man.model.base.BbsLogCountAdelModel;

/**
 * <br>[機  能] バッチ処理起動時に実行される処理を実装
 * <br>[解  説] 掲示板についての処理を行う
 * <br>[備  考]
 *
 * @author JTS
 */
public class BulletinBatchListenerImpl implements IBatchListener {
    /** ロギングクラス */
    private static Log log__ = LogFactory.getLog(BulletinBatchListenerImpl.class);

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     */
    public BulletinBatchListenerImpl() {
        super();
    }

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     * @param con DBコネクション
     * @param param バッチ処理時に使用する情報
     * @throws Exception バッチ処理実行時例外
     */
    public void doDayBatch(Connection con, IBatchModel param) throws Exception {
        log__.debug("掲示板バッチ処理開始");
        String pluginName = "掲示板";
        DayJob.outPutStartLog(con, param.getDomain(),
                pluginName, "");
        long startTime = System.currentTimeMillis();
        Throwable logException = null;
        con.setAutoCommit(false);
        boolean commitFlg = false;
        try {
            BbsBiz biz = new BbsBiz();
            BbsAdmConfModel conf = biz.getBbsAdminData(con, -1);
            if (conf.getBacAtdelFlg() == GSConstBulletin.AUTO_DELETE_ON) {
                //自動削除実行

                //基準日を作成
                UDate bdate = new UDate();
                int year = conf.getBacAtdelY();
                int month = conf.getBacAtdelM();
                bdate.addYear(-year);
                bdate.addMonth(-month);
                //削除実行
                biz.deleteOldBulletin(con, bdate);
            }

            //掲示期限を過ぎたスレッドを削除する
            biz.deleteOverLimitBulletin(con);

            //統計情報の集計を行う
            BbsLogCountSumDao logSumDao = new BbsLogCountSumDao(con);
            int[] blsKbnList = {GSConstBulletin.BLS_KBN_WRITE,
                                    GSConstBulletin.BLS_KBN_VIEW
            };
            UDate today = new UDate();
            for (int blsKbn : blsKbnList) {
                List<BbsLogCountSumModel> logSumList
                    = logSumDao.getNonRegisteredList(blsKbn, today);
                if (logSumList != null && !logSumList.isEmpty()) {
                    for (BbsLogCountSumModel logSumMdl : logSumList) {
                        if (logSumDao.update(logSumMdl) == 0) {
                            logSumDao.insert(logSumMdl);
                        }
                    }
                }
            }

            //掲示板 統計情報集計データ削除
            log__.debug("掲示板 統計情報集計データ削除処理開始");
            BbsLogCountAdelModel bbsLogCntAdelMdl = null;
            BbsLogCountAdelDao bbsLogCntAdelDao = new BbsLogCountAdelDao(con);
            List<BbsLogCountAdelModel> adelList = bbsLogCntAdelDao.select();
            if (adelList != null && !adelList.isEmpty()) {
                bbsLogCntAdelMdl = adelList.get(0);
            }
            if (bbsLogCntAdelMdl != null
                    && bbsLogCntAdelMdl.getBldDelKbn() == GSConstMain.LAD_DELKBN_AUTO) {
                int bbsLogAdelYear = bbsLogCntAdelMdl.getBldDelYear();
                int bbsLogAdelMonth = bbsLogCntAdelMdl.getBldDelMonth();

                //削除する境界の日付を設定する
                UDate bbsLogDelUd = new UDate();
                log__.debug("現在日 = " + bbsLogDelUd.getDateString());
                log__.debug("削除条件 経過年 = " + bbsLogAdelYear);
                log__.debug("削除条件 経過月 = " + bbsLogAdelMonth);
                bbsLogDelUd.addYear(bbsLogAdelYear * -1);
                bbsLogDelUd.addMonth(bbsLogAdelMonth * -1);
                bbsLogDelUd.setMaxHhMmSs();
                log__.debug("削除境界線(この日以前のデータを削除) = " + bbsLogDelUd.getTimeStamp());

                StatisticsBiz statsBiz = new StatisticsBiz();
                //集計データを削除
                int bbsViewLogCount =
                        statsBiz.deleteLogCount(con, "BBS_WRITE_LOG_COUNT",
                                "BWL_WRT_DATE", bbsLogAdelYear, bbsLogAdelMonth);
                log__.debug("掲示板閲覧 統計情報集計データ" + bbsViewLogCount + "件を削除");
                int bbsWriteLogCount =
                        statsBiz.deleteLogCount(con, "BBS_VIEW_LOG_COUNT",
                                "BVL_VIEW_DATE", bbsLogAdelYear, bbsLogAdelMonth);
                log__.debug("掲示板投稿 統計情報集計データ" + bbsWriteLogCount + "件を削除");
            }
            commitFlg = true;
            con.commit();
            log__.debug("掲示板バッチ処理終了");
        } catch (Exception e) {
            log__.error("掲示板バッチ処理失敗", e);
            JDBCUtil.rollback(con);
            logException = e;
            throw e;
        } finally {
            if (commitFlg) {
                DayJob.outPutFinishLog(con, param.getDomain(),
                        pluginName, startTime);
            } else {
                JDBCUtil.rollback(con);
                DayJob.outPutFailedLog(con, param.getDomain(),
                        pluginName, logException);
            }

        }
    }

    /**
     * <p>1時間間隔で実行されるJob
     * @param con DBコネクション
     * @param param バッチ処理時に使用する情報
     * @throws Exception バッチ処理実行時例外
     */
    public void doOneHourBatch(Connection con, IBatchModel param) throws Exception {
        UDate now = new UDate();

            con.setAutoCommit(false);
            boolean commitFlg = false;
            //予約投稿リストDao
            BbsThreRsvDao btrDao = new BbsThreRsvDao(con);

            try {
                //フォーラム一覧を取得
                //予約投稿されたスレッドの内、掲示開始日時が過ぎたもののフォーラムSIDを取得
                List<Integer> bfiSidList = btrDao.selectBfiSid(now);
                BbsBiz bbsBiz = new BbsBiz();
                BulletinDao bbsDao = new BulletinDao(con);

                for (Integer bfiSid : bfiSidList) {

                    //投稿時間が過ぎたスレッドが存在するフォーラムの最終更新日時を更新する
                    //フォーラムの最終更新日時と表示されているスレッド内の最新日時から
                    //最新のものを取得して更新する
                    bbsDao.updateBfsWrtDateBatch(bfiSid, now);

                    //フォーラム集計情報の更新
                    bbsBiz.updateBbsForSum(con, bfiSid, 0, now, false);

                    //ショートメール通知
                    if (bfiSid > 0) {
                        //フォーラムSIDから、掲示開始日時を過ぎたスレッドを取得する
                        ArrayList<BbsThreRsvModel> btrList = btrDao.selectByBfi(bfiSid);
                        for (int i = 0; i < btrList.size(); i++) {
                            //スレッドSIDを取得
                            int btiSid = btrList.get(i).getBtiSid();
                            //ドメイン名
                            String domain = param.getDomain();
                            //GroupSession共通情報を格納
                            GSContext gsContext = param.getGsContext();
                            //ショートメール通知を実行
                            bbsBiz.sendSmailForBatch(con, gsContext, domain, btiSid);
                        }
                    }
                }
                //掲示開始日時および掲示終了日時が過ぎたスレッドのSIDをテーブルから削除
                btrDao.delete(now);

                commitFlg = true;
                log__.debug("掲示板バッチ処理終了");
            } catch (SQLException e) {
                log__.error("掲示板バッチ処理失敗", e);
                JDBCUtil.rollback(con);
                throw e;
            } finally {
                if (commitFlg) {
                    con.commit();
                } else {
                    JDBCUtil.rollback(con);
                }
            }
    }

    /**
     * <p>5分間隔で実行されるJob
     * @param con DBコネクション
     * @param param バッチ処理時に使用する情報
     * @throws Exception バッチ処理実行時例外
     */
    public void do5mBatch(Connection con, IBatchModel param) throws Exception {

    }
}
