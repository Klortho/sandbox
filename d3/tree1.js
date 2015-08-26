$(document).ready(function() {

  var tree_data =
    {
      "name": "Top Level",
      "children": [
        {
          "name": "Level 2: A",
          "children": [
            {
              "name": "Son of A"
            },
            {
              "name": "Daughter of A"
            },
            {
              "name": "Meimei of A"
            }
          ]
        },
        {
          "name": "Level 2: B"
        }
      ]
    };

  // ************** Generate the tree diagram  *****************
  var margin = {
    top: 20, 
    right: 120, 
    bottom: 20, 
    left: 120
  };
  var width = 960 - margin.right - margin.left,
      height = 500 - margin.top - margin.bottom;
   
  var i = 0;

  // Create the tree layout 
  // (https://github.com/mbostock/d3/wiki/Tree-Layout#tree)
  var tree = d3.layout.tree().size([height, width]);

  // Construct a new diagonal generator. `diagonal` is a new function that 
  // draws the lines between the boxes.
  // See https://github.com/mbostock/d3/wiki/SVG-Shapes#diagonal.
  var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

  var svg = d3.select("body").append("svg")
   .attr("width", width + margin.right + margin.left)
   .attr("height", height + margin.top + margin.bottom)
   .append("g")
     .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    
  update(tree_data);

  // This function draws the tree
  function update(source) {

    // Compute the new tree layout.

    // nodes will be an array of all of the nodes in the tree. Each object has:
    //   * name: from the data
    //   * depth: 0 is the top-level
    //   * parent
    //   * x, y: computed based on the tree layout algorithm.
    var nodes = tree.nodes(tree_data);

    // links is an array of elements, one for each link between two nodes
    var links = tree.links(nodes);

    // You can move the nodes around now, or not.
    // Normalize for fixed-depth.
    //nodes.forEach(function(d) { d.y = d.depth * 180; });

    // Declare the nodes
    var node = svg.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });

    // Enter the nodes.
    var nodeEnter = node.enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { 
        return "translate(" + d.y + "," + d.x + ")"; 
      });

    nodeEnter.append("circle")
      .attr("r", 10)
      .style("fill", "#fff");

    nodeEnter.append("text")
      .attr("x", function(d) { 
        return d.children || d._children ? -13 : 13; 
      })
      .attr("dy", ".35em")
      .attr("text-anchor", function(d) { 
        return d.children || d._children ? "end" : "start"; 
      })
      .text(function(d) { return d.name; })
      .style("fill-opacity", 1);

    // Declare the links
    var link = svg.selectAll("path.link")
      .data(links, function(d) { return d.target.id; });

    // Enter the links.
    link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", diagonal);
  }

});
