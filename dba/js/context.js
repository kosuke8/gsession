/*
     Initialize the ContextMenu instances when the the elements
     that trigger their display are ready to be scripted.
*/

YAHOO.util.Event.onContentReady("tableList", function () {

    // Maintain a reference to the "clones" <ul>

    var oClones = this;


    // Clone the first ewe so that we can create more later

    var oEM = oClones.getElementsByTagName("em")[0];


    // create select sql
    function createSelect(p_oEM) {
        var oCite = p_oEM.lastChild;
        if (oCite.nodeType != 1) {
            oCite = oCite.previousSibling;
        }
        var oTextNode = oCite.firstChild;

        var sqlstr = document.getElementById(oTextNode.nodeValue + "_select").value;
        document.getElementById("dba001SqlStringTextArea").value=sqlstr;
    }


    // create update sql
    function createUpdate(p_oEM) {
        var oCite = p_oEM.lastChild;
        if (oCite.nodeType != 1) {
            oCite = oCite.previousSibling;
        }
        var oTextNode = oCite.firstChild;

        var sqlstr = document.getElementById(oTextNode.nodeValue + "_update").value;
        document.getElementById("dba001SqlStringTextArea").value=sqlstr;
    }

    // create insert sql
    function createInsert(p_oEM) {
        var oCite = p_oEM.lastChild;
        if (oCite.nodeType != 1) {
            oCite = oCite.previousSibling;
        }
        var oTextNode = oCite.firstChild;

        var sqlstr = document.getElementById(oTextNode.nodeValue + "_insert").value;
        document.getElementById("dba001SqlStringTextArea").value=sqlstr;
    }

    // create delete sql
    function createDelete(p_oEM) {
        var oCite = p_oEM.lastChild;
        if (oCite.nodeType != 1) {
            oCite = oCite.previousSibling;
        }
        var oTextNode = oCite.firstChild;

        var sqlstr = document.getElementById(oTextNode.nodeValue + "_delete").value;
        document.getElementById("dba001SqlStringTextArea").value=sqlstr;
    }

    // download daomodel zip file
    function createDaomodel(p_oEM) {
        var oCite = p_oEM.lastChild;
        if (oCite.nodeType != 1) {
            oCite = oCite.previousSibling;
        }
        var oTextNode = oCite.firstChild;
        downloadDaomodel(oTextNode.nodeValue);
    }
    // "click" event handler for each item in the ewe context menu

    function onEweContextMenuClick(p_sType, p_aArgs) {

        /*
             The second item in the arguments array (p_aArgs)
             passed back to the "click" event handler is the
             MenuItem instance that was the target of the
             "click" event.
        */

        var oItem = p_aArgs[1], // The MenuItem that was clicked
          oTarget = this.contextEventTarget,
            oEM;


        if (oItem) {

      oEM = oTarget.nodeName.toUpperCase() == "EM" ?
          oTarget : YAHOO.util.Dom.getAncestorByTagName(oTarget, "EM");

            switch (oItem.index) {

                case 0:     // select sql
                    createSelect(oEM);
                break;

                case 1:     // update sql
                    createUpdate(oEM);
                break;

                case 2:     // insert sql
                    createInsert(oEM);
                break;

                case 3:     // delete sql
                    createDelete(oEM);
                break;

                case 4:     // daoModel
                    createDaomodel(oEM);
                break;
            }

        }

    }


    /*
         Array of text labels for the MenuItem instances to be
         added to the ContextMenu instanc.
    */

    var aMenuItems = ["select文を生成", "update文を生成", "insert文を生成", "delete文を生成", "daoModelを生成(zip)" ];


    /*
         Instantiate a ContextMenu:  The first argument passed to
         the constructor is the id of the element to be created; the
         second is an object literal of configuration properties.
    */

    var oEweContextMenu = new YAHOO.widget.ContextMenu(
                                "ewecontextmenu",
                                {
                                    trigger: oClones.getElementsByTagName("em"),
                                    itemdata: aMenuItems,
                                    lazyload: true
                                }
                            );


    // "render" event handler for the ewe context menu

    function onContextMenuRender(p_sType, p_aArgs) {

        //  Add a "click" event handler to the ewe context menu

        this.subscribe("click", onEweContextMenuClick);

    }


    // Add a "render" event handler to the ewe context menu

    oEweContextMenu.subscribe("render", onContextMenuRender);

});
