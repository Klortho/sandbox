// Create the <svg> container element
var drawing = d3.select('#drawing').append('svg')
  .attr({
    'width': 200,
    'height': 200,
  })
  .style('border', '1px solid blue')
  .append('g')
  .attr('transform', 'translate(100, 100)')
;

// Create a rectangle
var rect = drawing.append('rect')
  .attr({
    'width': 100,
    'height': 100,
    'x': -50,
    'y': -50,
    'fill': 'blue',
    'stroke': 'black',
  })
;

// Do some animations, chained together
var duration = 1000;
console.log('filling with red');
rect.transition()
  .duration(duration)
  .attr('fill', 'red')
  .each('end', function() {

    console.log('rotating');
    drawing.transition()
      .duration(duration)
      .attr('transform', 'translate(100, 100) rotate(90)')
      .each('end', function() {

        console.log('growing');
        rect.transition()
          .duration(duration)
          .attr({
            'width': 150,
            'height': 150,
            'x': -75,
            'y': -75,
          })
        ;                    
      })
    ;
  })
;


  
