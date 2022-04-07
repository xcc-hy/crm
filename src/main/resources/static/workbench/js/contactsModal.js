var contactsModal = new Vue({
    el : "#contacts-modal",
    data : {
        modalTitle : '',
        modalUrl : '',
        modalData : {
            owner : '',
            source : '',
            fullname : '',
            appellation : '',
            email : '',
            mphone : '',
            job : '',
            birth : '',
            contactsummary : '',
            nextcontacttime : '',
            description : '',
            address : '',
            customerid : '',
        },
    },
    methods : {
        changeVal : function (keys, $event) {
            changeModelValue(this, keys, $event);
        },
        isLegal : function () {
            if (this.modalData.owner == '') {
                alertMsg('所有者不能是空！');
                return false;
            }
            if (this.modalData.fullname == '') {
                alertMsg('名称不能是空！');
                return false;
            }
            return true;
        },
        success : function () {

        },
        modalSave : function () {
            if (!this.isLegal()) {
                return;
            }
            var _this = this;
            $.ajax({
                url : _this.modalUrl,
                data: _this.modalData,
                type : 'post',
                success : function (data) {
                    alertMsg(data.msg);
                    $(_this.$el).modal('hide');
                    if (data.success) {
                        _this.success();
                    }
                }
            })
        },
        openCreateModal : function () {
            this.modalTitle = "创建联系人";
            this.modalUrl = "workbench/contacts/create";
            for (var key in this.modalData) {
                this.modalData[key] = '';
            }
            $(this.$el).modal('show');
        },
        openEditModal : function (id) {
            this.modalTitle = "修改联系人";
            this.modalUrl = "workbench/contacts/update";
            var _this = this;
            this.modalData.id = id;
            $.ajax({
                url : "workbench/contacts/queryById",
                data: {id : id},
                type : 'get',
                success : function (data) {
                    for (var key in _this.modalData) {
                        _this.modalData[key] = data[key];
                    }
                    $(_this.$el).modal('show');
                }
            })
        },
    }
})

$(function () {
    $("#contacts-customer-name").typeahead({
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
            contactsModal.modalData.customerid = item;
        }
    })
})