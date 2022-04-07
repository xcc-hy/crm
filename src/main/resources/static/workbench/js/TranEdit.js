var contactsSourceModal = new Vue({
    el : "#contacts-source-modal",
    data : {
        searchUrl : '',
        name : '',
        checkedName : '',
        contactsList : [],
    },
    computed : {
        contacts : function () {
            var tmp = {};
            var _this = this;
            if (this.checkedName !== '') {
                this.contactsList.forEach(act => {
                    if (act.id === _this.checkedName) {
                        tmp = act;
                    }
                })
            }
            return tmp;
        },
    },
    watch : {
        name : function () {
            this.updateTable();
        },
    },
    methods : {
        initCheck : function () {
            this.checkedName = '';
        },
        success : function () {

        },
        updateTable : function () {
            var _this = this;
            $.ajax({
                url : _this.searchUrl,
                data: {name : this.name},
                type : 'get',
                success : function (data) {
                    _this.contactsList = data;
                    _this.initCheck();
                }
            })
        },
        openModal : function (searchUrl = "workbench/contacts/queryByName") {
            this.searchUrl = searchUrl;
            this.name = '';
            this.updateTable();
            $(this.$el).modal('show');
        },
        modalSave : function () {
            $(this.$el).modal('hide');
            if (this.checkedName === '') {
                return;
            }
            this.success();
        },
    }
});

function TranEdit() {
    return new Vue({
        el: "#tran-edit",
        data: {
            curView : curView,
            last : View.main,
            modalTitle: '',
            modalUrl: '',
            activityName : '',
            contactsName : '',
            modalData: {
                owner : '',
                money : '',
                name : '',
                expecteddate : '',
                stage : '',
                type : '',
                source : '',
                customerid : '',
                activityid : '',
                contactsid : '',
                contactsummary : '',
                nextcontacttime : '',
                description : '',
            },
        },
        computed : {
            seen : function () {
                return this.getSeen();
            }
        },
        methods: {
            getSeen : function () {
                return this.curView.cur === View.edit;
            },
            changeVal: function (keys, $event) {
                changeModelValue(this, keys, $event);
            },
            isLegal: function () {
                if (this.modalData.owner === '') {
                    alertMsg('所有者不能是空！');
                    return false;
                }
                if (this.modalData.name === '') {
                    alertMsg('名称不能是空！');
                    return false;
                }
                if (this.modalData.expecteddate === '') {
                    alertMsg('预计成交日期不能是空！');
                    return false;
                }
                if (this.modalData.customerid === '') {
                    alertMsg('客户名称不能是空！');
                    return false;
                }
                if (this.modalData.stage === '') {
                    alertMsg('阶段不能是空！');
                    return false;
                }
                return true;
            },
            success: function () {

            },
            modalSave: function () {
                if (!this.isLegal()) {
                    return;
                }
                var _this = this;
                $.ajax({
                    url: _this.modalUrl,
                    data: _this.modalData,
                    type: 'post',
                    success: function (data) {
                        alertMsg(data.msg);
                        if (data.success) {
                            _this.success();
                        }
                    }
                })
            },
            returnMain : function () {
                this.curView.cur = this.last;
            },
            openCreateModal: function () {
                this.modalTitle = "创建交易";
                this.modalUrl = "workbench/tran/create";
                for (var key in this.modalData) {
                    this.modalData[key] = '';
                }
                this.activityName = '';
                this.contactsName = '';
            },
            openEditModal: function (id) {
                this.modalTitle = "修改交易";
                this.modalUrl = "workbench/tran/update";
                var _this = this;
                this.modalData.id = id;
                $.ajax({
                    url: "workbench/tran/queryById/code",
                    data: {id: id},
                    type: 'get',
                    success: function (data) {
                        for (var key in _this.modalData) {
                            _this.modalData[key] = data[key];
                        }
                        var arr;
                        if (_this.modalData.activityid != null && _this.modalData.activityid !== '') {
                            arr = _this.modalData.activityid.split("-");
                            _this.modalData.activityid = arr[0];
                            _this.activityName = arr.slice(1).join("-");
                        }
                        if (_this.modalData.contactsid != null && _this.modalData.contactsid !== '') {
                            arr = _this.modalData.contactsid.split("-");
                            _this.modalData.contactsid = arr[0];
                            _this.contactsName = arr.slice(1).join("-");
                        }
                    }
                })
            },
            openActivitySourceModal : function () {
                var _this = this;
                activitySourceModal.success = function () {
                    _this.activityName = activitySourceModal.activity.name;
                    _this.modalData.activityid = activitySourceModal.activity.id;
                };
                activitySourceModal.openModal();
            },
            openContactsSourceModal : function () {
                var _this = this;
                contactsSourceModal.success = function () {
                    _this.contactsName = contactsSourceModal.contacts.fullname;
                    _this.modalData.contactsid = contactsSourceModal.contacts.id;
                };
                contactsSourceModal.openModal();
            },
        }
    })
}

$(function () {
    $("#tran-customer-name").typeahead({
        source : function (query, process) {
            $.ajax({
                url : "workbench/customer/queryNameByName",
                data: {name : query},
                type : 'get',
                success : function (data) {
                    process(data);
                }
            })
        },
        updater : function (item) {
            tranEdit.modalData.customerid = item;
        }
    })
})