package jp.groupsession.v2.hlp.hlp020;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.ValidateUtil;
import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.struts.AbstractGsAction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


/**
 * <br>[機  能] ヘルプ 検索結果画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Hlp020Action extends AbstractGsAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Hlp020Action.class);

    /**
     * <p>
     * セッションが確立されていない状態でのアクセスを許可するのか判定を行う。
     * <p>
     * サブクラスでこのメソッドをオーバーライドして使用する
     *
     * @param req リクエスト
     * @param form アクションフォーム
     * @return true:許可する,false:許可しない
     */
    public boolean canNoSessionAccess(HttpServletRequest req, ActionForm form) {
        return true;
    }

    /**
     *<br>[機  能] アクションを実行する
     *<br>[解  説]
     *<br>[備  考]
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con DBコネクション
     * @return ActionForward フォワード
     * @throws Exception 実行例外
     */
    public ActionForward executeAction(ActionMapping map, ActionForm form,
        HttpServletRequest req, HttpServletResponse res, Connection con)
        throws Exception {

        log__.debug("Hlp010 start");
        ActionForward forward = null;
        Hlp020Form myForm = (Hlp020Form) form;

        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        cmd = cmd.trim();


        if (cmd.equals("hlp010")) {
            forward = map.findForward("hlp010");
        } else if (cmd.equals("prev")) {
            myForm.setHlp020DispPage(myForm.getHlp020DispPage() - 1);
            forward = __doInit(map, myForm, req, res, con);
        } else if (cmd.equals("next")) {
            myForm.setHlp020DispPage(myForm.getHlp020DispPage() + 1);
            forward = __doInit(map, myForm, req, res, con);
        } else {
            forward = __doInit(map, myForm, req, res, con);
        }

        log__.debug("Hlp010 end");
        return forward;
    }

    /**
     * <br>[機  能] 初期表示処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doInit(ActionMapping map,
                                    Hlp020Form form,
                                    HttpServletRequest req,
                                    HttpServletResponse res,
                                    Connection con)
        throws Exception {

        log__.debug("初期表示");
        ActionForward forward = null;

        Hlp020ParamModel paramMdl = new Hlp020ParamModel();
        paramMdl.setParam(form);

        ActionErrors errors = new ActionErrors();;
        Hlp020Biz biz = new Hlp020Biz(con);
        //Formの初期値を設定
        String word = form.getHlp002SearchText();
        String rpath = IOTools.setEndPathChar(getAppRootPath());

        if (!ValidateUtil.isSpace(word)) {
            boolean nothing = biz.getInitData(paramMdl, rpath, word);
            paramMdl.setFormData(form);

            if (nothing) {
                log__.debug("検索結果無しエラー");
                ActionMessage msg = new ActionMessage("errors.free.msg",
                        "『 " + word + " 』に一致する情報は見つかりませんでした。");
                StrutsUtil.addMessage(errors, msg, "help");
                addErrors(req, errors);
                form.setHlp020searchFlg(0);
            } else {
                form.setHlp020searchFlg(1);
            }
            forward = map.getInputForward();
        } else {
            forward = map.findForward("hlp010");
        }

        return forward;
    }


}

