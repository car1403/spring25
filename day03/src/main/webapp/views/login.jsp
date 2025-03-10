<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-5">
    <h2>Login Page</h2>
    <form>
        <div class="form-group">
            <label for="id">Id:</label>
            <input type="text" class="form-control" placeholder="Enter id" id="id">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="pwd">
        </div>

        <button type="submit" class="btn btn-primary">LOGIN</button>
    </form>
</div>
