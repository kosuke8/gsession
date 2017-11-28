function buttonPush(cmd){
  document.forms[0].CMD.value=cmd;
  document.forms[0].submit();
  return false;
}

function buttonPushWrite(cmd, sid) {
    document.forms[0].CMD.value=cmd;
    document.forms[0].bbs060postSid.value=sid;
    document.forms[0].submit();
    return false;
}

function clickRsvThread(sid) {
    document.forms[0].CMD.value='moveRsvThreadList';
    document.forms[0].bbs010forumSid.value=sid;
    document.forms[0].threadSid.value=sid;
    document.forms[0].submit();
    return false;
}

function buttonPushSearch() {
  $('input:hidden[name=bbs040dateNoKbn]').val("1");
  $('input:hidden[name=bbs040keyKbn]').val("0");
  $('input:hidden[name=bbs040readKbn]').val("0");
  $('input:hidden[name=bbs040taisyouThread]').val("1");
  $('input:hidden[name=bbs040taisyouNaiyou]').val("1");
  var bbs010forumSid = $('input:hidden[name=bbs010forumSid]').val();
  $('input:hidden[name=bbs040forumSid]').val(bbs010forumSid);
  $('input:hidden[name=searchDspID]').val("0601");
  buttonPush('searchThre');
}

function buttonPushSearchDtl() {
  $('input:hidden[name=bbs040dateNoKbn]').val("1");
  $('input:hidden[name=bbs040keyKbn]').val("0");
  $('input:hidden[name=bbs040readKbn]').val("0");
  $('input:hidden[name=bbs040taisyouThread]').val("1");
  $('input:hidden[name=bbs040taisyouNaiyou]').val("1");
  var bbs010forumSid = $('input:hidden[name=bbs010forumSid]').val();
  $('input:hidden[name=bbs040forumSid]').val(bbs010forumSid);
  $('input:hidden[name=searchDspID]').val("0602");
  buttonPush('searchThreDtl');
}

function changePage(id){
  var bbs060page = $('select[name=bbs060page1]').val();
  if (id == 1) {
    bbs060page = $('select[name=bbs060page2]').val();
  }
  $('input:hidden[name=bbs060page1]').val(bbs060page);

  getList($('input:hidden[name=bbs010forumSid]').val(), 0);
}

function changePageSingly(direction) {
  var intBbs060page = parseInt($('select[name=bbs060page1]').val());
  if (direction == 'prev') {
    if (intBbs060page - 1 < 1) {
      return;
    }
    $('input:hidden[name=bbs060page1]').val(intBbs060page - 1);

  } else {
    var pageSize = $('select[name=bbs060page1]').children().size();
    if (intBbs060page + 1 > pageSize)  {
      return;
    }
    $('input:hidden[name=bbs060page1]').val(intBbs060page + 1);
  }

  getList($('input:hidden[name=bbs010forumSid]').val(), 0);
}

function changePostPage(id){
  var bbs060postPage = $('select[name=bbs060postPage1]').val();
  if (id == 1) {
    bbs060postPage = $('select[name=bbs060postPage2]').val();
  }
  $('input:hidden[name=bbs060postPage1]').val(bbs060postPage);

  getList($('input:hidden[name=bbs010forumSid]').val(), $('input:hidden[name=threadSid]').val());
}

function changePostPageSingly(direction) {
  var intBbs060postPage = parseInt($('select[name=bbs060postPage1]').val());
  if (direction == 'prev') {
    if (intBbs060postPage - 1 < 1) {
      return;
    }
    $('input:hidden[name=bbs060postPage1]').val(intBbs060postPage - 1);
  } else {
    var pageSize = $('select[name=bbs060postPage1]').children().size();
    if (intBbs060postPage + 1 > pageSize) {
      return;
    }
    $('input:hidden[name=bbs060postPage1]').val(intBbs060postPage + 1);
  }

  getList($('input:hidden[name=bbs010forumSid]').val(), $('input:hidden[name=threadSid]').val());
}

function sortPostList(order) {
  $('input:hidden[name=bbs060postOrderKey]').val(order);
  // $('input:hidden[name=bbs060sortKey]').val(fid);
  // $('input:hidden[name=bbs060orderKey]').val(order);
  getList($('input:hidden[name=bbs010forumSid]').val(), $('input:hidden[name=threadSid]').val());
}

function sortThreadList(fid, order) {
  $('input:hidden[name=bbs060sortKey]').val(fid);
  $('input:hidden[name=bbs060orderKey]').val(order);

  getList($('input:hidden[name=bbs010forumSid]').val(), 0);
}

function getList(forumSid,threadSid) {

  if (threadSid > 0) {
    //Post list
    if (threadSid != $('input:hidden[name=threadSid]').val()) {
      //different post list
      $('input:hidden[name=bbs060postOrderKey]').val(-1);
      $('input:hidden[name=bbs060postPage1]').val(1);
    }
    $('#thread_list_block').empty();
    $('#thread_list_block').hide();

    if ($('#post_list_block').children('table').size() > 0) {
      $('#post_list_block').empty();
    }

    getPostListBlock(forumSid,threadSid);

    //scroll to page top
    $(window).scrollTop(0);

  } else {
    //Thread list
    if (forumSid != $('input:hidden[name=bbs010forumSid]').val()) {
      //different thread list
      $('input:hidden[name=bbs060page1]').val(1);
    }

    $('#post_list_block').empty();

    if ($('#thread_list_block').children('table').size() > 0) {
      $('#thread_list_block').empty();
    }

    var cmd = "getThreadData";
    getThreadListBlock(cmd, forumSid);

    //scroll to page top
    $(window).scrollTop(0);

    $('#thread_list_block').show();
  }

}


function changeListMenu(data, screenType) {

  //ディスク容量警告表示 リセット
  $('#diskWarnMessage').remove();

  //一覧メニューの切り替え
  if (screenType == 'thread') {
    //検索画面遷移元IDを初期化
    $('input:hidden[name=searchDspID]').val('');

      //スレッド一覧のメニュー
    $('#bbs060screenName').text(msglist["bbs.header.thread.list"]);

    //IE9で動作しない為コメントアウト
    //$('title').text(msglist["bbs.title.thread.list"]);

    //ヘルプ用パラメータを設定
    $('input:hidden[name=helpPrm]').val('0');

    $('#list_menu_post').hide();
    $('#list_menu_post').empty();

      //新規スレッドボタン
    if (data.bbs060createDspFlg) {
      $('#damy_add_thread_button').hide();
      $('#add_thread_button').show();
    } else {
      $('#add_thread_button').hide();
      $('#damy_add_thread_button').show();
    }
    $('#list_menu_thread').show();

    //ディスク容量警告表示
    if (data.bbs060forumWarnDisk > 0) {
      createDiskWarn(data);
    }

  } else if(screenType == 'post') {
    //投稿一覧のメニュー
    $('#bbs060screenName').text(msglist["bbs.header.post.list"]);

    //IE9で動作しない為コメントアウト
    //$('title').text(msglist["bbs.title.post.list"]);

    //ヘルプ用パラメータを設定
    $('input:hidden[name=helpPrm]').val('1');

    $('#list_menu_thread').hide();

    $('#list_menu_post').empty();
    createPostListMenu(data);
    $('#list_menu_post').show();
  }
}

