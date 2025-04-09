<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let websocket = {
        id:'',
        stompClient:null,
        init:function(){

            $('#connect').click(()=>{
                this.connect();
            });
            $('#disconnect').click(()=>{
                this.disconnect();
            });

        },
        connect:function(){

            let socket = new SockJS('${serverurl}/ws'); // http://127.0.0.1:8088
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);

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
    <h2>Web Socket Page</h2>
    <h1 id="adm_id">${sessionScope.cust.custId}</h1>
    <H1 id="status">Status</H1>
    <button id="connect">Connect</button>
    <button id="disconnect">Disconnect</button>
</div>
