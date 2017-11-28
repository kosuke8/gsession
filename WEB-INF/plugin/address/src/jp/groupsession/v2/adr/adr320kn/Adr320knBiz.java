package jp.groupsession.v2.adr.adr320kn;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.adr.GSConstAddress;
import jp.groupsession.v2.adr.adr320.Adr320Biz;
import jp.groupsession.v2.adr.dao.AdrAconfDao;
import jp.groupsession.v2.adr.dao.AdrArestDao;
import jp.groupsession.v2.adr.model.AdrAconfModel;
import jp.groupsession.v2.adr.model.AdrArestModel;
import jp.groupsession.v2.cmn.model.RequestModel;

/**
 *
 * <br>[機  能] アドレス帳 管理者設定 権限設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Adr320knBiz extends Adr320Biz {

    /**
     *
     * <br>[機  能] 確定処理
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエストモデル
     * @param con コネクション
     * @param arestKbn 登録者制限区分
     * @param arest 制限設定SID
     * @throws SQLException SQL実行時例外
     */
    public void comitData(RequestModel reqMdl,
            Connection con,
            int arestKbn,
            String[] arest) throws SQLException {
        // 管理者設定を取得
        AdrAconfDao aconfDao = new AdrAconfDao(con);
        AdrAconfModel aconf = aconfDao.selectAconf();
        boolean create = false;
        if (aconf == null) {
            create = true;
        }
        int sessionUid = reqMdl.getSmodel().getUsrsid();

        aconf = __makeAconfModel(sessionUid, aconf, arestKbn);

        if (create) {
            aconfDao.insert(aconf);
        } else {
            aconfDao.updateArestKbn(arestKbn);
        }

        AdrArestDao arestDao = new AdrArestDao(con);
        arestDao.deleteAll();

        if (arestKbn == GSConstAddress.ARESTKBN_NONE) {
            return;
        }

        List<AdrArestModel> arestList = createArestList(reqMdl, con, arest);
        for (AdrArestModel arestModel : arestList) {
            arestDao.insert(arestModel);
        }
    }
    /**
     *
     * <br>[機  能] 登録情報を設定
     * <br>[解  説]
     * <br>[備  考]
     * @param sessionUid ユーザSID
     * @param aconf 管理者設定モデル
     * @param arestKbn 登録者制限区分
     * @return 登録用 管理者設定モデル
     */
    private AdrAconfModel __makeAconfModel(int sessionUid, AdrAconfModel aconf, int arestKbn) {
        if (aconf == null) {
            aconf = new AdrAconfModel();
            aconf.init();
        }
        UDate now = new UDate();
        aconf.setAacAdate(now);
        aconf.setAacEdate(now);
        aconf.setAacAuid(sessionUid);
        aconf.setAacEuid(sessionUid);

        aconf.setAacArestKbn(arestKbn);

        return aconf;
    }

}
