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
    const map2 = {
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

            this.getData(map,target);

        },
        getData:function(map, target){
            $.ajax({
                url:'<c:url value="/getcontent"/>',
                data:{target:target},
                success:(result)=>{
                    this.makeMarkers(map, result);
                },
                error:()=>{}
            });
        },
        makeMarkers:function(map, datas){

            // 배열을 돌려서 (each)
            // 각 데이터를 이용하여 마커를 생성 하고
            // 각 마커에 인포윈도우를 생성 하고
            // 각 마커에 이벤트를 등록 한다.
            let imgSrc1 = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';


            let result = '';

            $(datas).each((index,item)=>{
                let imgSrc2 = '<c:url value="/img/'+item.markerImg+'"/> ';

                let imgSize = new kakao.maps.Size(30,30);
                let markerImg = new kakao.maps.MarkerImage(imgSrc2, imgSize);

                var markerPosition  = new kakao.maps.LatLng(item.markerLat, item.markerLng);
                var marker = new kakao.maps.Marker({
                    image: markerImg,
                    map:map,
                    position: markerPosition
                });
                let iwContent = '<p>'+item.markerTitle+'</p>';
                iwContent += '<img style="width:80px;" src="<c:url value="/img/'+item.markerImg+'"/> ">';

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
                    location.href = '<c:url value="/map/go?target='+item.markerId+'"/>';
                });

                // Make Content List
                result += '<p>';
                result += '<a href="<c:url value="/map/go?target='+item.markerId+'"/>">';
                result += '<img width="20px" src="<c:url value="/img/'+item.markerImg+'"/> ">';
                result += item.markerId+' '+item.markerTitle;
                result += '</a>';
                result += '</p>';
            });

            $('#content').html(result);
        }

    }
    $(function(){
        map2.init();
    });
</script>

<div class="col-sm-10">
    <div class="row">
        <div class="col-sm-8 col-lg-6">
            <h2>Map2 Page</h2>
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