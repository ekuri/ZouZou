// 使用百度地图API

/******************** global data structure and variable ********************/

// map object
var map;
// all provinces name(unused)
var provinces = [];
// all travel info
var allTravelInfos = new Array();
// all travel route
var allTravelRoutes = new Array();


// information window for all marker
var allRoutesInfoWindows = new Array();
// all provinces plygon
var allProvincePlygon = new Array();


// current new added route
var newRoute;
// information windows for new added route
var newRouteInfoWindows = new Array();
// travel point for new added route
var newRoutePoints = new Array();
// route marker for new added route
var newRouteMarkers = new Array();
// 是否可以添加新路线
var isNewRouteCreatable = false;


/******************** build map ********************/

window.onload = function() {
    buildForTag("allmap");
}

var isMapBuilt = false;
function buildForTag(targetTag) {
    if (isMapBuilt)
        return;
    loadMap(targetTag);
    setDemoData();
    getAllTravelDataFromServer();
    setMapInformation();
    registerAllItemEventListener();
};

/******************** main fuction to build a map ********************/
// load map
function loadMap(targetTag) {
    map = new BMap.Map(targetTag);
    isMapBuilt = true;
    map.centerAndZoom("中国", 5);
    map.enableScrollWheelZoom();
    map.disableDoubleClickZoom();
    setControls();
    console.log("map loaded.");
}

// get user travel data from server
function getAllTravelDataFromServer() {
    console.log("get data finished.");
}

// set travel route and marker, some event listener will also be registered
function setMapInformation() {
    getBoundarys(provinces);
    setAllRoutes();
    console.log("set information finished.");
}

// register all event listener
function registerAllItemEventListener() {
    addMapEventListeners();
    console.log("register finished");
}

/*****************************************************/
/******************** extra function ********************/
/*****************************************************/

/******************** get and set province boundary ********************/

function getBoundarys(provincesPara) {
    for(var i = 0; i < provincesPara.length; i++) {
        getBoundary(provincesPara[i]);
    }
}

function getBoundary(provincePara){
    var bdary = new BMap.Boundary();
    bdary.get(provincePara, function(rs){       //获取行政区域
        var count = rs.boundaries.length; //行政区域的点有多少个
        for(var i = 0; i < count; i++){
            var ply;
            ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000"}); //建立visited多边形覆盖物
            ply.setFillOpacity(0.2);
            ply.provinceName = provincePara;
            map.addOverlay(ply);  //添加覆盖物
            allProvincePlygon.push(ply);
            ply.addEventListener("click", function() {
                map.centerAndZoom(this.provinceName, 7);
            });
        } 
    }); 
}


/******************** get and set information windows ********************/

function getInfoWindowContent(title, src, discription) {
    var sContent =
        "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + title + "</h4>" + 
        "<img style='float:right;margin:4px' id='imgDemo' src='img/" + src + "' width='128' height='128' title='" + title + "'/>" + 
        "<p style='margin:0;line-height:1.5;font-size:16px;text-indent:2em;'>" + discription + "</p>" + 
        "</div>";
    return sContent;
}
function getInfoWindowChangerContent() {
    var sContent = 
        "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + "信息添加" + "</h4>" + 
        "<form method='post' enctype='multipart/form-data' target='hidenIframe' action='/travel/new/newTravelPoint'>" +
        "<iframe name='hidenIframe' style='width: 0px; height: 0px; border: none;'>" + "</iframe>" + 
        "<input type='date' name='date'>" + "</input>"+
        "<input type='time' name='time'>" + "</input>"+
        "<p></p>" +
        "<textarea name='description' style='width: 600px;height: 150px;'>说点什么吧～</textarea>" +
        "<image id='newSelectedImage'>" + "</image>" +
        "<input name='image' style='float: right;' type='file' accept='.jpg,.png,.jpeg' onchange='imageSelected(this.value)'></input>" +
        "<input class='btn btns' style='float: left;' type='submit' value='submit'></input>" +
        "</form>" +
        "</div>";
    return sContent;
}

/******************** set exiting Route ********************/