function createDiskWarn(data) {
  var html = '<tr id="diskWarnMessage">'
  + '<td colspan="3" width="99%">'
  + '<div style="text-align:center; border: solid 2px; border-color: #CC3333!important; width: 98%; padding: 10px 0px; margin: 10px 0px 5px 5px;">'
  + '<img src="../common/images/warn2.gif" border="0" alt="' + msglist["warning"] + '" style=" vertical-align:middle;"><span class="text_error">'
  + msglist["disk.usage.exceeded.1"] + data.bbs060forumWarnDisk + msglist["disk.usage.exceeded.2"] + '</span>'
  + '</div>'
  + '</td>'
  + '</tr>';

  $('#main_content_block').prepend(html);
}

function createPostListMenu(data) {
  var html = '';
  html += '<input type="button" value="'+ msglist["btn.pdf.export"] + '" class="btn_pdf_n1" onClick="buttonPush(\'pdf\');">&nbsp;';

    if (data.bbs060showThreBtn == 1) {
      html += '<input type="button" class="btn_dell_n1" value="' + msglist["delete.thread"] + '" onClick="buttonPush(\'delThread\');">&nbsp;';
    }
    if (data.bbs060reply == 0) {
      html += '<input type="button" class="btn_henshin_n1" value="' + msglist["reply"] + '" onClick="buttonPush(\'addPost\');">&nbsp;';
    } else if (data.bbs060reply == 1) {
      html += '<img src="../common/images/damy.gif" width="100" height="5">';
    }
    html += '<input type="button" value="' + msglist["back"] + '" class="btn_back_n1" onClick="backFromPostList(' + data.bbs010forumSid + ');">&nbsp;'
    + '</td>'

    $('#list_menu_post').append(html);
}

function getFormData(formObj) {

  var formData = "";
  formData = formObj.serialize();

  return formData;
}

//スレッド一覧部分取得
function getThreadListBlock(cmd, forumSid) {
  loadingPop(msglist["nowLoading"]);

  //フォームの情報でDBから値を取得
  $('input:hidden[name=CMD]').val(cmd);
  $('input:hidden[name=bbs010forumSid]').val(forumSid);

  var formData = getFormData($('#bbs060Form'));

  $.ajax({
    async: true,
    url:"../bulletin/bbs060.do",
    type: "post",
    data:formData
  }).done(function( data ) {

    changeListMenu(data, 'thread');

    getForumList(data);
    getNotReadThreadList(data.notReadThreadList);
    getMarkAllReadBlock(data);

    var threadList = $(data.threadList);

    var list = '';

    list += '<table width="100%">'
    + '<tr>';

    //フォーラムアイコン
    var binSid = data.bbs060BinSid;
    var forumSid = data.bbs010forumSid;
    list += '<td align="left" width="100%">'
    + '<table width="100%">'
    + '<tr>'
    + '<td width="0%" nowrap>'
    + '<table cellpadding="0" cellspacing="0">'
    + '<tr>';
    if (binSid > 0) {
      list += '<td><img width="30" height="30" src="../bulletin/bbs060.do?CMD=getImageFile&bbs010BinSid=' + binSid + '&bbs010forumSid=' + forumSid + '" alt="' + msglist["forum"] + '"></td>';
    } else {
      list += '<td><img width="30" height="30" src="../bulletin/images/cate_icon01.gif" alt=' + msglist["forum"] + '"></td>';
    }
    list += '</tr>'
    + '</table>'
    + '</td>';

    //フォーラム名
    var forumName = data.bbs060forumName;
    list += '<td align="left" width="100%" nowrap><span class="text_bbs2">'
    + forumName
    + '</span></td>'
    + '</tr>'
    + '</table>'
    + '</td>';

  //掲示予定数
    if (data.bbs060scheduledPostNum > 0 && data.bbs060createDspFlg) {
      list += '<td align="right" valign="middle" nowrap="">'
      + '<a href="javascript:clickRsvThread(' + forumSid + ');">'
      + '<span class="scheduled_post_link">' + msglist["bbs.scheduled.post.number.1"] + data.bbs060scheduledPostNum + msglist["bbs.scheduled.post.number.2"] + '</span>'
      + '</a>'
      + '</td>';
    }

    //ページコンボ 上
    var bbsPageLabel1 = $(data.bbsPageLabel);
    if (threadList.size() > 0 && bbsPageLabel1.size() > 1) {
      list += '<td align="right" valign="middle" nowrap>';
      list += '<img src="../common/images/arrow2_l.gif" alt="' + msglist["prevPage"] + '" class="img_bottom" height="20" width="20" onClick="changePageSingly(\'prev\');">'
      + '<select name="bbs060page1" onchange="changePage(0);" class="paging_box text_i">';

      for (var i = 0;i < bbsPageLabel1.size();++i) {
        list += '<option value="' + bbsPageLabel1[i].value + '" ';
        if (data.bbs060page1 == bbsPageLabel1[i].value) {
          list += 'selected';
        }
        list += '>' + bbsPageLabel1[i].label + '</option>';
      }
      list += '</select>'
      + '<img src="../common/images/arrow2_r.gif" alt="' + msglist["nextPage"] + '" class="img_bottom" height="20" width="20" onClick="changePageSingly(\'next\');"></td></td>';
    }

    list += '</tr>'
    + '</table>';

    list += '<table class="tl0" width="100%" cellpadding="0" cellspacing="0">';

    //スレッド一覧 ヘッダー
    list = createThreadListHeader(data, list);

    //スレッド一覧 内容
    if (threadList.size() > 0) {
      list = createThreadListContent(data, list);
    }

    list += '</table>';

    list += '<td align="right" valign="bottom" width="20%" nowrap>';

    //ページコンボ 下
    var bbsPageLabel2 = $(data.bbsPageLabel);
    if (threadList.size() > 0 && bbsPageLabel2.size() > 1) {
      list += '<table width="100%" cellpadding="5" cellspacing="0">'
      + '<tr>'
      + '<td align="right" valign="middle" nowrap>'
      + '<img src="../common/images/arrow2_l.gif" alt="' + msglist["prevPage"] + '" class="img_bottom" height="20" width="20" onClick="changePageSingly(\'prev\');">'
      + '<select name="bbs060page2" onchange="changePage(1);" class="paging_box text_i" value="' + data.bbs060page1 + '">';

      for (var i = 0;i < bbsPageLabel2.size();++i) {
        list += '<option value="' + bbsPageLabel2[i].value + '" ';
        if (data.bbs060page2 == bbsPageLabel2[i].value) {
          list += 'selected';
        }
        list += '>' + bbsPageLabel2[i].label + '</option>';
      }

      list += '</select>'
      + '<img src="../common/images/arrow2_r.gif" alt="' + msglist["nextPage"] + '" class="img_bottom" height="20" width="20" onClick="changePageSingly(\'next\');">'
      + '</td>'
      + '</tr>'
      + '</table>';
    }
    list += '</td>';

    list += '</tr>'
    + '</table>';

    $('#thread_list_block').append(list);

    closeloadingPop();

  }).fail(function(data){
    closeloadingPop();
    alert(msglist["failedGetThreadData"]);
  });
}

