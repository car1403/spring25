<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #map{
        width:400px;
        height: 300px;
        border: 2px solid red;
    }
</style>
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
                            <option value="">전국</option>
                            <option value="">서울</option>
                            <option value="">부산</option>
                            <option value="">제주</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <button id="get_btn" type="button" class="btn btn-success">Get Weather</button>
                    </div>
                </div>

            </div>

            <!-- Weather info  -->

        </div>
        <div class="col-sm-6">
            <div id="map"></div>
        </div>
    </div>
</div>
