
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let center_websocket = {
        stompClient:null,
        init:function(){


            this.ss();

            <%--let socket = new SockJS('${serverurl}/wss');--%>
            <%--this.stompClient = Stomp.over(socket);--%>
            <%--console.log('Start -------');--%>

            <%--this.stompClient.connect({},function(frame){--%>
            <%--    console.log(frame);--%>
            <%--    this.subscribe('/send2',function(msg){--%>
            <%--        console.log(msg);--%>
            <%--        console.log(typeof(msg));--%>
            <%--        console.log(msg.content1);--%>
            <%--        console.log(JSON.parse(msg.body).content1);--%>
            <%--        $('#msg1').text(JSON.parse(msg.body).content1);--%>
            <%--        $('#msg2').text(JSON.parse(msg.body).content2);--%>
            <%--        $('#msg3').text(JSON.parse(msg.body).content3);--%>
            <%--        $('#msg4').text(JSON.parse(msg.body).content4);--%>
            <%--        $('#progress1').css('width',JSON.parse(msg.body).content1/100*100+'%');--%>
            <%--        $('#progress1').attr('aria-valuenow',JSON.parse(msg.body).content1/100*100);--%>
            <%--        $('#progress2').css('width',JSON.parse(msg.body).content2/1000*100+'%');--%>
            <%--        $('#progress2').attr('aria-valuenow',JSON.parse(msg.body).content2/1000*100);--%>
            <%--        $('#progress3').css('width',JSON.parse(msg.body).content3/500*100+'%');--%>
            <%--        $('#progress3').attr('aria-valuenow',JSON.parse(msg.body).content3/500*100);--%>
            <%--        $('#progress4').css('width',JSON.parse(msg.body).content4/10*100+'%');--%>
            <%--        $('#progress4').attr('aria-valuenow',JSON.parse(msg.body).content4/10*100);--%>
            <%--    });--%>
            <%--});--%>
        },
        ss:function(){

            const sse = new EventSource("${serverurl}/connect/admin");
            sse.addEventListener('error', function (){

            })


            sse.addEventListener('connect', (e) => {
                const { data: receivedConnectData, id: id } = e;
                console.log('connect event data: ',receivedConnectData);  // "connected!"
                console.log('connect event name: ',id);
            });
            sse.addEventListener('count', e => {
                const { data: receivedCount } = e;
                console.log("count event data",receivedCount);
                $('#count').html(receivedCount);
            });
            sse.addEventListener('adminmsg', e => {
                const { data: receivedData } = e;
                console.log("count event data",receivedData);
                console.log("count event data2",JSON.parse(receivedData).content1);
                this.display(JSON.parse(receivedData));
                //$('#count').html(receivedData);
            });
        },
        display:function(data){
            $('#msg1').text(data.content1);
            $('#msg2').text(data.content2);
            $('#msg3').text(data.content3);
            $('#msg4').text(data.content4);
            $('#progress1').css('width',data.content1/100*100+'%');
            $('#progress1').attr('aria-valuenow',data.content1/100*100);
            $('#progress2').css('width',data.content2/1000*100+'%');
            $('#progress2').attr('aria-valuenow',data.content2/1000*100);
            $('#progress3').css('width',data.content3/500*100+'%');
            $('#progress3').attr('aria-valuenow',data.content3/500*100);
            $('#progress4').css('width',data.content4/10*100+'%');
            $('#progress4').attr('aria-valuenow',data.content4/10*100);
        }
    };

    $(function(){
        center_websocket.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <h1 class="h3 mb-0 text-gray-800" id="count">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg1" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress1" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg2" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress2" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg3" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress3" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg4" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">80%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress4" class="progress-bar bg-info" role="progressbar"
                                             style="width: 80%" aria-valuenow="80" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="live_chart">

                    </div>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                             aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>