//投稿一覧部分取得
function getPostListBlock(forumSid,threadSid) {
  loadingPop(msglist["nowLoading"]);

  //フォームの情報でDBから値を取得
  $('input:hidden[name=CMD]').val("getPostData");
  $('input:hidden[name=bbs010forumSid]').val(forumSid);
  $('input:hidden[name=threadSid]').val(threadSid);

  var formData = getFormData($('#bbs060Form'));

  $.ajax({
    async: true,
    url:"../bulletin/bbs060.do",
    type: "post",
    data:formData
  }).done(function( data ) {

    changeListMenu(data, 'post');

    getForumList(data);
    getNotReadThreadList(data.notReadThreadList);
    getMarkAllReadBlock(data);

    var threadList = $(data.threadList);

    var list = '';

    list += '<table width="100%" cellpadding="3" cellspacing="0" class="tl0">'
    + '<tr>'
    + '<td width="0%" nowrap class="bbs_toukou_head_td">'
    + '<table cellpadding="0" cellspacing="0">'
    + '<tr>';
    if (data.bbs060BinSid == 0) {
      list += '<td><img width="30" height="30" src="../bulletin/images/cate_icon01.gif" alt="' + msglist["forum"] + '"></td>';
    } else {
      list += '<td><img width="30" height="30" src="../bulletin/bbs060.do?CMD=getImageFile&bbs010BinSid='
      + data.bbs060BinSid
      + '&bbs010forumSid='
      + data.bbs010forumSid
      + '" alt="' + msglist["forum"] + '"></td>';
    }
    list += '<td nowrap></td>'
    + '</tr>'
    + '</table>'

    + '</td>'
    + '<td align="left" width="100%" class="bbs_toukou_head_td"><a href="javascript: toThreadList(' + data.bbs010forumSid + ')""><span class="text_bbs1">'
    + data.bbs060forumName
    + '</span></a></td>'
    + '</tr>'

    + '<tr id="selectionSearchArea">'
    + '<td width="0%" nowrap class="bbs_toukou_head_td">'

    + '<table cellpadding="0" cellspacing="0">'
    + '<tr>'
    + '<td><img src="../bulletin/images/cate_icon02.gif" alt="' + msglist["thread"] + '"></td>'
    + '<td nowrap></td>'
    + '</tr>'
    + '</table>'

    + '</td>'
    + '<td align="left" width="100%" class="bbs_toukou_head_td">';
    if (data.bbs060ThreImportance == '1') {
      list += '<img src="../smail/images/zyuu.gif" alt="' + msglist["bbs.importance"] + '" border="0" class="img_bottom">';
    }
    list += '<span class="text_bbs2">'
    + data.bbs060threadTitle
    + '</span></td>'
    + '</tr>'

    + '<tr>'
    + '<td width="0%" nowrap></td>'
    + '<td align="left" width="100%">'

    + '<table width="100%">'
    + '<tr>'
    + '<td>'
    + '<span class="text_base">' + msglist["bbs.order.of.posttime"] + '</span>&nbsp;'
    + '<input type="radio" name="bbs060postOrderKeyRadio" id="wrtOrder_01" value="0" onclick="sortPostList(0);" ';
    if (data.bbs060postOrderKey == 0) {
      list += 'checked="checked"';
    }
    list += '/>'
    + '<label for="wrtOrder_01"><span class="text_base">' + msglist["order.asc"] + '</span></label>&nbsp;'
    + '<input type="radio" name="bbs060postOrderKeyRadio" id="wrtOrder_02" value="1" onclick="sortPostList(1);" ';
    if (data.bbs060postOrderKey == 1) {
      list += 'checked="checked"';
    }
    list += '/>'
    + '<label for="wrtOrder_02"><span class="text_base">' + msglist["order.desc"] + '</span></label>'

    + '&nbsp;&nbsp;<span class="text_base">' + msglist["numView"] + '</span>&nbsp;'
    + '<span class="text_p"><a href="javascript:openComWindow('
    + data.bbs010forumSid + ', '
    + data.threadSid + ');">' +
    + data.readedCnt + '&nbsp;/&nbsp;'
    + data.forumMemberCount + '</a></span>'
    + '</td>';
    var bbsPageLabel = $(data.bbsPageLabel);
    if (bbsPageLabel.size() > 0) {
      list += '<td nowrap>'
      + '<table class="tl1" width="100%" align="center" border="0" cellpadding="5">'
      + '<tr><td align="right" colspan="2">'
      + '<table width="100%" cellpadding="5" cellspacing="0">'
      + '<tr><td align="right">'
      + '<img src="../common/images/arrow2_l.gif" alt="' + msglist["prevPage"] + '" class="img_bottom" height="20" width="20" onClick="changePostPageSingly(\'prev\');">'
      + '<select name="bbs060postPage1" onchange="changePostPage(0);" class="paging_box text_i">';
      for (var i = 0;i < bbsPageLabel.size();++i) {
        list += '<option value="' + bbsPageLabel[i].value + '" ';
        if (data.bbs060postPage1 == bbsPageLabel[i].value) {
          list += 'selected';
        }
        list += '>' + bbsPageLabel[i].label + '</option>';
      }
      list += '</select>'
      + '<img src="../common/images/arrow2_r.gif" alt="' + msglist["nextPage"] + '" class="img_bottom" height="20" width="20" onClick="changePostPageSingly(\'next\');">'
      + '</td></tr>'
      + '</table>'
      + '</td>'
      + '</tr>'
      + '</table>'
      + '</td>'
    }
    list += '</tr>'
    + '</table>'
    + '</td>'
    + '</tr>'
    + '</table>';

    //掲示期間
    if ($(data.bbs060limitDate).size() > 0) {
      list += '<span class="text_base4">' + msglist["bbs.posting.period"] + ':&nbsp;' + data.bbs060limitDate + '</span>';
    }

    list += '<table width="100%" id="post_list">'
    + '<tr>'
    + '<td width="100%" valign="top" id="selectionSearchArea2">'
    + '<table class="tl1" width="100%" align="center" border="0" cellpadding="">';

    var postList = $(data.postList);
    if (postList.size() > 0) {
      //投稿一覧
      list = createPostList(data, list);
    }

    //ページコンボ 下
    list += '<tr>'
    + '<td colspan="2" align="right">';
    if (bbsPageLabel.size() > 0) {
      list += '<table width="100%" cellpadding="5" cellspacing="0">'
      + '<tr>'
      + '<td align="right">'
      + '<img src="../common/images/arrow2_l.gif" alt="' + msglist["prevPage"] + '" class="img_bottom" height="20" width="20" onClick="changePostPageSingly(\'prev\');">'
      + '<select name="bbs060postPage2" onchange="changePostPage(1);" class="paging_box text_i">';
      for (var i = 0;i < bbsPageLabel.size();++i) {
        list += '<option value="' + bbsPageLabel[i].value + '" ';
        if (data.bbs060postPage2 == bbsPageLabel[i].value) {
          list += 'selected';
        }
        list += '>' + bbsPageLabel[i].label + '</option>';
      }
      list += '</select>'
      + '<img src="../common/images/arrow2_r.gif" alt="' + msglist["next"] + '" class="img_bottom" height="20" width="20" onClick="changePostPageSingly(\'nextPage\');">'
      + '</td>'
      + '</tr>'
      + '</table>';
    } else {
      list += '&nbsp';
    }

    list += '</td>'
    + '</tr>'
    + '</table>'
    + '</td>'
    + '</td>'
    + '</tr>'
    + '</table>';

    $('#post_list_block').append(list);

    closeloadingPop();

  }).fail(function(data){
    closeloadingPop();
    alert(msglist["failedGetPostData"]);
  });
}

