
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
    <h1>Next Page</h1>
    <table>
        <thead>
        <tr>
            <th>Image</th>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="it" items="${myitems}">
            <tr>
                <td>${it.imgName}</td>
                <td>${it.id}</td>
                <td>${it.name}</td>
                <td>${it.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>







