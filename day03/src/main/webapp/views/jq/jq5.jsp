<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    .input_bg{
        background: aliceblue !important;
    }
</style>
<script>
    const jq5 = {
        init:function(){

            $('#id').focus(function(){
                $(this).addClass('input_bg');
            });
            $('#pwd').focus(function(){
                $(this).addClass('input_bg');
            });
            $('#name').focus(function(){
                $(this).addClass('input_bg');
            });

            $('#id').blur(function(){
                $(this).removeClass('input_bg');
            });
            $('#pwd').blur(function(){
                $(this).removeClass('input_bg');
            });
            $('#name').blur(function(){
                $(this).removeClass('input_bg');
            });

            $('#register_btn').click(()=>{
                this.check();
            });

            $('#id').keyup(()=>{
                let id = $('#id').val();
                if(id.length >= 4){
                    $('#msg').text(id);
                    this.checkId(id);
                }

            });
        },
        checkId:function(id){
            $.ajax({
                url:'<c:url value="/checkid"/>',
                data:{cid:id},
                success:(result)=>{
                    //alert(result);
                    result ? $('#msg').text('OK') : $('#msg').text('NO!');
                },
                error:()=>{}
            });
        },
        check:function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let pwd2 = $('#pwd2').val();

            let name = $('#name').val();

            console.log('ID: %s, PWD: %s, NAME: %s',id,pwd, name);
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
            if(name == '' || name == null){
                $('#msg').text('NAME을 입력하세요');
                $('#name').focus();
                return;
            }
            if(pwd2 == '' || pwd2 == null){
                $('#msg').text('PWD2를 입력하세요');
                $('#pwd2').focus();
                return;
            }
            if(pwd != pwd2){
                $('#msg').text('Password가 틀립니다.다시 입력하세요');
                $('#pwd2').focus();
                return;
            }
            this.send();
        },
        send:function(){
            $('#register_form').attr('method','post');
            $('#register_form').attr('action','<c:url value="/jq/registerimpl"/>');
            $('#register_form').submit();
        }
    }
    $().ready(function(){
       jq5.init();
    });
</script>

<div class="col-sm-10">
    <h2>jQuery5 Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="register_form">
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" name="id" class="form-control" placeholder="Enter id" id="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name="pwd" class="form-control" placeholder="Enter password" id="pwd">
                </div>
                <div class="form-group">
                    <label for="pwd2">Password 확인:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd2">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="name" class="form-control" placeholder="Enter name" id="name">
                </div>
            </form>
            <button id="register_btn" class="btn btn-primary">REGISTER</button>


        </div>
        <div class="col-sm-4">
            <p id="msg">회원가입을 위해서는 ID, PWD, NAME을 입력하세요</p>
        </div>
    </div>
</div>