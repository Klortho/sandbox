var env = process.env.NODE_ENV || 'dev';
var debug = env !== 'prod';
var webpack = require('webpack');

var commonPlugins = [];
var devPlugins = [
  // You don't need this to use jQuery; this is just to put jQuery
  // (as `$`) into the global scope, in the dev environment.
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery"
  })
];
var prodPlugins = [
  new webpack.optimize.DedupePlugin(),
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.optimize.UglifyJsPlugin({ mangle: false, sourcemap: false }),
];
var plugins = commonPlugins.concat(
  env == 'dev' ? devPlugins : prodPlugins
);

module.exports = {
  context: __dirname,
  devtool: debug ? "inline-sourcemap" : null,
  entry: "./entry.js",
  output: {
    path: __dirname,
    filename: "bundle.js"
  },
  module: {
    loaders: [
      { test: /\.css$/, loader: "style!css" }
    ]
  },
  plugins: plugins,
};