// スレッド一覧 ヘッダー 昇順降順記号を付ける
function createThreadListHeader(data, list) {

  var sort_key = data.bbs060sortKey;
  var sort_key_thred_id = 1;
  var sort_key_toukou_id = 2;
  var sort_key_etsuran_id =3;
  var sort_key_user_id = 4;
  var sort_key_saishin_id = 5;
  var sort_key_size_id = 6;
  var sort_key_thred_name = msglist["thread"];
  var sort_key_toukou_name = msglist["numPost"];
  var sort_key_etsuran_name = msglist["numView"];
  var sort_key_user_name = msglist["bbs.poster"];
  var sort_key_saishin_name = msglist["bbs.newest.post"];
  var sort_key_size_name = msglist["txtSize"];

  var order_key = data.bbs060orderKey;
  //昇順
  var sort_direction_name = msglist["asc.mark"];
  if ((order_key == 1 && sort_key != sort_key_saishin_id)
  || (order_key == 0 && sort_key == sort_key_saishin_id)) {
    //降順
    sort_direction_name = msglist["desc.mark"];
  }

  if (sort_key == sort_key_thred_id) {
    sort_key_thred_name += sort_direction_name;
  } else if (sort_key == sort_key_toukou_id) {
    sort_key_toukou_name += sort_direction_name;
  } else if (sort_key == sort_key_etsuran_id) {
    sort_key_etsuran_name += sort_direction_name;
  } else if (sort_key == sort_key_user_id) {
    sort_key_user_name += sort_direction_name;
  } else if (sort_key == sort_key_saishin_id) {
    sort_key_saishin_name += sort_direction_name;
  } else if (sort_key == sort_key_size_id) {
    sort_key_size_name += sort_direction_name;
  }

  list += '<tr id="thread_list_header">';

  //スレッド名 SORT_KEY_THRED
  list += '<th width="50%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_thred_id && order_key == 0) {
    list += sort_key_thred_id + ',1);">';
  } else {
    list += sort_key_thred_id + ',0);">';
  }
  list +=  '<span class="text_base3">' + sort_key_thred_name + '</span>'
  + '</a>'
  + '</th>';

  //投稿数
  list += '<th width="7%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_toukou_id && order_key == 0) {
    list += sort_key_toukou_id + ',1);">';
  } else {
    list += sort_key_toukou_id + ',0);">';
  }
  list += '<span class="text_base3">' + sort_key_toukou_name + '</span>'
  + '</a>'
  + '</th>';

  //閲覧数
  list += '<th width="7%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_etsuran_id && order_key == 0) {
    list += sort_key_etsuran_id + ',1);">';
  } else {
    list += sort_key_etsuran_id + ',0);">';
  }
  list += '<span class="text_base3">' + sort_key_etsuran_name + '</span>'
  + '</a>'
  + '</th>';

  //投稿者
  list +=  '<th width="13%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_user_id && order_key == 0) {
    list += sort_key_user_id + ',1);">';
  } else {
    list += sort_key_user_id + ',0);">';
  }
  list += '<span class="text_base3">' + sort_key_user_name + '</span>'
  + '</a>'
  + '</th>';

  //最新書き込み
  list += '<th width="18%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_saishin_id && order_key == 0) {
    list += sort_key_saishin_id + ',1);">';
  } else {
    list += sort_key_saishin_id + ',0);">';
  }
  list += '<span class="text_base3">' + sort_key_saishin_name + '</span>'
  + '</a>'
  + '</th>';

  //サイズ
  list += '<th width="5%" class="header_7D91BD_center" nowrap>'
  + '<a href="javascript:void(0);" onClick="return sortThreadList(';
  if (sort_key == sort_key_size_id && order_key == 0) {
    list += sort_key_size_id + ',1);">';
  } else {
    list += sort_key_size_id + ',0);">';
  }
  list += '<span class="text_base3">' + sort_key_size_name + '</span>'
  + '</a>'
  + '</th>';

  list += '</tr>';

  return list;
}

//スレッド一覧 内容
function createThreadListContent(data, list) {
  var threadList = $(data.threadList);
  var tdColors = ['td_type1', 'td_type25_2'];

  for (var i = 0; i < threadList.size(); ++i) {
    var threadMdl = threadList[i];

    var tdColor = tdColors[i % 2];

    var titleClass = 'text_title_midoku';
    var valueClass = 'sc_ttl_sat';
    var mukoClass = 'mukouser';
    if (threadMdl.readFlg == 1) {
      titleClass = 'text_title_kidoku';
      valueClass = 'text_p';
    }

    list += '<tr id="thread_list_content">'
    + '<td width="50%" class="' + tdColor + '" valign="middle">'
    + '<table cellpadding="0" cellpadding="0">'
    + '<tr>'
    + '<td><img src="../bulletin/images/cate_icon02.gif" alt="' + msglist["thread"] + '"></td>'
    + '<td class="menu_bun">&nbsp; <a href="javascript:getList(' + data.bbs010forumSid + ',' + threadMdl.btiSid + ');">';
    if (threadMdl.bfiThreImportance == '1') {
      list += '<img src="../smail/images/zyuu.gif" alt="' + msglist["bbs.importance"] + '" border="0" class="img_bottom">';
    }
    if (threadMdl.btsTempflg == 1) {
        list += '<img src="../bulletin/images/icon_file.gif" alt="' + msglist["attachFile"] + '" class="attach_file_icon">';
    }

    list += '<span class="'+ titleClass +'">' + threadMdl.btiTitle + '</span></a>';

    if (threadMdl.newFlg == 1) {
      list += '&nbsp;<img src="../bulletin/images/icon_new.gif" height="15" alt="' + msglist["bbs.new.icon"] + '" border="1">';
    }

    list += '</td>'
    + '</tr>'
    + '</table>'
    + '</td>';

    list += '<td class="' + tdColor + '" align="right"><span class="' + valueClass + '">' + threadMdl.writeCnt + '</span></td>'
    + '<td class="' + tdColor + '" align="right">'
    + '<span class="' + valueClass + '">'
    + '<a href="javascript:openComWindow(' + data.bbs010forumSid + ', ' + threadMdl.btiSid + ');">'
    + '<span class="' + valueClass + '">' + threadMdl.readedCnt + '&nbsp;/&nbsp;' + data.forumMemberCount
    + '</a></span>'
    + '</td>';

    list += '<td class="' + tdColor + '" align="left">';

    var cbGrpSid = threadMdl.grpSid;
    if (cbGrpSid > 0) {
      if (threadMdl.grpJkbn == 9) {
        list += '<s><span class="' + valueClass + '">' + threadMdl.grpName + '</span></s>';
      } else {
        list += '<span class="' + valueClass + '">' + threadMdl.grpName + '</span>';
      }

    } else {
      if (threadMdl.userJkbn == 9) {
        list += '<s><span class="' + valueClass + '">' + threadMdl.userName + '</span></s>';
      } else {
          if(threadMdl.userYukoKbn == 1) {
              list += '<span class="' + valueClass + ' ' + mukoClass + '">' + threadMdl.userName + '</span>';
          } else {
            list += '<span class="' + valueClass + '">' + threadMdl.userName + '</span>';
          }
      }
    }

    list += '</td>'
    + '<td class="' + tdColor + '" align="center"><span class="' + valueClass + '">' + threadMdl.strWriteDate + '</span></td>'
    + '<td class="' + tdColor + '" align="right"><span class="' + valueClass + '">' + threadMdl.viewBtsSize + '</span></td>'
    + '</tr>';
  }

  return list;
}

