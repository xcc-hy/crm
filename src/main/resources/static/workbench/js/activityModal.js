var activityModal = new Vue({
    el : "#activity-modal",
    data : {
        modalTitle : '',
        modalUrl : '',
        modalData : {
            owner : '',
            name : '',
            startdate : '',
            enddate : '',
            cost : '',
            description : '',
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
            if (this.modalData.name == '') {
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
            this.modalTitle = "创建活动";
            this.modalUrl = "workbench/activity/create";
            for (var key in this.modalData) {
                this.modalData[key] = '';
            }
            $(this.$el).modal('show');
        },
        openEditModal : function (id) {
            this.modalTitle = "修改活动";
            this.modalUrl = "workbench/activity/update";
            var _this = this;
            this.modalData.id = id;
            $.ajax({
                url : "workbench/activity/queryById",
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