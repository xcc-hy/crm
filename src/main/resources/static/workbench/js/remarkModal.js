var remarkModal = new Vue({
    el : "#remark-modal",
    data : {
        id : '',
        noteContent : '',
        url : '',
    },
    methods : {
        openModal : function (id, noteContent, url) {
            this.id = id;
            this.noteContent = noteContent;
            this.url = url;
            $(this.$el).modal('show');
        },
        success : function () {

        },
        modalSave : function () {
            var _this = this;
            $.ajax({
                url : _this.url,
                data: {id : _this.id, notecontent : _this.noteContent},
                type : 'post',
                success : function (data) {
                    $(_this.$el).modal('hide');
                    if (data.success) {
                        _this.success();
                    }
                }
            })
        }
    },
});