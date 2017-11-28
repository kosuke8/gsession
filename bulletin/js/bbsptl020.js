$(function() {
  var createdForumList = $('input:hidden[name=bbsPtl020createdForum]');
  createdForumList.each(function(i, elem) {
    var sid = $(elem).val();
    $('#forum_link' + sid).children('span').addClass('disabled_link');
    $('#forum_link' + sid).removeAttr("onClick");
  });
})

function selectForum(forumSid) {
    document.forms[0].bbsptl020forumSid.value=forumSid;
    document.forms[0].CMD.value='selectForum';
    document.forms[0].submit();
    return false;
}

function closeWindow() {

    var closeFlg = document.forms[0].bbsptl020selectFlg.value;

    if (closeFlg == 'true') {
        var parentDocument = window.opener.document;
        parentDocument.forms[0].CMD.value = 'init';
        parentDocument.forms[0].submit();
        window.close();
    }

    return false;
}
