function syubetsuChange(){

    var syubetsuList = document.getElementsByName('cir060syubetsu');
    var syubetu = 0;
    for (i = 0; i < syubetsuList.length; i++) {
        if (syubetsuList[i].checked == true) {
            syubetu = syubetsuList[i].value;
            break;
        }
    }

    if (syubetu == 0) {
        //jusin
        document.forms[0].selectBtn.disabled = true;
        $('.cir_send_sel_btn').addClass('btn_base_disabled');
        $('.cir_send_sel_btn').removeClass('btn_base0');
        document.forms[0].clearBtn.disabled = true;
        document.forms[0].clearBtn.className = 'btn_base_disabled';

        clearUserList();

        document.forms[0].cir060groupSid.disabled = false;
        document.forms[0].cir060userSid.disabled = false;

    } else if (syubetu == 1) {
        //sosin
        document.forms[0].cir060groupSid.value = -1;
        document.forms[0].cir060userSid.value = -1;
        document.forms[0].cir060groupSid.disabled = true;
        document.forms[0].cir060userSid.disabled = true;

        document.forms[0].selectBtn.disabled = false;
        $('.cir_send_sel_btn').addClass('btn_base0');
        $('.cir_send_sel_btn').removeClass('btn_base_disabled');
        document.forms[0].clearBtn.disabled = false;
        document.forms[0].clearBtn.className = 'btn_base0';

    } else {
        //gomi
        document.forms[0].cir060groupSid.disabled = false;
        document.forms[0].cir060userSid.disabled = false;
        document.forms[0].selectBtn.disabled = false;
        $('.cir_send_sel_btn').addClass('btn_base0');
        $('.cir_send_sel_btn').removeClass('btn_base_disabled');
        document.forms[0].clearBtn.disabled = false;
        document.forms[0].clearBtn.className = 'btn_base0';
    }

    return false;
}

function clearUserList(){
    $('#atesaki_to_area')[0].innerHTML = '';
    var userSid = document.getElementsByName('cir060selUserSid');
    for (i = 0; i < userSid.length; i++) {
        userSid[i].value = '';
        userSid[i].disabled = true;
    }
}

