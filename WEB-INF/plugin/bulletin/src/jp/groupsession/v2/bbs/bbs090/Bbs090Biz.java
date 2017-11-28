package jp.groupsession.v2.bbs.bbs090;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.io.IOToolsException;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.bbs.bbs070.Bbs070Biz;
import jp.groupsession.v2.bbs.dao.BbsWriteInfDao;
import jp.groupsession.v2.bbs.model.BulletinDspModel;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.base.CmnGroupmDao;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmInfDao;
import jp.groupsession.v2.cmn.exception.TempFileException;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnBinfModel;
import jp.groupsession.v2.cmn.model.base.CmnGroupmModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.usr.GSConstUser;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

/**
 * <br>[機  能] 掲示板 投稿登録画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs090Biz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Bbs090Biz.class);

    /**
     * <br>[機  能] 初期表示情報を設定する
     * <br>[解  説] 処理モード = 編集の場合、フォーラム情報を設定する
     * <br>[備  考]
     * @param cmd CMDパラメータ
     * @param reqMdl リクエスト情報
     * @param paramMdl パラメータ情報
     * @param con コネクション
     * @param appRoot アプリケーションのルートパス
     * @param tempDir テンポラリディレクトリパス
     * @throws Exception 実行時例外
     */
    @SuppressWarnings("unchecked")
    public void setInitData(
            String cmd, RequestModel reqMdl, Bbs090ParamModel paramMdl,
            Connection con, String appRoot, String tempDir)
                    throws Exception {
        log__.debug("START");

        int userSid = reqMdl.getSmodel().getUsrsid();

        //フォーラム名、スレッド名称を設定
        BbsBiz bbsBiz = new BbsBiz();
        BulletinDspModel bbsMdl = bbsBiz.getThreadData(con, paramMdl.getThreadSid());
        paramMdl.setBbs090forumName(bbsMdl.getBfiName());
        paramMdl.setBbs090threTitle(bbsMdl.getBtiTitle());

        //投稿一覧からの遷移、かつ処理モード = 編集 または
        //投稿一覧からの遷移、かつ処理モード = 引用投稿 の場合
        //投稿情報を取得する
        int cmdMode = paramMdl.getBbs090cmdMode();
        if ((cmd.equals("editPost") && cmdMode == GSConstBulletin.BBSCMDMODE_EDIT)
        || (cmd.equals("inyouWrite") && cmdMode == GSConstBulletin.BBSCMDMODE_INYOU)) {

            //投稿情報を設定
            BulletinDspModel bbsWriteMdl = bbsBiz.getWriteData(con, paramMdl.getBbs060postSid());

            //投稿本文タイプ
            int valueType = bbsWriteMdl.getBwiType();
            paramMdl.setBbs090valueType(valueType);

            Bbs070Biz bbs070Biz = new Bbs070Biz();

            //本文
            String body = NullDefault.getString(bbsWriteMdl.getBwiValue(), "");
            if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
                //テキスト形式の場合
                paramMdl.setBbs090valueHtml("");
                paramMdl.setBbs090value(body);
            } else {
                //HTML形式の場合、本文内のファイルタグを編集用に修正
                body = bbs070Biz.getBbsBodyToEdit(paramMdl.getTempDirId(), body);
                paramMdl.setBbs090valueHtml(body);
                paramMdl.setBbs090value("");
            }

            //本文内添付ファイルをテンポラリディレクトリへ移動する
            bbs070Biz.bbsCopyBodyFileToTemp(
                    reqMdl, paramMdl.getBbs060postSid(), con, appRoot, tempDir);

            if (paramMdl.getBbs090cmdMode() == GSConstBulletin.BBSCMDMODE_INYOU) {

                //引用投稿の場合は内容の各行に「>」を付与する
                if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN
                        && !StringUtil.isNullZeroString(paramMdl.getBbs090value())) {
                    String separator = "\r\n";
                    String writeValue = StringUtil.substitute(paramMdl.getBbs090value(),
                                                            separator,
                                                            separator.concat("> "));
                    paramMdl.setBbs090value("> ".concat(writeValue));

                } else if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_HTML
                        && !StringUtil.isNullZeroString(paramMdl.getBbs090valueHtml())) {

                    //ブロック要素の終了タグとBRタグをCRLFに置き換える
                    String separator = "\r\n";
                    String lineBreak = "<br/>";
                    String quotedBody = paramMdl.getBbs090valueHtml();

                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</address>", separator);
                    quotedBody =
                            StringUtilHtml.replaceString(quotedBody, "</blockquote>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</dd>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</div>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</dl>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</fieldset>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</form>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h1>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h2>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h3>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h4>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h5>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</h6>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</hr>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</li>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</main>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</nav>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</noscript>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</ol>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</p>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</pre>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</table>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</tfooter>", separator);
                    quotedBody = StringUtilHtml.replaceString(quotedBody, "</ul>", separator);

                    quotedBody = StringUtilHtml.replaceString(quotedBody, lineBreak, "<BR>");
                    quotedBody = StringUtilHtml.transBRtoCRLF(quotedBody);

                    //タグを除去する
                    quotedBody = StringUtilHtml.delHTMLTag(quotedBody);

                    //改行をBRタグに再変換する
                    quotedBody = StringUtilHtml.replaceString(quotedBody, separator, lineBreak);

                    //文頭に引用符を付与する
                    quotedBody =
                            StringUtil.substitute(quotedBody, lineBreak, lineBreak.concat("> "));
                    quotedBody = "> ".concat(quotedBody);
                    paramMdl.setBbs090valueHtml(quotedBody);
                }
            }
            if (bbsWriteMdl.getGrpSid() > 0) {
                paramMdl.setBbs090contributor(bbsWriteMdl.getGrpSid());
            }

            //処理モード = 編集の場合は添付ファイルを設定する
            if (cmdMode == GSConstBulletin.BBSCMDMODE_EDIT) {
                getTempData(bbsWriteMdl, paramMdl, con, appRoot, tempDir, reqMdl);
            }

        }

        if (cmd.equals("addPost") && cmdMode == GSConstBulletin.BBSCMDMODE_ADD) {
            BulletinDspModel bbsModel = bbsBiz.getForumData(con, paramMdl.getBbs010forumSid());
            //スレッドテンプレートを適用する。
            if (bbsModel != null
                    && bbsModel.getBfiTemplateKbn()
                    == GSConstBulletin.BBS_THRE_TEMPLATE_YES
                    && bbsModel.getBfiTemplateWrite()
                    == GSConstBulletin.BBS_THRE_TEMPLATE_WRITE_YES) {

                String template = NullDefault.getString(bbsModel.getBfiTemplate(), "");
                if (bbsModel.getBfiTemplateType() == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
                    paramMdl.setBbs090value(template);
                } else {
                    paramMdl.setBbs090valueHtml(template);
                }
            }

            //投稿本文タイプ
            int valueType = bbsBiz.getInitPostType(
                    con, paramMdl.getBbs010forumSid(), userSid);
            paramMdl.setBbs090valueType(valueType);
        }

        //添付ファイル一覧を設定
        CommonBiz cmnBiz = new CommonBiz();

        List<LabelValueBean> sortList = cmnBiz.getTempFileLabelList(tempDir);
        Collections.sort(sortList);
        paramMdl.setBbs090FileLabelList(sortList);

        //投稿者コンボを設定
        int registUser = userSid;
        if (paramMdl.getBbs090cmdMode() == GSConstBulletin.BBSCMDMODE_EDIT) {
            //編集の場合、新規登録時の登録ユーザを投稿者の基準とする
            BbsWriteInfDao writeDao = new BbsWriteInfDao(con);
            registUser = writeDao.getWriteAuid(paramMdl.getBbs060postSid());
        }
        CmnUsrmInfDao usiDao = new CmnUsrmInfDao(con);
        CmnUsrmInfModel usiMdl = usiDao.selectUserNameAndJtkbn(registUser);

        int contributor = paramMdl.getBbs090contributor();
        if (contributor > 0) {
            GroupDao grpDao = new GroupDao(con);
            if (!grpDao.isBelong(registUser, contributor)
                    && paramMdl.getBbs090cmdMode() != GSConstBulletin.BBSCMDMODE_INYOU) {
                //投稿者が投稿グループに所属していない場合には投稿者を編集不可にする。
                paramMdl.setBbs090contributorEditKbn(0);
                CmnGroupmDao cmnGrpDao = new CmnGroupmDao(con);
                CmnGroupmModel grpMdl = cmnGrpDao.selectGroup(contributor);
                if (grpMdl != null) {
                    paramMdl.setBbs090contributorJKbn(grpMdl.getGrpJkbn());
                    UsrLabelValueBean label;
                    List<UsrLabelValueBean> labelList = new ArrayList<UsrLabelValueBean>();
                    label = new UsrLabelValueBean(grpMdl.getGrpName(), String
                            .valueOf(contributor));
                    labelList.add(label);
                    paramMdl.setBbs090contributorList(labelList);
                }
            }
        } else if (usiMdl.getUsrJkbn() == GSConstUser.USER_JTKBN_DELETE) {
            //投稿者が削除済みユーザの場合には投稿者を編集不可にする。
            paramMdl.setBbs090contributorEditKbn(0);

            UsrLabelValueBean label;
            List<UsrLabelValueBean> labelList = new ArrayList<UsrLabelValueBean>();
            String name = NullDefault.getString(usiMdl.getUsiSei(), "")
                    + "　" + NullDefault.getString(usiMdl.getUsiMei(), "");
            paramMdl.setBbs090contributorJKbn(usiMdl.getUsrJkbn());

            label = new UsrLabelValueBean(name, String
                    .valueOf(contributor));
            labelList.add(label);
            paramMdl.setBbs090contributorList(labelList);
        }


        if (paramMdl.getBbs090contributorEditKbn() == 1) {
                //投稿者コンボを設定
            paramMdl.setBbs090contributorList(
                    cmnBiz.getMARegistrantCombo(con, registUser, reqMdl));
        }
        log__.debug("End");
    }

    /**
     * <br>[機  能] 添付ファイルを設定する
     * <br>[解  説] 処理モード = 編集の場合、添付ファイルを設定する
     * <br>[備  考]
     * @param bbsWriteMdl 添付ファイルデータ
     * @param paramMdl パラメータ情報
     * @param con コネクション
     * @param appRoot アプリケーションのルートパス
     * @param tempDir テンポラリディレクトリパス
     * @param reqMdl リクエスト情報
     * @throws SQLException 実行例外
     * @throws IOException 添付ファイルの操作に失敗
     * @throws IOToolsException 添付ファイルの操作に失敗
     * @throws TempFileException 添付ファイルUtil内での例外
     */
    public void getTempData(BulletinDspModel bbsWriteMdl, Bbs090ParamModel paramMdl,
                            Connection con, String appRoot, String tempDir,
                            RequestModel reqMdl)
    throws SQLException, IOException, IOToolsException, TempFileException {

        CommonBiz cmnBiz = new CommonBiz();
        String dateStr = (new UDate()).getDateString(); //現在日付の文字列(YYYYMMDD)

        if (bbsWriteMdl.getTmpFileList() != null
                      && bbsWriteMdl.getTmpFileList().size() > 0) {

            List < CmnBinfModel > tmpFileList = bbsWriteMdl.getTmpFileList();
            String[] binSids = new String[tmpFileList.size()];

            //バイナリSIDの取得
            for (int i = 0; i < tmpFileList.size(); i++) {
                binSids[i] = String.valueOf(tmpFileList.get(i).getBinSid());
            }

            //取得したバイナリSIDからバイナリ情報を取得
            List<CmnBinfModel> binList = cmnBiz.getBinInfo(con, binSids, reqMdl.getDomain());

            int fileNum = 1;

            for (CmnBinfModel cbMdl : binList) {

                //添付ファイルをテンポラリディレクトリへ移動する
                cmnBiz.saveTempFile(dateStr, cbMdl,
                       appRoot, tempDir, fileNum);
                fileNum++;
            }
        }
    }
}
