package jp.groupsession.v2.api.webmail.mail;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.date.UDateUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.smail.mail.ApiSmlMailBiz;
import jp.groupsession.v2.api.webmail.mail.send.ApiWmlMailSendForm;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.dao.WmlDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnBinfModel;
import jp.groupsession.v2.cmn.model.base.WmlTempfileModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.wml.wml010.Wml010Biz;
import jp.groupsession.v2.wml.wml010.Wml010Const;

import org.apache.oro.text.perl.Perl5Util;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestHandler;

/**
 * <br>[機  能] WEBメールの操作を行うWEBAPIビジネスロジック
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlMailBiz {

    /** Logging インスタンス */
    //private static Log log__ = LogFactory.getLog(ApiWmlMailBiz.class);

    /**
     * <br>[機  能] 指定された文字列(yyyy/mm/dd hh:mm:ss) → Date型 へ変換
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param dateTime 変換したい日時文字列
     * @param isMax    時間最大設定フラグ
     * @return 日時データ(Date型)
     */
    public static UDate convertSlashDateTimeFormat(String dateTime, boolean isMax) {
        if (dateTime != null && dateTime.length() >= 10) {
            // 日付フォーマットチェック
            Perl5Util util = new Perl5Util();
            if (util.match("/^[0-9]{4}/[0-9]{2}/[0-9]{2}$/", dateTime.substring(0, 10))) {
                UDate date = UDateUtil.getUDate(dateTime.substring(0, 4),
                                                dateTime.substring(5, 7),
                                                dateTime.substring(8, 10));
                if (isMax) {
                    date.setMaxHhMmSs();
                } else {
                    date.setZeroHhMmSs();
                }

                // 時間フォーマットチェック
                if (dateTime.length() >= 19) {
                    if (util.match("/^[0-9]{2}:[0-9]{2}:[0-9]{2}$/", dateTime.substring(11))) {
                        date.setHour(Integer.valueOf(dateTime.substring(11, 13)));
                        date.setMinute(Integer.valueOf(dateTime.substring(14, 16)));
                        date.setSecond(Integer.valueOf(dateTime.substring(17, 19)));
                    }
                } else if (dateTime.length() >= 16) {
                    if (util.match("/^[0-9]{2}:[0-9]{2}$/", dateTime.substring(11))) {
                        date.setHour(Integer.valueOf(dateTime.substring(11, 13)));
                        date.setMinute(Integer.valueOf(dateTime.substring(14, 16)));
                    }
                }
                return date;
            }
        }
        return null;
    }

    /**
     * <br>[機  能] 宛先アドレスを結合
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param addressList 宛先アドレス一覧
     * @return 複数のアドレスを結合した文字列
     */
    public static String appendAddress(String[] addressList) {
        StringBuffer ret = new StringBuffer();

        if (addressList != null && addressList.length > 0) {
            for (int i = 0; i < addressList.length; i++) {
                if (addressList[i].length() > 0) {
                    if (ret.length() > 0) {
                        ret.append(",");
                    }
                    ret.append(addressList[i]);
                }
            }
        }
        return ret.toString();
    }

    /**
     * <br>[機  能] 送信パラメータ判定
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param  errors   エラー
     * @param  con      コネクション
     * @param  gsMsg    GsMessage
     * @param  form     フォーム
     * @param  userSid  ユーザSID
     * @throws SQLException SQL実行時例外
     */
    public void validateFormSmail(ActionErrors errors, Connection con,
                                  GsMessage gsMsg, ApiWmlMailSendForm form,
                                  int userSid)
        throws SQLException {

        if (form.getSendType() != Wml010Const.SEND_TYPE_NORMAL
         && form.getSendType() != Wml010Const.SEND_TYPE_REPLY
         && form.getSendType() != Wml010Const.SEND_TYPE_REPLY_ALL
         && form.getSendType() != Wml010Const.SEND_TYPE_FORWARD
         && form.getSendType() != Wml010Const.SEND_TYPE_EDIT) {
            // 不正な送信タイプ
            ActionMessage msg = new ActionMessage("error.input.notvalidate.data",
                    "sendType");
            StrutsUtil.addMessage(errors, msg, "sendType");
        } else if (form.getSendType() != Wml010Const.SEND_TYPE_NORMAL) {
            // 新規作成以外は参照メールの使用可否チェック
            this.validateReadSmail(errors, con, gsMsg, form.getWmlSid(), userSid);
        }
    }

    /**
     * <br>[機  能] メール使用可能判定
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param  errors  エラー
     * @param  con     コネクション
     * @param  gsMsg   GsMessage
     * @param  wmlSid  メールSID
     * @param  userSid ユーザSID
     * @throws SQLException SQL実行時例外
     */
    public void validateReadSmail(ActionErrors errors, Connection con,
                                  GsMessage gsMsg, long wmlSid, int userSid)
        throws SQLException {

        // メール閲覧可否チェック(新規作成以外)
        WmlDao wmlDao = new WmlDao(con);
        if (wmlSid < 0) {
           // メールSID未指定
             ActionMessage msg = new ActionMessage("error.input.required.text",
                    gsMsg.getMessage("wml.wml010.25"));
            StrutsUtil.addMessage(errors, msg, "wmlSid");
        } else if (!wmlDao.canReadMail(wmlSid, userSid)) {
            // メール閲覧権限が無い為、アクセスエラー
            ActionMessage msg = new ActionMessage("search.notfound.tdfkcode",
                    gsMsg.getMessage("cmn.mail"));
            StrutsUtil.addMessage(errors, msg, "wmlSid");
        }
    }

    /**
     * <br>[機  能] メール容量判定
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param  errors  エラー
     * @param  req     リクエスト
     * @param  gsMsg   GsMessage
     * @throws SQLException SQL実行時例外
     */
    public void validateMailSize(ActionErrors errors, HttpServletRequest req, GsMessage gsMsg)
        throws SQLException {

        Object obj =
                req.getAttribute(MultipartRequestHandler.ATTRIBUTE_MAX_LENGTH_EXCEEDED);
        if (obj != null && ((Boolean) obj).booleanValue()) {
            // アップロードサイズがMAXサイズを超えた場合
            String message = gsMsg.getMessage("cmn.upload.totalcapacity.over",
                    new String[]{GSConstCommon.TEXT_FILE_MAX_SIZE});
            ActionMessage msg = new ActionMessage("errors.free.msg", message);
            StrutsUtil.addMessage(errors, msg, "wmlSid");
        }
    }

    /**
     * <br>[機  能] 添付ファイルのデータサイズ取得
     * <br>[解  説]
     * <br>[備  考]
     * @param con         コネクション
     * @param reqMdl      リクエストモデル
     * @param form        フォーム
     * @throws Exception 実行例外
     * @return 添付ファイルの合計データサイズ
     */
    public long getTmpFileSize(Connection con, RequestModel reqMdl,
                               ApiWmlMailSendForm form)
            throws Exception {

        long fileSize = 0;

        // 添付ファイルのアップロード(新規追加されたバイナリデータ)
        FormFile[] fileList = form.getTmpFiles();
        if (fileList != null && fileList.length > 0) {
            for (FormFile file : fileList) {
                if (file != null) {
                    fileSize += file.getFileSize();
                }
            }
        }

        // 添付ファイルのアップロード２(テンプレートから取得)
        List<CmnBinfModel> binFileList = form.getBinFiles(con, reqMdl);
        if (binFileList.size() > 0) {
            for (CmnBinfModel cbMdl : binFileList) {
                fileSize += cbMdl.getBinFileSize();
            }
        }

        // 添付ファイルのアップロード３(参照メールから取得)
        List<WmlTempfileModel> wtfFileList = form.getWtfFiles(con, reqMdl);
        if (wtfFileList.size() > 0) {
            for (WmlTempfileModel wtfMdl : wtfFileList) {
                fileSize += wtfMdl.getWtfFileSize();
            }
        }
        return fileSize;
    }

    /**
     * <br>[機  能] 添付ファイルをサーバーにアップする
     * <br>[解  説]
     * <br>[備  考]
     * @param errors      エラー
     * @param con         コネクション
     * @param gsMsg       GsMessage
     * @param reqMdl      リクエストモデル
     * @param form        フォーム
     * @param appRootDir  ルートフォルダ
     * @param tempDir テンポラリフォルダ
     * @throws Exception 実行例外
     */
    public void uploadTmpFile(ActionErrors errors, Connection con,
                              GsMessage gsMsg, RequestModel reqMdl,
                              ApiWmlMailSendForm form,
                              String appRootDir, String tempDir)
            throws Exception {

        int fileNum = 1;

        if (tempDir == null || tempDir.isEmpty()) {
            return; // アップロード失敗
        }

        // 添付ファイルのアップロード(新規追加されたバイナリデータ)
        FormFile[] fileList = form.getTmpFiles();
        if (fileList != null && fileList.length > 0) {
            Wml010Biz wml010Biz = new Wml010Biz();
            ApiSmlMailBiz apiSmlBiz = new ApiSmlMailBiz();
            for (FormFile file : fileList) {
                if (file != null && file.getFileName() != null
                                 && file.getFileName().length() > 0) {
                    // 一旦、一時フォルダに保存
                    apiSmlBiz.validateTempFile(errors, con, gsMsg, file);
                    if (!errors.isEmpty()) {
                        return;
                    }
                    wml010Biz.uploadTempFile(file, tempDir);
                    fileNum++;
                }
            }
        }

        // 添付ファイルのアップロード２(テンプレートから取得)
        List<CmnBinfModel> binFileList = form.getBinFiles(con, reqMdl);

        // 添付ファイルのアップロード３(参照メールから取得)
        List<WmlTempfileModel> wtfFileList = form.getWtfFiles(con, reqMdl);

        if (binFileList.size() > 0 || wtfFileList.size() > 0) {
            String dateStr = (new UDate()).getDateString(); //現在日付の文字列(YYYYMMDD)
            CommonBiz cmnBiz = new CommonBiz();

            // テンプレートから添付ファイルをコピー
            for (CmnBinfModel cbMdl : binFileList) {
                // 添付ファイルをテンポラリディレクトリにコピーする。
                cmnBiz.saveTempFile(dateStr, cbMdl, appRootDir, tempDir, fileNum);
                fileNum++;
            }

            // 参照メールから添付ファイルをコピー
            for (WmlTempfileModel wtfMdl : wtfFileList) {
                cmnBiz.saveTempFileForWebmail(dateStr, wtfMdl,
                                              appRootDir, tempDir, fileNum);
                fileNum++;
            }
        }
    }
}