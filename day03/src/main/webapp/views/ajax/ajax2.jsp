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
        display:function(result){
            // [
            // {hi:16, low:3, location:'seoul',day:'mon'},
            // {hi:16, low:3, location:'seoul',day:'mon'},
            // {hi:16, low:3, location:'seoul',day:'mon'}
            // ]

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
    <div id="result"></div>
</div>