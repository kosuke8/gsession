package jp.groupsession.v2.rsv;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import jp.groupsession.v2.bbs.AbstractBulletinAction;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.rsv.biz.RsvCommonBiz;
import jp.groupsession.v2.struts.AbstractGsAction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <br>[機  能] 施設予約プラグインで共通使用するアクションクラスです
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public abstract class AbstractReserveAction extends AbstractGsAction {
    /** プラグインID */
    private static final String PLUGIN_ID = "reserve";
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(AbstractBulletinAction.class);

    /**プラグインIDを取得します
     * @return String プラグインID
     * @see jp.groupsession.v2.struts.AbstractGsAction#getPluginId()
     */
    @Override
    public String getPluginId() {
        return PLUGIN_ID;
    }

    /**
     * <br>[機  能] テンポラリディレクトリパスを取得する
     * <br>[解  説] 処理モード = 編集の場合、スレッド情報を設定する
     * <br>[備  考]
     * @param req リクエスト
     * @return テンポラリディレクトリパス
     */
    protected String _getReserveTempDir(HttpServletRequest req) {

        //テンポラリディレクトリパスを取得
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir = cmnBiz.getTempDir(
                getTempPath(req), GSConstReserve.PLUGIN_ID_RESERVE, getRequestModel(req));
        log__.debug("テンポラリディレクトリ = " + tempDir);

        return tempDir;
    }

    /**
     * <br>[機  能] 施設予約の対象となる施設のチェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param rsdSid 施設SID
     * @param req リクエスト
     * @return エラーメッセージ | 指定された施設が正常の場合、nullを返す
     * @throws SQLException SQL実行時例外
     */
    protected String _checkTargetFactory(Connection con, int rsdSid, HttpServletRequest req)
    throws SQLException {
        return _checkTargetFactory(con, new int[]{rsdSid}, req);
    }

    /**
     * <br>[機  能] 施設予約の対象となる施設のチェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param rsdSidList 施設SID
     * @param req リクエスト
     * @return エラーメッセージ | 指定された施設が正常の場合、nullを返す
     * @throws SQLException SQL実行時例外
     */
    protected String _checkTargetFactory(Connection con, int[] rsdSidList, HttpServletRequest req)
    throws SQLException {
        RsvCommonBiz rsvBiz = new RsvCommonBiz();
        return rsvBiz.checkTargetFactory(con, rsdSidList, getRequestModel(req));
    }
}