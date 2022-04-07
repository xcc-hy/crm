var activityRelationModal = new Vue({
    el : "#activity-relation-modal",
    data : {
        id : '',
        searchUrl : '',
        saveUrl : '',
        name : '',
        checkedNames : [],
        checkedAll : false,
        activityList : [],
    },
    watch : {
        name : function () {
            this.updateTable();
        },
    },
    methods : {
        initCheck : function () {
            this.checkedNames.length = 0;
            this.checkedAll = false;
        },
        clickCheckItem : function () {
            this.checkedAll = (this.checkedNames.length === this.activityList.length);
        },
        clickCheckAll : function () {
            this.checkedNames.length = 0;
            if (this.checkedAll) {
                this.activityList.forEach(item=>{
                    this.checkedNames.push(item.id);
                });
            }
        },
        success : function () {

        },
        updateTable : function () {
            var _this = this;
            $.ajax({
                url : _this.searchUrl,
                data: {id : this.id, name : this.name},
                type : 'get',
                success : function (data) {
                    _this.activityList = data;
                    _this.initCheck();
                }
            })
        },
        openModal : function (id, searchUrl, saveUrl) {
            this.searchUrl = searchUrl;
            this.saveUrl = saveUrl;
            this.id = id;
            this.name = '';
            this.updateTable();
            $(this.$el).modal('show');
        },
        modalSave : function () {
            if (this.checkedNames.length == 0) {
                $(_this.$el).modal('hide');
                return;
            }
            var _this = this;
            $.ajax({
                url : _this.saveUrl,
                data: {id : this.id, aIds : this.checkedNames},
                type : 'post',
                success : function (data) {
                    $(_this.$el).modal('hide');
                    if (data.success) {
                        _this.success();
                    }
                }
            })
        },
    }
});