function setDisabled(value) {

    if (document.forms[0].rsv111RsrKbn[1].checked == true) {
        document.forms[0].rsv111RsrDweek1.disabled=false;
        document.forms[0].rsv111RsrDweek2.disabled=false;
        document.forms[0].rsv111RsrDweek3.disabled=false;
        document.forms[0].rsv111RsrDweek4.disabled=false;
        document.forms[0].rsv111RsrDweek5.disabled=false;
        document.forms[0].rsv111RsrDweek6.disabled=false;
        document.forms[0].rsv111RsrDweek7.disabled=false;
        document.forms[0].rsv111RsrTranKbn[0].disabled=false;
        document.forms[0].rsv111RsrTranKbn[1].disabled=false;
        document.forms[0].rsv111RsrTranKbn[2].disabled=false;
        document.forms[0].rsv111RsrWeek.disabled=true;
        document.forms[0].rsv111RsrDay.disabled=true;
        document.forms[0].rsv111RsrWeek.value=0;
        document.forms[0].rsv111RsrDay.value=0;
        document.forms[0].rsv111RsrMonthOfYearly.disabled=true;
        document.forms[0].rsv111RsrDayOfYearly.disabled=true;

    } else if (document.forms[0].rsv111RsrKbn[2].checked == true) {
        document.forms[0].rsv111RsrDweek1.disabled=false;
        document.forms[0].rsv111RsrDweek2.disabled=false;
        document.forms[0].rsv111RsrDweek3.disabled=false;
        document.forms[0].rsv111RsrDweek4.disabled=false;
        document.forms[0].rsv111RsrDweek5.disabled=false;
        document.forms[0].rsv111RsrDweek6.disabled=false;
        document.forms[0].rsv111RsrDweek7.disabled=false;
        document.forms[0].rsv111RsrTranKbn[0].disabled=false;
        document.forms[0].rsv111RsrTranKbn[1].disabled=false;
        document.forms[0].rsv111RsrTranKbn[2].disabled=false;
        document.forms[0].rsv111RsrWeek.disabled=false;
        document.forms[0].rsv111RsrDay.disabled=false;
        document.forms[0].rsv111RsrMonthOfYearly.disabled=true;
        document.forms[0].rsv111RsrDayOfYearly.disabled=true;

        if (document.forms[0].rsv111RsrWeek.value==0) {
            document.forms[0].rsv111RsrDweek1.disabled=true;
            document.forms[0].rsv111RsrDweek2.disabled=true;
            document.forms[0].rsv111RsrDweek3.disabled=true;
            document.forms[0].rsv111RsrDweek4.disabled=true;
            document.forms[0].rsv111RsrDweek5.disabled=true;
            document.forms[0].rsv111RsrDweek6.disabled=true;
            document.forms[0].rsv111RsrDweek7.disabled=true;
        } else {
            document.forms[0].rsv111RsrDweek1.disabled=false;
            document.forms[0].rsv111RsrDweek2.disabled=false;
            document.forms[0].rsv111RsrDweek3.disabled=false;
            document.forms[0].rsv111RsrDweek4.disabled=false;
            document.forms[0].rsv111RsrDweek5.disabled=false;
            document.forms[0].rsv111RsrDweek6.disabled=false;
            document.forms[0].rsv111RsrDweek7.disabled=false;
        }
    } else if (document.forms[0].rsv111RsrKbn[3].checked == true) {
        document.forms[0].rsv111RsrDweek1.disabled=true;
        document.forms[0].rsv111RsrDweek2.disabled=true;
        document.forms[0].rsv111RsrDweek3.disabled=true;
        document.forms[0].rsv111RsrDweek4.disabled=true;
        document.forms[0].rsv111RsrDweek5.disabled=true;
        document.forms[0].rsv111RsrDweek6.disabled=true;
        document.forms[0].rsv111RsrDweek7.disabled=true;
        document.forms[0].rsv111RsrWeek.disabled=true;
        document.forms[0].rsv111RsrDay.disabled=true;
        document.forms[0].rsv111RsrTranKbn.disabled=true;
        document.forms[0].rsv111RsrDweek1.checked=false;
        document.forms[0].rsv111RsrDweek2.checked=false;
        document.forms[0].rsv111RsrDweek3.checked=false;
        document.forms[0].rsv111RsrDweek4.checked=false;
        document.forms[0].rsv111RsrDweek5.checked=false;
        document.forms[0].rsv111RsrDweek6.checked=false;
        document.forms[0].rsv111RsrDweek7.checked=false;
        document.forms[0].rsv111RsrWeek.value=0;
        document.forms[0].rsv111RsrDay.value=0;
        document.forms[0].rsv111RsrMonthOfYearly.disabled=false;
        document.forms[0].rsv111RsrDayOfYearly.disabled=false;
        document.forms[0].rsv111RsrTranKbn[0].disabled=false;
        document.forms[0].rsv111RsrTranKbn[1].disabled=false;
        document.forms[0].rsv111RsrTranKbn[2].disabled=false;
    } else {
        document.forms[0].rsv111RsrDweek1.disabled=true;
        document.forms[0].rsv111RsrDweek2.disabled=true;
        document.forms[0].rsv111RsrDweek3.disabled=true;
        document.forms[0].rsv111RsrDweek4.disabled=true;
        document.forms[0].rsv111RsrDweek5.disabled=true;
        document.forms[0].rsv111RsrDweek6.disabled=true;
        document.forms[0].rsv111RsrDweek7.disabled=true;
        document.forms[0].rsv111RsrTranKbn[0].disabled=true;
        document.forms[0].rsv111RsrTranKbn[1].disabled=true;
        document.forms[0].rsv111RsrTranKbn[2].disabled=true;
        document.forms[0].rsv111RsrWeek.disabled=true;
        document.forms[0].rsv111RsrDay.disabled=true;
        document.forms[0].rsv111RsrTranKbn.disabled=true;
        document.forms[0].rsv111RsrDweek1.checked=false;
        document.forms[0].rsv111RsrDweek2.checked=false;
        document.forms[0].rsv111RsrDweek3.checked=false;
        document.forms[0].rsv111RsrDweek4.checked=false;
        document.forms[0].rsv111RsrDweek5.checked=false;
        document.forms[0].rsv111RsrDweek6.checked=false;
        document.forms[0].rsv111RsrDweek7.checked=false;
        document.forms[0].rsv111RsrWeek.value=0;
        document.forms[0].rsv111RsrDay.value=0;
        document.forms[0].rsv111RsrMonthOfYearly.disabled=true;
        document.forms[0].rsv111RsrDayOfYearly.disabled=true;
        document.forms[0].rsv111RsrTranKbn[0].checked=true;
        document.forms[0].rsv111RsrTranKbn[1].checked=false;
        document.forms[0].rsv111RsrTranKbn[2].checked=false;
    }

}

