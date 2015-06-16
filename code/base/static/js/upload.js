$(function() {
    $('#upload-iframe').load(function() {
        var data = JSON.parse($('#upload-iframe').contents().find('body').html());
        alert(data['result']);
    });
});