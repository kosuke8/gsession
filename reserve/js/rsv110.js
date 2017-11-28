function moveFromDay(elmYear, elmMonth, elmDay, kbn) {

    systemDate = new Date();

    if (kbn == 2) {
        $(elmYear).val(convYear(systemDate.getYear()));
        $(elmMonth).val(systemDate.getMonth() + 1);
        $(elmDay).val(systemDate.getDate());
        setToDay();
        return;
    }

    if (kbn == 1 || kbn == 3) {

        var ymdf = escape(elmYear.value + '/' + elmMonth.value + "/" + elmDay.value);
        re = new RegExp(/(\d{4})\/(\d{1,2})\/(\d{1,2})/);
        if (ymdf.match(re)) {

            newDate = new Date(elmYear.value, elmMonth.value - 1, elmDay.value)

            if (kbn == 1) {
                newDate.setDate(newDate.getDate() - 1);
            } else if (kbn == 3) {
                newDate.setDate(newDate.getDate() + 1);
            }

            var newYear = convYear(newDate.getYear());
            var systemYear = convYear(systemDate.getYear());

            if (newYear < systemYear - 5 || newYear > systemYear + 5) {
                $(elmYear).val('');
            } else {
                $(elmYear).val(newYear);
            }
            $(elmMonth).val(newDate.getMonth() + 1);
            $(elmDay).val(newDate.getDate());

        } else {

            if (elmYear.value == '' && elmMonth.value == '' && elmDay.value == '') {
                $(elmYear).val(convYear(systemDate.getYear()));
                $(elmMonth).val(systemDate.getMonth() + 1);
                $(elmDay).val(systemDate.getDate());
            }
        }
    }

    setToDay();
}

function moveToDay(elmYear, elmMonth, elmDay, kbn) {

    systemDate = new Date();

    if (kbn == 2) {
        $(elmYear).val(convYear(systemDate.getYear()));
        $(elmMonth).val(systemDate.getMonth() + 1);
        $(elmDay).val(systemDate.getDate());
        setFromDay();
        return;
    }

    if (kbn == 1 || kbn == 3) {

        var ymdf = escape(elmYear.value + '/' + elmMonth.value + "/" + elmDay.value);
        re = new RegExp(/(\d{4})\/(\d{1,2})\/(\d{1,2})/);
        if (ymdf.match(re)) {

            newDate = new Date(elmYear.value, elmMonth.value - 1, elmDay.value)

            if (kbn == 1) {
                newDate.setDate(newDate.getDate() - 1);
            } else if (kbn == 3) {
                newDate.setDate(newDate.getDate() + 1);
            }

            var newYear = convYear(newDate.getYear());
            var systemYear = convYear(systemDate.getYear());

            if (newYear < systemYear - 5 || newYear > systemYear + 5) {
                $(elmYear).val('');
            } else {
                $(elmYear).val(newYear);
            }
            $(elmMonth).val(newDate.getMonth() + 1);
            $(elmDay).val(newDate.getDate());

        } else {

            if (elmYear.value == '' && elmMonth.value == '' && elmDay.value == '') {
                $(elmYear).val(convYear(systemDate.getYear()));
                $(elmMonth).val(systemDate.getMonth() + 1);
                $(elmDay).val(systemDate.getDate());
            }
        }
    }

    setFromDay();
}

function showOrHide(){
var rsv110HeaderDspFlg = document.forms[0].rsv110HeaderDspFlg.value;
  if (rsv110HeaderDspFlg == '0') {
    showText();
  } else {
    hideText();
  }
}

function showText(){
    $('#longHeader').show();
    $('#shortHeader').hide();
    document.forms[0].rsv110HeaderDspFlg.value='0';
}

function hideText(){
    $('#longHeader').hide();
    $('#shortHeader').show();
    document.forms[0].rsv110HeaderDspFlg.value='1';
}