//投稿一覧
function createPostList(data, list) {
  var postList = $(data.postList);
  var tdColors = ['td_type1', 'td_type25_3'];
  for (var i = 0;i < postList.size();++i) {
    var postMdl = postList[i];

    var tdColor = tdColors[i % 2];

    list += '<tr>'
    + '<td class="header_7D91BD_left" width="0%" nowrap><span class="text_base3">' + msglist["bbs.poster"] + '</span></td>'
    + '<td align="left" class="header_7D91BD_left" width="100%"><span class="text_left text_base3">' + msglist["bbs.post.body"] + '</span><span class="text_right text_base3">'
    + msglist["bbs.posttime"]
    + '&nbsp;:&nbsp;'
    + postMdl.strBwiAdate
    + '</span></td>'
    + '</tr>'
    + '<tr valign="top">'
    + '<td class="'
    + tdColor
    + '" width="0%" nowrap>';

    //投稿者画像を設定する
    var photoFileDsp = data.photoFileDsp;
    var registGrpSid = postMdl.grpSid;

    if (photoFileDsp == 0 && registGrpSid <= 0) {
      //「投稿者画像を表示する」 かつ 投稿者がグループではない
      list += '<table cellpadding="0" cellspacing="0" class="tl1 bbs_syashin" border="0">'
      + '<tr>';

      if (postMdl.userJkbn == 9) {
        list += '<td class="' + tdColor + '" valign="top" align="center"><del>'
        + postMdl.userName
        + '</del>&nbsp;</td>';

      } else {
        list += '<td class="' + tdColor + '" valign="top" align="center">'
        + '<a href="javaScript:void(0);" onClick="openUserInfoWindow(' + postMdl.userSid + ');">';
        if (postMdl.userYukoKbn == 1) {
            list += '<span class="mukouser">' + postMdl.userName +'</span>';
        } else {
            list += postMdl.userName;
        }
        list += '</a>&nbsp;</td>';
      }

      list += '</tr>'
      + '<tr>';

      if (postMdl.userPictKf == 1) {
        //個人情報公開 しない
        list += '<td class="td_type_bbs" width="130" align="center" valign="bottom" nowrap><span class="text_bbs_gray2">'
        + msglist["bbs.private"]
        + '</span></td>';
      } else {
        if (postMdl.photoFileName) {
          list += '<td>'
          + '<a href="javaScript:void(0);" onClick="openUserInfoWindow(' + postMdl.userSid + ');">'
          + '<img src="../common/cmn100.do?CMD=getImageFile&cmn100binSid=' + postMdl.photoFileSid
          + '" name="userPhoto" alt="' + msglist["photo"]
          + '" border="0" width="130" onload="initImageView130(\'userPhoto\');"></a></td>';
        } else {
          list += '<td width="130">'
          + '<a href="javaScript:void(0);" onClick="openUserInfoWindow(' + postMdl.userSid + ');">'
          + '<img src="../user/images/photo.gif" width="130" height="150" alt="' + msglist["photo"]
          + '" border="0"></a></td>';
        }
      }
      list += '</tr>'
      + '</table>';

    } else {
      if (postMdl.userJkbn == 9) {
        list += '<del>' + postMdl.userName + '</del>&nbsp;';
      } else if (registGrpSid > 0) {
        list += '<span class="text_bb1">' + postMdl.grpName + '</span>'
      } else {
          list += '<a href="javaScript:void(0);" onClick="openUserInfoWindow(' + postMdl.userSid + ');">';
          if (postMdl.userYukoKbn == 1) {
             list += '<span class="mukouser"> ' + postMdl.userName + '</a></span>&nbsp';
          } else {
             list += postMdl.userName + '</a>&nbsp';
          }
      }
    }


    list += '</td>'
    + '<td align="left" valign="top" class="' + tdColor + '" width="100%">';

    if (postMdl.newFlg == 1) {
      list += '<img src="../bulletin/images/icon_new.gif" class="img_bottom" alt="new">&nbsp;';
      if (postMdl.writeUpdateFlg != 1) {
        list += '<br>';
      }
    }
    if (postMdl.writeUpdateFlg == 1) {
      var edate = postMdl.strBwiEdate;
      list += '<span class="text_base4">' + edate + msglist["edit.to"] + '</span>'
      + '<br><br>';
    }
    if (postMdl.bwiType == 0) {
      list += postMdl.bwiValueView + '</td></tr>'
    } else {
      list += postMdl.bwiValue + '</td></tr>'
    }
    list += '<tr>'
    + '<td class="' + tdColor + '" width="0%" nowrap><span class="text_bb1">' + msglist["attach"] + '</span></td>'
    + '<td align="left" class="' + tdColor + '" width="100%">';

    if ($(postMdl.tmpFileList).size() > 0) {
      list = createAttachedImage(data, postMdl, list);
    } else {
      list += '&nbsp;';
    }
    list+= '</td>'
    + '</tr>';

    if (data.bbs060btnDspFlg == true) {
      list+= '<tr>'
      + '<td colspan="2" align="right" class="' + tdColor + '" width="100%">'
      + '<table width="0%">'
      + '<tr>'
      + '<td width="100%">&nbsp;</td>';

      //複写して新規作成
      if (postMdl.thdWriteFlg == 1) {
        list += '<td><input type="button" value="' + msglist["cmn.register.copy.new"] + '" class="btn_copy_thread" onclick="buttonPushWrite(\'copyThread\',' + postMdl.bwiSid + ');"></td>';
      }

      if (postMdl.showBtnFlg == 1) {
        if (postMdl.thdWriteFlg == 1) {
          if (data.bbs060showThreBtn == 1) {
            list += '<td><input type="button" class="btn_edit_n1" value="' + msglist["mailEdit"] + '" onclick="buttonPushWrite(\'editThread\',' + postMdl.bwiSid + ');"></td>';
          }
        } else {
          list += '<td><input type="button" class="btn_dell_n1" value="' + msglist["delet"]
          + '" onclick="buttonPushWrite(\'delPost\',' + postMdl.bwiSid + ');"></td>'
          + '<td>';
          if (data.bbs060reply == 0) {
            list += '<input type="button" class="btn_edit_n1" value="' + msglist["mailEdit"] + '" onclick="buttonPushWrite(\'editPost\',' + postMdl.bwiSid + ');">';
          } else if (data.bbs060reply == 1) {
            list += '<img src="../common/images/damy.gif" width="100" height="5">';
          }
          list += '</td>';
        }
      }
      list += '<td>';
      if (data.bbs060reply == 0) {
        list += '<input type="button" class="btn_henshin_n1" value="' + msglist["quote.reply"] + '" onclick="buttonPushWrite(\'inyouWrite\', ' + postMdl.bwiSid + ');">';
      } else if (data.bbs060reply == 1) {
        list += '<img src="../common/images/damy.gif" width="100" height="5">';
      }
      list += '</td>'
      + '</tr>'
      + '</table>'
      + '</td>'
      + '</tr>';
    }

    list += '<tr>'
    + '<td colspan="2" width="100%" align="left"><img src="../common/images/damy.gif" width="1" height="5"></td>'
    + '</tr>';
  }

  list += '<table cellpadding="0" cellspacing="0" width="100%">'
  + '<tr>'
  + '<td align="left">';
  if (data.threadUrl) {
    list += '<table cellpadding="0" cellspacing="0" width="100%">'
    + '<tr align="left">'
    + '<td>'
    + '<span class="text_base"><font size="-1">' + msglist["thread"] + 'URL:</font></span><input type="text" value="'  + data.threadUrl
    + '" class="text_theadurl" readOnly="true" style="width:515px;"/>'
    + '</td>'
    + '</tr>'
    + '</table>';
  }
  list += '</td>'
  + '</tr>'
  + '<tr>'

  + '<td align="right" nowrap>'
  + '<input type="button" value="'+ msglist["btn.pdf.export"] + '" class="btn_pdf_n1" onClick="buttonPush(\'pdf\');">&nbsp;';

  if (data.bbs060showThreBtn == 1) {
    list += '<input type="button" class="btn_dell_n1" value="' + msglist["delete.thread"] + '" onClick="buttonPush(\'delThread\');">&nbsp;';
  }
  if (data.bbs060reply == 0) {
    list += '<input type="button" class="btn_henshin_n1" value="' + msglist["reply"] + '" onClick="buttonPush(\'addPost\');">&nbsp;';
  } else if (data.bbs060reply == 1) {
    list += '<img src="../common/images/damy.gif" width="100" height="5">';
  }
  list += '<input type="button" value="' + msglist["back"] + '" class="btn_back_n1" onClick="backFromPostList(' + data.bbs010forumSid + ');">&nbsp;'
  + '</td>'

  + '</tr>'
  + '</table>';

  return list;
}

