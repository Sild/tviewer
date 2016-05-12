$(function () {
    $('table').tablesorter();

//    console.log($('input[type="hidden"][name="winCount"]').val());
//    console.log($('input[type="hidden"][name="looseCount"]').val());
    $('#company_member_statistic_div').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Statistics participation'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.y}',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [
                ['win', parseInt($('input[type="hidden"][name="winCount"]').val())],
                ['loose', parseInt($('input[type="hidden"][name="looseCount"]').val())]
            ]
        }]
    });
});