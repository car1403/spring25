<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #map{
        width:auto;
        height: 300px;
        border: 2px solid red;
    }
    #winfo{
        width:auto;
        border:2px solid blue;
        font-size: 12px;
    }
</style>

<script>
    const link3 = {
        init:function(){
            $('#get_btn').click(()=>{
                let loc = $('#loc').val();
                //alert(loc);
                this.getData(loc);
            });
        },
        getData:function(loc){
            $.ajax({
                url:'<c:url value="/getwinfo"/>',
                data:{loc:loc},
                success:(result)=>{
                    this.display(result);
                    this.showMap(result);
                }
            });
        },
        display:function(result){
            let temp = result.main.temp;
            let feel = result.main.feels_like;
            let speed = result.wind.speed;
            let desc = result.weather[0].description;
            let icon = result.weather[0].icon;
            let txt = '';
            txt += '<p>기온: '+temp+'</p>';
            txt += '<p>체감: '+feel+'</p>';
            txt += '<p>바람: '+speed+'</p>';
            txt += '<p>날씨: '+desc+'</p>';
            txt += '<img src="https://openweathermap.org/img/wn/'+icon+'@2x.png">';
            $('#winfo').html(txt);
        },
        showMap:function(result){
            let lat = result.coord.lat;
            let lng = result.coord.lon;

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
        link3.init();
    });
</script>

<div class="col-sm-10">
    <h2>Link3 Page</h2>
    <div class="row">
        <div class="col-sm-6">
            <!-- Select  -->
            <div class="form-group">
                <label for="loc">Location:</label>
                <div class="row">
                    <div class="col-sm-6">
                        <select class="form-control" id="loc">
                            <option value="a">전국</option>
                            <option value="s">서울</option>
                            <option value="b">부산</option>
                            <option value="j">제주</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <button id="get_btn" type="button" class="btn btn-success">Get Weather</button>
                    </div>
                </div>
            </div>
            <div id="winfo"></div>

            <!-- Weather info  -->

        </div>
        <div class="col-sm-6">
            <div id="map"></div>
        </div>
    </div>
</div>
