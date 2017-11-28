function buttonPush(cmd, mod){
    document.forms[0].CMD.value=cmd;
    document.forms[0].cmd.value=mod;
    document.forms[0].submit();
    return false;
}
function changeGroupCombo(cmd){
    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

function moveUser(cmd){
    document.forms[0].CMD.value=cmd;
    document.forms[0].submit();
    return false;
}

function setDisabled(value) {

    if (document.forms[0].sch040ScrollFlg.value=='1') {
        window.location.hash='add_user';
    }

    if (document.forms[0].sch041ExtKbn[1].checked == true) {
        document.forms[0].sch041Dweek[0].disabled=false;
        document.forms[0].sch041Dweek[1].disabled=false;
        document.forms[0].sch041Dweek[2].disabled=false;
        document.forms[0].sch041Dweek[3].disabled=false;
        document.forms[0].sch041Dweek[4].disabled=false;
        document.forms[0].sch041Dweek[5].disabled=false;
        document.forms[0].sch041Dweek[6].disabled=false;
        document.forms[0].sch041TranKbn[0].disabled=false;
        document.forms[0].sch041TranKbn[1].disabled=false;
        document.forms[0].sch041TranKbn[2].disabled=false;
        document.forms[0].sch041TranKbn[3].disabled=false;
        document.forms[0].sch041Week.disabled=true;
        document.forms[0].sch041Day.disabled=true;
        document.forms[0].sch041Week.value=0;
        document.forms[0].sch041Day.value=0;
        document.forms[0].sch041MonthOfYearly.disabled=true;
        document.forms[0].sch041DayOfYearly.disabled=true;

    } else if (document.forms[0].sch041ExtKbn[2].checked == true) {
        document.forms[0].sch041Dweek[0].disabled=false;
        document.forms[0].sch041Dweek[1].disabled=false;
        document.forms[0].sch041Dweek[2].disabled=false;
        document.forms[0].sch041Dweek[3].disabled=false;
        document.forms[0].sch041Dweek[4].disabled=false;
        document.forms[0].sch041Dweek[5].disabled=false;
        document.forms[0].sch041Dweek[6].disabled=false;
        document.forms[0].sch041TranKbn[0].disabled=false;
        document.forms[0].sch041TranKbn[1].disabled=false;
        document.forms[0].sch041TranKbn[2].disabled=false;
        document.forms[0].sch041TranKbn[3].disabled=false;
        document.forms[0].sch041Week.disabled=false;
        document.forms[0].sch041Day.disabled=false;
        document.forms[0].sch041MonthOfYearly.disabled=true;
        document.forms[0].sch041DayOfYearly.disabled=true;

        if (document.forms[0].sch041Week.value==0) {
            document.forms[0].sch041Dweek[0].disabled=true;
            document.forms[0].sch041Dweek[1].disabled=true;
            document.forms[0].sch041Dweek[2].disabled=true;
            document.forms[0].sch041Dweek[3].disabled=true;
            document.forms[0].sch041Dweek[4].disabled=true;
            document.forms[0].sch041Dweek[5].disabled=true;
            document.forms[0].sch041Dweek[6].disabled=true;
            document.forms[0].sch041Dweek[0].checked=false;
            document.forms[0].sch041Dweek[1].checked=false;
            document.forms[0].sch041Dweek[2].checked=false;
            document.forms[0].sch041Dweek[3].checked=false;
            document.forms[0].sch041Dweek[4].checked=false;
            document.forms[0].sch041Dweek[5].checked=false;
            document.forms[0].sch041Dweek[6].checked=false;
        } else {
            document.forms[0].sch041Dweek[0].disabled=false;
            document.forms[0].sch041Dweek[1].disabled=false;
            document.forms[0].sch041Dweek[2].disabled=false;
            document.forms[0].sch041Dweek[3].disabled=false;
            document.forms[0].sch041Dweek[4].disabled=false;
            document.forms[0].sch041Dweek[5].disabled=false;
            document.forms[0].sch041Dweek[6].disabled=false;
        }
    } else if (document.forms[0].sch041ExtKbn[3].checked == true) {
        document.forms[0].sch041TranKbn[0].disabled=false;
        document.forms[0].sch041TranKbn[1].disabled=false;
        document.forms[0].sch041TranKbn[2].disabled=false;
        document.forms[0].sch041TranKbn[3].disabled=false;
        document.forms[0].sch041Week.disabled=true;
        document.forms[0].sch041Day.disabled=true;
        document.forms[0].sch041MonthOfYearly.disabled=false;
        document.forms[0].sch041DayOfYearly.disabled=false;

        document.forms[0].sch041Dweek[0].disabled=true;
        document.forms[0].sch041Dweek[1].disabled=true;
        document.forms[0].sch041Dweek[2].disabled=true;
        document.forms[0].sch041Dweek[3].disabled=true;
        document.forms[0].sch041Dweek[4].disabled=true;
        document.forms[0].sch041Dweek[5].disabled=true;
        document.forms[0].sch041Dweek[6].disabled=true;
        document.forms[0].sch041Dweek[0].checked=false;
        document.forms[0].sch041Dweek[1].checked=false;
        document.forms[0].sch041Dweek[2].checked=false;
        document.forms[0].sch041Dweek[3].checked=false;
        document.forms[0].sch041Dweek[4].checked=false;
        document.forms[0].sch041Dweek[5].checked=false;
        document.forms[0].sch041Dweek[6].checked=false;
    } else {
        document.forms[0].sch041Dweek[0].disabled=true;
        document.forms[0].sch041Dweek[1].disabled=true;
        document.forms[0].sch041Dweek[2].disabled=true;
        document.forms[0].sch041Dweek[3].disabled=true;
        document.forms[0].sch041Dweek[4].disabled=true;
        document.forms[0].sch041Dweek[5].disabled=true;
        document.forms[0].sch041Dweek[6].disabled=true;
        document.forms[0].sch041TranKbn[0].disabled=false;
        document.forms[0].sch041TranKbn[1].disabled=false;
        document.forms[0].sch041TranKbn[2].disabled=true;
        document.forms[0].sch041TranKbn[3].disabled=true;
        document.forms[0].sch041Week.disabled=true;
        document.forms[0].sch041Day.disabled=true;
        document.forms[0].sch041TranKbn.disabled=true;
        document.forms[0].sch041Dweek[0].checked=false;
        document.forms[0].sch041Dweek[1].checked=false;
        document.forms[0].sch041Dweek[2].checked=false;
        document.forms[0].sch041Dweek[3].checked=false;
        document.forms[0].sch041Dweek[4].checked=false;
        document.forms[0].sch041Dweek[5].checked=false;
        document.forms[0].sch041Dweek[6].checked=false;
        document.forms[0].sch041Week.value=0;
        document.forms[0].sch041Day.value=0;
        document.forms[0].sch041MonthOfYearly.disabled=true;
        document.forms[0].sch041DayOfYearly.disabled=true;
        if (document.forms[0].sch041TranKbn[2].checked == true || document.forms[0].sch041TranKbn[3].checked) {
          document.forms[0].sch041TranKbn[1].checked=true;
        }
    }

}

function changeWeekCombo(cmd){
    if (document.forms[0].sch041ExtKbn[2].checked == true) {
        if (document.forms[0].sch041Week.value==0) {
            document.forms[0].sch041Dweek[0].disabled=true;
            document.forms[0].sch041Dweek[1].disabled=true;
            document.forms[0].sch041Dweek[2].disabled=true;
            document.forms[0].sch041Dweek[3].disabled=true;
            document.forms[0].sch041Dweek[4].disabled=true;
            document.forms[0].sch041Dweek[5].disabled=true;
            document.forms[0].sch041Dweek[6].disabled=true;
            document.forms[0].sch041Dweek[0].checked=false;
            document.forms[0].sch041Dweek[1].checked=false;
            document.forms[0].sch041Dweek[2].checked=false;
            document.forms[0].sch041Dweek[3].checked=false;
            document.forms[0].sch041Dweek[4].checked=false;
            document.forms[0].sch041Dweek[5].checked=false;
            document.forms[0].sch041Dweek[6].checked=false;
        } else {
            document.forms[0].sch041Dweek[0].disabled=false;
            document.forms[0].sch041Dweek[1].disabled=false;
            document.forms[0].sch041Dweek[2].disabled=false;
            document.forms[0].sch041Dweek[3].disabled=false;
            document.forms[0].sch041Dweek[4].disabled=false;
            document.forms[0].sch041Dweek[5].disabled=false;
            document.forms[0].sch041Dweek[6].disabled=false;
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

function changeTimeStatus() {

        //時間指定無し
        if (document.forms[0].sch041TimeKbn.checked) {

            //施設予約チェック
            oElements = document.getElementsByName("sch041SvReserve");
            if (oElements.length > 0) {
                if (window.confirm(msglist.cantRsv + "\r\n" + msglist.delRsv)) {
                    //施設予約を解除にする
                    var defValue = document.forms[0].sch041Reserve_r.value;
                    var defGroupAry = document.forms[0].sch041Reserve_r.options;
                    var defLength = defGroupAry.length;
                    for (i = defLength - 1; i >= 0; i--) {
                        if (defGroupAry[i].value != -1) {
                            defGroupAry[i].selected = true;
                        }
                    }
                    moveUser('041_res_leftarrow');

                } else {
                    document.forms[0].sch041TimeKbn.checked = false;
                }
            } else {
                //施設予約を無効
                setReserveInactive();
            }

       } else {
            //施設予約を有効
            setReserveActive();
       }
       setTimeStatus();
}
function setTimeStatus() {

        //時間指定無し
        if (document.forms[0].sch041TimeKbn.checked) {

            //開始時刻
            document.forms[0].sch041FrHour.disabled=true;
            document.forms[0].sch041FrMin.disabled=true;

            //終了時刻
            document.forms[0].sch041ToHour.disabled=true;
            document.forms[0].sch041ToMin.disabled=true;

            //時間マスタ
            $('.time_master').addClass('time_maste_none');

            //施設予約を無効
            setReserveInactive();

       } else {
            //開始時刻
            document.forms[0].sch041FrHour.disabled=false;
            document.forms[0].sch041FrMin.disabled=false;

            //終了時刻
            document.forms[0].sch041ToHour.disabled=false;
            document.forms[0].sch041ToMin.disabled=false;

            //時間マスタ
            $('.time_master').removeClass('time_maste_none');

            //施設予約を有効
            setReserveActive();
       }
}

function setReserveActive() {
    var cmd = document.forms[0].cmd.value;
    var timeKbn = document.forms[0].sch041TimeKbn.value;
    if (document.forms[0].reservePluginKbn.value == 0) {
        if (cmd != 'add') {
//            document.forms[0].sch041ResBatchRef[0].disabled=false;
//            document.forms[0].sch041ResBatchRef[1].disabled=false;
        }
        //施設予約を有効
        document.forms[0].addresBtn.disabled=false;
        document.forms[0].addresBtn.style.color = '#000066';
        document.forms[0].delresBtn.disabled=false;
        document.forms[0].delresBtn.style.color = '#000066';
        document.forms[0].sch041ReserveGroupSid.disabled=false;
        document.forms[0].sch041Reserve_r.disabled=false;
        document.forms[0].sch041Reserve_r.style.backgroundColor = '#ffffff';
        document.forms[0].sch041Reserve_l.disabled=false;
        document.forms[0].sch041Reserve_l.style.backgroundColor = '#ffffff';
    }
}

function setReserveInactive() {
    var cmd = document.forms[0].cmd.value;
    var timeKbn = document.forms[0].sch041TimeKbn.value;

    if (document.forms[0].reservePluginKbn.value == 0) {
        if (cmd != 'add') {
//            document.forms[0].sch041ResBatchRef[0].disabled=true;
//            document.forms[0].sch041ResBatchRef[1].disabled=true;
        }
        //施設予約を無効
        document.forms[0].addresBtn.disabled=true;
        document.forms[0].addresBtn.style.color = '#e0e0e0';
        document.forms[0].delresBtn.disabled=true;
        document.forms[0].delresBtn.style.color = '#e0e0e0';
        document.forms[0].sch041ReserveGroupSid.disabled=true;
        document.forms[0].sch041Reserve_r.disabled=true;
        document.forms[0].sch041Reserve_r.style.backgroundColor = '#e0e0e0';
        document.forms[0].sch041Reserve_l.disabled=true;
        document.forms[0].sch041Reserve_l.style.backgroundColor = '#e0e0e0';
    }
}

function selectUsersList() {

    var flg = true;
   if (document.forms[0].sch041SelectUsersKbn.checked) {
       flg = true;
   } else {
       flg = false;
   }
   oElements = document.getElementsByName("sch041users_l");
   var defUserAry = document.forms[0].sch041users_l.options;
   var defLength = defUserAry.length;
   for (i = defLength - 1; i >= 0; i--) {
       if (defUserAry[i].value != -1) {
           defUserAry[i].selected = flg;
       }
   }
}
function selectResList() {

    var flg = true;
   if (document.forms[0].sch041SelectResKbn.checked) {
       flg = true;
   } else {
       flg = false;
   }
   oElements = document.getElementsByName("sch041Reserve_l");
   var defResAry = document.forms[0].sch041Reserve_l.options;
   var defLength = defResAry.length;
   for (i = defLength - 1; i >= 0; i--) {
       if (defResAry[i].value != -1) {
           defResAry[i].selected = flg;
       }
   }
}

function deleteCompany(companyId, companyBaseId) {
    document.forms['sch041Form'].CMD.value = 'deleteCompany';
    document.forms['sch041Form'].sch041delCompanyId.value = companyId;
    document.forms['sch041Form'].sch041delCompanyBaseId.value = companyBaseId;
    document.forms['sch041Form'].submit();
    return false;
}

//午前
function setAmTime() {
  $("#sch041FrHour").val($(':hidden[name="sch040AmFrHour"]').val());
  $("#sch041FrMin").val($(':hidden[name="sch040AmFrMin"]').val());
  $("#sch041ToHour").val($(':hidden[name="sch040AmToHour"]').val());
  $("#sch041ToMin").val($(':hidden[name="sch040AmToMin"]').val());
}

//午後
function setPmTime() {
  $("#sch041FrHour").val($(':hidden[name="sch040PmFrHour"]').val());
  $("#sch041FrMin").val($(':hidden[name="sch040PmFrMin"]').val());
  $("#sch041ToHour").val($(':hidden[name="sch040PmToHour"]').val());
  $("#sch041ToMin").val($(':hidden[name="sch040PmToMin"]').val());
}

//終日
function setAllTime() {
  $("#sch041FrHour").val($(':hidden[name="sch040AllDayFrHour"]').val());
  $("#sch041FrMin").val($(':hidden[name="sch040AllDayFrMin"]').val());
  $("#sch041ToHour").val($(':hidden[name="sch040AllDayToHour"]').val());
  $("#sch041ToMin").val($(':hidden[name="sch040AllDayToMin"]').val());
}

function setFromDay() {
    if (document.forms[0].sch040ScrollFlg.value=='1') {
        window.location.hash='add_user';
    }
    var frYear = document.forms[0].sch041FrYear.value;
    var frMonth = document.forms[0].sch041FrMonth.value;
    var frDay = document.forms[0].sch041FrDay.value;
    var toYear = document.forms[0].sch041ToYear.value;
    var toMonth = document.forms[0].sch041ToMonth.value;
    var toDay = document.forms[0].sch041ToDay.value;

    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        frYear = toYear;
        frMonth = toMonth;
        frDay = toDay;
        document.forms[0].sch041FrYear.value = toYear;
        document.forms[0].sch041FrMonth.value = toMonth;
        document.forms[0].sch041FrDay.value = toDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            frMonth = toMonth;
            frDay = toDay;
            document.forms[0].sch041FrMonth.value = toMonth;
            document.forms[0].sch041FrDay.value = toDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                frDay = toDay;
                document.forms[0].sch041FrDay.value = toDay;
            }

            if (parseInt(frDay) == parseInt(toDay)) {
                daySameFlg = true;
            }
        }
    }
}

function setToDay() {
    if (document.forms[0].sch040ScrollFlg.value=='1') {
        window.location.hash='add_user';
    }
    var frYear = document.forms[0].sch041FrYear.value;
    var frMonth = document.forms[0].sch041FrMonth.value;
    var frDay = document.forms[0].sch041FrDay.value;
    var toYear = document.forms[0].sch041ToYear.value;
    var toMonth = document.forms[0].sch041ToMonth.value;
    var toDay = document.forms[0].sch041ToDay.value;

    var daySameFlg = false;

    if (parseInt(frYear) > parseInt(toYear)) {
        toYear = frYear;
        toMonth = frMonth;
        toDay = frDay;
        document.forms[0].sch041ToYear.value = frYear;
        document.forms[0].sch041ToMonth.value = frMonth;
        document.forms[0].sch041ToDay.value = frDay;
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) > parseInt(toMonth)) {
            toMonth = frMonth;
            toDay = frDay;
            document.forms[0].sch041ToMonth.value = frMonth;
            document.forms[0].sch041ToDay.value = frDay;
        }
    }

    if (parseInt(frYear) == parseInt(toYear)) {
        if (parseInt(frMonth) == parseInt(toMonth)) {
            if (parseInt(frDay) > parseInt(toDay)) {
                toDay = frDay;
                document.forms[0].sch041ToDay.value = frDay;
            }

            if (parseInt(frDay) == parseInt(toDay)) {
                daySameFlg = true;
            }
        }
    }
}

