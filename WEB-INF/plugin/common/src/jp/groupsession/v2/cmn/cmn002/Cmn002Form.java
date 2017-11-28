package jp.groupsession.v2.cmn.cmn002;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import jp.co.sjts.util.FileNameUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.cmn.config.Plugin;
import jp.groupsession.v2.cmn.config.PluginConfig;
import jp.groupsession.v2.cmn.config.TopMenuInfo;
import jp.groupsession.v2.struts.AbstractGsForm;

/**
 * <br>[機  能] フレーム(メニューとボディ)のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Cmn002Form extends AbstractGsForm {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Cmn002Form.class);

    /** トップメニューのページ */
    private int menuPage__ = 1;
    /** BODYに表示するURL */
    private String url__ = null;

    /**
     * <p>menuPage を取得します。
     * @return menuPage
     */
    public int getMenuPage() {
        return menuPage__;
    }

    /**
     * <p>menuPage をセットします。
     * @param menuPage menuPage
     */
    public void setMenuPage(int menuPage) {
        menuPage__ = menuPage;
    }

    /**
     * @return url を戻します。
     */
    public String getUrl() {
        return url__;
    }

    /**
     * @param url 設定する url。
     */
    public void setUrl(String url) {
        url__ = url;
    }

    /**
     * <br>[機  能] ログイン時の入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param req リクエスト
     * @param pconfig プラグイン情報
     * @return エラー
     */
    public ActionErrors validateBodyUrl(ActionMapping map,
            HttpServletRequest req, PluginConfig pconfig) {
        ActionErrors errors = new ActionErrors();
        ActionMessage msg = null;

        //入力なしの判定
        if (url__ == null || url__.length() == 0) {
            //
            return errors;
        }
        url__ = url__.trim();

        //plugin.xmlに記述されたものは無条件に許可
        List < Plugin > plist = pconfig.getPluginDataList();
        for (Plugin plugin : plist) {
            TopMenuInfo tminfo = plugin.getTopMenuInfo();
            if (tminfo != null) {
                String url = tminfo.getUrl();
                log__.debug("plugin url = " + url + "|||||");
                log__.debug("request url = " + url__ + "|||||");
                if (url__.equals(url)) {
                    return errors;
                }
            }
        }

//        //外部URLは認めない
//        String parseUrl = StringUtil.transToLink(url__, 0);
//        if (!url__.equals(parseUrl)) {
//            //
//            msg = new ActionMessage("error.input.gaibu.url");
//            StrutsUtil.addMessage(errors, msg, "error.input.gaibu.url");
//        }

        //タブ文字を除去
        //タブ文字が挿入されていてもjavascriptを実行する事が可能な為除去してチェックを行う
        //半角・全角スペースは問題ないためタブ文字を除去する
        //cmn002.do?url=javascrip%09t:alert(document.domain)
        url__ =  FileNameUtil.removeTabString(url__);

        //javascriptのURLも認めない
        if (url__.toLowerCase().indexOf("javascript") != -1) {
            msg = new ActionMessage("error.input.js.url");
            StrutsUtil.addMessage(errors, msg, "error.input.js.url");
        }
        return errors;
    }
}
