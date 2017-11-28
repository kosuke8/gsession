package jp.groupsession.v2.api.webmail.countm;

import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.api.AbstractApiForm;
import jp.groupsession.v2.api.webmail.mail.ApiWmlMailBiz;

/**
 * <br>[機  能] /WEBメールの未読メール件数を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiCountMForm extends AbstractApiForm {

    /** アカウントSID*/
    private int wacSid__  = -1;

    /** チェック日時 */
    private String checkTime__ = null;

    /**
     * <p>wacSid を取得します。
     * @return wacSid
     */
    public int getWacSid() {
        return wacSid__;
    }
    /**
     * <p>wacSid をセットします。
     * @param wacSid アカウントSID
     */
    public void setWacSid(int wacSid) {
        wacSid__ = wacSid;
    }

    /**
     * <p>checkTime を取得します。
     * @return checkTime
     */
    public String getCheckTime() {
        return checkTime__;
    }
    /**
     * <p>checkTime をセットします。
     * @param checkTime 日時指定 開始
     */
    public void setCheckTime(String checkTime) {
        checkTime__ = checkTime;
    }
    /**
     * <p>checkTime を UDate型 で取得します。
     * @return 日付データ
     */
    public UDate getCheckTimeDate() {
        return ApiWmlMailBiz.convertSlashDateTimeFormat(checkTime__, false);
    }

}
