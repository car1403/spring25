<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
    const center = {
        init:function(){
            this.getData();
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getwh"/>',
                success:(result)=>{
                    this.display(result);
                }
            });
        },
        display:function(result){
            //{weather:'오늘의 날씨는 추워'}
            let data = (result.response.body.items.item[0].wfSv).split('\n').join('<br>');
            $('#wt').html(data);
        }
    }
    $(function(){
        center.init();
    });
</script>

<div class="col-sm-10">
    <h2>TITLE HEADING</h2>
    <p id="wt">Title description, Sep 2, 2025</p>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${boards}">
            <tr>
                <td>${b.id}</td>
                <td>${b.title}</td>
                <td>${b.date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>