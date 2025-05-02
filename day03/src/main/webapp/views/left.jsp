<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Left Page --%>
<div class="col-sm-2">

    <h3>Main Left</h3>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/link1"/> ">Link1</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/link2"/>">Link2</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/link3"/>">Link3</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/link4"/>">Link4</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/link5"/>">Link5</a>
        </li>
    </ul>
    <hr class="d-sm-none">
</div>