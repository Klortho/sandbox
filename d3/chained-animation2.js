$(document).ready(function() {
   
    var drawing = d3.select('#drawing').append('svg')
        .attr({
            'width': 200,
            'height': 200,
        })
        .style('border', '1px solid blue')
        .append('g')
        .attr('transform', 'translate(100, 100)')
    ;
       
    var rect = drawing.append('rect')
        .attr({
            'width': 10,
            'height': 10,
            'x': -5,
            'y': -5,
            'fill': 'blue',
            'stroke': 'black',
        })
    ;

    var duration = 1000;

    function fill_with_red() {
        return new Promise(function(resolve, reject) {
            console.log('filling with red');
            rect.transition()
                .duration(duration)
                .attr('fill', 'red')
                .each('end', function() {
                    resolve("done filling with red");
                });
        });
    }
    function rotate() {
        return new Promise(function(resolve, reject) {
            console.log("rotating");
            drawing.transition()
                .duration(duration)
                .attr('transform', 'translate(100, 100) rotate(90)')
                .each('end', function() {
                    resolve('done rotating');
                });
        });
    }
    function embiggen() {
        return new Promise(function(resolve, reject) {
            console.log("embiggenning");
            rect.transition()
                .duration(duration)
                .attr({
                    'width': 20, 'height': 20, 'x': -10, 'y': -10,
                })
                .each('end', function() {
                    resolve('done embiggenning');
                });
        });
    }

    fill_with_red()
    .then(function(m) {
        console.log(m);
        return rotate();
    })
    .then(function(m) {
        console.log(m);
        return embiggen();
    })
    .then(function(m) {
        console.log(m);
    })
    ;


});