function selectUsersList() {

    var flg = true;
   if (document.forms[0].rsv110SelectUsersKbn.checked) {
       flg = true;
   } else {
       flg = false;
   }
   oElements = document.getElementsByName("users_l");
   var defUserAry = document.forms[0].users_l.options;
   var defLength = defUserAry.length;
   for (i = defLength - 1; i >= 0; i--) {
       if (defUserAry[i].value != -1) {
           defUserAry[i].selected = flg;
       }
   }
}


$(function() {
    $("#syoninbtn").live("click", function(){
        $('#rsvApproval').dialog({
            autoOpen: true,
            bgiframe: true,
            resizable: false,
            width:350,
            height: 180,
            modal: true,
            closeOnEscape: false,
            overlay: {
                backgroundColor: '#000000',
                opacity: 0.5
            },
            buttons: {
                はい: function() {
                    document.forms[0].CMD.value = "rsvApprovalOk";
                    document.forms[0].submit();

                    $(this).dialog('close');
                },
                キャンセル: function() {
                  $(this).dialog('close');
                }
            }
        });
    });
    $('textarea').each(function() {
        setTextareaAutoResize($(this).get(0));
    });
});

$(function() {
    $("#kyakkabtn").live("click", function(){
        $('#rsvcheck').dialog({
            autoOpen: true,
            bgiframe: true,
            resizable: false,
            width:350,
            height: 180,
            modal: true,
            closeOnEscape: false,
            overlay: {
                backgroundColor: '#000000',
                opacity: 0.5
            },
            buttons: {
                はい: function() {
                    document.forms[0].CMD.value = "rsvRejectionOk";

                    if ($('#rejectDel').attr("checked")){
                        document.forms[0].rsv110rejectDel.value = 1;
                    }
                    document.forms[0].submit();

                    $(this).dialog('close');
                },
                キャンセル: function() {
                    //キャンセル時チェックボックスを外す
                    $('#rejectDel').attr("checked",false);
                  $(this).dialog('close');
                }
            }
        });
    });
});

$(function() {
    $("#waitbtn").live("click", function(){
        $('#rsvWait').dialog({
            autoOpen: true,
            bgiframe: true,
            resizable: false,
            width:350,
            height: 180,
            modal: true,
            closeOnEscape: false,
            overlay: {
                backgroundColor: '#000000',
                opacity: 0.5
            },
            buttons: {
                はい: function() {
                    document.forms[0].CMD.value = "rsvWaitOk";
                    document.forms[0].submit();

                    $(this).dialog('close');
                },
                キャンセル: function() {
                  $(this).dialog('close');
                }
            }
        });
    });
    $('textarea').each(function() {
        setTextareaAutoResize($(this).get(0));
    });
});

//午前
function setAmTime() {
  var frHour = $(':hidden[name="rsv110AmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110AmFrMin"]').val();
  var toHour = $(':hidden[name="rsv110AmToHour"]').val();
  var toMinute = $(':hidden[name="rsv110AmToMin"]').val();

  $("#rsv110FrHour").val(parseInt(frHour));
  $("#rsv110FrMin").val(parseInt(frMinute));
  $("#rsv110ToHour").val(parseInt(toHour));
  $("#rsv110ToMin").val(parseInt(toMinute));
}

//午後
function setPmTime() {
  var frHour = $(':hidden[name="rsv110PmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110PmFrMin"]').val();
  var toHour = $(':hidden[name="rsv110PmToHour"]').val();
  var toMinute = $(':hidden[name="rsv110PmToMin"]').val();

  $("#rsv110FrHour").val(parseInt(frHour));
  $("#rsv110FrMin").val(parseInt(frMinute));
  $("#rsv110ToHour").val(parseInt(toHour));
  $("#rsv110ToMin").val(parseInt(toMinute));
}

//終日
function setAllTime() {
  var frHour = $(':hidden[name="rsv110AllDayFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110AllDayFrMin"]').val();
  var toHour = $(':hidden[name="rsv110AllDayToHour"]').val();
  var toMinute = $(':hidden[name="rsv110AllDayToMin"]').val();

  $("#rsv110FrHour").val(parseInt(frHour));
  $("#rsv110FrMin").val(parseInt(frMinute));
  $("#rsv110ToHour").val(parseInt(toHour));
  $("#rsv110ToMin").val(parseInt(toMinute));
}

