function dspChangeUsrUko() {
    //ログイン停止フラグは非表示の場合がある
    if ($(':hidden[name="usr031UsrUkoFlg"]').val() == 1) {
        $("#usr031FormTable").find("td.td_wt").addClass("td_sch_type2");
        $("#usr031FormTable").find("td.td_wt6").addClass("td_sch_type2");
        $("#usr031FormTable").find("td.td_wt7").addClass("td_sch_type2");
    }
}

$(function(){
 // ページ読み込み時に実行したい処理
    dspChangeUsrUko();
 });