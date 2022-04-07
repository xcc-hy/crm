function ContactsDetail(curOwner) {
    return new Vue({
        el : "#contacts-detail",
        data : {
            id : '',
            curView : curView,
            remarkTitle : '联系人',
            remarkFor : '',
            newRemark : '',
            remarkHeight : '90px',
            remarkBtn : false,
            contacts : {},
            remarkList : [],
            tranList : [],
            activityList : [],
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
                    url : "workbench/contacts/detail",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.contacts = data.contacts;
                        _this.remarkList = data.remarkList;
                        _this.tranList = data.tranList;
                        _this.activityList = data.activityList;
                    }
                })
            },
            contacts : function () {
                this.remarkFor = this.contacts.fullname + this.contacts.appellation + "-" + this.contacts.customerid;
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
                contactsModal.success = this.reflash;
                contactsModal.openEditModal(this.id);
            },
            // 打开修改备注窗口
            openEditRemarkModal : function (id) {
                var _this = this;
                for (var item of this.remarkList) {
                    if (item.id === id) {
                        remarkModal.success = _this.reflashRemark;
                        remarkModal.openModal(id, item.notecontent, "workbench/contactsRemark/update");
                        break;
                    }
                }
            },
            // 刷新备注表
            reflashRemark : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/contactsRemark/queryByContactsId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.remarkList = data;
                    }
                })
            },
            // 刷新交易表
            reflashTran : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/tran/queryByContactsId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.tranList = data;
                    }
                })
            },
            // 刷新联系人表
            reflash : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/contacts/queryById/visible",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.contacts = data;
                    }
                })
            },
            reflashRelation : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/contactsActivityRelation/queryActivityByContactsId",
                    data: {id : this.id},
                    type : 'get',
                    success : function (data) {
                        _this.activityList = data;
                    }
                })
            },
            // 删除市场活动关联
            deleteRelation : function () {
                var _this = this;
                $.ajax({
                    url : "workbench/contactsActivityRelation/delete",
                    data: {id : id},
                    type : 'post',
                    success : function (data) {
                        if (data.success) {
                            _this.reflashRelation();
                        }
                    }
                })
            },
            // 删除交易
            deleteTran : function (id) {
                var _this = this;
                $.ajax({
                    url: "workbench/tran/delete",
                    data: {ids : [id]},
                    type: 'post',
                    success: function (data) {
                        if (data.success) {
                            _this.reflashTran();
                        }
                    }
                })
            },
            // 删除联系人
            deleteItem : function (id) {
                if(confirm("确定删除这条数据？")) {
                    var _this = this;
                    $.ajax({
                        url: "workbench/contacts/delete",
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
                    url : "workbench/contactsRemark/delete",
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
                    url : "workbench/contactsRemark/create",
                    data: {notecontent : this.newRemark, contactsid : this.id},
                    type : 'get',
                    success : function (data) {
                        if (data.success) {
                            _this.reflashRemark();
                            _this.cancelSave();
                        }
                    }
                })
            },
            createRelation : function () {
                activityRelationModal.success = this.reflashRelation;
                activityRelationModal.openModal(this.id,
                    "workbench/contactsActivityRelation/queryUnRelationActivityByContactsId",
                    "workbench/contactsActivityRelation/create");
            },
            // 返回主界面
            returnMain : function () {
                contactsMain.reflash();
                this.curView.cur = View.main;
            },
            // 跳转到交易信息界面
            openTranDetail : function (id) {
                var _this = this;
                tranDetail.id = id;
                tranDetail.last = this.curView.cur;
                tranDetail.returnMain = function () {
                    _this.reflashTran();
                    this.curView.cur = tranDetail.last;
                }
                this.curView.cur = View.tran;
            },
            // 跳转到联系人信息界面
            openActivityDetail : function (id) {
                activityDetail.id = id;
                this.curView.cur = View.activity;
            },
            // 跳转到新建交易信息界面
            openCreateTran : function () {
                var _this = this;
                tranEdit.last = this.curView.cur;
                tranEdit.success = function () {
                    _this.reflashTran();
                    tranEdit.curView.cur = tranEdit.last;
                }
                this.curView.cur = View.edit;
                tranEdit.openCreateModal();
                tranEdit.modalData.customerid = this.contacts.customerid;
                tranEdit.modalData.owner = curOwner;
                tranEdit.modalData.contactsid = this.contacts.id;
                tranEdit.contactsName = this.contacts.fullname;
            },
        }
    })
}