function setFromDay() {

    var frYear = document.forms[0].rsv110SelectedYearFr.value;
    var frMonth = document.forms[0].rsv110SelectedMonthFr.value;
    var frDay = document.forms[0].rsv110SelectedDayFr.value;
    var frHour = document.forms[0].rsv110FrHour.value;
    var frMinute = document.forms[0].rsv110FrMin.value;
    var toYear = document.forms[0].rsv110SelectedYearTo.value;
    var toMonth = document.forms[0].rsv110SelectedMonthTo.value;
    var toDay = document.forms[0].rsv110SelectedDayTo.value;
    var toHour = document.forms[0].rsv110ToHour.value;
    var toMinute = document.forms[0].rsv110ToMin.value;
    var toMinute = document.forms[0].rsv110ToMin.value;
    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        frYear = toYear;
        frMonth = toMonth;
        frDay = toDay;
        document.forms[0].rsv110SelectedYearFr.value = toYear;
        document.forms[0].rsv110SelectedMonthFr.value = toMonth;
        document.forms[0].rsv110SelectedDayFr.value = toDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            frMonth = toMonth;
            frDay = toDay;
            document.forms[0].rsv110SelectedMonthFr.value = toMonth;
            document.forms[0].rsv110SelectedDayFr.value = toDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                frDay = toDay;
                document.forms[0].rsv110SelectedDayFr.value = toDay;
            }

            if (parseInt(frDay) == parseInt(toDay)) {
                daySameFlg = true;
            }
        }
    }

    if (parseInt(frHour) > -1
     && parseInt(toHour) > -1
     && parseInt(frMinute) > -1
     && parseInt(toMinute) > -1) {

        if (daySameFlg) {

            if (parseInt(frHour) > parseInt(toHour)) {
                frHour = toHour;
                document.forms[0].rsv110FrHour.value = toHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv110FrMin.value = toMinute;
                }
            }
        }
    }
}

function setToDay() {

    var frYear = document.forms[0].rsv110SelectedYearFr.value;
    var frMonth = document.forms[0].rsv110SelectedMonthFr.value;
    var frDay = document.forms[0].rsv110SelectedDayFr.value;
    var frHour = document.forms[0].rsv110FrHour.value;
    var frMinute = document.forms[0].rsv110FrMin.value;
    var toYear = document.forms[0].rsv110SelectedYearTo.value;
    var toMonth = document.forms[0].rsv110SelectedMonthTo.value;
    var toDay = document.forms[0].rsv110SelectedDayTo.value;
    var toHour = document.forms[0].rsv110ToHour.value;
    var toMinute = document.forms[0].rsv110ToMin.value;
    var toMinute = document.forms[0].rsv110ToMin.value;
    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        toYear = frYear;
        toMonth = frMonth;
        toDay = frDay;
        document.forms[0].rsv110SelectedYearTo.value = frYear;
        document.forms[0].rsv110SelectedMonthTo.value = frMonth;
        document.forms[0].rsv110SelectedDayTo.value = frDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            toMonth = frMonth;
            toDay = frDay;
            document.forms[0].rsv110SelectedMonthTo.value = frMonth;
            document.forms[0].rsv110SelectedDayTo.value = frDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                toDay = frDay;
                document.forms[0].rsv110SelectedDayTo.value = frDay;
            }

            if (parseInt(frDay) == parseInt(toDay)) {
                daySameFlg = true;
            }
        }
    }

    if (parseInt(frHour) > -1
     && parseInt(toHour) > -1
     && parseInt(frMinute) > -1
     && parseInt(toMinute) > -1) {

        if (daySameFlg) {

            if (parseInt(frHour) > parseInt(toHour)) {
                toHour = frHour;
                document.forms[0].rsv110ToHour.value = frHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv110ToMin.value = frMinute;
                }
            }
        }
    }
}
