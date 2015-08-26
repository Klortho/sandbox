// This are from the Tutorial, lesson 1:
// http://code.hazzens.com/d3tut/lesson_1.html

$('document').ready(function() {

  // Set the attributes of a single node.
  d3.select('.section')  // select() returns a d3.selection; only the first 
                         // matching node
      .text("foo")
      .style('color', '#f0f'); 

  // Set the attributes of a whole collection of nodes
  d3.selectAll('.section')
      .text("bar")
      .style('color', '#f0f'); 

  // Zebra striping a table:
  d3.selectAll('tr')
      .style('background-color', function() {
          var i = Array.prototype.indexOf.call(this.parentElement.children, this);
          return i % 2 ? "#DDD" : "white";
      });

  // Creating
  d3.selectAll('.section')
      .append('div')
          .text('*footer*');

  // Binding data to a selection
  var letters = ['a', 'b', 'c', 'd'];
  var tds = d3.selectAll('td');
  tds.data(letters);

  // If you want to actually *use* the bound data for something. Note that
  // if the length of the data doesn't match the length of the array of nodes,
  // the remainders are just ignored.
  tds.data(letters)
      // arguments are by convention `d` - the data item; and `i` - the index
      .text(function(d, i) {
          return "letter #" + (i + 1) + ": " + d;
      });

  // Getting the array back out: 
  console.log("letters are " + tds.data());


  // But actually the results of data binding are a *join*.
  // If there are more data items than nodes, you can still do something with
  // the extra data items, by using the `enter` selection
  var captain_names = ['Pike', 'Kirk', 'Picard', 'Sisko', 'Janeway', 'Archer'];

  // Note that the `captains` selection is created using a selector on the 
  // parent. This is required in order to be able to use the extra data.
  // It sets the `parentNode` to the captains div. If you don't do that, the
  // `parentNode` will be the html document.
  var captains = d3.select('.captains')
                   .selectAll('.captain').data(captain_names);
  // This sets the text for the nodes that already exist
  captains
      .text(function(d, i) {
          return 'Captain #' + (i + 1) + ': ' + d;
      });
  // The `captains.enter()` selection is an array of six elements, but is the
  // converse of the normal selection: the first two, corresponding to nodes that
  // already exist, are undefined.
  // See https://github.com/mbostock/d3/wiki/Selections#enter
  captains.enter().append('div')
      .style('color', 'green')
      .attr('class', 'captain')  // attr is like style or text, but sets node-level attributes.
      .text(function(d, i) {
        return 'Captain #' + (i + 1) + ': ' + d;
    });

  // Let's make a graph!
  var root = d3.select('#chart').append('svg')
      .attr('width', 200)
      .attr('height', 200)
      .style('border', '1px solid black');

  root.selectAll('foo')          // This is actually an empty selection, but
                                 // it's okay, we just use it to bind the data.
      .data([5, 25, 80]).enter()
      .append('rect')
          .attr('x', Object)    // `Object` is a shorthand way to return the datum
          .attr('y', Object)
          .attr('width', 15)
          .attr('height', 10)
          .attr('fill', '#c63')
          .attr('stroke', 'black');

  // Art!
  var art = d3.select('#mondrian').append('svg')
      .attr('width', 600)
      .attr('height', 600)
      .style('border', '1px solid black');

  var rects = [
      {x:  -5, y:  -5, w: 150, h: 195},
      {x:  -5, y: 200, w: 150, h: 230},
      {x: 155, y: 435, w: 395, h: 175},
      {x: 555, y: 435, w:  55, h:  80},
      {x: 155, y:  -5, w: 450, h: 435, fill: '#731000'},
      {x:  -5, y: 435, w: 150, h: 175, fill: '#0b183b'},
      {x: 555, y: 520, w:  55, h:  90, fill: '#d49800'}
  ];

  art.selectAll('rect')
      .data(rects).enter()
      .append('rect')
        .attr('x', function(d) { return d.x; })
        .attr('y', function(d) { return d.y; })
        .attr('width', function(d) { return d.w; })
        .attr('height', function(d) { return d.h; })
        .attr('fill', function(d) { return d.fill || '#eef2d1'; })
        .attr('stroke-width', 10)
        .attr('stroke', 'black');



});





