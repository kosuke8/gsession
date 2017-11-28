function buttonPush(cmd){

    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

$(function() {
    initTinymce();

    setDisplay($("input:hidden[name=bbs090valueType]").val());

    $('#value_content_type_switch').live("click", function(){
      var valueType = 0;
      if ($("input:hidden[name=bbs090valueType]").val() == 0) {
        valueType = 1;
      }
      $("input:hidden[name=bbs090valueType]").val(valueType);
      changeValueType();
    });

})

function setDisplay(valueType) {
    if (valueType == '0') {
      //change to plain text
      $("input:hidden[name=bbs090valueType]").val(0);
      $("#value_content_type_switch").text(msglist["change.to.html.type"]);
      $("#input_area_html").addClass("display_none");
      $("#input_area_plain").removeClass("display_none");
      $("#plain_text_count").removeClass("display_none");

    } else {
      //change to html text
      $("input:hidden[name=bbs090valueType]").val(1);
      $("#value_content_type_switch").text(msglist["change.to.plain.type"]);
      $("#input_area_html").removeClass("display_none");
      $("#input_area_plain").addClass("display_none");
      $("#plain_text_count").addClass("display_none");
    }
}

function setupTinymce(editor) {
  editor.addButton('addbodyfile', {
    text: msglist["cmn.insert.content"],
    icon: false,
    onclick: function () {
      opnTempPlus('bbs090BodyFile', 'bulletin', '0', '7', 'bodyFile', $("input:hidden[name=tempDirId]").val());
    }
  });
}

function changeValueType() {
  //valueType 0:plain 1:html

  var valueType = $("input:hidden[name=bbs090valueType]").val();

  setDisplay(valueType);

  if (valueType == '0') {
    //change to plain text
    var htmlAreaStr = "";
    if (tinyMCE.get('inputstr_tinymce') != null) {
      htmlAreaStr = tinyMCE.activeEditor.getContent({format : 'text'});
    }

    if (htmlAreaStr != null && htmlAreaStr.length > 0 && htmlAreaStr != "\n") {
      $("#input_area_plain").val(htmlAreaStr);
      $('#inputlength').html(htmlAreaStr.length);
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
