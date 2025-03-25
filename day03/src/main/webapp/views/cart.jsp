<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    #cart_item_img{
        width:30px;
    }
    #cart_cnt{
        width:80px;
    }
</style>
<script>
    const cart = {
        init:function(){

        },
        del:function(item_id){
            let cust_id = '${sessionScope.cust.custId}';
            let c = confirm('삭제 하시겠습니까 ?');
            if(c == true){
                //location.href='/cart/del?custId='+cust_id+'&itemId='+item_id;
                location.href='<c:url value="/cart/del?custId='+cust_id+'&itemId='+item_id+'"/>';
            }
        },
        mod:function(item_id){
            let c = confirm('수정 하시겠습니까 ?');
            if(c == true){
                let cust_id = '${sessionScope.cust.custId}';
                let cart_cnt = $('#'+item_id).val();
                location.href='<c:url value="/cart/mod?custId='+cust_id+'&cartCnt='+cart_cnt+'&itemId='+item_id+'"/>';
            }
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
                <td><input id="${c.itemId}" type="number" value="${c.cartCnt}"></td>
                <td><fmt:formatDate  value="${c.itemRdate}" pattern="yyyy-MM-dd" /> </td>
                <td>
                    <button id="cart_mod_btn" class="btn btn-danger" onclick="cart.mod(${c.itemId})">UPDATE</button>
                </td>
                <td>
                    <button id="cart_del_btn" class="btn btn-primary" onclick="cart.del(${c.itemId});">DELETE</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
