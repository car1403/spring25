<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>

</script>

<div class="col-sm-10">
    <h2>Item Center</h2>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Img</th>
            <th>Name</th>
            <th>Price</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${items}">
            <tr>
                <td>${i.itemImgname}</td>
                <td><a href="<c:url value="/item/detail?id=${i.itemId}"/>">${i.itemName}</a></td>
                <td><fmt:formatNumber type="number" pattern="###,###" value="${i.itemPrice}" /></td>
                <td><fmt:formatDate  value="${i.itemRdate}" pattern="yyyy-MM-dd" /> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>