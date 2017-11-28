function changeOutputType() {
    if ($('input[name=tcd110OutputFileType]:checked').val() == 1) {
        $('#outputBtn1').addClass('btn_pdf_n2');
        $('#outputBtn2').addClass('btn_pdf_n2');
        $('#outputBtn1').removeClass('btn_excel_n2');
        $('#outputBtn2').removeClass('btn_excel_n2');
    } else {
        $('#outputBtn1').addClass('btn_excel_n2');
        $('#outputBtn2').addClass('btn_excel_n2');
        $('#outputBtn1').removeClass('btn_pdf_n2');
        $('#outputBtn2').removeClass('btn_pdf_n2');
    }
}

$(function() {
    changeOutputType();
});
