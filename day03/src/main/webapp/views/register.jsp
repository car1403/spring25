<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
    <h2>Register Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form>
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" class="form-control" placeholder="Enter id" id="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" placeholder="Enter name" id="name">
                </div>
                <button type="submit" class="btn btn-primary">REGISTER</button>
            </form>
        </div>
        <div class="col-sm-4">
            <p>회원가입을 위해서는 ID, PWD, NAME을 입력하세요</p>
        </div>
    </div>

</div>
