function changePage(id){
    if (id == 1) {
        document.forms[0].bbs010page1.value=document.forms[0].bbs010page2.value;
    }

    document.forms[0].CMD.value='init';
    document.forms[0].submit();
    return false;
}

function buttonPush(cmd){

    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

function clickForum(sid) {
    document.forms[0].CMD.value='moveThreadList';
    document.forms[0].bbs010forumSid.value=sid;
    document.forms[0].submit();
    return false;
}

function clickMemBtn(sid) {
    document.forms[0].CMD.value='moveMemList';
    document.forms[0].bbs010forumSid.value=sid;
    document.forms[0].submit();
    return false;
}

$('.forum_button').live('click', function() {
  var child_ul = $(this).parents('li.forum_list_content').next();

  if (child_ul.css('display') == 'none') {
    openForum($(this), child_ul);
  } else {
    closeForum($(this), child_ul);
  }

  return false;
})

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
