function getForm() {
    return document.forms['ntp088Form'];
}

function editAccess(nsaSid) {
    getForm().CMD.value = 'spAccessEdit';
    getForm().ntp088editMode.value = 1;
    getForm().ntp088editData.value = nsaSid;
    getForm().submit();
    return false;
}

function sort(sortKey, orderKey) {
    getForm().CMD.value = 'init';
    getForm().ntp088sortKey.value = sortKey;
    getForm().ntp088order.value = orderKey;
    getForm().submit();
    return false;
}

function changePage(id){
    if (id == 1) {
        getForm().ntp088pageTop.value=document.forms[0].ntp088pageBottom.value;
    }

    getForm().CMD.value='init';
    getForm().submit();
    return false;
}