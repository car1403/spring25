
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Next Page</h1>
    <c:forEach var="it" items="${myitems}">
        <h4>${it.name} ${it.price}</h4>
    </c:forEach>
</body>
</html>







