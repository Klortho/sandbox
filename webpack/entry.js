var content = require('./content.js');
// This requires us to use `--module-bind 'css=style!css'` on the webpack
// command line
require("./style.css");



console.log(content);
