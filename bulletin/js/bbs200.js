$(function() {
  $('input[name=bbs200IniPostTypeKbn]').live("change", function(){
    switchDispArea();
  });
  switchDispArea();
})

function switchDispArea() {
  if ($('input[name=bbs200IniPostTypeKbn]:checked').val() == '0') {
    $('#iniPostTypeArea').hide();
  } else {
    $('#iniPostTypeArea').show();
  }
}