//添付ファイル画像を用意
function createAttachedImage(data, postMdl, list) {

  list += '<table cellpadding="0" cellpadding="0" border="0">';

  var bwiSid = postMdl.bwiSid;

  var tmpFileList = $(postMdl.tmpFileList);
  for (var i = 0;i < tmpFileList.size();++i) {
    var fileMdl = tmpFileList[i];

    if (data.tempImageFileDsp == 0 && fileMdl.binFileExtension) {
      //拡張子判断
      var fext = fileMdl.binFileExtension.toLowerCase();
      if (fext.lastIndexOf('.gif') != -1 || fext.lastIndexOf('.jpeg') != -1
      || fext.lastIndexOf('.jpg') != -1 || fext.lastIndexOf('.png') != -1) {
        list += '<tr>'
        + '<td colspan="2">'
        + '<img src="../bulletin/bbs060.do?CMD=tempview&bbs010forumSid=' + data.bbs010forumSid + '&threadSid=' + data.threadSid + '&bbs060postBinSid=' + fileMdl.binSid + '&bbs060postSid=' + bwiSid + '" name="pictImage' + fileMdl.binSid + '" onload="initImageView(\'pictImage' + fileMdl.binSid + '\');">'
        + '</td>'
        + '</tr>';
      }
    } else {
      list += '&nbsp;';
    }

    list += '<tr>'
    + '<td><img src="../common/images/file_icon.gif" alt="' + msglist["file"] + '"></td>'
    + '<td class="menu_bun">'
    + '<a href="../bulletin/bbs060.do?CMD=fileDownload&bbs010forumSid=' + data.bbs010forumSid + '&threadSid=' + data.threadSid + '&bbs060postBinSid=' + fileMdl.binSid + '&bbs060postSid=' + bwiSid + '">'
    + '<span class="text_link">' + fileMdl.binFileName + fileMdl.binFileSizeDsp + '</span>'
    + '</a></td>'
    + '</tr>'
    + '<tr><td colspan="2">&nbsp;<br><br></td></tr>';
  }
  list += '</table>';

  return list;
}

function toThreadList(forumSid) {
  $('input:hidden[name=threadSid]').val("");
  getList(forumSid,0);
}

function backFromPostList(forumSid) {
  if ($('input:hidden[name=bbsmainFlg]').val() == '1'
  || ($('input:hidden[name=searchDspID]').val() != void 0
  && $('input:hidden[name=searchDspID]').val() != '')) {
    buttonPush('backThreadList');
  } else {
    toThreadList(forumSid);
  }
}

