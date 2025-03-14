<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Center Page--%>
<style>
    #map{
        width: 400px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let mapCenter = {
        merker:null,
        map:null,
        init:function(){
            this.displayMap();

            setInterval(()=>{
                this.getData();
            },3000);

        },
        displayMap:function(){
            var mapContainer = document.getElementById('map');
            var mapOption = {
                    center: new kakao.maps.LatLng(37.501634, 127.039886),
                    level: 3
                };
            this.map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        },
        getData:function(){
            $.ajax({
                url:'/getlatlng',
                success:(result)=>{
                    //alert(result.lat);
                    this.showMarker(result);
                }
            });
        },
        showMarker:function(result){
           // var moveLatLon = new kakao.maps.LatLng(result.lat, result.lng);
           // this.map.panTo(moveLatLon);
            if(this.marker != null){
                this.marker.setMap(null);
            }
            console.log(`%f, %f`,result.lat, result.lng)
            var markerPosition  = new kakao.maps.LatLng(result.lat, result.lng);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });
            this.marker.setMap(this.map);
        }
    }
    $(function(){
        mapCenter.init();
    });
</script>

<div class="col-sm-10">
    <h2>Map Center</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <div id="map"></div>
</div>