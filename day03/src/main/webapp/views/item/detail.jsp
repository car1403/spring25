<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>

</script>

<div class="col-sm-10">
    <h2>Item Detail Page</h2>
    <h3>${item.itemId}</h3>
    <img src="<c:url value="/img/${item.itemImgname}"/>">
    <h3>${item.itemName}</h3>
    <h3>${item.itemPrice}</h3>
    <h3>${item.itemRdate}</h3>

</div>