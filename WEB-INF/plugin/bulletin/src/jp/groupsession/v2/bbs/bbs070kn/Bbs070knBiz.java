package jp.groupsession.v2.bbs.bbs070kn;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.io.IOTools;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.bbs.bbs070.Bbs070Biz;
import jp.groupsession.v2.bbs.dao.BbsBinDao;
import jp.groupsession.v2.bbs.dao.BbsBodyBinDao;
import jp.groupsession.v2.bbs.dao.BbsThreInfDao;
import jp.groupsession.v2.bbs.dao.BbsThreRsvDao;
import jp.groupsession.v2.bbs.dao.BbsThreSumDao;
import jp.groupsession.v2.bbs.dao.BbsThreViewDao;
import jp.groupsession.v2.bbs.dao.BbsWriteInfDao;
import jp.groupsession.v2.bbs.dao.BulletinDao;
import jp.groupsession.v2.bbs.model.BbsBinModel;
import jp.groupsession.v2.bbs.model.BbsThreInfModel;
import jp.groupsession.v2.bbs.model.BbsThreRsvModel;
import jp.groupsession.v2.bbs.model.BbsThreSumModel;
import jp.groupsession.v2.bbs.model.BbsThreViewModel;
import jp.groupsession.v2.bbs.model.BbsWriteInfModel;
import jp.groupsession.v2.bbs.model.BulletinDspModel;
import jp.groupsession.v2.bbs.model.BulletinSmlModel;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.config.PluginConfig;
import jp.groupsession.v2.cmn.dao.MlCountMtController;
import jp.groupsession.v2.cmn.dao.base.CmnGroupmDao;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmInfDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnGroupmModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;

