var new_packet = [];
var new_flow = [];
function data_format(data) {
    new_packet = [];
    new_flow = [];
    $.each(data.flow_list, function (key, value) {
            var Datatime = new Date(Date.parse(value[0]));
            var yvalue = value[1];
            var tms = Date.UTC(Datatime.getFullYear(), Datatime.getMonth(), Datatime.getDate(), Datatime.getHours(),Datatime.getMinutes());
            new_flow.push([tms,yvalue]);
        });

    $.each(data.packet_list, function (key, value) {
            var Datatime = new Date(Date.parse(value[0]));
            var yvalue = value[1];
            var tms = Date.UTC(Datatime.getFullYear(), Datatime.getMonth(), Datatime.getDate(), Datatime.getHours(),Datatime.getMinutes());
            new_packet.push([tms,yvalue]);
        });
}

function chart_init(){
    $('#container').highcharts({
            chart: {
                events: {
                    // 图表放大事件处理函数
                    selection: function (event) {
                        var min = event.xAxis[0].min;
                        var max = event.xAxis[0].max;
                        xAxis = this.xAxis[0];
                        //time_chose(min, max);
                        table_reload(min, max);
                        xAxis.removePlotBand('ch1');
                        var ch2 = $('#containers').highcharts();//第二个图的那个啥..
                        ch2.xAxis[0].removePlotBand('ch2');
                        xAxis.addPlotBand({
                            from: min,
                            to: max,
                            id: 'ch1',
                            color: '#D1DAED'
                        });
                        ch2.xAxis[0].addPlotBand({
                            from: min,
                            to: max,
                            id: 'ch2',
                            color: '#D1DAED'
                        });
                        return false;
                    }
                },
                zoomType: 'x'
            },
            xAxis: {
               type: "datetime",
               dateTimeLabelFormats: {
                    millisecond: '%H:%M:%S.%L',
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%Y-%m-%d',
                    week: '%m-%d',
                    month: '%Y-%m',
                    year: '%Y'
                },
                crosshair: true,
                gridLineColor: '#E6E6E6',//纵向网格线颜
                gridLineWidth: 1, //纵向网格线的宽度
            },
            tooltip: {
                xDateFormat: '%Y-%m-%d %H:%M:%S',
                shared: true,
                valueSuffix: ' mbps'
            },
            exporting: {
                enabled: false
            },
            credits: {enabled: false},
            title: {
                text: '流量',
                align: 'left'
            },
            yAxis: {
                title: {
                    enabled: false,
                },
                labels: {
                    formatter: function () {
                        return this.value + 'mbps';
                    }
                },
                min:0
            },
            legend: {
                enabled: true,
                align: 'right'
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },
            series: [{
                type: 'area',
                name: '流量',
                data: new_flow
            }]
        });
        $('#containers').highcharts({
            chart: {
                events: {
                    // 图表放大事件处理函数
                    selection: function (event) {
                        // 获取放大后 x 轴范围
                        var min = event.xAxis[0].min;
                        var max = event.xAxis[0].max;
                        xAxis = this.xAxis[0];
                        table_reload(min, max);
                        xAxis.removePlotBand('ch2');
                        var ch1 = $('#container').highcharts();//第二个图的那个啥..
                        ch1.xAxis[0].removePlotBand('ch1');
                        xAxis.addPlotBand({
                            from: min,
                            to: max,
                            id: 'ch2',
                            color: '#D1DAED'
                        });
                        ch1.xAxis[0].addPlotBand({
                            from: min,
                            to: max,
                            id: 'ch1',
                            color: '#D1DAED'
                        });
                        return false;
                    }
                },
                zoomType: 'x'
            },

            xAxis: {
               type: "datetime",
               dateTimeLabelFormats: {
                    millisecond: '%H:%M:%S.%L',
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%Y-%m-%d',
                    week: '%m-%d',
                    month: '%Y-%m',
                    year: '%Y'
                },
                crosshair: true,
                gridLineColor: '#E6E6E6',//纵向网格线颜
                gridLineWidth: 1 //纵向网格线的宽度
            },
            title: {
                text: '数据包',
                align: 'left'
            },
            tooltip: {
                xDateFormat: '%Y-%m-%d %H:%M:%S',
                shared: true,
                valueSuffix: ' kpps'
            },
           yAxis: {
                title: {
                    enabled: false,
                },
                labels: {
                    formatter: function () {
                        return this.value + ' kpps';
                    }
                },
                min:0
            },
            exporting: {
                enabled: false
            },
            credits: {enabled: false},
            legend: {
                enabled: true,
                align: 'right',
                /* y:-325*/
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },
            series: [{
                type: 'area',
                name: '数据包',
                data: new_packet
            }]
        });
}