function setAllRoutes() {
    for (var i = 0; i < allTravelRoutes.length; i++) {
        var travelRouteLocal = allTravelRoutes[i];
        var indexLocal = allRoutesInfoWindows.push(new Array()) - 1;
        for (var c = 0; c < travelRouteLocal.length; c++) {
            var routeMarker = new BMap.Marker(travelRouteLocal[c]);
            map.addOverlay(routeMarker);
            
            allRoutesInfoWindows[indexLocal].push(createMapInfoWindow(allTravelInfos[i][c]));
            
            routeMarker.addEventListener("click", function(indexI, indexC) {
                return function() {
                    map.centerAndZoom(allTravelRoutes[indexI][indexC], 15);
                    this.openInfoWindow(allRoutesInfoWindows[indexI][indexC]);
                }
                //图片加载完毕重绘infowindow
                /*document.getElementById('imgDemo').onload = function (){
                    infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                }*/
            }(i, c));
        }
        var routeLineLocal = new BMap.Polyline(travelRouteLocal, {strokeColor: "green", strokeWeight: 4, strokeOpacity: 0.5});
        map.addOverlay(routeLineLocal);
    }
}

function createMapInfoWindow(infoParam) {
    return new BMap.InfoWindow(getInfoWindowContent(infoParam.title, infoParam.src, infoParam.discription));
}

/******************** create new Route ********************/

function paintNewRoute() {
    map.removeOverlay(newRoute);
    newRoute = new BMap.Polyline(newRoutePoints, {strokeColor:"green", strokeWeight:4, strokeOpacity:0.5});
    map.addOverlay(newRoute);
}

function addMapEventListeners() {
    map.addEventListener("rightclick", function(d) {
        if (!isNewRouteCreatable)
            return;
        var marker = new BMap.Marker(d.point);  // 创建标注
        newRouteMarkers.push(marker);
        var indexLocal = newRoutePoints.push(d.point);
        paintNewRoute();
        map.addOverlay(marker);               // 将标注添加到地图中
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        marker.enableDragging();

        var tempInfoWindow = new BMap.InfoWindow(getInfoWindowChangerContent());
        newRouteInfoWindows.push(tempInfoWindow);
        marker.infomationWindow = tempInfoWindow;
        marker.addEventListener("click", function() {
            this.openInfoWindow(this.infomationWindow);
        });
        marker.addEventListener("dragend", function(indexOfTarget) {
            return function(positionPara) {
                newRoutePoints[indexOfTarget] = positionPara.point;
                paintNewRoute();
            }
        }(indexLocal - 1));
    });
}

/******************** html event ********************/

function imageSelected(imagePath) {
    //var imageLocal = document.getElementById("newSelectedImage");
    //imageLocal.src = imagePath;
}

/******************** 2015年6月3日新添加 ********************/

var mapSetfocus = false;
function setDemoData() {
    provinces = ["西藏"];
    var lasaRoute = [
        new BMap.Point(91.124901, 29.661225),
        new BMap.Point(91.127452, 29.662543),
        new BMap.Point(91.128225, 29.660942),
        new BMap.Point(91.125619, 29.656313),
        new BMap.Point(91.12084, 29.657145),
        new BMap.Point(91.121469, 29.658275),
        new BMap.Point(91.117876, 29.658981),
        new BMap.Point(91.119349, 29.65206),
        new BMap.Point(91.117301, 29.649298),
        ];
    var lasaRouteInfo = [
        {title: "布达拉宫",  src: "布达拉宫.jpg",  discription: "旅行第一站！！！看到了美丽而雄伟的布达拉宫，在蓝天白云的映衬下格外辉煌，而且很是壮观。"},
        {title: "宗角禄康公园",  src: "宗角禄康公园.jpg",  discription: "宗角禄康公园在布达拉宫后，水清林幽，古柳蟠生、碧波清澈，是拉萨著名的园林"},
        {title: "圣地康桑",  src: "圣地康桑.jpg",  discription: "看到了美丽而雄伟的布达拉宫，在蓝天白云的映衬下格外辉煌，而且很是壮观。"},
        {title: "和平解放纪念碑",  src: "和平解放纪念碑.jpg",  discription: "好高好高好高好高好高好高好高好高好高好高好高好高好高好高好高好高好高好高!!!!"},
        {title: "鲁普岩寺",  src: "鲁普岩寺.jpg",  discription: "这一天，我没有给自己的西藏行列出具体的行程安排，美美地睡了一个自然醒，便下楼来到宾馆餐厅，喝了足足两大碗酥油茶后，心满心足地抹去了嘴唇上那层薄薄的酥油，迎着9月依然耀眼的阳光，走上了鲁普岩寺"},
        {title: "药王山观景台",  src: "药王山观景台.jpg",  discription: "旅行第一站！！！看到了美丽而雄伟的布达拉宫，在蓝天白云的映衬下格外辉煌，而且很是壮观。"},
        {title: "药王山",  src: "药王山.jpg",  discription: "药王山上是拍摄布达拉宫较好的角度，尤其是半山腰。有密密麻麻的摄影师和摄影发烧友汇集在药王山上等待第一缕光线照亮布达拉宫的瞬间。"},
        {title: "雪林多吉颇章",  src: "雪林多吉颇章.jpg",  discription: "听说是是班禅额尔德尼在拉萨市的行宫，过来看看!!!"},
        {title: "阳光花园",  src: "阳光花园.jpg",  discription: "看到了美丽而雄伟的布达拉宫，在蓝天白云的映衬下格外辉煌，而且很是壮观。"},
        ];
    allTravelRoutes.push(lasaRoute);
    allTravelInfos.push(lasaRouteInfo);
    console.log("Demo data set");
}

