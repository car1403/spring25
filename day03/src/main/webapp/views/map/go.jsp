
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<%--Center Page--%>
<style>
    #map{
        width: auto;
        height: 300px;
        border: 2px solid red;
    }
</style>
<script>
    const go = {
        init:function(){
            this.makeMap();
        },
        makeMap:function(){
            let lat = ${marker.markerLat};
            let lng = ${marker.markerLng};
            
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

        }
    }
    $(function(){
        go.init();
    });
</script>

<div class="col-sm-10">
    <h2>Go Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <h3>${marker.markerId}</h3>
    <h3>${marker.markerTitle}</h3>
    <h3>${marker.markerLat}</h3>
    <h3>${marker.markerLng}</h3>
    <h3>${marker.markerTarget}</h3>
    <div id="map"></div>

</div>