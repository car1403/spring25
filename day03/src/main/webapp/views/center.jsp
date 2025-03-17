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
                    alert(result);
                    //this.display(result);
                }
            });
        },
        display:function(result){
            //{weather:'오늘의 날씨는 추워'}
            $('#wt').html(result.weather);
        }
    }
    $(function(){
        center.init();
    });
</script>

<div class="col-sm-10">
    <h2>TITLE HEADING</h2>
    <h5 id="wt">Title description, Sep 2, 2025</h5>
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