// 查看省级和查看全国的按钮
function ZoomControl(){
      // 默认停靠位置和偏移量
      this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;
      this.defaultOffset = new BMap.Size(10, 10);
}
ZoomControl.prototype = new BMap.Control();
ZoomControl.prototype.initialize = function(map){
    // 创建一个DOM元素
    var div = document.createElement("div");
    // 添加按钮
    var nationViewBtn = document.createElement("button");
    nationViewBtn.innerHTML = "查看全国";
    nationViewBtn.setAttribute("class", "btn btn-default btns");
    var provinceViewBtn = document.createElement("button");
    provinceViewBtn.innerHTML = "查看省级";
    provinceViewBtn.setAttribute("class", "btn btn-default btns");
    
    nationViewBtn.style.margin = "4px";
    nationViewBtn.onclick = function() {
        map.centerAndZoom("中国", 4);
    }
    
    provinceViewBtn.onclick = function() {
        map.setZoom(6);
    }
    
    div.appendChild(provinceViewBtn);
    div.appendChild(nationViewBtn);
    // 设置样式
    div.style.cursor = "pointer";
    map.getContainer().appendChild(div);
    // 将DOM元素返回
    return div;
}

// 新建旅游路线的按钮

function newRouteControl(){
      // 默认停靠位置和偏移量
      this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
      this.defaultOffset = new BMap.Size(10, 10);
}
newRouteControl.prototype = new BMap.Control();
newRouteControl.prototype.initialize = function(map){
    // 创建一个DOM元素
    var div = document.createElement("div");
    // 添加按钮
    var newRouteStartBtn = document.createElement("button");
    newRouteStartBtn.innerHTML = "开始新旅行";
    newRouteStartBtn.setAttribute("class", "btn btn-default btns");
    var newRouteEndBtn = document.createElement("button");
    newRouteEndBtn.innerHTML = "结束当前旅行";
    newRouteEndBtn.setAttribute("class", "btn btn-default btns");
    
    newRouteStartBtn.style.margin = "4px";
    newRouteStartBtn.onclick = function() {
        isNewRouteCreatable = true;
    }
    
    newRouteEndBtn.onclick = function() {
        isNewRouteCreatable = false;
    }
    
    div.appendChild(newRouteEndBtn);
    div.appendChild(newRouteStartBtn);
    // 设置样式
    div.style.cursor = "pointer";
    // 添加DOM元素到地图中
    map.getContainer().appendChild(div);
    // 将DOM元素返回
    return div;
}

// 设置地图控件
function setControls() {
    // 创建控件
    var zoomControlLocal = new ZoomControl();
    var newRouteControlLocal = new newRouteControl();
    // 添加到地图当中
    map.addControl(zoomControlLocal);
    map.addControl(newRouteControlLocal);
    console.log("control set.");
}

/******************** json文本与本地数据对象转换 ********************/
// 解析全部旅行的json为本地数据对象
function unpackAllTravelJsonToLocalTravelData(jsonPara) {
    for (var i = 0; i < jsonPara.length; i++) {
        var currentLocal = singleTravelJsonToLocalTravelData(jsonPara[i]);
        allTravelRoutes.push(currentLocal.points);
        allTravelInfos.push(currentLocal.info);
    }
}

// 解析单次旅行的json并返回
function singleTravelJsonToLocalTravelData(jsonPara) {
    var targetTravel = new Object();
    targetTravel.points = new BMap.Point(jsonPara.longtitude, jsonPara.latitude);
    targetTravel.info = {title: jsonPara.city,  src: jsonPara.type,  discription: jsonPara.content};
    return targetTravel;
}