/**
 * <br>[機  能] 掲示板 スレッド登録確認画面のビジネスロジッククラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs070knBiz {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Bbs070knBiz.class);

    /** DBコネクション */
    public Connection con__ = null;

    /**
     * <p>コンストラクタ
     * @param con Connection
     */
    public Bbs070knBiz(Connection con) {
        con__ = con;
    }

    /**
     * <br>[機  能] 初期表示情報を設定する
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータ情報
     * @param reqMdl リクエスト情報
     * @param tempDir テンポラリディレクトリ
     * @throws Exception 実行例外
     */
    @SuppressWarnings("unchecked")
    public void setInitData(Bbs070knParamModel paramMdl, RequestModel reqMdl, String tempDir)
    throws Exception {
        log__.debug("START");

        //投稿者を設定
        int contributor = paramMdl.getBbs070contributor();
        if (contributor > 0) {
            CmnGroupmDao grpDao = new CmnGroupmDao(con__);
            CmnGroupmModel grpMdl = grpDao.selectGroup(contributor);
            if (grpMdl != null) {
                paramMdl.setBbs070contributorJKbn(grpMdl.getGrpJkbn());
                paramMdl.setBbs070knviewContributor(
                        grpMdl.getGrpName());
            }

        } else {
            int registUser = reqMdl.getSmodel().getUsrsid();
            if (paramMdl.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_EDIT) {
                //編集の場合、新規登録時の登録ユーザを投稿者とする
                BbsWriteInfDao writeDao = new BbsWriteInfDao(con__);
                registUser = writeDao.getWriteAuid(paramMdl.getBbs060postSid());
            }
            CmnUsrmInfDao usiDao = new CmnUsrmInfDao(con__);
            CmnUsrmInfModel usiMdl = usiDao.selectUserNameAndJtkbn(registUser);
            String name = NullDefault.getString(usiMdl.getUsiSei(), "")
                    + "　" + NullDefault.getString(usiMdl.getUsiMei(), "");

            paramMdl.setBbs070knviewContributor(name);
            paramMdl.setBbs070UserYukoKbn(usiMdl.getUsrUkoFlg());
            paramMdl.setBbs070contributorJKbn(usiMdl.getUsrJkbn());

        }

        if (paramMdl.getBbs070valueType() == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //表示用に内容を設定
            String viewValue = paramMdl.getBbs070value();
            viewValue = NullDefault.getString(
                    StringUtilHtml.transToHTmlPlusAmparsant(viewValue), "");
            viewValue = StringUtil.transToLink(viewValue, StringUtil.OTHER_WIN, true);
            paramMdl.setBbs070knviewvalue(viewValue);
        }

        //フォーラム名を設定
        BbsBiz bbsBiz = new BbsBiz();
        BulletinDspModel btDspMdl = bbsBiz.getForumData(con__, paramMdl.getBbs010forumSid());
        paramMdl.setBbs070forumName(btDspMdl.getBfiName());

        //添付ファイル一覧を設定
        CommonBiz cmnBiz = new CommonBiz();
        List<LabelValueBean> sortList = cmnBiz.getTempFileLabelList(tempDir);
        Collections.sort(sortList);
        paramMdl.setBbs070FileLabelList(sortList);

        log__.debug("End");
    }

    /**
     * <br>[機  能] スレッド情報の登録処理を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータ情報
     * @param cntCon MlCountMtController
     * @param userSid セッションユーザSID
     * @param appRootPath アプリケーションのルートパス
     * @param tempDir テンポラリディレクトリ
     * @param now 現在日時
     * @param reqMdl リクエストモデル
     * @return int スレッドSID
     * @throws Exception 実行例外
     */
    public int insertThreadData(Bbs070knParamModel paramMdl,
            MlCountMtController cntCon,
            int userSid,
            String appRootPath,
            String tempDir,
            UDate now,
            RequestModel reqMdl)
                    throws Exception {
        log__.debug("START");

        //        UDate now = new UDate();

        int bfiSid = paramMdl.getBbs010forumSid();

        //スレッドSID採番
        int btiSid = (int) cntCon.getSaibanNumber(GSConstBulletin.SBNSID_BULLETIN,
                                                GSConstBulletin.SBNSID_SUB_BULLETIN_THREAD,
                                                userSid);

        //スレッド情報の登録
        BbsThreInfModel bbsThreInfMdl = new BbsThreInfModel();
        bbsThreInfMdl.setBtiSid(btiSid);
        bbsThreInfMdl.setBfiSid(bfiSid);
        bbsThreInfMdl.setBtiTitle(paramMdl.getBbs070title());
        bbsThreInfMdl.setBtiAuid(userSid);
        bbsThreInfMdl.setBtiAdate(now);
        bbsThreInfMdl.setBtiEuid(userSid);
        bbsThreInfMdl.setBtiEdate(now);
        bbsThreInfMdl.setBtiLimit(paramMdl.getBbs070limit());
        UDate limitFrDate = now.cloneUDate();
        if (bbsThreInfMdl.getBtiLimit() == GSConstBulletin.THREAD_LIMIT_YES) {
            limitFrDate.setHour(paramMdl.getBbs070limitFrHour());
            limitFrDate.setMinute(paramMdl.getBbs070limitFrMinute());
            limitFrDate.setDate(paramMdl.getBbs070limitFrYear(),
                    paramMdl.getBbs070limitFrMonth(),
                    paramMdl.getBbs070limitFrDay());
            bbsThreInfMdl.setBtiLimitFrDate(limitFrDate);

            UDate limitToDate = now.cloneUDate();
            limitToDate.setHour(paramMdl.getBbs070limitHour());
            limitToDate.setMinute(paramMdl.getBbs070limitMinute());
            limitToDate.setDate(paramMdl.getBbs070limitYear(),
                            paramMdl.getBbs070limitMonth(),
                            paramMdl.getBbs070limitDay());
            bbsThreInfMdl.setBtiLimitDate(limitToDate);
            //予約投稿リストへ登録
            if (now.compareDateYMDHM(limitFrDate) == UDate.LARGE) {
                BbsThreRsvModel bbsThreRsvMdl = new BbsThreRsvModel();
                BbsThreRsvDao btrDao = new BbsThreRsvDao(con__);
                bbsThreRsvMdl.setBtiSid(btiSid);
                bbsThreRsvMdl.setBfiSid(bfiSid);
                BbsBiz bbsBiz = new BbsBiz();
                String threadUrl = bbsBiz.createThreadUrl(reqMdl, bfiSid, btiSid);
                bbsThreRsvMdl.setBtrUrl(threadUrl);
                btrDao.insert(bbsThreRsvMdl);
            }
        }
        int contributor = 0;
        if (paramMdl.getBbs070contributor() > 0) {
            contributor = paramMdl.getBbs070contributor();
        }
        bbsThreInfMdl.setBtiAgid(contributor);
        bbsThreInfMdl.setBtiEgid(contributor);
        bbsThreInfMdl.setBtiImportance(paramMdl.getBbs070Importance());
        BbsThreInfDao bbsThreInfDao = new BbsThreInfDao(con__);
        bbsThreInfDao.insert(bbsThreInfMdl);

        //投稿SID採番
        int bwiSid = (int) cntCon.getSaibanNumber(GSConstBulletin.SBNSID_BULLETIN,
                                                GSConstBulletin.SBNSID_SUB_BULLETIN_WRITE,
                                                userSid);
        paramMdl.setBbs060postSid(bwiSid);

        //本文のタイプ
        int valueType = paramMdl.getBbs070valueType();
        //本文
        String postValue = null;

        CommonBiz cmnBiz = new CommonBiz();

        if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //本文がプレーンテキストの場合
            postValue = paramMdl.getBbs070value();

        } else {
            //本文がHTMLテキストの場合
            postValue = paramMdl.getBbs070valueHtml();

            //本文内ファイルのIDを取得し、表示用のタグに変換。
            List <String> bodyFileList = new ArrayList<String>();
            Bbs070Biz bbs070Biz = new Bbs070Biz();
            postValue = bbs070Biz.getBbsBodyFileList(
                    paramMdl.getBbs060postSid(), postValue, bodyFileList);

            //本文から投稿本文添付情報を取得し、バイナリー情報に登録
            List <String> bodyBinSidList = new ArrayList<String>();
            String bodyFileTempDir = null;
            for (String bodyFileId : bodyFileList) {
                bodyFileTempDir = IOTools.replaceFileSep(
                        tempDir + GSConstCommon.EDITOR_BODY_FILE + "/" + bodyFileId + "/");
                List <String> bodyBinSid = cmnBiz.insertBinInfo(
                        con__, bodyFileTempDir, appRootPath, cntCon, userSid, now);
                if (bodyBinSid != null && bodyBinSid.size() > 0) {
                    bodyBinSidList.add(bodyBinSid.get(0));
                }
            }

            //投稿本文添付情報テーブルへの登録
            BbsBodyBinDao bbsBodyBinDao = new BbsBodyBinDao(con__);
            bbsBodyBinDao.insertBbsBodyBinData(bwiSid, bodyFileList, bodyBinSidList);
        }

        //投稿情報の登録
        BbsWriteInfModel bbsWriteInfMdl = new BbsWriteInfModel();
        bbsWriteInfMdl.setBwiSid(bwiSid);
        bbsWriteInfMdl.setBfiSid(bfiSid);
        bbsWriteInfMdl.setBtiSid(btiSid);
        bbsWriteInfMdl.setBwiType(valueType);
        if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //本文がプレーンテキストの場合
            bbsWriteInfMdl.setBwiValue(postValue);
            bbsWriteInfMdl.setBwiValuePlain("");

        } else {
            //本文がHTMLテキストの場合
            bbsWriteInfMdl.setBwiValue(postValue);
            //BRタグを\r\nに変換後、タグを除去し、プレーンテキストとして登録
            String postValuePlain = StringUtilHtml.replaceString(postValue, "<br/>", "<BR>");
            postValuePlain = StringUtilHtml.transBRtoCRLF(postValuePlain);
            postValuePlain = StringUtilHtml.delHTMLTag(postValuePlain);
            postValuePlain = StringEscapeUtils.unescapeHtml(postValuePlain);
            bbsWriteInfMdl.setBwiValuePlain(postValuePlain);
        }

        //予約投稿時かつ掲示開始日時が未来の場合、その日を投稿日時とする。
        if (bbsThreInfMdl.getBtiLimit() == GSConstBulletin.THREAD_LIMIT_YES
                && now.compareDateYMDHM(limitFrDate) == UDate.LARGE) {
            bbsWriteInfMdl.setBwiAdate(limitFrDate);
            bbsWriteInfMdl.setBwiEdate(limitFrDate);
        } else {
            bbsWriteInfMdl.setBwiAdate(now);
            bbsWriteInfMdl.setBwiEdate(now);
        }
        bbsWriteInfMdl.setBwiAuid(userSid);
        bbsWriteInfMdl.setBwiEuid(userSid);
        bbsWriteInfMdl.setBwiAgid(contributor);
        bbsWriteInfMdl.setBwiEgid(contributor);

        BbsWriteInfDao bbsWriteInfDao = new BbsWriteInfDao(con__);
        bbsWriteInfDao.insert(bbsWriteInfMdl);

        //添付ファイルをバイナリー情報に登録
        List < String > binSid = cmnBiz.insertBinInfo(con__, tempDir, appRootPath,
                                                    cntCon, userSid, now);

        //投稿添付情報の登録
        BbsBinModel bbsBinMdl = new BbsBinModel();
        bbsBinMdl.setBwiSid(bwiSid);
        bbsBinMdl.setBinSid(new Long(0));
        BbsBinDao bbsBinDao = new BbsBinDao(con__);
        bbsBinDao.insertBbsBinData(bwiSid, binSid);

        //スレッド集計情報の登録
        BbsBiz bbsBiz = new BbsBiz();
        BbsThreSumModel bbsThreSumMdl = new BbsThreSumModel();
        bbsThreSumMdl.setBtiSid(btiSid);
        bbsThreSumMdl.setBtsWrtCnt(1);

        //掲示予定フラグ
        boolean rsvThredFlg = false;
        if (bbsThreInfMdl.getBtiLimit() == GSConstBulletin.THREAD_LIMIT_YES
                && bbsBiz.checkReserveDate(limitFrDate, now)) {
            rsvThredFlg = true;
        }

        //掲示予定の場合 スレッドの最終書き込み日時を更新しない
        if (rsvThredFlg) {
            bbsThreSumMdl.setBtsWrtDate(limitFrDate);
        } else {
            bbsThreSumMdl.setBtsWrtDate(now);
        }


        bbsThreSumMdl.setBtsAuid(userSid);
        bbsThreSumMdl.setBtsAdate(now);
        bbsThreSumMdl.setBtsEuid(userSid);
        bbsThreSumMdl.setBtsEdate(now);
        bbsThreSumMdl.setBtsSize(bbsBiz.getThreadDiskSize(con__, btiSid));
        if (binSid != null && !binSid.isEmpty()) {
            bbsThreSumMdl.setBtsTempflg(GSConstBulletin.BTS_TEMPFLG_EXIST);
        } else {
            bbsThreSumMdl.setBtsTempflg(GSConstBulletin.BTS_TEMPFLG_NOTHING);
        }
        BbsThreSumDao bbsThreSumDao = new BbsThreSumDao(con__);
        bbsThreSumDao.insert(bbsThreSumMdl);

        //フォーラム集計情報の更新
        //掲示予定の場合 フォーラムの最終書き込み日時を更新しない
        if (rsvThredFlg) {
            bbsBiz.updateBbsForSum(con__, bfiSid, userSid, now, false);
        } else {
            bbsBiz.updateBbsForSum(con__, bfiSid, userSid, now, true);
        }


        log__.debug("End");

        return btiSid;
    }

    /**
     * <br>[機  能] スレッド情報の更新処理を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータ情報
     * @param cntCon MlCountMtController
     * @param userSid セッションユーザSID
     * @param appRootPath アプリケーションのルートパス
     * @param tempDir テンポラリディレクトリ
     * @param reqMdl リクエストモデル
     * @return backFlg 戻り画面フラグ 0:投稿一覧 1:スレッド一覧 2:フォーラム一覧
     * @throws Exception 実行例外
     */
    public int updateThreadData(Bbs070knParamModel paramMdl,
            MlCountMtController cntCon,
            int userSid,
            String appRootPath,
            String tempDir,
            RequestModel reqMdl)
                    throws Exception {
        log__.debug("START");

        UDate now = new UDate();

        int bfiSid = paramMdl.getBbs010forumSid();
        int btiSid = paramMdl.getThreadSid();
        int bwiSid = paramMdl.getBbs060postSid();

        //スレッド情報の更新
        BbsThreInfDao bbsThreInfDao = new BbsThreInfDao(con__);
        BbsThreInfModel bbsThreInfMdl = new BbsThreInfModel();
        bbsThreInfMdl.setBtiSid(btiSid);
        bbsThreInfMdl.setBtiTitle(paramMdl.getBbs070title());
        bbsThreInfMdl.setBtiEuid(userSid);
        bbsThreInfMdl.setBtiEdate(now);
        bbsThreInfMdl.setBtiLimit(paramMdl.getBbs070limit());

        UDate limitFrDate = now.cloneUDate();

        if (bbsThreInfMdl.getBtiLimit() == GSConstBulletin.THREAD_LIMIT_YES) {
            limitFrDate.setHour(paramMdl.getBbs070limitFrHour());
            limitFrDate.setMinute(paramMdl.getBbs070limitFrMinute());
            limitFrDate.setDate(paramMdl.getBbs070limitFrYear(),
                    paramMdl.getBbs070limitFrMonth(),
                    paramMdl.getBbs070limitFrDay());
            bbsThreInfMdl.setBtiLimitFrDate(limitFrDate);

            UDate limitToDate = new UDate();
            limitToDate.setHour(paramMdl.getBbs070limitHour());
            limitToDate.setMinute(paramMdl.getBbs070limitMinute());
            limitToDate.setDate(paramMdl.getBbs070limitYear(),
                            paramMdl.getBbs070limitMonth(),
                            paramMdl.getBbs070limitDay());
            bbsThreInfMdl.setBtiLimitDate(limitToDate);
            //予約投稿リストへ登録
            BbsThreRsvModel bbsThreRsvMdl = new BbsThreRsvModel();
            BbsThreRsvDao btrDao = new BbsThreRsvDao(con__);
            //掲示開始日時を未来に指定して編集した場合、予約投稿リストへ登録
            if (now.compareDateYMDHM(limitFrDate) == UDate.LARGE) {
                bbsThreRsvMdl.setBtiSid(btiSid);
                bbsThreRsvMdl.setBfiSid(bfiSid);
                BbsBiz bbsBiz = new BbsBiz();
                String threadUrl = bbsBiz.createThreadUrl(reqMdl, bfiSid, btiSid);
                bbsThreRsvMdl.setBtrUrl(threadUrl);
                //すでに存在するスレッドSIDとの重複を避ける
                if (btrDao.selectByBti(btiSid).getBtiSid() == 0) {
                    btrDao.insert(bbsThreRsvMdl);
                }
            //掲示開始日時を過去に指定して編集した場合、予約投稿リストから削除
            } else {
                btrDao.delete(btiSid);
            }
        }
        int contributor = 0;
        if (paramMdl.getBbs070contributor() > 0) {
            contributor = paramMdl.getBbs070contributor();
        }
        bbsThreInfMdl.setBtiEgid(contributor);
        bbsThreInfMdl.setBtiImportance(paramMdl.getBbs070Importance());
        bbsThreInfDao.updateThreData(bbsThreInfMdl);

        //登録済みのバイナリー情報の削除
        BulletinDao bbsDao = new BulletinDao(con__);
        bbsDao.deleteBinfForWrite(bwiSid);

        //登録済みの投稿本文添付情報の削除
        BbsBodyBinDao bbsBodyBinDao = new BbsBodyBinDao(con__);
        bbsBodyBinDao.delete(bwiSid);

        //本文のタイプ
        int valueType = paramMdl.getBbs070valueType();
        //本文
        String postValue = null;

        CommonBiz cmnBiz = new CommonBiz();

        if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //本文がプレーンテキストの場合
            postValue = paramMdl.getBbs070value();
        } else {
            //本文がHTMLテキストの場合
            postValue = paramMdl.getBbs070valueHtml();

            //本文内ファイルのIDを取得し、表示用のタグに変換。
            List <String> bodyFileList = new ArrayList<String>();
            Bbs070Biz bbs070Biz = new Bbs070Biz();
            postValue = bbs070Biz.getBbsBodyFileList(
                    paramMdl.getBbs060postSid(), postValue, bodyFileList);

            //本文から投稿本文添付情報を取得し、バイナリー情報に登録
            List <String> bodyBinSidList = new ArrayList<String>();
            String bodyFileTempDir = null;
            for (String bodyFileId : bodyFileList) {
                bodyFileTempDir = IOTools.replaceFileSep(
                        tempDir + GSConstCommon.EDITOR_BODY_FILE + "/" + bodyFileId + "/");
                List <String> bodyBinSid = cmnBiz.insertBinInfo(
                        con__, bodyFileTempDir, appRootPath, cntCon, userSid, now);
                if (bodyBinSid != null && bodyBinSid.size() > 0) {
                    bodyBinSidList.add(bodyBinSid.get(0));
                }
            }

            //投稿本文添付情報テーブルへの登録
            bbsBodyBinDao.insertBbsBodyBinData(bwiSid, bodyFileList, bodyBinSidList);
        }

        //投稿情報の更新
        BbsWriteInfModel bbsWriteInfMdl = new BbsWriteInfModel();
        bbsWriteInfMdl.setBwiSid(bwiSid);
        bbsWriteInfMdl.setBwiType(valueType);
        if (valueType == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //本文がプレーンテキストの場合
            bbsWriteInfMdl.setBwiValue(postValue);
            bbsWriteInfMdl.setBwiValuePlain("");

        } else {
            //本文がHTMLテキストの場合
            bbsWriteInfMdl.setBwiValue(postValue);
            //BRタグを\r\nに変換後、タグを除去し、プレーンテキストとして登録
            String postValuePlain = StringUtilHtml.replaceString(postValue, "<br/>", "<BR>");
            postValuePlain = StringUtilHtml.transBRtoCRLF(postValuePlain);
            postValuePlain = StringUtilHtml.delHTMLTag(postValuePlain);
            postValuePlain = StringEscapeUtils.unescapeHtml(postValuePlain);
            bbsWriteInfMdl.setBwiValuePlain(postValuePlain);
        }

        bbsWriteInfMdl.setBwiEdate(now);
        bbsWriteInfMdl.setBwiEuid(userSid);
        bbsWriteInfMdl.setBwiEgid(contributor);

        BbsWriteInfDao bbsWriteInfDao = new BbsWriteInfDao(con__);
        bbsWriteInfDao.updateWriteInf(bbsWriteInfMdl);

        //添付ファイルをバイナリー情報に登録
        List < String > binSid = cmnBiz.insertBinInfo(con__, tempDir, appRootPath,
                                                    cntCon, userSid, now);

        //投稿添付情報の登録
        BbsBinModel bbsBinMdl = new BbsBinModel();
        bbsBinMdl.setBwiSid(bwiSid);
        bbsBinMdl.setBinSid(new Long(0));
        BbsBinDao bbsBinDao = new BbsBinDao(con__);
        bbsBinDao.deleteWriteBin(bwiSid);
        bbsBinDao.insertBbsBinData(bwiSid, binSid);

        //スレッド閲覧情報の更新
        BbsThreViewModel threViewMdl = new BbsThreViewModel();
        threViewMdl.setBtiSid(btiSid);
        threViewMdl.setBivViewKbn(GSConstBulletin.BBS_THRE_VIEW_NO);
        threViewMdl.setBivEuid(userSid);
        threViewMdl.setBivEdate(now);
        BbsThreViewDao threViewDao = new BbsThreViewDao(con__);
        threViewDao.updateAllUserViewKbn(threViewMdl);

        //掲示予定フラグ
        BbsBiz bbsBiz = new BbsBiz();
        boolean rsvThredFlg = false;
        if (bbsThreInfMdl.getBtiLimit() == GSConstBulletin.THREAD_LIMIT_YES
                && bbsBiz.checkReserveDate(limitFrDate, now)) {
            rsvThredFlg = true;
        }

        //スレッドおよびフォーラム集計情報の更新
        //掲示予定の場合、最終書き込み日時を更新しない
        if (rsvThredFlg) {
            bbsBiz.updateBbsThreSum(con__, btiSid, userSid, now, false, limitFrDate);
            bbsBiz.updateBbsForSum(con__, bfiSid, userSid, now, false);
        } else {
            bbsBiz.updateBbsThreSum(con__, btiSid, userSid, now, true, now);
            bbsBiz.updateBbsForSum(con__, bfiSid, userSid, now, true);
        }

        //戻り先画面フラグ
        int backFlg = 0;
        if (rsvThredFlg) {
            //編集後が公開予定日が未来だった場合
            if (bbsBiz.isCheckExistThread(con__, btiSid)) {
                //スレッドが存在すればスレッド一覧に戻す。
                backFlg = 1;
            } else {
                //スレッドが存在しなければフォーラム一覧へ戻す。
                backFlg = 2;
            }
        }

        log__.debug("End");
        return backFlg;
    }

    /**
     * <br>[機  能] ショートメールで通知を行う。
     * <br>[解  説]
     * <br>[備  考]
     * @param paramMdl パラメータ情報
     * @param cntCon MlCountMtController
     * @param btiSid スレッドSID
     * @param userSid セッションユーザSID
     * @param appRootPath アプリケーションのルートパス
     * @param tempDir テンポラリディレクトリ
     * @param pluginConfig PluginConfig
     * @param reqMdl リクエスト情報
     * @throws Exception 実行例外
     */
    public void sendSmail(
                Bbs070knParamModel paramMdl,
                MlCountMtController cntCon,
                int btiSid,
                int userSid,
                String appRootPath,
                String tempDir,
                PluginConfig pluginConfig,
                RequestModel reqMdl) throws Exception {

        BbsBiz biz = new BbsBiz();
        BulletinSmlModel bsmlModel = new BulletinSmlModel();
        //フォーラムSID
        bsmlModel.setBfiSid(paramMdl.getBbs010forumSid());
        //投稿者
        bsmlModel.setUserSid(userSid);
        //投稿者グループSID
        bsmlModel.setGrpSid(paramMdl.getBbs070contributor());
        //スレッドタイトル
        bsmlModel.setBtiTitle(paramMdl.getBbs070title());
        //投稿日時
        bsmlModel.setBwiAdate(new UDate());
        //添付ファイル名
        CommonBiz cmnBiz = new CommonBiz();
        List<LabelValueBean> files = cmnBiz.getTempFileLabelList(tempDir);
        bsmlModel.setFileLabelList(files);
        //投稿内容
        String bwiValue = null;
        if (paramMdl.getBbs070valueType() == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            //プレーンテキストの場合
            bwiValue = paramMdl.getBbs070value();
        } else  {
            //HTMLテキストの場合
            bwiValue = StringUtilHtml.delHTMLTag(
                    StringUtilHtml.transToText(paramMdl.getBbs070valueHtml()));
        }
        bsmlModel.setBwiValue(bwiValue);
        //スレッドURL
        bsmlModel.setThreadUrl(biz.createThreadUrl(reqMdl, paramMdl.getBbs010forumSid(), btiSid));

        //送信
        biz.sendSmail(con__, cntCon, bsmlModel, appRootPath, pluginConfig, reqMdl);
    }

}
