#!/usr/bin/env node

var fs = require('fs');
var libxml = require("libxmljs-mt");

process.env.XML_CATALOG_FILES = 'catalog.xml';


var test_cases = [
  [ 'external-subset-cat-bad.xml', 'bad', ],
  [ 'external-subset-cat-good.xml', 'good', ],
  [ 'external-subset-does-not-exist.xml', 'bad', ],
  [ 'external-subset-nocat-bad.xml', 'bad', ],
  [ 'external-subset-nocat-good.xml', 'good', ],
  [ 'internal-subset-bad.xml', 'bad', ],
  [ 'internal-subset-good.xml', 'good', ],
  [ 'no-dtd.xml', 'bad', ],
  [ 'not-well-formed.xml', 'bad', ],
  //[ 'xinclude-good.xml', 'good', ],
];


var do_all = true,
    test_case = null;
if (process.argv.length > 2) {
  do_all = false;
  var test_file = process.argv[2];
  test_case = test_cases.find(function(tc) {
    return tc[0] == test_file;
  });
  if (!test_case) {
    console.log("Couldn't find test case " + test_file);
    process.exit(1);
  }
}

var test_promise =
  do_all ?
    test_cases.reduce(
      function(seq, test_case) {
        return seq.then(function() {
          return test_one(test_case);
        });
      },
      Promise.resolve()
    )
  : test_one(test_case);

test_promise.then(
  function() {
    console.log("PASSED");
  },
  function(err) {
    console.log("FAILED! ", err);
  }
);


function test_one(test_case) {
  var xml_file = test_case[0];
  var expect = test_case[1];
  return new Promise(function(resolve, reject) {
    console.log('Testing ' + xml_file);
    return validate(xml_file)
      .then(
        function() {
          process.stdout.write("  document is valid; ");
          if (expect == 'good') {
            console.log("as expected");
            resolve();
          }
          else {
            console.log("unexpected!");
            reject("Document should have been invalid: " + xml_file);
          }
        },
        function(err) {
          process.stdout.write("  document is invalid; ");
          if (expect == 'good') {
            console.log("unexpected!!!!!!!!!!!!!!!!!!!!!!!!!!");
            reject(err);
          }
          else {
            console.log("as expected");
            resolve();
          }
        }
      )
  });
}



function validate(xml_file) {
  return new Promise(function(resolve, reject) {
    fs.readFile(xml_file, function (err, data) {
      if (err) reject(err);
      libxml.Document.fromXmlAsync(data,
        {
          dtdvalid: true,
          nonet: true,
          //xinclude: true,
        },
        function(err, doc) {
          //console.log("          err: ", err);
          if (err) reject(err);
          else if (doc && doc.errors && doc.errors.length) {
            reject(doc.errors);
          }
          else resolve();
        });
    });
  });
}
