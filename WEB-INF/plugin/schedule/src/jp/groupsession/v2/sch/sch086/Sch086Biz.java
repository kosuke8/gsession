package jp.groupsession.v2.sch.sch086;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.cmn.GSConstSchedule;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.sch.biz.SchCommonBiz;
import jp.groupsession.v2.sch.dao.SchAdmConfDao;
import jp.groupsession.v2.sch.model.SchAdmConfModel;

/**
 * <br>[機  能] スケジュール 管理者設定 スケジュール初期値設定画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 */
public class Sch086Biz {

    /** リクエスモデル */
    public RequestModel reqMdl__ = null;

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl RequestModel
     */
    public Sch086Biz(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }

    /**
     * <br>[機  能] 初期表示情報を画面にセットする
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param paramMdl Sch086ParamModel
     * @throws SQLException SQL実行例外
     */
    public void setInitData(Connection con, Sch086ParamModel paramMdl)
        throws SQLException {

        //ラベル(時)
        ArrayList<LabelValueBean> sch086HourLabel = new ArrayList<LabelValueBean>();
        for (int i = 0; i < 24; i++) {
            sch086HourLabel.add(new LabelValueBean(String.valueOf(i), Integer.toString(i)));
        }
        paramMdl.setSch086HourLabel(sch086HourLabel);
        //ラベル(分)
        SchCommonBiz schCmnBiz = new SchCommonBiz(reqMdl__);
        int hourMemCount = schCmnBiz.getDayScheduleHourMemoriMin(con);
        ArrayList<LabelValueBean> sch086MinuteLabel = new ArrayList<LabelValueBean>();
        for (int i = 0; i < 60; i += hourMemCount) {
            sch086MinuteLabel.add(
                    new LabelValueBean(StringUtil.toDecFormat(i, "00"), Integer.toString(i)));
        }
        paramMdl.setSch086MinuteLabel(sch086MinuteLabel);

        if (paramMdl.getSch086init() == 0) {
            //DBより現在の設定を取得する。(なければデフォルト)
            SchCommonBiz biz = new SchCommonBiz(reqMdl__);
            SchAdmConfModel conf = biz.getAdmConfModel(con);
            paramMdl.setSch086TimeType(conf.getSadIniTimeStype());
            paramMdl.setSch086DefFrH(conf.getSadIniFrH());
            paramMdl.setSch086DefFrM(conf.getSadIniFrM());
            paramMdl.setSch086DefToH(conf.getSadIniToH());
            paramMdl.setSch086DefToM(conf.getSadIniToM());
            paramMdl.setSch086EditType(conf.getSadIniEditStype());
            paramMdl.setSch086Edit(conf.getSadIniEdit());
            paramMdl.setSch086PublicType(conf.getSadInitPublicStype());
            paramMdl.setSch086Public(conf.getSadIniPublic());
            paramMdl.setSch086SameType(conf.getSadIniSameStype());
            paramMdl.setSch086Same(conf.getSadIniSame());

            paramMdl.setSch086init(1);
        }
    }

    /**
     * <br>[機  能] 時間、編集権限、公開区分初期値設定を登録する
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param paramMdl Sch086ParamModel
     * @param sessionUserSid セッションユーザSID
     * @throws SQLException SQL実行例外
     */
    public void entryKbn(Connection con, Sch086ParamModel paramMdl,
                            int sessionUserSid)
        throws SQLException {
        SchCommonBiz biz = new SchCommonBiz(reqMdl__);
        SchAdmConfModel conf = biz.getAdmConfModel(con);

        //時間区分
        if (paramMdl.getSch086TimeType() == GSConstSchedule.SAD_INITIME_STYPE_ADM) {
            conf.setSadIniTimeStype(paramMdl.getSch086TimeType());
        } else {
            conf.setSadIniTimeStype(GSConstSchedule.SAD_INITIME_STYPE_USER);
        }

        conf.setSadIniFrH(paramMdl.getSch086DefFrH());
        conf.setSadIniFrM(paramMdl.getSch086DefFrM());
        conf.setSadIniToH(paramMdl.getSch086DefToH());
        conf.setSadIniToM(paramMdl.getSch086DefToM());

        //編集区分
        if (paramMdl.getSch086EditType() == GSConstSchedule.SAD_INIEDIT_STYPE_ADM) {
            conf.setSadIniEditStype(paramMdl.getSch086EditType());
        } else {
            conf.setSadIniEditStype(GSConstSchedule.SAD_INIEDIT_STYPE_USER);
        }

        switch (paramMdl.getSch086Edit()) {
            case GSConstSchedule.EDIT_CONF_NONE:
            case GSConstSchedule.EDIT_CONF_OWN:
            case GSConstSchedule.EDIT_CONF_GROUP:
                conf.setSadIniEdit(paramMdl.getSch086Edit());
                break;
            default:
                conf.setSadIniEdit(GSConstSchedule.EDIT_CONF_NONE);
        }

        //公開区分
        if (paramMdl.getSch086PublicType() == GSConstSchedule.SAD_INIPUBLIC_STYPE_ADM) {
            conf.setSadInitPublicStype(paramMdl.getSch086PublicType());
        } else {
            conf.setSadInitPublicStype(GSConstSchedule.SAD_INIPUBLIC_STYPE_USER);
        }

        switch (paramMdl.getSch086Public()) {
            case GSConstSchedule.DSP_PUBLIC:
            case GSConstSchedule.DSP_NOT_PUBLIC:
            case GSConstSchedule.DSP_YOTEIARI:
            case GSConstSchedule.DSP_BELONG_GROUP:
                conf.setSadIniPublic(paramMdl.getSch086Public());
                break;
            default:
                conf.setSadIniPublic(GSConstSchedule.DSP_PUBLIC);
        }

        //同時編集区分
        if (paramMdl.getSch086SameType() == GSConstSchedule.SAD_INISAME_STYPE_ADM) {
            conf.setSadIniSameStype(paramMdl.getSch086SameType());
        } else {
            conf.setSadIniSameStype(GSConstSchedule.SAD_INISAME_STYPE_USER);
        }

        switch (paramMdl.getSch086Same()) {
            case GSConstSchedule.SAME_EDIT_ON:
            case GSConstSchedule.SAME_EDIT_OFF:
                conf.setSadIniSame(paramMdl.getSch086Same());
                break;
            default:
                conf.setSadIniSame(GSConstSchedule.SAME_EDIT_ON);
        }

        //スケジュール 初期値を登録
        conf.setSadEuid(sessionUserSid);
        conf.setSadEdate(new UDate());
        SchAdmConfDao dao = new SchAdmConfDao(con);
        if (dao.updateInitSetting(conf) == 0) {
            conf.setSadAuid(sessionUserSid);
            conf.setSadAdate(conf.getSadEdate());
            dao.insert(conf);
        }
    }
}