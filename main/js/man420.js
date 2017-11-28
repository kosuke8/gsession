    function initLoad() {

        if ($('input[name=man420UsrImpFlg]:checked').val() == 0) {
            document.forms[0].usrNotImpRadio.checked = true;
            document.forms[0].usrImpRadio.checked = false;
        }
        else {
            document.forms[0].usrNotImpRadio.checked = false;
            document.forms[0].usrImpRadio.checked = true;
        }
        hideUsrTimeSelect();
    }

    function hideUsrTimeSelect() {
        if ($('input[name=man420UsrImpFlg]:checked').val() == 0) {
            $(usrStartTimeSelect).hide();
        } else {
            $(usrStartTimeSelect).show();
        }
        hideUsrStartTime();
    }

    function hideUsrStartTime() {
        if ($('input[name=man420UsrImpTimeSelect]:checked').val() == 2
                && $('input[name=man420UsrImpFlg]:checked').val() == 1) {
            $(usrStartTime).show();
        } else {
            $(usrStartTime).hide();
        }
     }
