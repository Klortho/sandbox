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

So that jQuery will be added automatically whenever webpack sees
`$` in the global context, do this:

```
new webpack.ProvidePlugin({
  $: "jquery",
  jQuery: "jquery"
})
```

