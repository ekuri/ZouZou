$(function(){
    /*var ulNode = $('ul.timeline');
    function fectchData() {
        var day = "5/4";
        var time = "4:30";
        var pictureUrl = "img/1.jpg";
        var content = "在厦门的日子，少了朋友圈，少了空间微博，生活变得简单清明，却无比美好。无论走到哪里旅行，其实都是在生活。重要的是学会从生活中感受美好，这样无论走到哪里，有没有在旅行途中，生命都会变得美丽可爱呢。";
        
        var html="";
        for(var i = 0; i < 10; i++) {
            html += "<li><div class='time'>" + day + "</div>";
            html += "<div class='version'>" + time + "</div>";
            html += "<div class='number'></div>";
            html += "<div class='content'>"+
            "<div style='overflow:hidden;zoom:1'>"+
            "<img style='width:408px;height:228px;float:left;margin:10px;border-radius:25px;' src='"+pictureUrl+"' />"+content+
            "</div>" +
            "<div style='position:absolute;right:30px;bottom:0px;'><img src='img/love.png'/>7次赞</div>"
            "</div></li>"
        }
        ulNode.append(html);
    }*/

    function showMap() {
        $(document).ready(function() {
            $(".btn-route").click(function() {
                $(".route-map").show();
            });
        });
    }

    function hideMap() {
        $(document).ready(function() {
            $(".hide-map").click(function() {
                $(".route-map").hide();
            });
        });
    }

    showMap();
    hideMap();
    //fectchData();

    $('#comment-iframe').load(function() {
        var data = JSON.parse($('#comment-iframe').contents().find('body').html());
        var travelItemId = data['travelItem'];
        if (data['result']) {
            $('#travelItem' + travelItemId).append('<li><div>' +
                '<div class="timeline-comment-head"><img src="' + data['image'] +
                '"></div><div class="timeline-comment-content">' + 
                '<div class="timeline-comment-content-1"><a href="#">' + data['username'] +
                '</a>: ' + data['content'] + '</div></div></div></li>');
            var count = $('#count' + travelItemId).html();
            $('#count' + travelItemId).html(parseInt(count) + 1);
            $('.content-input').val('');
        } else {
            alert(data['message']);
        }
    });
});