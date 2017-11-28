function buttonPush(cmd){
    setScrollPosition();
    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

function setScrollPosition(){
    var bbs030ScrollPosition = $(window).scrollTop();
    document.forms[0].bbs030ScrollPosition.value = bbs030ScrollPosition;
}

function doScroll(){
    if (document.forms[0].bbs030ScrollPosition.value) {
        window.scroll(0, document.forms[0].bbs030ScrollPosition.value);
    }
}

function selectGroup() {
    document.forms[0].CMD.value = 'changeGrp';
    document.forms[0].submit();
    return false;
}

function setupTinymce(editor) {
}

function changeInitArea() {

//  var initKbn = document.getElementsByName('bbs030templateKbn')[0].checked;

  var initKbn = Number($("input:radio[name=bbs030templateKbn]:checked").val());


  if (initKbn == 1) {
    $('#templateArea').show();
  } else {
    $('#templateArea').hide();
  }

}

function changeInputDiskSize(diskHnt) {
  if(diskHnt == 1){
    document.getElementById("inputDiskSize").style.display="";
    document.getElementById("warnDiskArea").style.display="";
  } else if(diskHnt == 0) {
    document.getElementById("inputDiskSize").style.display="none";
    document.getElementById("warnDiskArea").style.display="none";
  }
}

function changeWarnDisk(warnDisk) {
  if (warnDisk == 1){
    $('#warnDiskThresholdArea').show();
  } else {
    $('#warnDiskThresholdArea').hide();
  }
}

$(function() {

    //掲示期間 設定区分 変更時
    $("input:radio[name=bbs030Limit]").live('change', function(){
        if ($(this).val() == 1) {
            $('#inputLimitDate').show();
        } else {
            $('#inputLimitDate').hide();
        }
    });

    //スレッド保存期間設定 変更時
    $("input:radio[name=bbs030Keep]").live('change', function(){
        if ($(this).val() == 1) {
            $('#inputKeepDate').show();
        } else {
            $('#inputKeepDate').hide();
        }
    });

    $('#value_content_type_switch').live("click", function(){
      var valueType = 0;
      if ($("input:hidden[name=bbs030templateType]").val() == 0) {
        valueType = 1;
      }
      $("input:hidden[name=bbs030templateType]").val(valueType);
      changeValueType();
    });

    $('input:radio[name=bbs030FollowParentMemFlg]').live("change", function(){
      changeFollowParentMemFlg();
      buttonPush('selectForum');
    });

    //初期処理
    doInit();
})

function doInit() {

    var limitdisableKbn = Number($("input:radio[name=bbs030LimitDisable]:checked").val());
    if (limitdisableKbn == 1) {
        $('#inputLimitEnableLimit').show();
        $('#inputLimitEnableDate').show();
        $('#timeUnit').show();
    } else {
        $('#inputLimitEnableLimit').hide();
        $('#inputLimitEnableDate').hide();
        $('#timeUnit').hide();
    }

    var limitKbn = Number($("input:radio[name=bbs030Limit]:checked").val());
    if (limitKbn == 1) {
        $('#inputLimitDate').show();
    } else {
        $('#inputLimitDate').hide();
    }

    var keepKbn = Number($("input:radio[name=bbs030Keep]:checked").val());
    if (keepKbn == 1) {
        $('#inputKeepDate').show();
    } else {
        $('#inputKeepDate').hide();
    }

    var parentSid = $("input:hidden[name=bbs030ParentForumSid]").val();
    if (parentSid == 0) {
      $('#selectFollowParentMemArea').hide();
    } else {
      $('#selectFollowParentMemArea').show();
    }

    changeFollowParentMemFlg();

    initTinymce();

    setDisplay($("input:hidden[name=bbs030templateType]").val());
}

function setDisplay(valueType) {
    if (valueType == '0') {
      //change to plain text
      $("input:hidden[name=bbs030templateType]").val(0);
      $("#value_content_type_switch").text(msglist["change.to.html.type"]);
      $("#input_area_html").addClass("display_none");
      $("#input_area_plain").removeClass("display_none");
      $("#template_plain_text_count").removeClass("display_none");

    } else {
      //change to html text
      $("input:hidden[name=bbs030templateType]").val(1);
      $("#value_content_type_switch").text(msglist["change.to.plain.type"]);
      $("#input_area_html").removeClass("display_none");
      $("#input_area_plain").addClass("display_none");
      $("#template_plain_text_count").addClass("display_none");
    }
}

function changeFollowParentMemFlg() {
  if ($('input:radio[name=bbs030FollowParentMemFlg]:checked').val() == 1
  && $("input:hidden[name=bbs030ParentForumSid]").val() != 0) {
    $('#selectMemberArea').hide();
  } else {
    $('#selectMemberArea').show();
  }
}

function changeValueType() {
  //valueType 0:plain 1:html

  var valueType = $("input:hidden[name=bbs030templateType]").val();

  setDisplay(valueType);

  if (valueType == '0') {
    //change to plain text
    var htmlAreaStr = "";
    if (tinyMCE.get('inputstr_tinymce') != null) {
      htmlAreaStr = tinyMCE.activeEditor.getContent({format : 'text'});
    }

    if (htmlAreaStr != null && htmlAreaStr.length > 0 && htmlAreaStr != "\n") {
      $("#input_area_plain").val(htmlAreaStr);
      $('#inputlengthTemplate').html(htmlAreaStr.length);
    }

  } else {
    //change to html text
    setCopyTextAreaStr();
  }
}

function setCopyTextAreaStr() {
  if ($("#input_area_plain").val() == null || $("#input_area_plain").val() == "") {
    $("#input_area_plain").val("");
  }
  try {
      tinyMCE.get('inputstr_tinymce').setContent(textBr(htmlEscape($("#input_area_plain").val())));
  } catch (e) {
    initTinymce();
  }
}

function textBr(txtVal){
    txtVal = txtVal.replace(/\r?\n/g, "<br />");
    return txtVal;
}

function htmlEscape(s){
    s=s.replace(/&/g,'&amp;');
    s=s.replace(/>/g,'&gt;');
    s=s.replace(/</g,'&lt;');
    return s;
}
