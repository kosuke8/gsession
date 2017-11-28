package jp.groupsession.v2.rsv.rsv280;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.StringUtil;
import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.rsv.dao.RsvAdmConfDao;
import jp.groupsession.v2.rsv.model.RsvAdmConfModel;

/**
 * <br>[機  能] 施設予約 管理者設定 施設予約初期値設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv280Biz {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Rsv280Biz.class);

    /**
     * <br>[機  能] 初期表示を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl Rsv280ParamModel
     * @param con コネクション
     * @throws SQLException SQL実行エラー
     */
    public void setInitData(Rsv280ParamModel paramMdl, Connection con)
            throws SQLException {
        log__.debug("初期表示");

        //ラベル(時)
        ArrayList<LabelValueBean> rsv280HourLabel = new ArrayList<LabelValueBean>();
        for (int i = 0; i < 24; i++) {
            rsv280HourLabel.add(
                    new LabelValueBean(
                            String.valueOf(i), Integer.toString(i)));
        }
        paramMdl.setRsv280HourLabel(rsv280HourLabel);

        //ラベル(分)
        RsvAdmConfDao aconfDao = new RsvAdmConfDao(con);
        RsvAdmConfModel aconfModel = aconfDao.select();
        //施設予約管理者設定より、時間間隔を取得する。
        int houDiv = GSConstReserve.DF_HOUR_DIVISION;
        if (aconfModel != null) {
            houDiv = aconfModel.getRacHourDiv();
        }
        ArrayList<LabelValueBean> rsv280MinuteLabel = new ArrayList<LabelValueBean>();
        for (int i = 0; i < 60; i += houDiv) {
            rsv280MinuteLabel.add(
                    new LabelValueBean(
                            StringUtil.toDecFormat(i, "00"), Integer.toString(i)));
        }
        paramMdl.setRsv280MinuteLabel(rsv280MinuteLabel);

        if (paramMdl.getRsv280initFlg() == 0) {
            //DBより設定情報を取得。なければデフォルト値とする。
            if (aconfModel != null) {
                paramMdl.setRsv280PeriodKbn(aconfModel.getRacIniPeriodKbn());
                paramMdl.setRsv280DefFrH(aconfModel.getRacIniFrH());
                paramMdl.setRsv280DefFrM(aconfModel.getRacIniFrM());
                paramMdl.setRsv280DefToH(aconfModel.getRacIniToH());
                paramMdl.setRsv280DefToM(aconfModel.getRacIniToM());
                paramMdl.setRsv280EditKbn(aconfModel.getRacIniEditKbn());
                paramMdl.setRsv280Edit(aconfModel.getRacIniEdit());
                paramMdl.setRsv280PublicKbn(aconfModel.getRacIniPublicKbn());
                paramMdl.setRsv280Public(aconfModel.getRacIniPublic());
            }

            paramMdl.setRsv280initFlg(1);
        }
    }
}
