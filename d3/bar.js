$(document).ready(function() {
   
    var data = [5, 9, 4, 3, 1, 9, 0];
    var width = 800;
    var height = 400;
    var max_value = d3.max(data);


    var chart = d3.select('#chart').append('svg')
        .attr({
            'width': width,
            'height': height,
        })
        .style('border', '1px solid green');

    var bar_height = height / data.length;
    var bar_width = function(d) {
        return d * width / max_value;
    }
    var bar_x = 0;
    var bar_y = function(d, i) {
        return bar_height * i;
    }

    chart.selectAll('foo').data(data).enter()
        .append('rect')
            .attr({
                'x': bar_x,
                'y': bar_y,
                'width': bar_width,
                'height': bar_height,
                'fill': '#dff',
                'stroke': '#444',
            });

});