function changeWeekCombo(){
    if (document.forms[0].rsv111RsrKbn[2].checked == true) {
        if (document.forms[0].rsv111RsrWeek.value==0) {
            document.forms[0].rsv111RsrDweek1.disabled=true;
            document.forms[0].rsv111RsrDweek2.disabled=true;
            document.forms[0].rsv111RsrDweek3.disabled=true;
            document.forms[0].rsv111RsrDweek4.disabled=true;
            document.forms[0].rsv111RsrDweek5.disabled=true;
            document.forms[0].rsv111RsrDweek6.disabled=true;
            document.forms[0].rsv111RsrDweek7.disabled=true;
            document.forms[0].rsv111RsrDweek1.checked=false;
            document.forms[0].rsv111RsrDweek2.checked=false;
            document.forms[0].rsv111RsrDweek3.checked=false;
            document.forms[0].rsv111RsrDweek4.checked=false;
            document.forms[0].rsv111RsrDweek5.checked=false;
            document.forms[0].rsv111RsrDweek6.checked=false;
            document.forms[0].rsv111RsrDweek7.checked=false;
        } else {
            document.forms[0].rsv111RsrDweek1.disabled=false;
            document.forms[0].rsv111RsrDweek2.disabled=false;
            document.forms[0].rsv111RsrDweek3.disabled=false;
            document.forms[0].rsv111RsrDweek4.disabled=false;
            document.forms[0].rsv111RsrDweek5.disabled=false;
            document.forms[0].rsv111RsrDweek6.disabled=false;
            document.forms[0].rsv111RsrDweek7.disabled=false;
        }
    }
}