//フォーラム一覧を取得
function getForumList(data) {

  var forumList = data.forumList;
  //フォーラム一覧の有効/無効と件数チェック
  if (data.bbs060forumDspFlg == 1 || $(forumList).size() < 1) {
    $('#subForumList').hide();
    $('#subForumList').empty();
    return;
  }
  $('#subForumList').show();

  if($('#side_forum_list').children().size() > 0) {
    //list content exists 未読既読情報のみ更新
    updateForumLink(forumList);
  } else {
    //list content not exists
    var html = createForumList(forumList);
    $('#side_forum_list').append(html);

    //自身の子フォーラムを開く
    var target = $('#forum_list_side_' + data.bbs010forumSid);
    var child_forum_block = target.next('.child_forum_block_side');
    openForum(target.find('span.forum_button_side'), child_forum_block);
    //自身までの親フォーラムまで開く
    while (target.parent('.child_forum_block_side').size() > 0) {
      var parent_forum_block = target.parent('.child_forum_block_side');
      openForum(parent_forum_block.prev().find('span.forum_button_side'), parent_forum_block);
      target = parent_forum_block;
    }

    //tooltips設定
    $("a:has(span.tooltips)").mouseover(function(e){
      $("form").append("<div id=\"ttp\">"+ ($(this).children("span.tooltips").html()) +"</div>");
      $("#ttp")
      .css("position","absolute")
      .css("text-align","left")
      .css("font-size","12px")
      .css("top",(e.pageY) + 15 + "px")
      .css("left",(e.pageX) + 15 + "px")
      .css("display","none")
      .css("filter","alpha(opacity=85)")
      .fadeIn("fast")
    }).mousemove(function(e){
      $("#ttp")
      .css("top",(e.pageY) + 15 + "px")
      .css("left",(e.pageX) + 15 + "px")
    }).mouseout(function(){

      $("#ttp").remove();
    });
  }

  //選択中フォーラムを強調
  $('#side_forum_list_content').find('span.forum_list_title_side').removeClass('forum_li_text_strong');
  $('#forum_list_side_' + data.bbs010forumSid).find('span.forum_list_title_side').addClass('forum_li_text_strong');
}

//フォーラムリンクを更新
function updateForumLink(forumList) {
  var listSize = $(forumList).size();
  for (var i=0;i<listSize;++i) {
    var forumMdl = forumList[i];
    var forumNameSpan = $('#forum_list_side_' + forumMdl.bfiSid).find('span.forum_list_title_side');

    if (forumMdl.readFlg == 1
    && $(forumNameSpan).hasClass('bbs_li_unread')) {
      $(forumNameSpan).removeClass('bbs_li_unread');
      $(forumNameSpan).addClass('bbs_li_read');
    } else if (forumMdl.readFlg != 1
    && $(forumNameSpan).hasClass('bbs_li_read')) {
      $(forumNameSpan).removeClass('bbs_li_read');
      $(forumNameSpan).addClass('bbs_li_unread');
    }
  }
}

//フォーラム一覧を生成
function createForumList(forumList) {
  var html = '';
  html += '<div id="side_forum_list_all_opener">'
  + '<i class="forum_li_side_caret_open"></i><span class="link_look_text" onClick="openAllForum(\'show\')">' + msglist["open.all"] + '</span>&nbsp;&nbsp;<i class="forum_li_side_caret_close"></i><span class="link_look_text" onClick="openAllForum(\'hide\')">' + msglist["close.all"] + '</span>'
  + '</div>'
  + '<ul class="none_mark_list" id="side_forum_list_content">';
  var listSize = $(forumList).size();
  var titleClass = '';
  var valueClass = '';
  var saveParentSid = 0;
  var saveLevel = 1;
  var parentForumList = [];
  var initFlg = true;
  for (var i=0;i<listSize;++i) {

    var forumMdl = forumList[i];
    titleClass = 'bbs_li_unread';
    valueClass = 'sc_ttl_sat';
    if (forumMdl.readFlg == 1) {
      titleClass = 'bbs_li_read';
      valueClass = 'text_p';
    }
    var intLevel = parseInt(forumMdl.forumLevel);

    //最初期表示では飛ばす
    if (initFlg) {
      initFlg = false;
    } else {
      //リスト項目END、ブロックEND
      if (saveLevel > intLevel) {
        var levelReminder = saveLevel - intLevel;
        for (var j=0;j<levelReminder;++j) {
          html += '</li>'
          + '</ul>';
        }
      } else if (saveLevel == intLevel && saveParentSid != forumMdl.parentForumSid) {
        html += '</li>'
        + '</ul>';
      } else {
        html += '</li>';
      }
    }

    if (forumMdl.parentForumSid != 0
      && $.inArray(forumMdl.parentForumSid, parentForumList) < 0) {
        //ブロックSTART
        html += '<ul class="none_mark_list child_forum_block_side" id="' + forumMdl.parentForumSid + '_child">';
      }

    //リスト項目START
    html = createForumListItem(forumMdl, titleClass, valueClass, html);

    parentForumList.push(forumMdl.parentForumSid);
    saveParentSid = forumMdl.parentForumSid;
    saveLevel = intLevel;
  }
  html += '</li>';
  html += '</ul>';
  return html;
}

//フォーラム項目を生成
function createForumListItem(forumMdl, titleClass, valueClass, html) {
  html += '<li class="forum_list_side" id="forum_list_side_' + forumMdl.bfiSid + '" >';

  //開閉ボタン
  if (forumMdl.numberOfChild > 0) {
    html += '<span href="#" class="forum_button_side closed_button" id="open_button_' + forumMdl.bfiSid + '" >+</span>';
  } else {
    html += '<span class="level_indent_side">-</span>';
  }

  //フォーラム画像

  if (forumMdl.imgBinSid == 0) {
    //フォーラム画像default
    html += '<img width="18" height="18" src="../bulletin/images/cate_icon01.gif" class="forum_li_icon_top" alt="' + msglist["forum"] + '" onclick="toThreadList(' + forumMdl.bfiSid + ');">';
  } else {
    //フォーラム画像original
    html += '<img width="18" height="18" src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=' + forumMdl.imgBinSid + '&bbs010ForSid=' + forumMdl.bfiSid + '" class="forum_li_icon_top" alt="' + msglist["forum"] + '" onclick="toThreadList(' + forumMdl.bfiSid + ');">';
  }

  //フォーラムタイトル
  html += '<div>'
  + '<span class="' + titleClass + ' forum_list_title_side" onclick="toThreadList(' + forumMdl.bfiSid + ');">' + forumMdl.bfiName + '</span>';

  //掲示予定あり
  if (forumMdl.rsvThreCnt > 0) {
    html += '<a class="forum_img_new"><span class="tooltips">' + msglist["bbs.post.schedule"] + ':' + forumMdl.rsvThreCnt + '</span><img src="../bulletin/images/icon_scheduled_post.png" class="forum_icon" width="16" height="16" alt="' + msglist["bbs.post.schedule"] + '" border="1"></a>';
  }

  //フォーラムnew画像
  if (forumMdl.newFlg == 1) {
    html += '<span class="forum_img_new"><img src="../bulletin/images/icon_new.gif" class="forum_icon" height="12" width="32" alt="' + msglist["bbs.new.icon"] + '" border="1"></span>';
  }

  html += '</div>';
  return html;
}

//未読スレッド一覧を取得
function getNotReadThreadList(notReadThreadList) {
  //未読スレッドの有無チェック
  if ($(notReadThreadList).size() < 1) {
    $('#notReadThreadListTable').hide();
    $('#notReadThreadListTable').empty();
    return;
  }

  var html = createNotReadThreadList(notReadThreadList);
  $('#notReadThreadListTable').empty();
  $('#notReadThreadListTable').append(html);
  $('#notReadThreadListTable').show();
}

