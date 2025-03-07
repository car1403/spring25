<%--
  Created by IntelliJ IDEA.
  User: jeanm
  Date: 2025-03-07
  Time: 오전 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1{
            color:red;
            background: black;
        }
        h2{
            color:yellow;
            background: blue;
        }
        span{
            color:white;
            background: blueviolet;
        }

    </style>
    <script>
        function spanClick(){
            alert('Click Span');
        }
        let h2 = document.querySelector('h2');
        h2.innerHTML = 'Replace Text';
    </script>
</head>
<body>
    <h1>Main Page</h1>
    <h2>Header2</h2>
    <span onclick="spanClick();">Span</span>
</body>
</html>