function moveFromDay(elmYear, elmMonth, elmDay, kbn) {

    systemDate = new Date();

    //「今日」ボタン押下
    if (kbn == 2) {
        $(elmYear).val(convYear(systemDate.getYear()));
        $(elmMonth).val(systemDate.getMonth() + 1);
        $(elmDay).val(systemDate.getDate());
        setToDay();
        return;
    }

    //「前日」or 「翌日」ボタン押下
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

    //「今日」ボタン押下
    if (kbn == 2) {
        $(elmYear).val(convYear(systemDate.getYear()));
        $(elmMonth).val(systemDate.getMonth() + 1);
        $(elmDay).val(systemDate.getDate());
        setFromDay();
        return;
    }

    //「前日」or 「翌日」ボタン押下
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
var rsv111HeaderDspFlg = document.forms[0].rsv111HeaderDspFlg.value;
  if (rsv111HeaderDspFlg == '0') {
    showText();
  } else {
    hideText();
  }
}

function showText(){
    $('#longHeader').show();
    $('#shortHeader').hide();
    document.forms[0].rsv111HeaderDspFlg.value='0';
}

function hideText(){
    $('#longHeader').hide();
    $('#shortHeader').show();
    document.forms[0].rsv111HeaderDspFlg.value='1';
}

function selectUsersList() {

    var flg = true;
   if (document.forms[0].rsv111SelectUsersKbn.checked) {
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


//午前
function setAmTime() {
  var frHour = $(':hidden[name="rsv110AmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110AmFrMin"]').val();
  var toHour = $(':hidden[name="rsv110AmToHour"]').val();
  var toMinute = $(':hidden[name="rsv110AmToMin"]').val();

  $("#rsv111FrHour").val(parseInt(frHour));
  $("#rsv111FrMin").val(parseInt(frMinute));
  $("#rsv111ToHour").val(parseInt(toHour));
  $("#rsv111ToMin").val(parseInt(toMinute));
}

//午後
function setPmTime() {
  var frHour = $(':hidden[name="rsv110PmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110PmFrMin"]').val();
  var toHour = $(':hidden[name="rsv110PmToHour"]').val();
  var toMinute = $(':hidden[name="rsv110PmToMin"]').val();

  $("#rsv111FrHour").val(parseInt(frHour));
  $("#rsv111FrMin").val(parseInt(frMinute));
  $("#rsv111ToHour").val(parseInt(toHour));
  $("#rsv111ToMin").val(parseInt(toMinute));
}

//終日
function setAllTime() {
  var frHour = $(':hidden[name="rsv110AllDayFrHour"]').val();
  var frMinute = $(':hidden[name="rsv110AllDayFrMin"]').val();
  var toHour = $(':hidden[name="rsv110AllDayToHour"]').val();
  var toMinute = $(':hidden[name="rsv110AllDayToMin"]').val();

  $("#rsv111FrHour").val(parseInt(frHour));
  $("#rsv111FrMin").val(parseInt(frMinute));
  $("#rsv111ToHour").val(parseInt(toHour));
  $("#rsv111ToMin").val(parseInt(toMinute));
}

function setFromDay() {

    var frYear = document.forms[0].rsv111RsrDateYearFr.value;
    var frMonth = document.forms[0].rsv111RsrDateMonthFr.value;
    var frDay = document.forms[0].rsv111RsrDateDayFr.value;
    var frHour = document.forms[0].rsv111FrHour.value;
    var frMinute = document.forms[0].rsv111FrMin.value;
    var toYear = document.forms[0].rsv111RsrDateYearTo.value;
    var toMonth = document.forms[0].rsv111RsrDateMonthTo.value;
    var toDay = document.forms[0].rsv111RsrDateDayTo.value;
    var toHour = document.forms[0].rsv111ToHour.value;
    var toMinute = document.forms[0].rsv111ToMin.value;
    var toMinute = document.forms[0].rsv111ToMin.value;
    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        frYear = toYear;
        frMonth = toMonth;
        frDay = toDay;
        document.forms[0].rsv111RsrDateYearFr.value = toYear;
        document.forms[0].rsv111RsrDateMonthFr.value = toMonth;
        document.forms[0].rsv111RsrDateDayFr.value = toDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            frMonth = toMonth;
            frDay = toDay;
            document.forms[0].rsv111RsrDateMonthFr.value = toMonth;
            document.forms[0].rsv111RsrDateDayFr.value = toDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                frDay = toDay;
                document.forms[0].rsv111RsrDateDayFr.value = toDay;
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
                document.forms[0].rsv111FrHour.value = frHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv111FrMin.value = toMinute;
                }
            }
        }
    }
}

