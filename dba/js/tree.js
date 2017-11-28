//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
(function(){
  var init = function() {

  //create the TreeView instance:
    var tree = new YAHOO.widget.TreeView("tableList");

  //get a reusable reference to the root node:
    var root = tree.getRoot();

  //tables node list:
    var table = new YAHOO.widget.TextNode("TABLE", root, true);
    for (i = 0,j = YAHOO.util.Dom.getElementsByClassName("tableLiFlag").length; i < j; i++) {
      var tempNode = new YAHOO.widget.HTMLNode('<em>'+YAHOO.util.Dom.getElementsByClassName("tableLiFlag")[i].innerHTML+'</em>', table, false, true);
    }


  //views node list:
    var view = new YAHOO.widget.TextNode("VIEW", root, true);
    for (i = 0,j = YAHOO.util.Dom.getElementsByClassName("viewLiFlag").length; i < j; i++) {
      var tempNode = new YAHOO.widget.HTMLNode(YAHOO.util.Dom.getElementsByClassName("viewLiFlag")[i].innerHTML, view, false, true);
    }

  //sequences node list:
    var sequence = new YAHOO.widget.TextNode("SEQUENCE", root, true);
    //display all sequenses
    var allSeq = new YAHOO.widget.HTMLNode("<a href='#' onClick='selectSeq()'>全てのシーケンス</a>", sequence, false, true);
    for (i = 0,j = YAHOO.util.Dom.getElementsByClassName("seqLiFlag").length; i < j; i++) {
      var tempNode = new YAHOO.widget.HTMLNode(YAHOO.util.Dom.getElementsByClassName("seqLiFlag")[i].innerHTML, sequence, false, true);
    }

  //index node list:
    var indexes = new YAHOO.widget.TextNode("INDEX", root, true);
    for (i = 0,j = YAHOO.util.Dom.getElementsByClassName("idxLiFlag").length; i < j; i++) {
      var tempNode = new YAHOO.widget.HTMLNode(YAHOO.util.Dom.getElementsByClassName("idxLiFlag")[i].innerHTML, indexes, false, true);
    }
    
  //setting node list:
    var settings = new YAHOO.widget.TextNode("SETTING", root, true);
    //display db settings
    var setinfo = new YAHOO.widget.HTMLNode("<a href='#' onClick='selectSetting()'>DB設定情報</a>", settings, false, true);
    for (i = 0,j = YAHOO.util.Dom.getElementsByClassName("setLiFlag").length; i < j; i++) {
      var tempNode = new YAHOO.widget.HTMLNode(YAHOO.util.Dom.getElementsByClassName("setLiFlag")[i].innerHTML, settings, false, true);
    }
  
    tree.draw();
  }
  //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);
  //display body
    YAHOO.util.Dom.setStyle(document.body, 'visibility', 'visible');
})();
