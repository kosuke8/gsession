function sendSystemInfo() {

    //URL�A�p�����[�^�����擾����
    $.ajax({
        async: true,
        url:"../main/man230.do",
        type: "post",
        data: {CMD: "sendSystemInfo"}
    }).done(function( data ) {
        if (data != null || data != "") {
            var subWindow;
            var winWidth = 520;
            var winHeight = 300;
            var winx = getCenterX(winWidth);
            var winy = getCenterY(winHeight);

            var newWinOpt = "width=" + winWidth + ", height=" + winHeight + ", toolbar=no ,scrollbars=yes, resizable=yes, left=" + winx + ", top=" + winy;
            subWindow = window.open(data.url, 'reportWindow', newWinOpt);

            var formName = 'systemInfo';

            var form = $('<form/>', {action: data.url, method: 'post', target:'reportWindow', name:formName});
            form.append($('<input/>',{type:'hidden',name:"sysinfo" ,value:data.sysinfo}));
            form.append($('<input/>',{type:'hidden',name:"licenseid" ,value:data.licenseid}));
            form.append($('<input/>',{type:'hidden',name:"version" ,value:data.version}));

            //body����form��ǉ�(IE�Ή�)
            $('body').append(form);
            //�T�u�~�b�g
            form.submit();
            //form�̍폜�ijsp���̊��form�͍폜����Ȃ��j
            form.remove();
            return false;
      }
   }).fail(function(data){
        //JSON�f�[�^���s���̏���
   });

  function getCenterX(winWidth) {
    var x = (screen.width - winWidth) / 2;
    return x;
  }

  function getCenterY(winHeight) {
    var y = (screen.height - winHeight) / 2;
    return y;
  }

}