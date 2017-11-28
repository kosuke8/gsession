/**
 * jqueryプラグイン初期化処理
 * ここに書いた処理はDOM読み込みと並行処理になる
 */
;(function($) {
    //jqueryプラグイン読み込み
    if ($.fn.usrgrpselect) {
        //読み込み済みの場合何もしない
        return;
    }

    /** コマンド要素定義 標準*/
    var CMD_ENUM = {
    //初期化
    INIT:"init",
    //スクロール設定
    SETSCROL:"setScroll",
    //スクロール実行
    DOSCROL:"doScroll",
    //選択済みリスト一括設定
    DSPSELECTED:"dspSelected",
    //指定選択済みリスト表示
    SHOWSELECTED:"showSelected",
    //指定選択済みリスト非表示
    HIDESELECTED:"hideSelected",
    //選択除外ユーザ設定
    SETBANUSR:"setBanUsr",
    }
    /**
     * スクロール設定
     */
    var setScrollPosition = function(id){
        var scrollPosition = $(window).scrollTop();
        $("<input>", {
            type: 'hidden',
            name: id +'.scrollY',
            value: scrollPosition
            }).appendTo('#' + id);
    };

    /**
     * スクロール実行
     */
    var doScroll = function(id, scrollPosition) {
        if (scrollPosition > 0) {
            window.scroll(0, scrollPosition);
        }
    };
    /**
     * 選択済みリスト非表示
     */
    var hideSelected = function(id, key) {
        $('#' + id + '\\.selectedList\\(' + key + '\\)\\.head').hide();
        $('#' + id + '\\.selectedList\\(' + key + '\\)').hide();
    };
    /**
     * 選択済みリスト表示
     */
    var showSelected = function(id, key) {
        $('#' + id + '\\.selectedList\\(' + key + '\\)\\.head').show();
        $('#' + id + '\\.selectedList\\(' + key + '\\)').show();
    };
    /**
     * 選択済みリスト一括設定
     */
    var dspSelected = function(id, keys) {
        $('tr[id^=' + id + '\\.selectedList\\(]').hide();
        var arrkeys;
        if ($.isArray(keys)) {
            arrKeys = keys;
        } else {
            arrKeys = [keys];
        }
        var selectedHeight = 0;
        switch (arrKeys.length) {
        case 1:
            selectedHeight = 13;
            break;
        case 2:
            selectedHeight = 5;
            break;
        }
        $.each(arrKeys, function() {
            $('tr[id^=' + id + '\\.selectedList\\(' + this + ']').show();
            $('tr[id^=' + id + '\\.selectedList\\(' + this + ']').find('td select').attr('size', selectedHeight);
        });

    };
    /**選択不可ユーザ設定*/
    var setBanUsr = function(id, usrSid) {
        $('#' + id).find('[name=' + id +'\\.banUsrSid]').remove();
        if (usrSid) {
            $.each(usrSid, function() {
                $("<input>", {
                    type: 'hidden',
                    name: id +'.banUsrSid',
                    value: this
                    }).appendTo('#' + id);

            });
        }
    };
    /**
     * 初期化
     */
    var init = function(id, keys, titles, scrollY, banUsrSid) {
        if (scrollY > 0) {
            doScroll(id, scrollY);
        }
        //グループコンボのイベント

        $('#' + id).find('[name=' + id +'\\.group\\.selected]').change(
                function() {
                   $('#' + id).usrgrpselect({cmd:'setScroll'});
                   buttonPush('init');
                });
        //グループボタンのイベント
        $('#' + id +'\\.group\\.select').click(
                function() {
                   $('#' + id).usrgrpselect({cmd:'setScroll'});
                   openGroupWindow_Disabled(
                           this.form.elements.namedItem(id + '.group.selected').item(0),
                           'elements.namedItem(\'' + id + '.group.selected\')', '0',  id + '.changeGrp', '', '', null, '0');
                   buttonPush('init');
                });
        //全グループから選択ボタンのイベント
        $('#' + id +'\\.group\\.all').click(
                function() {
                    $('#' + id).usrgrpselect({cmd:'setScroll'});
                    var cnt = 0;
                    var selectBox;
                    $.each(keys, function() {
                        if ($('#' + id +'\\.selectedList\\(' + this +'\\)').is(':visible')) {
                            // 表示されている場合の処理
                            selectBox = id +'.selected(' + this+ ')';
                            cnt++;
                        }
                    });
                    if (cnt == 2) {
                        return openAllGroup2_Disabled(this.form.elements.namedItem(id +'.group.selected').item(0),
                                id +'\\.group\\.selected',
                                 this.form.elements.namedItem(id +'.group.selected').item(0).value,
                                  '0', id + '.changeGrp',
                                   id +'.selected(' + keys[0] +')', id +'.selected(' + keys[1] +')', null,
                                    '-1', '1', '', '', '', id + '\\.banUsrSid', null, null, titles[0], titles[1]);

                    }
                    if (cnt == 1) {
                        return openAllGroup_setDisable(this.form.elements.namedItem(id +'.group.selected').item(0),
                                 id +'\\.group\\.selected',
                                 this.form.elements.namedItem(id +'.group.selected').item(0).value,
                                  '0', id + '.changeGrp',
                                   selectBox,
                                    '-1', '1', '', '', '', id + '\\.banUsrSid', null, null);

                    }

                });
        setBanUsr(id, banUsrSid);
    };
    $.fn.usrgrpselect = function(option) {
        if (option.cmd == CMD_ENUM.SETSCROL) {
            setScrollPosition(this.attr("id"));
        } else if (option.cmd == CMD_ENUM.DOSCROL) {
            doScroll(this.attr("id"), option.scroll);
        } else if (option.cmd == CMD_ENUM.DSPSELECTED) {
            dspSelected(this.attr("id"), option.key);
        } else if (option.cmd == CMD_ENUM.SHOWSELECTED) {
            showSelected(this.attr("id"), option.key);
        } else if (option.cmd == CMD_ENUM.HIDESELECTED) {
            hideSelected(this.attr("id"), option.key);
        } else if (option.cmd == CMD_ENUM.INIT) {
            init(this.attr("id"), option.key, option.titles, option.scroll, option.banUsrSid);
        } else if (option.cmd ==CMD_ENUM.SETBANUSR) {
            setBanUsr(this.attr("id"), option.banUsrSid)
        }
    };
})(jQuery);