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
            this.display();
        },
        display:function() {
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
                series: [
                    {
                        name:'Seoul',
                        data:[1,2,5,8,10,19,25,30,19,15,6,2]
                    },
                    {
                        name:'Jeju',
                        data:[3,5,7,8,12,21,29,33,20,18,8,2]
                    },
                    {
                        name:'Busan',
                        data:[1,2,5,3,10,18,20,40,30,20,10,12]
                    }
                ]
            });

        }
    }
    $(function(){
        chart1.init();
    });
</script>

<div class="col-sm-10">
    <h2>Chart1 Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <div id="container"></div>
</div>