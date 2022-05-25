({
    helperMethod: function (c, e, h) {
        try {
            console.log('he;lper method chartssssssss');
            Highcharts.chart(document.getElementById("Container"), {
                chart: {
                    type: 'bar',
                },
                title: {
                    text: 'SObject Detials'
                },
                subtitle: {
                    text: 'Total number of records against each type of object.'
                },
                xAxis: {
                    categories: ['Account', 'Contact', 'Opportunity', 'Lead', 'Contract'],
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: null,
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' records'
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: false
                        }
                    }
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: ' ',
                    data: [10,45, 34, 30, 30, 40]
                }]
            });
        } catch (err) { 
            console.log("err: +++++"+err); 
            console.log("err: +++++"+err.lineNumber); 
        }
    },    
    
    createGraph : function(c, e, h) {
        
        var data = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
            datasets: [{
                label: "Dataset #1",
                data: [65, 59, 20, 81, 56, 55, 40],
            }]
        };
        
        var options = {
            maintainAspectRatio: false,
            scales: {
                y: {
                    stacked: true,
                    grid: {
                        display: true,
                        color: "rgba(255,99,132,0.2)"
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        };
        
        new Chart('chart', {
            type: 'bar',
            options: options,
            data: data
        });
        
    },
    
    createLineGraph : function(c, e, h) {
        
    }
})