//「全て既読にする」ボタン取得
function getMarkAllReadBlock(data) {
  //ボタンの有効/無効と未読件数チェック
  if (!data.bbs060mreadFlg
  || data.bbs060unreadCnt < 1) {
    $('#markAllReadBlock').hide();
    $('#markAllReadBlock').empty();
    return;
  }

  var html = createMarkAllReadBlock(data);
  $('#markAllReadBlock').empty();
  $('#markAllReadBlock').append(html);
  $('#markAllReadBlock').show();
}

//未読スレッド一覧生成
function createNotReadThreadList(notReadThreadList) {
  var html = '';
  html += '<tr>'
  + '<td width="100%" valign="top" align="left" class="tl0" style="border: solid 1px #cccccc;">'
  + '<table width="100%" class="tl0 bbs_forum_header_left">'
  + '<tr>'
  + '<td width="0%"><img src="../bulletin/images/cate_icon02_bdr.gif" alt="' + msglist["thread"] + '"></td>'
  + '<td width="100%" align="left" ><span class="text_base3">' + msglist["unread.thread.list"] + '</span></td>'
  + '</tr>'
  + '</table>'
  + '<table width="100%" class="tl0 shintyaku_tbl2">';
  var sidMap = {};
  var listSize = $(notReadThreadList).size();
  var forumName = '';
  var forumSid = '';
  var forumMdl;
  var headerFlg = false;
  for (var i=0;i<listSize;++i) {
    forumMdl = notReadThreadList[i];
    forumName = forumMdl.bfiName;
    forumSid = forumMdl.bfiSid;

    if (sidMap[forumSid] == void 0) {
      html += '<table width="100%" class="tl0 shintyaku_tbl2">'
      + '<tr class="smail_td2">'
      + '<td align="left" width="0%">';
      if (forumMdl.binSid == 0) {
        html += '<img width="20" height="20" src="../bulletin/images/cate_icon01.gif" alt="' + msglist["forum"] + '">';
      } else {
        html += '<img width="20" height="20" src="../bulletin/bbs060.do?CMD=getImageFile&bbs010BinSid=' + forumMdl.binSid + '&bbs010forumSid=' + forumMdl.bfiSid + '" alt="' + msglist["forum"] + '">';
      }
      html += '</td>'
      + '<td align="left" width="100%"><span class="text_base11">' + forumMdl.bfiName + '</span></td>'
      + '</tr>';
      sidMap[forumSid] = forumName;
    }

    var titleClass = "text_link";
    html += '<tr class="text_base2">'
    + '<td colspan="2">&nbsp;・'
    + '<a href="javascript: getList(' + forumMdl.bfiSid + ',' + forumMdl.btiSid + ')">';
    if (forumMdl.bfiThreImportance == 1) {
      html += '<img src="../smail/images/zyuu.gif" alt="' + msglist["bbs.importance"] + '" border="0" class="img_bottom">';
    }
    if (forumMdl.btsTempflg == 1) {
        html += '<img src="../bulletin/images/icon_file.gif" alt="' + msglist["attachFile"] + '" class="attach_file_icon">';
    }
    html += '<span class="' + titleClass + '"><font size="-1">' + forumMdl.btiTitle + '</font></span></a>'
    + '<br><span class="text_base10">' + forumMdl.strWriteDate
    + '</span>'
    + '</td>'
    + '</tr>';

  }
  html += '</table>'
  + '</td>'
  + '</tr>';
  return html;
}

//「全て既読にする」ボタン生成
function createMarkAllReadBlock(data) {
  var html = '';

  html = '<tr>'
  + '<td valign="top" align="left" class="tl0" style="border: solid 1px #cccccc;">'
  + '<table width="100%" class="tl0 bbs_forum_header_left">'
  + '<tr>';

  if (data.bbs060BinSid == 0) {
    html += '<td width="0%"><img width="30" height="30" src="../bulletin/images/cate_icon01.gif" alt="' + msglist["forum"] + '"></td>';
  } else {
    html += '<td width="0%">'
    + '<img width="30" height="30" src="../bulletin/bbs060.do?CMD=getImageFile&bbs010BinSid=' + data.bbs060BinSid + '&bbs010forumSid=' + data.bbs010forumSid + '" alt="' + msglist["forum"] + '">'
    + '</td>';
  }

  html += '<td width="100%"><span class="text_base3">' + data.bbs060forumName + '</span></td>'
  + '</tr>'
  + '</table>'
  + '<table width="100%" class="tl0 shintyaku_tbl2">'
  + '<tr>'
  + '<td align="center" style="padding: 10px;">'
  + '<span class="text_base2">' + msglist["unread.thread.count"] +  ':&nbsp;' + data.bbs060unreadCnt + '</span>'
  + '<div style="width:100%; text-align:center; margin-top: 15px;">'
  + '<input type="button" name="btn_allread" class="btn_base1w" value="' + msglist["markRead"] + '" onClick="buttonPush(\'bbs060allRead\');">'
  + '</div>'
  + '</td>'
  + '</tr>'
  + '</table>'
  + '</td>'
  + '</tr>';

  return html;
}

//フォーラム一覧の全て開く・閉じる機能
function openAllForum(act) {
  var child_block = $('#side_forum_list_content').find('.child_forum_block_side');
  var buttons = $('#side_forum_list_content').find('.forum_button_side');

  if (act == 'hide') {
    closeForum(buttons, child_block);
  } else {
    openForum(buttons, child_block);
  }

  return false;
}

//フォーラム一覧の開閉機能
$('.forum_button_side').live('click', function() {
  var child_ul = $(this).parents('li').next();

  if (child_ul.css('display') == 'none') {
    openForum($(this), child_ul);
  } else {
    closeForum($(this), child_ul);
  }

  return false;
});

function openForum(button, target) {
  target.animate({height: 'show', opacity: 'show'}, "fast");
  button.removeClass('closed_button');
  button.addClass('opened_button');
  button.text('-');
}

function closeForum(button, target) {
  target.animate({height: 'hide', opacity: 'hide'}, "fast");
  button.removeClass('opened_button');
  button.addClass('closed_button');
  button.text('+');
}

function loadingPop(popTxt) {

  $('#loading_pop').dialog({
    autoOpen: true,  // hide dialog
    bgiframe: true,   // for IE6
    resizable: false,
    height: 95,
    width: 250,
    modal: true,
    title: popTxt,
    overlay: {
      backgroundColor: '#000000',
      opacity: 0.5
    },
    buttons: {
      hideBtn: function() {
      }
    }
  });

  $('.ui-button-text').each(function() {
    if ($(this).text() == 'hideBtn') {
      $(this).parent().parent().parent().addClass('border_top_none');
      $(this).parent().parent().parent().addClass('border_bottom_none');
      $(this).parent().after("<div style=\"border-top:0px;line-height:10px\" class=\"\">&nbsp;&nbsp;&nbsp;&nbsp;</div>");
      $(this).parent().remove();
    }
  })

}

function closeloadingPop() {
    if ($('#loading_pop') != null) {
        setTimeout('closeloading();',150)
    }
}

function closeloading() {
    if ($('#loading_pop') != null) {
        $('#loading_pop').dialog('close');
    }
}
