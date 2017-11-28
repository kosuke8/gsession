function changeEnableDisablePeriod() {
  if (document.forms[0].rsv280PeriodKbn[0].checked) {
     document.getElementById('rsvPeriodArea1').rowspan=2;
     $('#rsvPeriodArea2').show();
  } else {
     document.getElementById('rsvPeriodArea1').rowspan=1;
     $('#rsvPeriodArea2').hide();
  }
}

function changeEnableDisable() {
  if (document.forms[0].rsv280EditKbn[0].checked) {
     document.getElementById('rsvEditArea1').rowspan=2;
     $('#rsvEditArea2').show();
  } else {
     document.getElementById('rsvEditArea1').rowspan=1;
     $('#rsvEditArea2').hide();
  }
}

function changeEnableDisablePublic() {
    if (document.forms[0].rsv280PublicKbn[0].checked) {
       document.getElementById('rsvPublicArea1').rowspan=2;
       $('#rsvPublicArea2').show();
    } else {
       document.getElementById('rsvPublicArea1').rowspan=1;
       $('#rsvPublicArea2').hide();
    }
  }
