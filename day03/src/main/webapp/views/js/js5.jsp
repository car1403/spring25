<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
function clickBtn(){
    alert('click button');
}
window.onload = function(){
    let aclick = document.querySelector('#aclick');
    aclick.onclick = function(){
        let c = confirm('이동하시겠습니까?');
        if(c){
            location.href = 'http://www.naver.com';
        }
    }
}
</script>

<div class="col-sm-10">
    <h2>JS3 Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <button id="btn" onclick="clickBtn()">Button</button>
    <a href="#" id="aclick">Click</a>
</div>