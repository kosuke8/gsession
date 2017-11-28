function setShowHide() {
  changeStypeMaxDsp();
  changeStypeReloadTime();
  changeStypePhotoDsp();
  changeStypeAttachImgDsp();
}

function changeStypeMaxDsp() {
  var check = $("input[name='sml400MaxDspStype']:checked").val();
  if (check == 1) {
    $('#smlMaxDspArea1').attr("rowSpan","2");
    $('#smlMaxDspArea2').show();
  } else {
    $('#smlMaxDspArea1').attr("rowSpan","1");
    $('#smlMaxDspArea2').hide();
  }
}

function changeStypeReloadTime() {
  var check = $("input[name='sml400ReloadTimeStype']:checked").val();
  if (check == 1) {
    $('#smlReloadTimeArea1').attr("rowSpan","2");
    $('#smlReloadTimeArea2').show();
  } else {
    $('#smlReloadTimeArea1').attr("rowSpan","1");
    $('#smlReloadTimeArea2').hide();
  }
}

function changeStypePhotoDsp() {
  var check = $("input[name='sml400PhotoDspStype']:checked").val();
  if (check == 1) {
    $('#smlPhotoDspArea1').attr("rowSpan","2");
    $('#smlPhotoDspArea2').show();
  } else {
    $('#smlPhotoDspArea1').attr("rowSpan","1");
    $('#smlPhotoDspArea2').hide();
  }
}

function changeStypeAttachImgDsp() {
  var check = $("input[name='sml400AttachImgDspStype']:checked").val();
  if (check == 1) {
    $('#smlAttachImgDspArea1').attr("rowSpan","2");
    $('#smlAttachImgDspArea2').show();
  } else {
    $('#smlAttachImgDspArea1').attr("rowSpan","1");
    $('#smlAttachImgDspArea2').hide();
  }
}
