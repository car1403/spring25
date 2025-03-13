<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    #result{
        border:2px solid red;
        width:300px;
    }
</style>
<script>
    const ajax2 = {
        init:function(){
            $('#get_btn').click(()=>{
                this.getData();
            });
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getwts"/> ',
                success:(result)=>{
                    this.display(result);
                },
                error:()=>{}
            });
        },
        display:function(data){
            let result = '';
            $(data).each((index,item)=>{
                result += '<tr>';
                result += '<td>'+item.day+'</td>';
                result += '<td>'+item.hi+'</td>';
                result += '<td>'+item.low+'</td>';
                result += '</tr>';
            });
            $('#wts > tbody').html(result);
        }
    }
    $(function(){
        ajax2.init();
    });
</script>

<div class="col-sm-10">
    <h2>AJAX2 Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <button id="get_btn">Get Weather</button>
    <table id="wts" class="table">
        <thead class="thead-light">
        <tr>
            <th>Day</th>
            <th>Hi</th>
            <th>Low</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>