<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>
    const board_detail = {
        init:function(){
            $('#board_update_btn').click(()=>{
                this.send();
            });
            $('#board_delete_btn').click(()=>{
                let c = confirm("삭제 하시겠습니까 ?");
                if(c == true){
                    let id = $('#id').val();
                    location.href='<c:url value="/board/del?id='+id+'"/>';
                }

            });
        },
        send:function(){
            $('#board_add_form').attr('method','post');
            $('#board_add_form').attr('action','<c:url value="/board/updateimpl"/>');
            $('#board_add_form').submit();
        }
    }
    $(function(){
        board_detail.init();
    });
</script>

<div class="col-sm-10">
    <h2>Board Detail Page</h2>
    <h5>글번호: ${board.boardId}</h5>
    <h5>글쓴이: ${board.boardAuthor}</h5>
    <h5>작성일: <fmt:formatDate  value="${board.boardRdate}" pattern="yyyy-MM-dd : HH:mm:ss" /></h5>

    <div class="row">
        <div class="col-sm-8">
            <form id="board_add_form">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" value="${board.boardTitle}" name="boardTitle" class="form-control"
                           placeholder="Enter Title" id="title">
                    <label for="content">Content:</label>
                    <textarea name="boardContent" class="form-control" rows="5" id="content">${board.boardContent}</textarea>
                </div>
                <input type="hidden" id="id" name="boardId" value="${board.boardId}">

            </form>
            <button id="board_update_btn" class="btn btn-primary">Update</button>
            <button id="board_delete_btn" class="btn btn-danger">Delete</button>

        </div>
        <div class="col-sm-4">
            <p id="msg">게시글을 입력 하세요.</p>
        </div>
    </div>
</div>