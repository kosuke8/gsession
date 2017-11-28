function selectUsersList() {

    var flg = true;
   if (document.forms[0].rsv210SelectUsersKbn.checked) {
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
  var frHour = $(':hidden[name="rsv210AmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv210AmFrMin"]').val();
  var toHour = $(':hidden[name="rsv210AmToHour"]').val();
  var toMinute = $(':hidden[name="rsv210AmToMin"]').val();

  $("#rsv210FrHour").val(parseInt(frHour));
  $("#rsv210FrMin").val(parseInt(frMinute));
  $("#rsv210ToHour").val(parseInt(toHour));
  $("#rsv210ToMin").val(parseInt(toMinute));
}

//午後
function setPmTime() {
  var frHour = $(':hidden[name="rsv210PmFrHour"]').val();
  var frMinute = $(':hidden[name="rsv210PmFrMin"]').val();
  var toHour = $(':hidden[name="rsv210PmToHour"]').val();
  var toMinute = $(':hidden[name="rsv210PmToMin"]').val();

  $("#rsv210FrHour").val(parseInt(frHour));
  $("#rsv210FrMin").val(parseInt(frMinute));
  $("#rsv210ToHour").val(parseInt(toHour));
  $("#rsv210ToMin").val(parseInt(toMinute));
}

//終日
function setAllTime() {
  var frHour = $(':hidden[name="rsv210AllDayFrHour"]').val();
  var frMinute = $(':hidden[name="rsv210AllDayFrMin"]').val();
  var toHour = $(':hidden[name="rsv210AllDayToHour"]').val();
  var toMinute = $(':hidden[name="rsv210AllDayToMin"]').val();

  $("#rsv210FrHour").val(parseInt(frHour));
  $("#rsv210FrMin").val(parseInt(frMinute));
  $("#rsv210ToHour").val(parseInt(toHour));
  $("#rsv210ToMin").val(parseInt(toMinute));
}

function setFromTime() {

    var frHour = document.forms[0].rsv210FrHour.value;
    var frMinute = document.forms[0].rsv210FrMin.value;
    var toHour = document.forms[0].rsv210ToHour.value;
    var toMinute = document.forms[0].rsv210ToMin.value;

    if (parseInt(frHour) > -1
     && parseInt(toHour) > -1
     && parseInt(frMinute) > -1
     && parseInt(toMinute) > -1) {

            if (parseInt(frHour) > parseInt(toHour)) {
                frHour = toHour;
                document.forms[0].rsv210FrHour.value = toHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv210FrMin.value = toMinute;
                }
            }
        }
}

function setToTime() {

    var frHour = document.forms[0].rsv210FrHour.value;
    var frMinute = document.forms[0].rsv210FrMin.value;
    var toHour = document.forms[0].rsv210ToHour.value;
    var toMinute = document.forms[0].rsv210ToMin.value;

    if (parseInt(frHour) > -1
     && parseInt(toHour) > -1
     && parseInt(frMinute) > -1
     && parseInt(toMinute) > -1) {

            if (parseInt(frHour) > parseInt(toHour)) {
                toHour = frHour;
                document.forms[0].rsv210ToHour.value = frHour;

            }
            if (parseInt(frHour) == parseInt(toHour)) {
                if (parseInt(frMinute) > parseInt(toMinute)) {
                    document.forms[0].rsv210ToMin.value = frMinute;
                }
            }
    }
}