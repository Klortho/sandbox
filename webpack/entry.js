var content = require('./content.js');
var $ = require('jquery');

// This requires us to use `--module-bind 'css=style!css'` on the webpack
// command line
require("./style.css");


$('h1').html(content);
console.log(content);
