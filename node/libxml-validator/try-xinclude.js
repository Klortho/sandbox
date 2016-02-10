#!/usr/bin/env node

var fs = require('fs');
var libxml = require("@klortho/libxmljs-mt");

process.env.XML_CATALOG_FILES = 'catalog.xml';

fs.readFile('xinclude-good.xml', function (err, data) {
  if (err) reject(err);
  libxml.Document.fromXmlAsync(data,
    {
      dtdvalid: true,
      nonet: true,
      xinclude: true,
    },
    function(err, doc) {
      if (err) throw(err);
      else if (doc && doc.errors && doc.errors.length) {
        throw(doc.errors);
      }
      else {
        console.log("document is " + doc.toString());
        process.exit(0);
      }
    });
});