$(function () {
    $.getJSON("base_info", function (data) {
       data_format(data);
       chart_init();
    });
    $('.contents').on('mousemove', function (e) {
        var sourceChartContainer = $(this);
        var sourceChart = sourceChartContainer.highcharts();
        var sourceXAxis = sourceChart.xAxis[0];
        var extremes = sourceXAxis.getExtremes();
        var targetChartContainerList = sourceChartContainer.siblings();
        targetChartContainerList.each(function (index, targetChartContainerElement) {
            var targetChartContainer = $(targetChartContainerElement);
            var targetChart = targetChartContainer.highcharts();
            var sourceOffset = sourceChartContainer.offset();
            var targetOffset = targetChartContainer.offset();
            var targetE = {};
            for (var i in e) {
                targetE[i] = e[i];
            }
            targetE.pageX = e.pageX + targetOffset.left - sourceOffset.left;
            targetE.pageY = e.pageY + targetOffset.top - sourceOffset.top;
            var targetEl = targetChartContainer.find('rect.highcharts-background')[0] || targetChartContainer.find('path.highcharts-tracker')[0];
            targetE.target = targetE.srcElement = targetE.fromElement = targetE.toElement = targetEl;
            targetE.delegateTarget = targetE.currentTarget = targetChartContainer[0];
            targetE.originalEvent = targetE;
            if (targetChart && targetChart.pointer) {
                targetChart.pointer.onContainerMouseMove(targetE);
            }
            if (targetChart && targetChart.scroller) {
                targetChart.scroller.mouseMoveHandler(targetE);
            }
            if (sourceChart.mouseIsDown == 'mouseup' || sourceChart.mouseIsDown == 'mousedown') {
                if (targetChart && targetChart.xAxis[0]) {
                    var targetXAxis = targetChart.xAxis[0];
                    targetXAxis.setExtremes(extremes.min, extremes.max);
                }
            }
        });
        return false;
    });
    $('.contents').bind('mouseleave', function (e) {
        var sourceChartContainer = $(this);
        var sourceChart = sourceChartContainer.highcharts();
        if (sourceChart && sourceChart.pointer) {
            sourceChart.pointer.reset();
            sourceChart.pointer.chartPosition = null;
        }
        var targetChartContainerList = sourceChartContainer.siblings();
        targetChartContainerList.each(function (index, targetChartContainerElement) {
            var targetChartContainer = $(targetChartContainerElement);
            var targetChart = targetChartContainer.highcharts();
            if (targetChart && targetChart.pointer) {
                targetChart.pointer.reset();
                targetChart.pointer.chartPosition = null;
            }
        });
        return false;
    });
    $('.contents').bind('mouseup', function (e) {
        var sourceChartContainer = $(this);
        var sourceChart = sourceChartContainer.highcharts();
        targetChartContainerList = sourceChartContainer.siblings();
        e.type = 'mouseup';
        if (sourceChart && sourceChart.pointer) {
            sourceChart.pointer.drop(e);
            sourceChart.mouseIsDown = 'mouseup';
        }
    });
});

// $('.dropdown-menu').on('click',function (e) {
//     var $target=$(e.target);
//     $target.is('a')&& $("#text").text($target.text());
//     var time_len = $("#text").text();
//     $.ajax({
//         url: "base_info",
//         datatype: 'json',
//         data: {'time_len': time_len},
//         success: function (data) {
//             data_format(data);
//             $('#container').highcharts().series[0].remove(false);
//             $('#containers').highcharts().series[0].remove(false);
//             chart_init();
//             $('#container').highcharts().redraw();
//             $('#containers').highcharts().redraw();
//         }
//     });
// });

function time_ajax(select_time, time_len) {
    $.ajax({
        url: "base_info",
        datatyep: 'json',
        data: {
            'select_time': select_time,
            'time_len': time_len
        },
        success: function (data) {
            data_format(data);
            $('#container').highcharts().series[0].remove(false);
            $('#containers').highcharts().series[0].remove(false);
            chart_init();
            $('#container').highcharts().redraw();
            $('#containers').highcharts().redraw();
        }
    })
}

