function initTinymce() {
  //言語対応
  // var lang = 'en_US';
  var lang = 'ja';

  tinymce.init({
    selector: '#inputstr_tinymce',
    plugins: [
      'advlist autolink link image lists charmap hr anchor pagebreak spellchecker',
      'searchreplace visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table contextmenu directionality template paste textcolor'
    ],
    paste_data_images: true,
    menubar: false,
    toolbar1: 'undo redo | visualblocks | styleselect fontsizeselect bold italic forecolor backcolor',
    toolbar2: 'alignleft aligncenter alignright alignjustify | bullist numlist outdent indent table | link image media fullpage addbodyfile',
    language: lang,
    content_style: 'p {font-size: 14.4px; font-family: Meiryo, "メイリオ", "Lucida Grande", Verdana, "Hiragino Kaku Gothic Pro","ヒラギノ角ゴ Pro W3", "ＭＳ Ｐゴシック", sans-serif;}',
    height : 300,
    setup: function (editor) {
      setupTinymce(editor);
    }
  });
}

function addElementBody(type, src){
  tinyMCE.activeEditor.dom.add(tinyMCE.activeEditor.getBody(), type, {src : src});
}
