<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    #container{
        width: auto;
        height: 300px;
        border: 2px solid orangered;
    }
</style>

<script>
    const chart1 = {
        init:function(){
            this.getData();
            setInterval(()=>{
                this.getData();
            },5000);
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/getchart1"/>',
                success:(result)=>{
                    this.display(result);
                }
            });
        },
        display:function(result) {
            Highcharts.chart('container', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: '2025 Monthly Average Temperature'
                },
                xAxis: {
                    categories: [
                        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                    ],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Temperature'
                    },
                    labels: {
                        format: '{value}°'
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series:result
            });

        }
    }
    $(function(){
        chart1.init();
    });
</script>

<div class="col-sm-10">
    <h2>Chart1 Page</h2>

    <div id="container"></div>
</div>