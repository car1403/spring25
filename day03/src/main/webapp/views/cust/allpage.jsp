<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>

</script>

<div class="col-sm-10">
    <h2>Cust Get Page</h2>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Id</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cpage.getList()}">
            <tr>
                <td>${c.custId}</td>
                <td><a href="<c:url value="/cust/detail?id=${c.custId}"/>">${c.custName}</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../page.jsp"/>
</div>