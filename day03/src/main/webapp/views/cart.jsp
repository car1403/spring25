<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    #cart_item_img{
        width:30px;
    }
</style>
<script>
    const cart = {
        init:function(){

        },
        del:function(item_id){
            let cust_id = '${sessionScope.cust.custId}';
            alert('del:'+cust_id+' '+item_id);
            location.href='';
        }
    }
    $(function(){
        cart.init();
    });
</script>
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
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carts}">
            <tr>
                <td><img id="cart_item_img" src="<c:url value="/img/${c.itemImgname}"/>"></td>
                <td>${c.itemName}</td>
                <td><fmt:formatNumber type="number" pattern="#,###" value="${c.itemPrice}" /></td>
                <td>${c.cartCnt}</td>
                <td><fmt:formatDate  value="${c.itemRdate}" pattern="yyyy-MM-dd" /> </td>
                <td>
                    <button id="cart_mod_btn" class="btn btn-danger">UPDATE</button>
                </td>
                <td>
                    <button id="cart_del_btn" class="btn btn-primary" onclick="cart.del(${c.itemId});">DELETE</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
