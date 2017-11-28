function loop(opa) {
     if (opa <= 100) {
       element.style.filter = "alpha(opacity:"+opa+")";
       element.style.opacity = opa/100;
       opa = opa + 15;
       setTimeout("loop(" + opa + ")", 10);
     }
   }

$(function(){
 jQuery("a:has(span.tooltips)").live({
     mouseenter:function(e){
     $(this).append("<div id=\"ttp\"><table><tr><td nowrap>"
             + ($(this).children("span.tooltips").html()) +"</td></tr></table></div>");

     $("#ttp")
      .css("position","absolute")
      .css("text-align","left")
      .css("font-size","12px")
      .css("top",(e.pageY) + 15 + "px")
      .css("left",(e.pageX) + 15 + "px")

     var opa = 10;
     element = document.getElementById("ttp");
     element.style.visibility = "visible";
     loop(opa);

     },mousemove:function(e){
      $("#ttp")
      .css("top",(e.pageY) + 15 + "px")
      .css("left",(e.pageX) + 15 + "px");

     },mouseleave:function(){
         $("#ttp").remove();
     }
 });
});