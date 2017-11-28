 function hideExtDomainArea() {
        if (document.forms[0].man430ExtPageDspKbn[0].checked) {
            $("#extDomainArea").hide();
        } else {
            $("#extDomainArea").show();
        }
    }