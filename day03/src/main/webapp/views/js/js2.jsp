<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    #result{
        border:2px solid red;
        width: 200px;
    }
</style>
<script>
    const js2 = {
        init:function(){
            this.getData();
        },
        getData:function(){
            const data = [
                {rank:1, title:'미국주식', updown:'up'},
                {rank:2, title:'날씨', updown:'up'},
                {rank:3, title:'미세먼지', updown:'down'},
                {rank:4, title:'봄', updown:'up'},
                {rank:5, title:'점심식사', updown:'down'}
            ];

            this.display(data);
        },
        display:function(data){
            let result = '';
            for(var a of data){
                result += '<h4>';
                result += a.rank+' '+a.title+' '+a.updown;
                result += '</h4>';
            }
            document.querySelector('#result').innerHTML = result;

        }
    }





    window.onload = function(){
        js2.init();
    }
</script>

<div class="col-sm-10">
    <h2>JS2 Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <div id="result"></div>
</div>