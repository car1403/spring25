<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<style>
    #result{
        border: 2px solid red;
        width: 300px;
        margin-top: 30px;
    }
</style>

<script>
    const jq2 = {
        init:function(){
            // 버튼을 클릭하면 getData를 호출 한다.
            // 버튼에 이벤트를 붙인다
            $('#aclick').click (() => {
                this.getData();
            });
        },
        getData:function(){
            const data = [
                {rank:Math.floor(Math.random()*10), title:'미국주식', updown:'up'},
                {rank:Math.floor(Math.random()*10), title:'날씨', updown:'up'},
                {rank:Math.floor(Math.random()*10), title:'미세먼지', updown:'down'},
                {rank:Math.floor(Math.random()*10), title:'봄', updown:'up'},
                {rank:Math.floor(Math.random()*10), title:'점심식사', updown:'down'}
            ];

            this.display(data);
        },
        display:function(data){
            let result = '';
            $(data).each((index,item)=>{
                result += '<tr>';
                result += '<td>'+item.rank+'</td>';
                result += '<td>'+item.title+'</td>';
                result += '<td>'+item.updown+'</td>';
                result += '</tr>';
            });
            $('#rank > tbody').html(result);
        }
    }

    $().ready(()=>{
        jq2.init();
    });
</script>

<div class="col-sm-10">
    <h2>JQ2 Page</h2>
    <button type="button" class="btn btn-primary" id="aclick">GET DATA</button>
    <table id="rank" class="table">
        <thead class="thead-light">
        <tr>
            <th>rank</th>
            <th>title</th>
            <th>updown</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>