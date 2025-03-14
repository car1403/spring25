<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    #map{
        width: auto;
        height: 300px;
        border: 2px solid red;
    }
    #content{
        margin-top: 83px;
        width:auto;
        height:300px;
        border: 2px solid red;
        overflow: auto;
    }
</style>
<script>
    const map1 = {
        init:function(){
            this.makeMap(37.554472, 126.980841,'남산','s1.jpg',100);

            $('#sbtn').click(()=>{
                this.makeMap(37.554472, 126.980841,'남산','s1.jpg',100);
            });
            $('#bbtn').click(()=>{
                this.makeMap(35.175109, 129.175474,'해운대','s2.jpg',200);
            });
            $('#jbtn').click(()=>{
                this.makeMap(33.254564, 126.560944,'서귀포','s3.jpg',300);
            });
        },
        makeMap:function(lat, lng, title, img, target){
            var mapContainer = document.getElementById('map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 7
            };
            var map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                map:map,
                position: markerPosition
            });

            let iwContent = '<p>'+title+'</p>';
            iwContent += '<img style="width:80px;" src="<c:url value="/img/'+img+'"/> ">';

            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent,

            });

            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            kakao.maps.event.addListener(marker, 'click', function() {
                // 127.0.0.1/map/go
                location.href = '<c:url value="/map/go?target='+target+'"/>';
            });

            this.makeMarkers(map,target);

        },
        makeMarkers:function(map, target){
            let datas = [];
            if(target == 100){
                datas = [
                    {lat:37.564472, lng:126.990841, title:'순대국1', img:'ss1.jpg', target:101},
                    {lat:37.544472, lng:126.970841, title:'순대국2', img:'ss2.jpg', target:102},
                    {lat:37.564472, lng:126.970841, title:'순대국3', img:'ss3.jpg', target:103},
                    {lat:37.565472, lng:126.980841, title:'순대국4', img:'ss4.jpg', target:104},
                    {lat:37.563472, lng:126.974841, title:'순대국5', img:'ss5.jpg', target:105},
                    {lat:37.565472, lng:126.972841, title:'순대국6', img:'ss6.jpg', target:106},
                    {lat:37.566472, lng:126.971841, title:'순대국7', img:'ss7.jpg', target:107}
                ];
            }else if(target == 200){
                datas = [
                    {lat:35.176109, lng:129.165474, title:'순대국1', img:'ss1.jpg', target:201},
                    {lat:35.171109, lng:129.174474, title:'순대국2', img:'ss2.jpg', target:202},
                    {lat:35.179109, lng:129.172474, title:'순대국3', img:'ss3.jpg', target:203},
                    {lat:35.173109, lng:129.166474, title:'순대국4', img:'ss4.jpg', target:204}
                ];
            }

            // 배열을 돌려서 (each)
            // 각 데이터를 이용하여 마커를 생성 하고
            // 각 마커에 인포윈도우를 생성 하고
            // 각 마커에 이벤트를 등록 한다.
            let imgSrc1 = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
            let imgSrc2 = '<c:url value="/img/m.jpg"/> ';


            let result = '';

            $(datas).each((index,item)=>{
                let imgSize = new kakao.maps.Size(30,30);
                let markerImg = new kakao.maps.MarkerImage(imgSrc2, imgSize);

                var markerPosition  = new kakao.maps.LatLng(item.lat, item.lng);
                var marker = new kakao.maps.Marker({
                    image: markerImg,
                    map:map,
                    position: markerPosition
                });
                let iwContent = '<p>'+item.title+'</p>';
                iwContent += '<img style="width:80px;" src="<c:url value="/img/'+item.img+'"/> ">';

                var infowindow = new kakao.maps.InfoWindow({
                    content : iwContent,

                });
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    infowindow.open(map, marker);
                });
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
                kakao.maps.event.addListener(marker, 'click', function() {
                    // 127.0.0.1/map/go
                    location.href = '<c:url value="/map/go?target='+item.target+'"/>';
                });

                // Make Content List
                result += '<p>';
                result += '<a href="<c:url value="/map/go?target='+item.target+'"/>">';
                result += '<img width="20px" src="<c:url value="/img/'+item.img+'"/> ">';
                result += item.target+' '+item.title;
                result += '</a>';
                result += '</p>';
            });

            $('#content').html(result);
        }

    }
    $(function(){
        map1.init();
    });
</script>

<div class="col-sm-10">
    <div class="row">
        <div class="col-sm-8 col-lg-6">
            <h2>Map1 Page</h2>
            <button id="sbtn" class="btn btn-primary">Seoul</button>
            <button id="bbtn" class="btn btn-primary">Busan</button>
            <button id="jbtn" class="btn btn-primary">Jeju</button>
            <div id="map"></div>
        </div>
        <div class="col-sm-4 col-lg-6">
            <div id="content"></div>
        </div>
    </div>


</div>