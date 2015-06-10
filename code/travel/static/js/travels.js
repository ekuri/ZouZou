$(function(){
    var ulNode = $('ul.timeline');
    function fectchData() {
        var day = "2015/5/4";
        var time = "2015/9/4";
        var pictureUrl = "img/1.jpg";
        var content = "在厦门的日子，少了朋友圈，少了空间微博，生活变得简单清明，却无比美好。无论走到哪里旅行，其实都是在生活。重要的是学会从生活中感受美好，这样无论走到哪里，有没有在旅行途中，生命都会变得美丽可爱呢。";
        var html="";
        var num = 15;
        var name = "香格里拉";
        var imgDisplays = [
        {
            picUrl:"img/1.jpg",
            title:"分享图片",
            day:"5.1",
            time:"15:30"
        },{
            picUrl:"img/2.jpg",
            title:"碧水蓝天",
            day:"5.1",
            time:"16:30"
        },{
            picUrl:"img/3.jpg",
            title:"牛",
            day:"5.1",
            time:"17:30"
        }];
        /*for(var i = 0; i < 10; i++) {
            html += "<li><div class='time'>" + day + "</div>";
            html += "<div class='version'>" + time + "</div>" +
            "<div class='timeline-badge primary'><a><i class='glyphicon glyphicon-record'></i></a></div>"+
            "<div class='line'> <img src='img/line_time.png' /></div>"+
            "<div class='content'>"+
            "<div style='overflow:hidden;zoom:1'>";
            
            
            for(var j = 0; j < imgDisplays.length; j++) {
                html += "<div class='imgDisplay'>" +
                "<img src='"+ imgDisplays[j].picUrl +"'/>" +
                "<p>" + imgDisplays[j].title + "</p>" +
                "<p>" + imgDisplays[j].day + " " + imgDisplays[j].time + "</p>" +
                "</div>";
            }
            html += "<div class='restInfo'><p style='position:absolute'>"+ name + num +"条记录</p><p style='text-align:center'><a>查看详情</a></p></div>"
            "</div>" +
            "</div></li>"
        }*/
        ulNode.append(html);
    }
    fectchData();
});