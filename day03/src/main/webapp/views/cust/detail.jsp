<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>
    const cust_detail = {
        init:function(){
            $('#cust_update_btn').click(()=>{
                this.send();
            });
            $('#cust_delete_btn').click(()=>{
                let c = confirm("삭제 하시겠습니까 ?");
                if(c == true){
                    let id = $('#id').val();
                    location.href='<c:url value="/cust/del?id='+id+'"/>';
                }

            });
        },
        send:function(){
            $('#cust_add_form').attr('method','post');
            $('#cust_add_form').attr('action','<c:url value="/cust/updateimpl"/>');
            $('#cust_add_form').submit();
        }
    }
    $(function(){
        cust_detail.init();
    });
</script>

<div class="col-sm-10">
    <h2>Cust Detail Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="cust_add_form">
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" value="${cust.custId}" name="custId" class="form-control" placeholder="Enter id" id="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" value="${cust.custPwd}"  name="custPwd"  class="form-control" placeholder="Enter password" id="pwd">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" value="${cust.custName}"  name="custName"  class="form-control" placeholder="Enter name" id="name">
                </div>
            </form>
            <button id="cust_update_btn" class="btn btn-primary">Update</button>
            <button id="cust_delete_btn" class="btn btn-danger">Delete</button>

        </div>
        <div class="col-sm-4">
            <p id="msg">Cust를 입력 하세요.</p>
        </div>
    </div>
</div>