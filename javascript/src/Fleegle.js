// Define a global class Fleegle.

if (typeof d3 !== "undefined")
{
  (function() {
    /**/

    Fleegle = function(opts) {
      var self = this;
      Fleegle.instances.push(self);
      diagram.opts = opts || {};

      // Defer everything else, including options handling, until document
      // ready (that lets the user specify options in a @data-options
      // attribute in the HTML).
      document_ready
        .then(function() {
          return self.initialize();
        })
        .then(function() {
          return self.update();
        })
        .catch(function(err) {
          console.error(err.stack);
        })
      ;
    };

    Fleegle.instances = [];

    // By default, on document ready, we'll instantiate an instance
    // automatically. The user can override this, by setting autostart
    // to false, or by creating his own instance, before that event.
    Fleegle.auto_start = true;

    // document_ready is a Promise that resolves when the document is ready.
    var document_ready = Fleegle.document_ready =
      new Promise(function(resolve) {
        document.addEventListener("DOMContentLoaded", resolve);
      });
    document_ready.then(function() {
      if (Fleegle.auto_start && Fleegle.instances.length == 0) 
        new Fleegle();
    });


    // Default values for all the options. 
    // Options are set, in order of precedence:
    // - From an object on the Fleegle constructor.
    // - From the @data-options attribute of the <div>
    //   element. Make sure they are in strictly valid JSON format.
    // - These defaults
    Fleegle.default_options = {

      // Config file
      config_file: "config.json",

      // Duration of the animation, in milliseconds.
      duration: 500,
    };


    // Initialize, by computing and storing the options, creating
    // the svg element, reading the JSON config file. This returns a 
    // Promise that resolves after the JSON config is read.
    Fleegle.prototype.initialize = function() {
      var self = this;

      // User can pass in a specifier for the div either as an
      // id string or a DOM Element
      var opts = self.opts,
          container = opts.container || 'fleegle';
      var container_dom = self.container_dom =
        typeof container == "string" ? 
          document.getElementById(container) : container;

      if (!container_dom) {
        console.error("Something wrong with the specifier for the diagram's " +
          "DOM element");
        return;
      };

      // D3 selector for the container
      var container_d3 = diagram.container_d3 = d3.select(container_dom);

      // Compute the actual options. This sets
      // the properties right on this Fleegle object itself.
      var tag_opts_json = container_dom.getAttribute("data-options");
      var tag_options = tag_opts_json ? JSON.parse(tag_opts_json) : {};
      Fleegle.extend(self, Fleegle.default_options, tag_options, opts);

      // Initialize the SVG
      var svg = self.svg = container_d3.append("svg");

      var defs = svg.append("defs");

      // Note that <defs> can be nested. This allows us to specify the
      // the <filter> entirely as an HTML string.
      defs.append('defs').html(
        '<filter id="dropshadow" height="130%">' +
          '<feGaussianBlur in="SourceAlpha" stdDeviation="3"/>' +
          '<feOffset dx="2" dy="2" result="offsetblur"/>' +
          '<feComponentTransfer>' +
          '  <feFuncA type="linear" slope=".5"/>' +
          '</feComponentTransfer>' +
          '<feMerge>' +
          '  <feMergeNode/>' +
          '  <feMergeNode in="SourceGraphic"/>' +
          '</feMerge>' +
        '</filter>'
      );


      // Read the input file, and return the promise
      return new Promise(function(resolve, reject) {
        var config_file = self.config_file;
        d3.json(config_file, function(error, config) {
          if (error) {
            reject(new Error("Error reading config file '" + config_file + 
                "': " + error.statusText));
          }
          else {
            self.config = config;

            try {
              // Do more initialization stuff here
              resolve();
            }
            catch(e) {
              reject(e);
            }
          }
        });
      });
    };


    // Main function to update the rendering. 
    Fleegle.prototype.update = function(n) {
      console.log("updating");
    };

    // Simple extend utility function - doesn't recurse
    Fleegle.extend = function() {
      var target = arguments[0];
      for (var i = 1; i < arguments.length; ++i) {
        var obj = arguments[i];
        for (var key in obj)
          if (obj.hasOwnProperty(key)) target[key] = obj[key];
      }
      return target;
    };
  })();
}
