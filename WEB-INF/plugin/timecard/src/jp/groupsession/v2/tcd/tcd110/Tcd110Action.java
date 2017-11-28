package jp.groupsession.v2.tcd.tcd110;

import java.sql.Connection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.Encoding;
import jp.co.sjts.util.FileNameUtil;
import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.archive.ZipUtil;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.http.TempFileUtil;
import jp.co.sjts.util.io.IOTools;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.GSConstTimecard;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.TcdAdmConfModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.tcd.AbstractTimecardAction;
import jp.groupsession.v2.tcd.TimecardBiz;
import jp.groupsession.v2.tcd.excel.TimeCardXlsParametarModel;
import jp.groupsession.v2.tcd.tcd010.Tcd010Biz;
import jp.groupsession.v2.tcd.tcd010.Tcd010Model;
import jp.groupsession.v2.tcd.tcd010.Tcd010ParamModel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;


/**
 * <br>[機  能] タイムカード 管理者設定 勤務表一括出力画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Tcd110Action extends AbstractTimecardAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Tcd110Action.class);

    /**
     * <br>[機  能] 管理者以外のアクセスを許可するのか判定を行う。
     * <br>[解  説]
     * <br>[備  考]
     * @param req リクエスト
     * @param form フォーム
     * @return boolean true:許可する,false:許可しない
     */
    public boolean canNotAdminAccess(HttpServletRequest req, ActionForm form) {
        return false;
    }

    /**
     * <br>[機  能] アクションを実行する
     * <br>[解  説]
     * <br>[備  考]
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

        ActionForward forward = null;

        //コマンド取得
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        log__.debug("CMD = " + cmd);
        cmd = cmd.trim();

        Tcd110Form tcForm = (Tcd110Form) form;

        if (cmd.equals("tcd110_back")) {
            //戻る
            forward = map.findForward("tcd030");
        } else if (cmd.equals("tcd110_submit")) {
            //勤務表出力ボタン
            forward = __doOutput(map, tcForm, req, res, con);

        } else if (cmd.equals("addTarget")) {
            //追加(出力対象)ボタン
            forward = __doAddTarget(map, tcForm, req, res, con);

        } else if (cmd.equals("deleteTarget")) {
            //削除(出力対象)ボタン
            forward = __doDelTarget(map, tcForm, req, res, con);

        } else {
            //初期表示
            forward = __doInit(map, tcForm, req, res, con);
        }

        return forward;
    }

    /**
     * <br>[機  能] 初期表示
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception SQL実行時例外
     */
    private ActionForward __doInit(ActionMapping map, Tcd110Form form,
            HttpServletRequest req, HttpServletResponse res, Connection con)
            throws Exception {

        ActionForward forward = null;

        RequestModel reqMdl = getRequestModel(req);
        Tcd110Biz biz = new Tcd110Biz(reqMdl);
        Tcd110ParamModel paramMdl = new Tcd110ParamModel();
        paramMdl.setParam(form);
        con.setAutoCommit(true);
        biz.setInitData(paramMdl, con);
        con.setAutoCommit(false);
        paramMdl.setFormData(form);

        forward = map.getInputForward();
        return forward;
    }

    /**
     * <br>[機  能] 勤務表出力ボタンクリック時処理
     * <br>[解  説]
     * <br>[備  考]
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception SQL実行時例外
     */
    private ActionForward __doOutput(
            ActionMapping map, Tcd110Form form,
            HttpServletRequest req, HttpServletResponse res,
            Connection con)
                    throws Exception {

        ActionErrors ereors = form.validateCheck(con, getRequestModel(req));
        if (!ereors.isEmpty()) {
            addErrors(req, ereors);
            __doInit(map, form, req, res, con);
            return map.getInputForward();
        }

        //勤務表出力先ディレクトリパスを設定
        RequestModel reqMdl = getRequestModel(req);
        UDate date = new UDate();
        date.setDate(form.getTcd110Year(), form.getTcd110Month(), 1);
        GsMessage gsMsg = new GsMessage(reqMdl);
        String msg = gsMsg.getMessage("tcd.140");
        String rosterStr = msg + date.getStrYear() + date.getStrMonth();
        TimecardBiz timecardBiz = new TimecardBiz(reqMdl);
        String appRootPath = getAppRootPath();
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir
            = cmnBiz.getTempDir(getTempPath(req), GSConstTimecard.PLUGIN_ID_TIMECARD, reqMdl);
        IOTools.isDirCheck(tempDir, true);
        String outputDir = IOTools.replaceFileSep(tempDir + "/" + rosterStr + "/");
        IOTools.isDirCheck(outputDir, true);

        TimeCardXlsParametarModel parmModel = new TimeCardXlsParametarModel();
        parmModel.setTargetYear(date.getYear());
        parmModel.setTargetMonth(date.getMonth());
        parmModel.setAppRootPath(appRootPath);
        parmModel.setOutTempDir(outputDir);
        parmModel.setCon(con);

        //タイムカード基本設定を取得
        TimecardBiz tcBiz = new TimecardBiz(reqMdl);
        TcdAdmConfModel admConf = tcBiz.getTcdAdmConfModel(getSessionUserSid(req), con);

        //勤務表出力対象ユーザを取得する
        Tcd010Biz tcd010Biz = new Tcd010Biz();
        Tcd110Biz biz110 = new Tcd110Biz(reqMdl);
        Map<Integer, String> targetMap
            = biz110.getOutputUserMap(con, form.getTcd110target(), reqMdl);

        //勤務表出力対象ユーザの勤務表を出力する
        Tcd010ParamModel tcd010ParamMdl = new Tcd010ParamModel();
        tcd010ParamMdl.setYear(date.getStrYear());
        tcd010ParamMdl.setMonth(date.getStrMonth());

        Iterator<Integer> targetSidIter =  targetMap.keySet().iterator();
        while (targetSidIter.hasNext()) {
            int targetUserSid = targetSidIter.next();
            List<Tcd010Model> timeCardInfoList
                = tcd010Biz.getTimeCardList(tcd010ParamMdl, targetUserSid, admConf, con, reqMdl);

            parmModel.setTargetUserSid(targetUserSid);
            parmModel.setTimeCardInfoList(timeCardInfoList);

            String outBookName  = rosterStr
                        + "_" + targetMap.get(targetUserSid);
            //ファイル名として使用できない文字を"_"に置換する
            outBookName = FileNameUtil.getTempDirNameTabRemove(outBookName);
            //ファイル名＋拡張子=255文字以内
            outBookName = StringUtil.trimRengeString(outBookName, 251);

            if (form.getTcd110OutputFileType() == Tcd110Form.OUTPUT_TYPE_PDF) {
                //PDF形式で出力
                parmModel.setOutBookName(outBookName + ".pdf");
                parmModel.setOutBookTmpName(outBookName + ".pdf");
                timecardBiz.createTimeCardPdf(parmModel);

            } else {
                //EXCEL形式で出力
                parmModel.setOutBookName(outBookName + ".xls");
                parmModel.setOutBookTmpName(outBookName + ".xls");
                timecardBiz.createTimeCardXls(parmModel);
            }
        }

        //出力した勤務表をZIP圧縮する
        UDate now = new UDate();
        String downloadTmpName = now.getDateString() + "_"
                + now.getStrHour()
                + now.getStrMinute()
                + now.getStrSecond()
                + "_timecard.zip";
        String downloadPath = tempDir + downloadTmpName;
        ZipUtil.zipDir("Windows-31J", outputDir, downloadPath);

        String downloadName = rosterStr + ".zip";
        try {
            TempFileUtil.downloadAtachment(req, res, downloadPath, downloadName, Encoding.UTF_8);

        } catch (Exception e) {
            log__.error("勤務表一括出力に失敗", e);
        }

        //TEMPディレクトリ削除
        IOTools.deleteDir(IOTools.setEndPathChar(outputDir));
        //ログ出力
        String logTitle = gsMsg.getMessage("tcd.55");
        String logContent = "[" + gsMsg.getMessage("tcd.tcd110.01") + "] : "
                                    + gsMsg.getMessage("cmn.date5",
                                            new String[]{date.getStrYear(),
                                            String.valueOf(form.getMonth())})
                                    + "\r\n";
        logContent += "[" + gsMsg.getMessage("tcd.tcd110.04") + "] : ";
        if (form.getTcd110OutputFileType() == Tcd110Form.OUTPUT_TYPE_PDF) {
            logContent += gsMsg.getMessage("tcd.tcd080.14");
        } else {
            logContent += gsMsg.getMessage("tcd.tcd080.15");
        }
        logContent += "\r\n";

        logContent += "[" + gsMsg.getMessage("tcd.tcd110.02") + "] : \r\n";
        List<LabelValueBean> targetList =
                biz110._getSelectUserLabelList(form.getTcd110target(), con);
        for (LabelValueBean target : targetList) {
            logContent += target.getLabel() + "\r\n";
        }
        if (logContent.length() > 1000) {
            logContent = logContent.substring(0, 1000);
        }

        TimecardBiz cBiz = new TimecardBiz(reqMdl);
        cBiz.outPutTimecardLog(map, reqMdl, con, logTitle, GSConstLog.LEVEL_INFO,
                                            logContent);

        return null;
    }

    /**
     * <br>[機  能] 追加(出力対象)ボタン押下時処理を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行時例外
     * @return ActionForward
     */
    private ActionForward __doAddTarget(
        ActionMapping map,
        Tcd110Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con) throws Exception {

        Tcd110Biz biz = new Tcd110Biz(getRequestModel(req));
        form.setTcd110target(
                biz.getAddMember(form.getTcd110target(),
                                    form.getTcd110targetNoSelect()));

        return  __doInit(map, form, req, res, con);
    }

    /**
     * <br>[機  能] 削除(出力対象)ボタン押下時処理を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行時例外
     * @return ActionForward
     */
    private ActionForward __doDelTarget(
        ActionMapping map,
        Tcd110Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con) throws Exception {

        CommonBiz cmnBiz = new CommonBiz();
        form.setTcd110target(
                cmnBiz.getDeleteMember(form.getTcd110targetSelect(),
                                    form.getTcd110target()));

        return  __doInit(map, form, req, res, con);
    }
}
