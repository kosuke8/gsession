function changeChk() {
   var chkFlg;
   if (document.forms[0].fil280allCheck.checked) {
       checkAll('fil220sltCheck');

   } else {
       nocheckAll('fil220sltCheck');
   }
}

function CabinetDetail(cabSid) {
    document.forms[0].cmnMode.value='1';
    document.forms[0].fil010SelectCabinet.value=cabSid;
    document.forms[0].fil030SelectCabinet.value=cabSid;
    document.forms[0].fil010DspCabinetKbn.value=1;
    document.forms[0].backDsp.value='fil280';
    document.forms[0].CMD.value='fil280editCabinet';
    document.forms[0].submit();
    return false;
}

function CabinetDetailMulti() {
    document.forms[0].cmnMode.value='2';
    document.forms[0].fil010DspCabinetKbn.value=1;
    document.forms[0].backDsp.value='fil280';
    document.forms[0].CMD.value='fil280togetherEdit';
    document.forms[0].submit();
    return false;
}
function MoveToSearch() {
    document.forms[0].CMD.value='fil280search';
    document.forms[0].submit();
    return false;
}