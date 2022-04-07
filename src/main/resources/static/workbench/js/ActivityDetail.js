function ActivityDetail() {
    return new Vue({
        el : "#activity-detail",
        data : {
            id : '',
            curView : curView,
            remarkTitle : '市场活动',
            remarkFor : '',
            newRemark : '',
            remarkHeight : '90px',
            remarkBtn : false,
            activity : {},
            remarkList : [],
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
                    url : "workbench/activity/detail",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.activity = data.activity;
                        _this.remarkList = data.remarkList;
                    }
                })
            },
            activity : function () {
                this.remarkFor = this.activity.name;
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
            // 打开修改联系人窗口
            openEditModal : function () {
                activityModal.openEditModal(this.id);
                activityModal.success = this.reflash;
            },
            reflash : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/activity/queryById/visible",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.activity = data;
                    }
                })
            },
            // 打开修改备注窗口
            openEditRemarkModal : function (id) {
                var _this = this;
                for (var item of this.remarkList) {
                    if (item.id == id) {
                        remarkModal.openModal(id, item.notecontent, "workbench/activityRemark/update");
                        remarkModal.success = _this.reflashRemark;
                        break;
                    }
                }
            },
            // 刷新备注表
            reflashRemark : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/activityRemark/queryByActivityId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.remarkList = data;
                    }
                })
            },
            // 删除
            deleteItem : function () {
                if(confirm("确定删除这条数据？")) {
                    var _this = this;
                    $.ajax({
                        url: "workbench/activity/delete",
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
                    url : "workbench/activityRemark/delete",
                    data: {id : id},
                    type : 'post',
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
                    url : "workbench/activityRemark/create",
                    data: {notecontent : this.newRemark, activityid : this.id},
                    type : 'post',
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
                activityMain.reflash();
                this.curView.cur = View.main;
            },
        }
    })
}