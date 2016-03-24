# webpack fun

Build this with

```
npm install -g webpack
npm install
webpack
```

Then, bring up index.html in your browser.

To do development, use `webpack --watch`, and then you can make
changes to files, and your bundle will be recompiled automatically.
Note that it won't do auto-reload in the browser, though -- to get
that, you have to use webpack-dev-server.


## Build environment

To distinguish between `dev` and `prod`, he uses this:

```
var debug = process.env.NODE_ENV !== "prod";
```

It is nice that it defaults to debug;

## CSS

This line in webpack.config.js let's you "include" CSS files from
you JS modules without having to use a \<link> element on the
HTML page:

```javascript
    loaders: [
      { test: /\.css$/, loader: "style!css" }
    ]
```

Just use this in your JS file:

```javascript
require("./style.css");
```

Alternatively, instead of declaring the loader, you could use 
`--module-bind 'css=style!css'` on the webpack command line (but I don't know
why you would ever want to do that).


## Sourcemaps

This line in webpack.config.js causes sourcemaps to be created:

```
  devtool: debug ? "inline-sourcemap" : null,
```

## jQuery

So that jQuery will be added automatically whenever webpack sees
`$` in the global context, you can add this:

```
plugins: [
  ...
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery"
  })
]
```

Note that I don't know what this buys you, really. It seems to me it
would be better to always have a `require` whenever you're using a
module like jquery. The above plugin does not, for example, put `$`
into the global scope, or cause jQuery to be excluded from the built
bundle.
