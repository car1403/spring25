<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    .ch{
        width:auto;
        height: 300px;
        border: 1px solid indianred;
        margin: 2px;
    }
</style>
<script>
    const chart2 = {
        init:function(){
            this.chart1Display();
            this.chart2Display();
            this.chart3Display();
        },
        chart1Display:function(){
            Highcharts.chart('chart1', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: 'External trade in goods by country, Norway 2023'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                        'target="_blank">SSB</a>'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    type: 'category',
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'NOK (million)',
                        margin: 20
                    }
                },
                tooltip: {
                    valueSuffix: ' MNOK'
                },
                series: [{
                    name: 'Total imports',
                    data: [
                        ['Belgium', 21956],
                        ['China', 114358],
                        ['Denmark', 47726],
                        ['Falkland Islands', 0],
                        ['Germany', 116128],
                        ['Netherlands', 48957],
                        ['Russia', 3046],
                        ['Sweden', 110695],
                        ['Turkey', 10399],
                        ['United States', 76285],
                        ['Unspecified', null],
                        ['Vietnam', 10014]
                    ]
                }]
            });


        },
        chart2Display:function(){
            Highcharts.chart('chart2', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country'
                },
                subtitle: {
                    text: '3D donut in Highcharts'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: [
                        ['Norway', 16],
                        ['Germany', 12],
                        ['USA', 8],
                        ['Sweden', 8],
                        ['Netherlands', 8],
                        ['ROC', 6],
                        ['Austria', 7],
                        ['Canada', 4],
                        ['Japan', 3]

                    ]
                }]
            });


        },
        chart3Display:function() {
            Highcharts.chart('chart3', {
                chart: {
                    type: 'cylinder',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: 'Number of confirmed COVID-19'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.fhi.no/en/id/infectious-diseases/coronavirus/daily-reports/daily-reports-COVID19/"' +
                        'target="_blank">FHI</a>'
                },
                xAxis: {
                    categories: [
                        '0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69',
                        '70-79', '80-89', '90+'
                    ],
                    title: {
                        text: 'Age groups'
                    },
                    labels: {
                        skew3d: true
                    }
                },
                yAxis: {
                    title: {
                        margin: 20,
                        text: 'Reported cases'
                    },
                    labels: {
                        skew3d: true
                    }
                },
                tooltip: {
                    headerFormat: '<b>Age: {category}</b><br>'
                },
                plotOptions: {
                    series: {
                        depth: 25,
                        colorByPoint: true
                    }
                },
                series: [{
                    data: [
                        95321, 169339, 121105, 136046, 106800, 58041, 26766, 14291,
                        7065, 3283
                    ],
                    name: 'Cases',
                    showInLegend: false
                }]
            });
        }
    }

    $(function(){
        chart2.init();
    });
</script>

<div class="col-sm-10">
    <h2>Chart2 Page</h2>
    <div class="row">
        <div class="col-sm-4">
            <div id="chart1" class="ch"></div>
        </div>
        <div class="col-sm-4">
            <div id="chart2" class="ch"></div>
        </div>
        <div class="col-sm-4">
            <div id="chart3" class="ch"></div>
        </div>
    </div>
</div>