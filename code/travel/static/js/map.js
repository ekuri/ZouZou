// 百度地图API功能

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

// current travel id
var curentTravelID

/******************** build map ********************/
var isMapBuilt = false;
function buildForTag(targetTag, travelID) {
    if (isMapBuilt)
        return;
    getAllTravelDataFromServer(targetTag, travelID);
};

/******************** main fuction to build a map ********************/
// load map
function loadMap(targetTag) {
    map = new BMap.Map(targetTag);
    isMapBuilt = true;
    map.centerAndZoom("中国", 5);
    map.disableScrollWheelZoom();
    map.disableDoubleClickZoom();
    console.log("map loaded.");
}

// get user travel data from server
function getAllTravelDataFromServer(targetTag, travelID) {
    var xmlhttp;
    if (window.XMLHttpRequest)
      {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
      }
    else
      {// code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    xmlhttp.onreadystatechange=function()
      {
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            var mapSetfocus = false;
            jsonArray = eval(xmlhttp.responseText)
            console.log("get data finished.");
            addLocalDataFromJsonArray(jsonArray);
            loadMap(targetTag);
            setMapInformation();
            map.addEventListener("tilesloaded", function() {
                if (mapSetfocus)
                    return;
                console.log("map load finished.");
                map.centerAndZoom(allTravelRoutes[0][0], 15);
                mapSetfocus = true;
            });
        }
      }
    xmlhttp.open("GET","/travel/path/" + travelID, true);
    xmlhttp.send();
}

// set travel route and marker, some event listener will also be registered
function setMapInformation() {
    //getBoundarys(provinces);
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
            /*ply.addEventListener("click", function() {
                map.centerAndZoom(this.provinceName, 7);
            });*/
        } 
    }); 
}


/******************** get and set information windows ********************/

function getInfoWindowContent(title, src, discription, time) {
    timeLocal = time.slice(0, time.indexOf("+"));
    var sContent =
        "<div class='post-tag post-tag-time'>" +
                               " <span class='fui-time'></span>" +
                                "<a href='#''><span>" + timeLocal +"</span></a>" +
        "</div>" +
        "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + title + "</h4>" + 
        "<img style='float:right;margin:4px' id='imgDemo' src='/media/" + src + "' width='128' height='128' title='" + title + "'/>" + 
        "<p style='margin:0;line-height:1.5;font-size:16px;text-indent:2em;'>" + discription + "</p>" + 
        "</div>";
    return sContent;
}
function getInfoWindowChangerContent() {
    var sContent = 
        "<p style='margin:0 0 5px 0;padding:0.2em 0'>" + "信息添加" + "</p>" + 
        "<form method='post' enctype='multipart/form-data' target='hidenIframe' action='/travel/new/newTravelPoint'>" +
        "<iframe name='hidenIframe' style='width: 0px; height: 0px; border: none;'>" + "</iframe>" + 
        "<input type='date' name='date'>" + "</input>"+
        "<input type='time' name='time'>" + "</input>"+
        "<textarea name='description' style='width: 600px;height: 150px;'>说点什么吧～</textarea>" +
        "<image id='newSelectedImage'>" + "</image>" +
        "<input name='image' style='float: right;' type='file' accept='.jpg,.png,.jpeg' onchange='imageSelected(this.value)'></input>" +
        "<input style='float: left;' type='submit' value='submit'></input>" +
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
            console.log("marker added");
            
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
    return new BMap.InfoWindow(getInfoWindowContent(infoParam.title, infoParam.src, infoParam.discription, infoParam.time));
}

/******************** create new Route ********************/

function paintNewRoute() {
    map.removeOverlay(newRoute);
    newRoute = new BMap.Polyline(newRoutePoints, {strokeColor:"green", strokeWeight:4, strokeOpacity:0.5});
    map.addOverlay(newRoute);
}

function addMapEventListeners() {
    map.addEventListener("rightclick", function(d) {
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
function addLocalDataFromJsonArray(jsonArray) {
    var pointArrayLocal = new Array();
    var infoArrayLocal = new Array();
    for (var i = 0; i < jsonArray.length; i++) {
        addLocalDataFromSimgleJsonObj(jsonArray[i], pointArrayLocal, infoArrayLocal);
    }
    allTravelRoutes.push(pointArrayLocal);
    allTravelInfos.push(infoArrayLocal);
}

function addLocalDataFromSimgleJsonObj(jsonObj, pointArray, infoArray) {
    pointArray.push(new BMap.Point(jsonObj.longtitude, jsonObj.latitude));
    var routeInfoLocal = {title: "",  src: jsonObj.picture,  discription: jsonObj.content, time: jsonObj.time};
    infoArray.push(routeInfoLocal);
}