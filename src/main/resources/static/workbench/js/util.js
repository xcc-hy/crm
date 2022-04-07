function alertMsg(msg) {
    $('#alert-body').html(msg);
    $('#alertModal').modal('show');
}
function changeModelValue(it, keys, $event) {
    if (typeof keys == "string") {
        it[keys] = $($event.target).val();
    } else {
        let i = 0;
        for (; i < keys.length - 1; i++) {
            it = it[keys[i]];
        }
        it[keys[i]] = $($event.target).val();
    }
}