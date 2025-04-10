<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>
<style>
    .updown_btn{
        width:30px;
        height:30px;
    }
</style>
<script>
    const item_detail ={
        init:function(){
            $('#down_btn').click(()=>{
                let cnt = Number($('#cnt').val());
                if(cnt > 0){
                    cnt = cnt-1
                    $('#cnt').val(cnt);
                    let total = cnt * ${item.itemPrice};
                    $('#total').html('Total: '+total+' 원');
                }

            });
            $('#up_btn').click(() => {
                let cnt = Number($('#cnt').val());
                cnt = cnt + 1
                $('#cnt').val(cnt);
                let total = cnt * ${item.itemPrice};
                $('#total').html('Total: ' + total + ' 원');
            });
            // restController 로 cart에 add 하는 기능
            $('#add_bnt').click(()=>{
                let item_id = ${item.itemId};
                let cust_id = '${sessionScope.cust.custId}';
                let cart_cnt = $('#cnt').val();
                $('#myModal').modal('hide');

                $.ajax({
                    url:'/cartaddimpl',
                    data:{custId:cust_id, itemId:item_id, cartCnt:cart_cnt},
                    success:(result)=>{
                        result ? alert('정상등록') : alert('등록 실패');
                    }
                });
            });
            // Controller 로 cart에 add 하는 기능
            $('#go_bnt').click(()=>{
                let item_id = ${item.itemId};
                let cust_id = '${sessionScope.cust.custId}';
                let cart_cnt = $('#cnt').val();
                location.href='<c:url value="/cart/add?custId='+cust_id+'&cartCnt='+cart_cnt+'&itemId='+item_id+'"/>';
            });
        }
    }
    $(function () {
        item_detail.init();
    });
</script>

<div class="col-sm-10">
    <h2>Item Detail Page</h2>
    <h3>${item.itemId}</h3>
    <h4 id="total">0</h4>
    <div class="row">
        <div class="col-sm-2">
            <img class="updown_btn" id="down_btn" src="<c:url value="/img/down.jpg"/>"/>
        </div>
        <div class="col-sm-5">
            <input type="number" value="0" class="form-control" id="cnt">
        </div>
        <div class="col-sm-2">
            <img class="updown_btn"  id="up_btn" src="<c:url value="/img/up.jpg"/>"/>
        </div>
        <div class="col-sm-3">
            <!-- Button to Open the Modal -->
            <button type="button"  data-backdrop="static" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>
        </div>
    </div>
    <img src="<c:url value="/img/${item.itemImgname}"/>">
    <h3>${item.itemName}</h3>
    <h3><fmt:formatNumber type="number" pattern="#,###" value="${item.itemPrice}"/></h3>
    <h3><fmt:formatDate  value="${item.itemRdate}" pattern="yyyy-MM-dd: HH:mm:ss"/></h3>

</div>

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">장바구니에 넣으시겠습니까 ?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                장바구니 화면으로 이동 합니다.
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="add_bnt">Add Cart</button>
                <button type="button" class="btn btn-danger" id="go_bnt">Go Cart</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>