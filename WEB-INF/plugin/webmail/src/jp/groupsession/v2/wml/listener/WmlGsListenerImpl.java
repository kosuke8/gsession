package jp.groupsession.v2.wml.listener;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.groupsession.v2.cmn.GSContext;
import jp.groupsession.v2.cmn.IGsListener;
import jp.groupsession.v2.wml.dao.base.WmlAccountRcvlockDao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <br>[機  能] Servlet init() 又はdestroy()実行時に実行されるリスナーを実装
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class WmlGsListenerImpl implements IGsListener {

    /** ロギングクラス */
    private static Log log__ = LogFactory.getLog(WmlGsListenerImpl.class);
    /** リクエスト */
    public HttpServletRequest req__ = null;

    /**
     * <p>init()実行時に実行される
     * @param gscontext GS共通情報
     * @param con DBコネクション
     * @param domain ドメイン
     * @throws Exception 実行例外
     */
    public void gsInit(GSContext gscontext, Connection con, String domain) throws Exception {
        __deleteReceiveLock(con);
    }

    /**
     * <p>destroy()実行時に実行される
     * @param gscontext GS共通情報
     * @param con DBコネクション
     * @param domain ドメイン
     * @throws Exception 実行例外
     */
    public void gsDestroy(GSContext gscontext, Connection con, String domain) throws Exception {
        __deleteReceiveLock(con);
    }

    /**
     * <br>[機  能] アカウント_受信ロックの初期化に失敗のクリアを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @throws SQLException SQL実行時例外
     */
    private void __deleteReceiveLock(Connection con) throws SQLException {
        try {
            WmlAccountRcvlockDao rcvLockDao = new WmlAccountRcvlockDao(con);
            rcvLockDao.delete();
        } catch (SQLException e) {
            log__.error("WEBメール アカウント_受信ロックの初期化に失敗", e);
            JDBCUtil.rollback(con);
            throw e;
        } finally {
            con.commit();
        }
    }
}