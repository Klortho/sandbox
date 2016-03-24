var debug = process.env.NODE_ENV !== "prod";
var webpack = require('webpack');

var commonPlugins = [
  //new webpack.ProvidePlugin({
  //  $: "jquery",
  //  jQuery: "jquery"
  //})
];
var prodPlugins = [
  new webpack.optimize.DedupePlugin(),
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.optimize.UglifyJsPlugin({ mangle: false, sourcemap: false }),
];
var plugins = debug ? commonPlugins : commonPlugins.concat(prodPlugins);

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


