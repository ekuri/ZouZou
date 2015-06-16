$(function() {
    $('#upload-iframe').load(function() {
        var data = JSON.parse($('#upload-iframe').contents().find('body').html());
        if (data['result']) {
            $('ul.timeline').append('<li><div class="timeline-badge primary">' +
                '<a><i class="glyphicon glyphicon-record"></i></a></div>' + 
                '<div class="content"><div class="imgDisplay">' +
                '<img src="' + data['picture'] + '" /></div><p>' + data['content'] +
                '</p></div></li>');
        } else {
            alert(data['message']);
        }
    });

    $('#close-travel-button').click(function() {
        var result = confirm("结束旅行后不可重新开启，确认结束吗");
        if (result) {
            $.post('/travel/end/', {}, function(data) {
                if (data['result']) {
                    $('.timeline').remove();
                } else {
                    alert('暂时没有开始任何旅行');
                }
            }, 'json');
        }
    });

    $('#new-travel-button').click(function() {
        $.post('/travel/start/', {}, function(data) {
            if (data['result']) {
                $('.travel').append('<div class="timeline"><ul class="timeline"></ul></div>');
            } else {
                alert('上次旅行还未结束');
            }
        }, 'json');
    });
});