<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    const register = {
        init:function(){
            $('#register_btn').click(()=>{
                this.check();

            });

            $('#id').keyup(()=>{
                let id = $('#id').val();
                if(id.length >= 2){
                    $('#msg').text(id);
                    this.checkId(id);
                }

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
            if(name == '' || name == null){
                $('#msg').text('NAME을 입력하세요');
                $('#name').focus();
                return;
            }


            let c = confirm('회원가입 하시겠습니까 ?');
            if(c == true){
                this.send();
            }
        },
        checkId:function(id){
            $.ajax({
                url:'<c:url value="/checkid"/>',
                data:{cid:id},
                success:(result)=>{
                    //alert(result);
                    if(result == 1){
                        $('#msg').text('OK');
                        $('#id').off('blur');
                    }else{
                        $('#msg').text('NO!');
                        $('#id').blur(()=>{
                            $('#id').focus();
                        });
                    }
                },
                error:()=>{}
            });
        },
        send:function(){
            $('#register_form').attr('method','post');
            $('#register_form').attr('action','<c:url value="/goregister"/>');
            $('#register_form').submit();
        }
    }
    $(function(){
        register.init();
    });
</script>

<div class="col-sm-10">
    <h2>Register Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="register_form">
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" name="custId" class="form-control" placeholder="Enter id" id="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name="custPwd"  class="form-control" placeholder="Enter password" id="pwd">
                </div>
                <div class="form-group">
                    <label for="pwd2">Password2:</label>
                    <input type="password"  class="form-control" placeholder="Enter password" id="pwd2">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="custName"  class="form-control" placeholder="Enter name" id="name">
                </div>
            </form>
            <button id="register_btn" class="btn btn-primary">REGISTER</button>

        </div>
        <div class="col-sm-4">
            <p id="msg">회원가입을 위해서는 ID, PWD, NAME을 입력하세요</p>
        </div>
    </div>

</div>
