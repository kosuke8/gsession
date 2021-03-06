function buttonPushAdd(cmd, cmdMode){
    $('#CMD')[0].value = cmd;
    document.forms[0].prj050cmdMode.value=cmdMode;
    document.forms[0].submit();
    return false;
}

function onTitleLinkSubmit(sortKey, order) {
    document.forms[0].prj030sort.value = sortKey;
    document.forms[0].prj030order.value = order;
    document.forms[0].submit();
    return false;
}

function viewTodo(cmd, todoSid) {
    $('#CMD')[0].value = cmd;
    document.forms[0].prj060todoSid.value=todoSid;
    document.forms[0].submit();
    return false;
}

function editTodo(cmd, cmdMode, prjSid, todoSid) {
    $('#CMD')[0].value = cmd;
    document.forms[0].prj050cmdMode.value=cmdMode;
    document.forms[0].prj050prjSid.value=prjSid;
    document.forms[0].prj050todoSid.value=todoSid;
    document.forms[0].submit();
    return false;
}

function changeChk(){

   var chkFlg;
   if (document.forms[0].allCheck.checked) {
       chkFlg = true;
   } else {
       chkFlg = false;
   }

   targetArray = document.getElementsByName("prj030sendMember");
   for(i = 0; i < targetArray.length; i++) {
       targetArray[i].checked = chkFlg;
   }
}

function memberEdit(cmd, dspId) {
    document.forms[0].CMD.value = cmd;
    document.forms[0].movedDspId.value = dspId;
    document.forms[0].submit();
    return false;
}

function changePage(id){
    if (id == 1) {
        document.forms[0].prj030page2.value=document.forms[0].prj030page1.value;
    } else {
        document.forms[0].prj030page1.value=document.forms[0].prj030page2.value;
    }

    document.forms[0].submit();
    return false;
}

function viewTodoComment(cmd, todoSid) {
    document.forms['prj030Form'].prjmvComment.value = 1;
    return viewTodo(cmd, todoSid);
}

function doOpenDialog(prjSid){

    var idList = [];
    $('.td_type_selected').each(function() {
      idList.push($(this).attr('id'));
    });
    $('.td_type_selected2').each(function() {
        idList.push($(this).attr('id'));
    });

    var userAgent = window.navigator.userAgent.toLowerCase();
    var appVersion = window.navigator.appVersion.toLowerCase();
    var dwidth = 100;
    var dwidth2 = 180;
    if (userAgent.indexOf("firefox") > -1) {
      dwidth = 160;
    }

    if (idList.length > 0) {
      if (msglist.shifts == "シフト") {
        $('#dialog-form').dialog({
            autoOpen: true,
            height: dwidth,
            width: 350,
            modal: true,
            buttons: {
                "シフト": function() {
                    var listStr = '';
                    //prj030selectTodoの値を設定
                    for (i = 0; i < idList.length; i++) {
                      if (idList[i] != null) {
                          if (i == (idList.length - 1)) {
                              listStr += idList[i];
                          } else {
                              listStr += idList[i] + ',';
                          }
                      }
                    }
                    //休日設定
                    var holKbn = 0;
                    if (!$('#holSet').is(':checked')) {
                        holKbn = 1;
                    }
                    //移動区分
                    var mvKbn = 0;
                    if ($('#radioMi').is(':checked')) {
                       mvKbn = 1;
                    }
                    //移動日数 月
                    var mvMonth = $('#selMonth option:selected').text();
                    //移動日数 日
                    var mvDay = $('#selDay option:selected').text();

                    $.ajaxSetup({async:false});
                    $.post('../project/prj030.do', {"cmd":"editDate","CMD":"editDate",
                                                    "prj030prjSid":prjSid,
                                                    "prj030selectTodoStr":listStr,
                                                    "prj030chDateKbn":mvKbn,
                                                    "prj030chDateHol":holKbn,
                                                    "prj030mvMonth":mvMonth,
                                                    "prj030mvDay":mvDay},
                       function(data) {
                          $( this ).dialog( "close" );
                          buttonPush('updateTodoList');
                       }
                    );
                },
                "キャンセル": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
      } else {
          $('#dialog-form').dialog({
              autoOpen: true,
              height: dwidth,
              width: 350,
              modal: true,
              buttons: {
                  "shifts": function() {
                      var listStr = '';
                      //prj030selectTodoの値を設定
                      for (i = 0; i < idList.length; i++) {
                        if (idList[i] != null) {
                            if (i == (idList.length - 1)) {
                                listStr += idList[i];
                            } else {
                                listStr += idList[i] + ',';
                            }
                        }
                      }
                      //休日設定
                      var holKbn = 0;
                      if (!$('#holSet').is(':checked')) {
                          holKbn = 1;
                      }
                      //移動区分
                      var mvKbn = 0;
                      if ($('#radioMi').is(':checked')) {
                         mvKbn = 1;
                      }
                      //移動日数 月
                      var mvMonth = $('#selMonth option:selected').text();
                      //移動日数 日
                      var mvDay = $('#selDay option:selected').text();

                      $.ajaxSetup({async:false});
                      $.post('../project/prj030.do', {"cmd":"editDate","CMD":"editDate",
                                                      "prj030prjSid":prjSid,
                                                      "prj030selectTodoStr":listStr,
                                                      "prj030chDateKbn":mvKbn,
                                                      "prj030chDateHol":holKbn,
                                                      "prj030mvMonth":mvMonth,
                                                      "prj030mvDay":mvDay},
                         function(data) {
                            $( this ).dialog( "close" );
                            buttonPush('updateTodoList');
                         }
                      );
                  },
                  "cancel": function() {
                      $( this ).dialog( "close" );
                  }
              }
          });
      }
    } else {
      if (msglist.shifts == "シフト") {
        $('#dialog-error').dialog({
            autoOpen: true,
            height: dwidth2,
            width: 350,
            modal: true,
            buttons: {
                "閉じる": function() {
                    $( this ).dialog( "close" );
                }
            }
        });
      } else {
          $('#dialog-error').dialog({
              autoOpen: true,
              height: dwidth2,
              width: 350,
              modal: true,
              buttons: {
                  "Close": function() {
                      $( this ).dialog( "close" );
                  }
              }
          });
      }
    }
    return false;
}

function backGroundSetting(key, typeNo) {
    if (key.checked) {
        if (typeNo == 1) {
          document.getElementById(key.value).className='td_type_selected';
        } else {
          document.getElementById(key.value).className='td_type_selected2';
        }
    } else {
        var cssName = 'td_line_color' + typeNo;
        document.getElementById(key.value).className=cssName;
    }
}

function chgCheckAllChange(allChkName, chkName) {
    if (document.getElementsByName(allChkName)[0].checked) {
        $(".td_line_color1").addClass("td_type_selected");
        $(".td_line_color2").addClass("td_type_selected2");
    } else {
        $(".td_type_selected").addClass("td_line_color1");
        $(".td_type_selected2").addClass("td_line_color2");
        $(".td_line_color1").removeClass("td_type_selected");
        $(".td_line_color2").removeClass("td_type_selected2");
    }
}