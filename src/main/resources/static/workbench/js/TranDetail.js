function TranDetail() {
    return new Vue({
        el : "#tran-detail",
        data : {
            id : '',
            curView : curView,
            last : View.main,
            remarkTitle : '交易',
            remarkFor : '',
            newRemark : '',
            remarkHeight : '90px',
            remarkBtn : false,
            tran : {},
            remarkList : [],
            tranHistoryList : [],
        },
        computed : {
            seen : function () {
                return this.getSeen();
            }
        },
        watch : {
            id : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/tran/detail",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.tran = data.tran;
                        _this.remarkList = data.remarkList;
                        _this.tranHistoryList = data.tranHistoryList;
                    }
                })
            },
            tran : function () {
                this.remarkFor = this.tran.name;
            },
        },
        methods : {
            getSeen : function () {
                return this.curView.cur === View.detail;
            },
            changeVal : function (keys, $event) {
                changeModelValue(this, keys, $event);
            },
            remarkDivMouseenter : function ($event) {
                $($event.target).children("div").children("div").show();
            },
            remarkDivMouseleave : function ($event) {
                $($event.target).children("div").children("div").hide();
            },
            hrefMouseenter : function ($event) {
                $($event.target).children("span").css("color","red");
            },
            hrefMouseleave : function ($event) {
                $($event.target).children("span").css("color","#E6E6E6");
            },
            addRemark : function () {
                this.remarkHeight = "130px";
                this.remarkBtn = true;
            },
            cancelSave : function () {
                this.newRemark = '';
                this.remarkHeight = "90px";
                this.remarkBtn = false;
            },
            // 打开修改窗口
            openEditModal : function () {
                var _this = this;
                tranEdit.last = this.curView.cur;
                tranEdit.success = function () {
                    _this.reflash();
                    this.curView.cur = this.last;
                };
                this.curView.cur = View.edit;
                tranEdit.openEditModal(this.id);
            },
            // 打开修改备注窗口
            openEditRemarkModal : function (id) {
                var _this = this;
                for (var item of this.remarkList) {
                    if (item.id === id) {
                        remarkModal.success = _this.reflashRemark;
                        remarkModal.openModal(id, item.notecontent, "workbench/tranRemark/update");
                        break;
                    }
                }
            },
            // 刷新备注表
            reflashRemark : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/tranRemark/queryByTranId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.remarkList = data;
                    }
                })
            },
            // 刷新联系人表
            reflash : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/tran/queryById/visible",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.tran = data;
                    }
                });
                $.ajax({
                    url : "workbench/tranHistory/queryByTranId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.tranHistoryList = data;
                    }
                });
            },
            // 删除联系人
            deleteItem : function (id) {
                if(confirm("确定删除这条数据？")) {
                    var _this = this;
                    $.ajax({
                        url: "workbench/tran/delete",
                        data: {ids : [_this.id]},
                        type: 'post',
                        success: function (data) {
                            alertMsg(data.msg);
                            if (data.success) {
                                _this.returnMain();
                            }
                        }
                    })
                }
            },
            // 删除备注
            deleteRemark : function (id) {
                var _this = this;
                $.ajax({
                    url : "workbench/tranRemark/delete",
                    data: {id : id},
                    type : 'get',
                    success : function (data) {
                        if (data.success) {
                            _this.reflashRemark();
                        }
                    }
                })
            },
            // 保存备注
            saveRemark : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/tranRemark/create",
                    data: {notecontent : this.newRemark, tranid : this.id},
                    type : 'get',
                    success : function (data) {
                        if (data.success) {
                            _this.reflashRemark();
                            _this.cancelSave();
                        }
                    }
                })
            },
            // 返回主界面
            returnMain : function () {
                tranMain.reflash();
                this.curView.cur = this.last;
            },
        }
    })
}

$(function(){
    //阶段提示框
    $(".mystage").popover({
        trigger:'manual',
        placement : 'bottom',
        html: 'true',
        animation: false
    }).on("mouseenter", function () {
        var _this = this;
        $(this).popover("show");
        $(this).siblings(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
    }).on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide")
            }
        }, 100);
    });
});