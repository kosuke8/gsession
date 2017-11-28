function selectchage() {
	if($('#selectbox').val() <10){
        $('#canAnswer').show();
    } else {
        $('#canAnswer').hide();
    }
}

function check() {
	  $("#enq810CanAnswer:checked").val()
}

$(function(){
	if($('#selectbox').val() <10){
        $('#canAnswer').show();
    } else {
        $('#canAnswer').hide();
    }
});