function hassinChange(cmd){
    document.forms[0].cir060userSid.value = -1;
    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

function changePage(id){
    if (id == 1) {
        document.forms[0].cir060pageNum2.value = document.forms[0].cir060pageNum1.value;
    } else {
        document.forms[0].cir060pageNum1.value = document.forms[0].cir060pageNum2.value;
    }

    document.forms[0].CMD.value='searchAgain';
    document.forms[0].submit();
    return false;
}

function viewItem(cmd, id, kbn){
    document.forms[0].CMD.value=cmd;
    document.forms[0].cir010selectInfSid.value=id;
    document.forms[0].cir010sojuKbn.value=kbn;
    document.forms[0].submit();
    return false;
}

function clickSortTitle(sortValue) {

    if (document.forms[0].cir060sort1.value == sortValue) {

        if (document.forms[0].cir060order1[0].checked == true) {
            document.forms[0].cir060order1[0].checked = false;
            document.forms[0].cir060order1[1].checked = true;
        } else {
            document.forms[0].cir060order1[1].checked = false;
            document.forms[0].cir060order1[0].checked = true;
        }
    } else {
        document.forms[0].cir060sort1.value = sortValue;
    }
    return false;
}
/**
 * �e��ʂɖ߂�ۂɃA�N�V�����ɃR�}���h��n���ꍇ
 * cmd �R�}���h
 */
function openGroupWindowForCircular(formOj, selBoxName, myGpFlg, cmd) {

    document.forms[0].cir060userSid.value = -1;
    if (cmd != "") {
        document.forms[0].CMD.value=cmd;
    }
    openGroup(formOj, selBoxName, myGpFlg, "");
    return;
}



$(function() {

    //宛先選択ボタン
    $(".cir_send_sel_btn").live("click", function(){

        //選択ボタン名
        var functinBtnName = $(this).attr('id');
        var paramStr = "CMD=getInitData";

        paramStr += getNowSelUsr();


        //宛先一覧取得
        getSelAtesakiData(paramStr, functinBtnName, 0);

        /* テンプレートポップアップ */
        $('#atesakiSelPop').dialog({
            autoOpen: true,  // hide dialog
            bgiframe: true,   // for IE6
            resizable: false,
            height: 560,
            width: 750,
            modal: true,
            overlay: {
              backgroundColor: '#000000',
              opacity: 0.5
            },
            buttons: {
              閉じる: function() {
                  $(this).dialog('close');
              }
            }
        });
    });


    //ユーザ選択  グループコンボ変更
    $("#fakeButton").live("click", function(){
        var paramStr = "CMD=changeGrpData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });

    //ユーザ選択  グループコンボ変更
    $("#cmn120ChangeGrp").live("change", function(){
        var paramStr = "CMD=changeGrpData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });

    //ユーザ選択  ユーザ追加
    $("#adduserBtn").live("click", function(){
        var paramStr = "CMD=addUserData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });

    //ユーザ選択  ユーザ削除
    $("#deluserBtn").live("click", function(){
        var paramStr = "CMD=removeUserData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });


    //ユーザ選択  ユーザ削除
    $("#myGrpAddBtn").live("click", function(){
        var paramStr = "CMD=addMyGrpUserData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });

    //ユーザ選択  再読み込み
    $("#fakeButton2").live("click", function(){
        var paramStr = "CMD=getInitData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());
    });

    //ユーザ選択  選択ボタンクリック
    $("#sel_usr_pop_btn").live("click", function(){
        drawPopUsr();
    });

    //選択ユーザ  削除
    $(".add_usr_del").live("click", function(){
        $(this).parent().remove();
    });

    /* ユーザ選択   グループ区分  hover*/
    jQuery('.sel_group_notcheck').live({
        mouseenter:function(){
          $(this).addClass("sel_group_notcheck_on");
        },
        mouseleave:function(){
          $(this).removeClass("sel_group_notcheck_on");
        }
    });

    /* ユーザ選択  グループ区分  変更*/
    $('.sel_group_check').live("click", function(){

        var grpKbn = $(this).attr('id');

        if (grpKbn == "groupTab") {
            $('#cmn120MyGroupSidSel').addClass("display_none");
            $('#cmn120ChangeGrpBtn').removeClass("display_none");
            $('#cmn120ChangeGrpBtn2').removeClass("display_none");
            $('#cmn120ChangeGrp').removeClass("display_none");
            $(this).removeClass("sel_group_notcheck_on");
            $(this).removeClass("sel_group_notcheck");
            $('#mygroupTab').addClass("sel_group_notcheck");
            $('#deptAccountTab').addClass("sel_group_notcheck");
            $('#cmn120DspKbn').val(1);
        } else if  (grpKbn == "mygroupTab") {
            $('#cmn120MyGroupSidSel').removeClass("display_none");
            $('#cmn120ChangeGrpBtn').addClass("display_none");
            $('#cmn120ChangeGrpBtn2').addClass("display_none");
            $('#cmn120ChangeGrp').addClass("display_none");
            $(this).removeClass("sel_group_notcheck_on");
            $(this).removeClass("sel_group_notcheck");
            $('#groupTab').addClass("sel_group_notcheck");
            $('#deptAccountTab').addClass("sel_group_notcheck");
            $('#cmn120DspKbn').val(2);
        } else if  (grpKbn == "deptAccountTab") {
            $('#cmn120MyGroupSidSel').addClass("display_none");
            $('#cmn120ChangeGrpBtn').addClass("display_none");
            $('#cmn120ChangeGrpBtn2').addClass("display_none");
            $('#cmn120ChangeGrp').addClass("display_none");
            $(this).removeClass("sel_group_notcheck_on");
            $(this).removeClass("sel_group_notcheck");
            $('#groupTab').addClass("sel_group_notcheck");
            $('#mygroupTab').addClass("sel_group_notcheck");
            $('#cmn120DspKbn').val(4);
        }

        var paramStr = "CMD=changeTabData&";
        paramStr += getFormData($('#atesakiSelForm'));
        getSelAtesakiData(paramStr, $('#funcBtnName').val(), $('#funcBtnKbn').val());

    });
});

function getNowSelUsr() {

    var paramStr = "";

    $('input:hidden[name=cir060selUserSid]').each(function(){
        paramStr += "&cmn120userSid=" + $(this).val();
    });

    return paramStr;

}

function getSelAtesakiData(paramStr, functionName, functionKbn) {

    paramStr += "&cmn120BackUrl=circular"

    $.ajax({
        async: true,
        url:"../common/cmn120.do",
        type: "post",
        data: paramStr
    }).done(function( data ) {

        var atesakiSelStr = "";

        try {
            atesakiSelStr += "<form id=\"atesakiSelForm\" name=\"atesakiSelForm\">";

            atesakiSelStr += "<input type=\"button\" class=\"display_none\" id=\"fakeButton\" name=\"fakeButton\" />";
            atesakiSelStr += "<input type=\"button\" class=\"display_none\" id=\"fakeButton2\" name=\"fakebutton2\" />";

            if (data.cmn120userSid != null && data.cmn120userSid != "") {
                for (i = 0; i < data.cmn120userSid.length; i++) {
                    atesakiSelStr += "<input type=\"hidden\" name=\"cmn120userSid\" value=\""
                                  +   data.cmn120userSid[i] + "\">";
                }
            }

            if (data.cmn120userSidOld != null && data.cmn120userSidOld != "") {
                for (i = 0; i < data.cmn120userSidOld.length; i++) {
                    atesakiSelStr += "<input type=\"hidden\" name=\"cmn120userSidOld\" value=\""
                                  +   data.cmn120userSidOld[i] + "\">";
                }
            }

            if (data.cmn120paramName != null && data.cmn120paramName != "") {
                if (data.cmn120userSid != null && data.cmn120userSid.length > 0) {
                    for (i = 0; i < data.cmn120userSid.length; i++) {

                        atesakiSelStr += "<input type=\"hidden\" name=\""
                                      +  data.cmn120paramName
                                      + "/>\" value=\""
                                      +  data.cmn120userSid[i]
                                      +  "/>\">";
                    }
                }
            }


            atesakiSelStr += "<input type=\"hidden\" id=\"funcBtnName\" value=\""
                          +  functionName
                          +  "\" />"
                          +  "<input type=\"hidden\" id=\"funcBtnKbn\" value=\""
                          +  functionKbn
                          +  "\" />"
                          +  "<input type=\"hidden\" id=\"cmn120DspKbn\" name=\"cmn120DspKbn\" value=\""
                          +  data.cmn120DspKbn
                          +  "\" />"
                          +  "<table width=\"100%\" border=\"0\">"
                          +  "<tr>"
                          +  "<td width=\"100%\" align=\"center\">"
                          +  "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"650px\">"
                          +  "<tr>"
                          +  "<td>"
                          +  "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">"
                          +  "<tr>"
                          +  "<td width=\"50%\">"
                          + "</td>"
                          +  "<td width=\"0%\"></td>"
                          +  "<td class=\"\" align=\"right\" width=\"50%\">"
                          +  "<input type=\"button\" id=\"sel_usr_pop_btn\" value=\"選択\" class=\"btn_base1\">"
                          +  "<td width=\"0%\"></td>"
                          +  "</tr>"
                          +  "</table>"
                          +  "<img src=\"../common/images/spacer.gif\" alt=\"\" height=\"10px\" width=\"10px\">"
                          +  "<table style=\"padding:0px;margin:0px;\" width=\"100%\">"
                          +  "<tr>"
                          +  "<td nowrap align=\"left\" class=\"sel_group_space\" width=\"350px\"></td>"
                          +  "<td nowrap id=\"groupTab\" class=\"group_select_state sel_group_check\"><span>グループ</span></td>"
                          +  "<td nowrap id=\"mygroupTab\" class=\"sel_group_check sel_group_notcheck\"><span>マイグループ</span></td>"
                          +  "<td nowrap id=\"deptAccountTab\" class=\"sel_group_check sel_group_notcheck\"><span>代表アカウント</span></td>"
                          +  "<td nowrap align=\"left\" class=\"sel_group_space\"></td>"
                          +  "</tr>"
                          +  "</table>"
                          +  "<table width=\"100%\" class=\"\" border=\"0\" cellpadding=\"5\">"
                          +  "<tr>"
                          +  "<td align=\"left\" class=\"td_smail_wt\">"
                          +  "<table width=\"0%\" border=\"0\">"
                          +  "<tr id=\"cmn120SelectHeaderRow\">"
                          +  "<td width=\"35%\" class=\"table_bg_A5B4E1\" align=\"center\"><span class=\"text_bb1\">" + functionName + "</span></td>"
                          +  "<td width=\"20%\" align=\"center\">&nbsp;</td>"
                          +  "<td width=\"35%\" align=\"left\">"
                          +  "<input id=\"cmn120ChangeGrpBtn\" class=\"btn_group_n1\" onclick=\"return openAllGroup_no_submit(this.form.cmn120groupSid, 'cmn120groupSid', '-1', '0', 'changeGrp', 'cmn120userSid', '-1', '0', '0', '0', '0', 'atesakiSelForm', 'fakeButton2')\" value=\"全グループから選択\"  type=\"button\"><br>";


            //グループ
            var grpSelStr = "";
            if (data.cmn120DspKbn == 0 || data.cmn120DspKbn == 1) {
                grpSelStr += "<select name=\"cmn120groupSid\" id=\"cmn120ChangeGrp\" class=\"select01\">";
                if (data.cmn120GroupList.length > 0) {
                    for (k = 0; k < data.cmn120GroupList.length; k++) {
                        var grpMdl = data.cmn120GroupList[k];

                        if (grpMdl.value != "cac") {
                            grpSelStr += "<option value=\""
                                +  grpMdl.value
                                +  "\">"
                                +  grpMdl.label
                                +  "</option>";
                        } else {
                            grpSelStr += "<option class=\"select03\" value=\""
                                +  grpMdl.value
                                +  "\">"
                                +  grpMdl.label
                                +  "</option>";
                        }

                    }
                }
                grpSelStr += "</select>";
                grpSelStr += "<input type=\"hidden\" name=\"cmn120MyGroupSid\" value=\""
                          +  data.cmn120MyGroupSid
                          +  "\" />";
            }


            //マイグループ
            var myGrpSelStr = "";
            if (data.cmn120DspKbn == 2) {
                if (data.cmn120GroupList.length > 0) {
                myGrpSelStr += "<select  id=\"cmn120ChangeGrp\" name=\"cmn120MyGroupSid\" class=\"select01\">";

                    for (j = 0; j < data.cmn120GroupList.length; j++) {
                        var myGrpMdl = data.cmn120GroupList[j];
                        myGrpSelStr += "<option value=\""
                                    +  myGrpMdl.value
                                    +  "\">"
                                    +  myGrpMdl.label
                                    +  "</option>";
                    }
                    myGrpSelStr += "</select>";
                } else {
                    myGrpSelStr += "<input id=\"cmn120ChangeGrp\" type=\"hidden\" name=\"cmn120MyGroupSid\" value=\""
                                +  data.cmn120MyGroupSid
                                +  "\" />";
                    myGrpSelStr += "<span class=\"text_r1\">マイグループが作成されていません。</span>";
                }
                myGrpSelStr += "<input type=\"hidden\" name=\"cmn120groupSid\" value=\""
                            +  data.cmn120groupSid
                            +  "\" />";
            }

            //代表アカウント
            var deptAccountSelStr = "";
            if (data.cmn120DspKbn == 4) {

                deptAccountSelStr += "<input type=\"hidden\" name=\"cmn120groupSid\" value=\""
                                  +  data.cmn120groupSid
                                  +  "\" />";
                deptAccountSelStr += "<input type=\"hidden\" name=\"cmn120MyGroupSid\" value=\""
                                  +  data.cmn120MyGroupSid
                                  +  "\" />";
                if (data.cmn120GroupList.length == 0) {
                    deptAccountSelStr += "<span class=\"text_r1\">代表アカウントが作成されていません。</span>";
                }
            }

            atesakiSelStr += myGrpSelStr;
            atesakiSelStr += grpSelStr;
            atesakiSelStr += deptAccountSelStr;

            atesakiSelStr += "</td>"
                          +  "<td width=\"10%\" align=\"center\" valign=\"bottom\">"
                          +  "<input id=\"cmn120ChangeGrpBtn2\" type=\"button\" onclick=\"openGroupWindow(this.form.cmn120groupSid, 'cmn120groupSid', '0', 'changeGrp', '1', 'fakeButton')\" class=\"group_btn2\" value=\"&nbsp;&nbsp;\" id=\"cmn120GroupBtn\">"
                          +  "</td>"
                          +  "</tr>"
                          +  "<tr>"
                          +  "<td>";


            //グループ ユーザ 右
            var selUsrRightStr = "";
            selUsrRightStr += "<select id=\"cmn120SelectRightUser\" name=\"cmn120SelectRightUser\" multiple=\"multiple\" size=\"15\" class=\"select01\">";
            if (data.cmn120RightUserList.length > 0) {

                for (l = 0; l < data.cmn120RightUserList.length; l++) {
                    var selGrpMdl = data.cmn120RightUserList[l];
                    var mukouserClass = "";
                    if (selGrpMdl.usrUkoFlg == "1") {
                        mukouserClass = "mukouser_option"
                    }

                    selUsrRightStr += "<option class=\"" + mukouserClass + "\" value=\""
                                   +  selGrpMdl.value
                                   +  "\">"
                                   +  htmlEscape(selGrpMdl.label)
                                   +  "</option>";
                }
                selUsrRightStr += "<option value=\"-1\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>";
            }
            selUsrRightStr += "</select>";
            atesakiSelStr  += selUsrRightStr;


            atesakiSelStr += "</td>"
                          +  "<td align=\"center\">"
                          +  "<input type=\"button\" class=\"btn_base1add\" value=\"追加\" name=\"adduserBtn\" id=\"adduserBtn\">"
                          +  "<br><br>"
                          +  "<input type=\"button\" class=\"btn_base1del\" value=\"削除\" name=\"deluserBtn\" id=\"deluserBtn\">"
                          +  "<br>"
                          +  "</td>"
                          +  "<td align=\"center\">";


              //グループ ユーザ 左
              var selUsrLeftStr = "";
              selUsrLeftStr += "<select id=\"cmn120SelectLeftUser\" name=\"cmn120SelectLeftUser\" multiple=\"multiple\" size=\"15\" class=\"select01\">";
              if (data.cmn120LeftUserList.length > 0) {
                  for (m = 0; m < data.cmn120LeftUserList.length; m++) {
                      var selGrpLeftMdl = data.cmn120LeftUserList[m];
                      var mukouserClass = "";
                      if (selGrpLeftMdl.usrUkoFlg == "1") {
                          mukouserClass = "mukouser_option"
                      }

                      selUsrLeftStr += "<option class=\"" + mukouserClass + "\" value=\""
                                +  selGrpLeftMdl.value
                                +  "\">"
                                +  htmlEscape(selGrpLeftMdl.label)
                                +  "</option>";
                  }
                  selUsrLeftStr += "<option value=\"-1\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>";
              }

              selUsrLeftStr += "</select>";
              atesakiSelStr += selUsrLeftStr;

              atesakiSelStr += "</td>"
                            +  "</tr>"
                            +  "</table>"
                            +  "</td>"
                            +  "</tr>"
                            +  "</table>"
                            +  "<img src=\"../common/images/spacer.gif\" alt=\"\" height=\"10px\" width=\"10px\">"
                            +  "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">"
                            +  "<tr>"
                            +  "<td align=\"right\">"
                            +  "<input type=\"button\" id=\"sel_usr_pop_btn\" value=\"選択\" class=\"btn_base1\">"
                            +  "</td>"
                            +  "</tr>"
                            +  "</table>"
                            +  "</td>"
                            +  "</tr>"
                            +  "</table>"
                            +  "</td>"
                            +  "</tr>"
                            +  "</table>"
                            +  "</form>";

             $("#atesakiSelArea").children().remove();
             $("#atesakiSelArea").append(atesakiSelStr);

             if (data.cmn120DspKbn == 0 || data.cmn120DspKbn == 1) {
                 $('#cmn120ChangeGrpBtn').removeClass("display_none");
                 $('#cmn120ChangeGrpBtn2').removeClass("display_none");
                 $('#groupTab').removeClass("sel_group_notcheck");
                 $('#mygroupTab').addClass("sel_group_notcheck");
                 $('#deptAccountTab').addClass("sel_group_notcheck");
                 $('#cmn120DspKbn').val(1);
             } else if (data.cmn120DspKbn == 2) {
                 $('#cmn120ChangeGrpBtn').addClass("display_none");
                 $('#cmn120ChangeGrpBtn2').addClass("display_none");
                 $('#mygroupTab').removeClass("sel_group_notcheck");
                 $('#groupTab').addClass("sel_group_notcheck");
                 $('#deptAccountTab').addClass("sel_group_notcheck");
                 $('#cmn120DspKbn').val(2);
             } else if (data.cmn120DspKbn == 4) {
                 $('#cmn120ChangeGrpBtn').addClass("display_none");
                 $('#cmn120ChangeGrpBtn2').addClass("display_none");
                 $('#deptAccountTab').removeClass("sel_group_notcheck");
                 $('#groupTab').addClass("sel_group_notcheck");
                 $('#mygroupTab').addClass("sel_group_notcheck");
                 $('#cmn120DspKbn').val(4);
             }

             //コンボ設定
             if (data.cmn120DspKbn == 0 || data.cmn120DspKbn == 1) {
                 $("#cmn120ChangeGrp").val(data.cmn120groupSid);
             } else if (data.cmn120DspKbn == 2) {
                 $("#cmn120ChangeGrp").val(data.cmn120MyGroupSid);
             }

        } catch (ae) {
            alert(ae);
        }

    }).fail(function(data){
        alert('error');
    });

}

function drawPopUsr() {

    if ($('#funcBtnKbn').val() == 0) {
        $('.atesaki_to_user').remove();
        $('#cmn120SelectRightUser option').each(function(){

            if ($(this).val() != null && $(this).val() != 0 && $(this).val() != -1 && $(this).val() != "") {
                var mukouserClass = "";
                if ($(this).hasClass("mukouser_option")) {
                    mukouserClass = "mukouser"
                }
                $('#atesaki_to_area').append("<div class=\"atesaki_to_user\" id=\"0\"><span class=\"" + mukouserClass + "\">" + htmlEscape($(this).text())
                                                     + "</span><input type=\"hidden\" name=\"cir060selUserSid\" value=\""
                                                     + $(this).val()
                                                     + "\" />&nbsp;&nbsp;[<span class=\"add_usr_del\">削除</span>]</div>")
            }
        });
    }

    $('#atesakiSelPop').dialog('close');

}

function getFormData(formObj) {

    var formData = "";
    formData = formObj.serialize();

    return formData;
}

function htmlEscape(s){
    s=s.replace(/&/g,'&amp;');
    s=s.replace(/>/g,'&gt;');
    s=s.replace(/</g,'&lt;');
    return s;
}