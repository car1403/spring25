<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 400px;
        overflow: auto;
        border: 2px solid green;
    }
</style>
<script>
    let websocket = {
        id:'',
        stompClient:null,
        init:function(){
            this.id = $('#login_id').text();
            this.connect();
            $('#connect').click(()=>{
                this.connect();
            });
            $('#disconnect').click(()=>{
                this.disconnect();
            });

            $('#sendto').click(()=>{
                var msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $('#totext').val()
                });
                this.stompClient.send('/sendchatbot', {}, msg);
                $("#to").prepend(
                    "<h4>" + this.id +":"+
                    $('#totext').val()
                    + "</h4>");
            });
        },
        connect:function(){
            let sid = this.id;
            let socket = new SockJS('/chatbot');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                // /sendto/me/user01
                this.subscribe('/sendto/'+sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + "Chatbot" +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        }
    };
    $(function(){
        websocket.init();
    });
</script>
<div class="col-sm-10">
    <h2>ChatBot Page</h2>
    <div class="col-sm-5">
        <h1 id="login_id">${sessionScope.cust.custId}</h1>
        <H1 id="status">Status</H1>



        <input type="text" id="totext"><button id="sendto">Send</button>
        <div id="to"></div>

    </div>

</div>