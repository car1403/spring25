<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .fakeimg {
            height: 200px;
            width:300px;
            background: #aaa;
        }
        #scroll-btn {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 13%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: 2px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }
        #scroll-btn2 {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 5%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: bold 10px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn2.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }
    </style>
    <script>

    </script>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>HTML5 & CSS & JavaScript</h1>
    <p>Resize this responsive page to see the effect!</p>
</div>
<ul class="nav justify-content-end">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/login"/> ">Login</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/register"/> ">Register</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/about"/> ">About us</a>
    </li>
</ul>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="<c:url value="/" /> ">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">JS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">AJAX</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Map</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Chart</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container" style="margin-top:30px">
    <div class="row">
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Footer</p>
</div>

</body>
</html>
