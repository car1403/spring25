<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
    const jq1 = {
        init:function(){
            $('#h5').text('Replay Text');
        }
    }

    $().ready(function(){
       jq1.init();
    });
</script>

<div class="col-sm-10">
    <h2>jQuery1 Page</h2>
    <h5 id="h5">Title description, Sep 2, 2025</h5>

</div>