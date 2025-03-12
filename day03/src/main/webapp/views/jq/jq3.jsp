<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    #result{
        border: 2px solid red;
        width: 500px;
        margin-top: 30px;
    }
</style>
<script>

</script>

<div class="col-sm-10">
    <h2>jQuery3 Page</h2>
    <button id="append" type="button" class="btn btn-danger">Append</button>
    <button id="prepend" type="button" class="btn btn-danger">Prepend</button>
    <button id="after" type="button" class="btn btn-danger">After</button>
    <button id="before" type="button" class="btn btn-danger">Before</button>
    <button id="remove" type="button" class="btn btn-danger">Remove</button>
    <button id="empty" type="button" class="btn btn-danger">Empty</button>
    <div id="result"></div>
</div>