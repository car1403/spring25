<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<script>
    window.onload = function(){
        let time = document.querySelector('#time');
        setInterval(function(){
            let date = new Date();
            time.innerHTML = date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
        }, 1000);
    }

</script>

<div class="col-sm-10">
    <h2>JavaScript Center</h2>
    <h5 id="time"></h5>

</div>