function setToDay() {

    var frYear = document.forms[0].rsv111RsrDateYearFr.value;
    var frMonth = document.forms[0].rsv111RsrDateMonthFr.value;
    var frDay = document.forms[0].rsv111RsrDateDayFr.value;
    var frHour = document.forms[0].rsv111FrHour.value;
    var frMinute = document.forms[0].rsv111FrMin.value;
    var toYear = document.forms[0].rsv111RsrDateYearTo.value;
    var toMonth = document.forms[0].rsv111RsrDateMonthTo.value;
    var toDay = document.forms[0].rsv111RsrDateDayTo.value;
    var toHour = document.forms[0].rsv111ToHour.value;
    var toMinute = document.forms[0].rsv111ToMin.value;
    var toMinute = document.forms[0].rsv111ToMin.value;
    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        toYear = frYear;
        toMonth = frMonth;
        toDay = frDay;
        document.forms[0].rsv111RsrDateYearTo.value = frYear;
        document.forms[0].rsv111RsrDateMonthTo.value = frMonth;
        document.forms[0].rsv111RsrDateDayTo.value = frDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            toMonth = frMonth;
            toDay = frDay;
            document.forms[0].rsv111RsrDateMonthTo.value = frMonth;
            document.forms[0].rsv111RsrDateDayTo.value = frDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                toDay = frDay;
                document.forms[0].rsv111RsrDateDayTo.value = frDay;
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
                document.forms[0].rsv111ToHour.value = frHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv111ToMin.value = frMinute;
                }
            }
        }
    }
}

function setFromTime() {
    var frHour = document.forms[0].rsv111RsrTimeHourFr.value;
    var frMin = document.forms[0].rsv111RsrTimeMinuteFr.value;
    var toHour = document.forms[0].rsv111RsrTimeHourTo.value;
    var toMin = document.forms[0].rsv111RsrTimeMinuteTo.value;

    if(parseInt(frHour) > -1
        && parseInt(frMin) > -1
        && parseInt(toHour) > -1
        && parseInt(toMin) > -1) {

      if (parseInt(frHour) > parseInt(toHour)) {
          frHour = toHour;
          document.forms[0].rsv111RsrTimeHourFr.value = toHour;
      }

      if (parseInt(frHour) == parseInt(toHour)) {
        if(parseInt(frMin) > parseInt(toMin)) {
          document.forms[0].rsv111RsrTimeMinuteFr.value = toMin;
        }
      }
    }
}

function setToTime() {
    var frHour = document.forms[0].rsv111RsrTimeHourFr.value;
    var frMin = document.forms[0].rsv111RsrTimeMinuteFr.value;
    var toHour = document.forms[0].rsv111RsrTimeHourTo.value;
    var toMin = document.forms[0].rsv111RsrTimeMinuteTo.value;

    if(parseInt(frHour) > -1
            && parseInt(frMin) > -1
            && parseInt(toHour) > -1
            && parseInt(toMin) > -1) {

      if (parseInt(frHour) > parseInt(toHour)) {
          toHour = frHour;
          document.forms[0].rsv111RsrTimeHourTo.value = frHour;
      }

      if (parseInt(frHour) == parseInt(toHour)) {
        if(parseInt(frMin) > parseInt(toMin)) {
          document.forms[0].rsv111RsrTimeMinuteTo.value = frMin;
        }
      }
    }
}