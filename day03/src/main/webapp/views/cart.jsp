<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
    <h2>Cart Page</h2>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Count</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carts}">
            <tr>
                <td>${c.itemImgname}</td>
                <td>${c.itemName}</td>
                <td>${c.itemPrice}</td>
                <td>${c.itemCnt}</td>
                <td>${c.itemRdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
