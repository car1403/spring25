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
        init:function(){
            this.displayMap();
        },
        displayMap:function(){
            var mapContainer = document.getElementById('map');
            var mapOption = {
                    center: new kakao.maps.LatLng(37.501634, 127.039886),
                    level: 3
                };
            var map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
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