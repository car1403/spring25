<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--Center Page--%>

<script>
    const center = {
        init:function(){
            this.getData();
            this.sse();
        },
        sse:function(){

            const sse = new EventSource("http://192.168.45.117:8088/connect?id=id01");

            sse.addEventListener('connect', (e) => {
                const { data: receivedConnectData } = e;
                console.log('connect event data: ',receivedConnectData);  // "connected!"
            });
            sse.addEventListener('count', e => {
                const { data: receivedCount } = e;
                console.log("count event data",receivedCount);
                $('#count').html(receivedCount);
            });
            sse.addEventListener('adminmsg', e => {
                const { data: receivedData } = e;
                console.log("count event data",receivedData);
                console.log("count event data2",JSON.parse(receivedData).content1);
                //this.display(JSON.parse(receivedData));
                //$('#count').html(receivedData);
            });
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getwh"/>',
                success:(result)=>{
                    this.display(result);
                },
                contentType: "application/x-www-form-urlencoded; charset=euc-kr"
            });
            $.ajax({
                url:'<c:url value="/getwh2"/>',
                success:(result)=>{
                    this.display2(result);
                },
                contentType: "application/x-www-form-urlencoded; charset=euc-kr"
            });
        },
        display:function(result){
            //{weather:'오늘의 날씨는 추워'}
            let data = (result.response.body.items.item[0].wfSv).split('\n').join('<br>');
            $('#wt').html(data);
        },
        display2:function(result){
            let txt = '';
            txt += '<p>'
            txt += result.main.temp;
            txt += result.weather[0].description;
            txt += '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'@2x.png">';
            txt += '</p>';
            $('#wt2').html(txt);
        }

    }
    $(function(){
        center.init();
    });
</script>

<div class="col-sm-10">
    <h2>TITLE HEADING</h2>
    <p id="wt">Title description, Sep 2, 2025</p>
    <p id="count">Title description, Sep 2, 2025</p>
    <div id="wt2"></div>
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Date</th>
            <th>Hit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${boards}">
            <tr>
                <td>${b.boardId}</td>
                <td><a href="<c:url value='/board/detail?id=${b.boardId}'/>"> ${b.boardTitle}</a></td>
                <td><fmt:formatDate  value="${b.boardRdate}" pattern="yyyy-MM-dd: HH:mm:ss" /></td>
                <td>${b.boardHit}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>