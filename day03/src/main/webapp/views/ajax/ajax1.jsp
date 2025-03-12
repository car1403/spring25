<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
    const ajax1 = {
        init:function(){
            $('#get_btn').click(()=>{
                this.getData();
            });
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getwt"/> ',
                success:(result)=>{
                    this.display(result);
                },
                error:()=>{}
            });
        },
        display:function(result){
            // {hi:16, low:3, location:'seoul'}
            $('#hi').text(result.hi);
            $('#low').text(result.low);
            $('#location').text(result.location);
        }
    }
    $(function(){
        ajax1.init();
    });
</script>

<div class="col-sm-10">
    <h2>AJAX1 Page</h2>
    <button id="get_btn">Get Data</button>
    <h5>Title description, Sep 2, 2025</h5>
    <h3 id="hi"></h3>
    <h3 id="low"></h3>
    <h3 id="location"></h3>
</div>