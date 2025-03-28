<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
    const board_add = {
        init:function(){
            $('#board_add_btn').click(()=>{
                this.send();
            });
        },
        send:function(){
            $('#board_add_form').attr('method','post');
            $('#board_add_form').attr('action','<c:url value="/board/addimpl"/>');
            $('#board_add_form').submit();
        }
    }
    $(function(){
        board_add.init();
    });
</script>

<div class="col-sm-10">
    <h2>Board Add Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="board_add_form">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" name="boardTitle" class="form-control"
                           placeholder="Enter Title" id="title">
                    <label for="content">Content:</label>
                    <textarea name="boardContent" class="form-control" rows="5" id="content"></textarea>
                </div>
                <input type="hidden" name="boardAuthor" value="${sessionScope.cust.custId}">

            </form>
            <button id="board_add_btn" class="btn btn-primary">Add</button>

        </div>
        <div class="col-sm-4">
            <p id="msg">게시글을 입력 하세요.</p>
        </div>
    </div>
</div>