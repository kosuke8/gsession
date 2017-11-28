(function() {



    //Call loader the first time
    var loader = new YAHOO.util.YUILoader({
        base: '../common/js/yui/',
        //Get these modules
        require: ['reset-fonts-grids', 'utilities', 'container', 'treeview', 'selector', 'resize', 'layout' , 'menu'],
        rollup: true,
        onSuccess: function() {
            //Load the global CSS file.
            YAHOO.util.Get.css('../dba/css/dba.css');

            var layout = new YAHOO.widget.Layout({
                units: [
                    { position: 'top', height: 70, resize: false, body: 'top1' },
                    { position: 'left', width: 200, header:'テーブル一覧', collapse: true,animate: true,resize: true,body:'left1',scroll:true, gutter: '0 5 0 5px', minWidth: 150},
                    { position: 'center', body:'center1'}
//                    { position: 'bottom', height: 10, resize: false, body: 'bottom1',maxHeight: 0}
               ]
            });

            layout.on('render', function() {
                var el = layout.getUnitByPosition('center').get('wrap');
                var layout2 = new YAHOO.widget.Layout(el, {
                    parent: layout,
                    units: [
                        { position: 'top', header: 'SQL実行', height: 255, body:'tableSql',collapse: true,animate: false},
                        { position: 'center', header: '実行結果', scroll: true, body:'resultData'}
                    ]
                });
                layout2.render();
            });

            layout.on('render', function() {
                window.setTimeout(function() {

                    YAHOO.util.Get.script('../dba/js/dba001.js');
                    YAHOO.util.Get.script('../dba/js/tree.js');
                    YAHOO.util.Get.script('../dba/js/context.js');
                }, 0);

            });
            layout.render();
        }
    });

    loader.insert();

})();
