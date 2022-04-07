var activitySourceModal = new Vue({
    el : "#activity-source-modal",
    data : {
        searchUrl : '',
        name : '',
        checkedName : '',
        activityList : [],
    },
    computed : {
        activity : function () {
            var tmp = {};
            var _this = this;
            if (this.checkedName !== '') {
                this.activityList.forEach(act => {
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
                    _this.activityList = data;
                    _this.initCheck();
                }
            })
        },
        openModal : function (searchUrl = "workbench/activity/queryByName") {
            this.searchUrl = searchUrl;
            this.name = '';
            this.updateTable();
            $(this.$el).modal('show');
        },
        modalSave : function () {
            $(this.$el).modal('hide');
            if (this.checkedName == '') {
                return;
            }
            this.success();
        },
    }
});