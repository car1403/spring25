<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    .input_bg{
        background: aliceblue !important;
    }
</style>
<script>
    const jq4 = {
        init:function(){

            $('#id').focus(function(){
                $(this).addClass('input_bg');
            });
            $('#pwd').focus(function(){
                $(this).addClass('input_bg');
            });

            $('#id').blur(function(){
                $(this).removeClass('input_bg');
            });
            $('#pwd').blur(function(){
                $(this).removeClass('input_bg');
            });

            $('#login_btn').click(()=>{
                this.check();
            });
        },
        check:function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            console.log('ID: %s, PWD: %s',id,pwd);
            if(id == '' || id == null){
                $('#msg').text('ID를 입력하세요');
                $('#id').focus();
                return;
            }
            if(pwd == '' || pwd == null){
                $('#msg').text('PWD를 입력하세요');
                $('#pwd').focus();
                return;
            }
            this.send();
        },
        send:function(){
            console.log('Login Implementation.........');
            $('#login_form').attr('method','post');
            $('#login_form').attr('action','<c:url value="/jq/loginimpl"/>');
            $('#login_form').submit();
        }
    }
    $().ready(function(){
       jq4.init();
    });
</script>

<div class="col-sm-10">
    <h2>jQuery4 Page</h2>
    <div class="row">
        <div class="col-sm-6">
            <form id="login_form">
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" name="id" class="form-control" placeholder="Enter id" id="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name="pwd" class="form-control" placeholder="Enter password" id="pwd">
                </div>
            </form>
            <button id="login_btn" class="btn btn-primary">LOGIN</button>
        </div>
        <div class="col-sm-6">
            <h4 id="msg"></h4>
        </div>
    </div>
</div>









