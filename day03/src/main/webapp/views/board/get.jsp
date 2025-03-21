<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>

</script>

<div class="col-sm-10">
    <h2>Board Get Page</h2>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Date</th>
            <th>Hit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${boards}">
            <tr>
                <td>${b.boardId}</td>
                <td><a href="<c:url value="/board/detail?id=${b.boardId}"/>">${b.boardTitle}</a></td>
                <td><fmt:formatDate  value="${b.boardRdate}" pattern="yyyy-MM-dd" /> </td>
                <td>${b.boardHit}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>