function setFromTime() {
    if (document.forms[0].sch040ScrollFlg.value=='1') {
        window.location.hash='add_user';
    }
    var frHour = document.forms[0].sch041FrHour.value;
    var frMin = document.forms[0].sch041FrMin.value;
    var toHour = document.forms[0].sch041ToHour.value;
    var toMin = document.forms[0].sch041ToMin.value;

    if(parseInt(frHour) > -1
        && parseInt(frMin) > -1
        && parseInt(toHour) > -1
        && parseInt(toMin) > -1) {

      if (parseInt(frHour) > parseInt(toHour)) {
          frHour = toHour;
          document.forms[0].sch041FrHour.value = toHour;
      }

      if (parseInt(frHour) == parseInt(toHour)) {
        if(parseInt(frMin) > parseInt(toMin)) {
          document.forms[0].sch041FrMin.value = toMin;
        }
      }
    }
}

function setToTime() {
    if (document.forms[0].sch040ScrollFlg.value=='1') {
        window.location.hash='add_user';
    }
    var frHour = document.forms[0].sch041FrHour.value;
    var frMin = document.forms[0].sch041FrMin.value;
    var toHour = document.forms[0].sch041ToHour.value;
    var toMin = document.forms[0].sch041ToMin.value;

    if(parseInt(frHour) > -1
            && parseInt(frMin) > -1
            && parseInt(toHour) > -1
            && parseInt(toMin) > -1) {

      if (parseInt(frHour) > parseInt(toHour)) {
          toHour = frHour;
          document.forms[0].sch041ToHour.value = frHour;
      }

      if (parseInt(frHour) == parseInt(toHour)) {
        if(parseInt(frMin) > parseInt(toMin)) {
          document.forms[0].sch041ToMin.value = frMin;
        }
      }
    }
}