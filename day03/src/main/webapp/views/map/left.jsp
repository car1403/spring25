<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Left Page --%>
<div class="col-sm-2">

    <h3>Map Left</h3>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/map/map1"/> ">map1</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/map/map2"/>">map2</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/map/map3"/>">map3</a>
        </li>
    </ul>
    <hr class="d-sm-none">
</div>