function changeEnableDisable() {
  var ctext = $('#lmtinput')[0];
  if (document.forms[0].sch087RepeatKbnType[0].checked) {
     changeStyle(ctext, 'sch_description_text_notdsp');
  } else {
     changeStyle(ctext, 'sch_description_text_dsp');
  }
}

function showOrHide() {
  if (document.forms[0].sch087RepeatKbn.length) {
      if (document.forms[0].sch087RepeatKbn[1].checked) {
          showText();
      } else {
          hideText();
      }
  }
}
function showText(){
    $('#repertMyKbnArea').show();
}

function hideText(){
    $('#repertMyKbnArea').hide();
}
