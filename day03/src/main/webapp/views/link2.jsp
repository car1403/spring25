<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #wt{
        width: 400px;
        border: 2px solid red;
        font-size: 10px;
    }
    #map{
        width:400px;
        height:300px;
        border: 2px solid blue;

    }
</style>
<script>
    const link2 = {
        init:function(){
            $('#getbtn').click(()=>{
                let loc = $('#sel1').val();
                this.getData(loc);
            });
        },
        getData:function(loc){
            alert(loc);
            $.ajax({
                url:'<c:url value="/getcwh2"/>',
                data:{loc:loc},
                success:(result)=>{
                    this.display(result);
                    this.showMap(result);
                }
            });
        },
        showMap:function(result){
            let lat = result.coord.lat;
            let lon = result.coord.lon;
            var mapContainer = document.getElementById('map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat, lon),
                level: 3
            };
            var map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        },
        display:function(result){
            let txt = '';
            txt += '<p>'
            txt += result.main.temp;
            txt += result.weather[0].description;
            txt += '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'@2x.png">';
            txt += '</p>';
            $('#wt').html(txt);
        }
    }
    $(function(){
        link2.init();
    });

</script>

<div class="col-sm-10">
    <h2>Link2 Page</h2>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="sel1">Select list:</label>
                <div class="row">
                    <div class="col-sm-6">
                        <select class="form-control" id="sel1" name="loc">
                            <option value="5128581" selected>전국</option>
                            <option value="1835848">서울</option>
                            <option value="1838524">부산</option>
                            <option value="1846266">제주</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <button id="getbtn" type="button" class="btn btn-warning">Get Data</button>
                    </div>

                </div>
            </div>

            <h4 id="wt"></h4>
        </div>
        <div class="col-sm-6">
            <div id="map"></div>
        </div>
    </div>


</div>
