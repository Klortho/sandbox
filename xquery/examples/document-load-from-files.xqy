xquery version "1.0-ml";


(: 
  document-load-from-file.xqy 
  
  Note that the Docbook 4 sample has a doctype, but does not use namespaces, as
  so:
      <!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.4//EN"
                               "http://www.docbook.org/xml/4.4/docbookx.dtd">
      <article>
         ...
      </article>
  So what happens to the doctype information?
  
  The Docbook 5 sample uses namespaces.
:)

(: This gives us $config:baseDir, which points to the test server install dir  :)
import module namespace config="http://chrismaloney.org/ns/config"
       at "config.xqy";
(: But our base dir is in the examples subdirectory  :)
declare variable $baseDir := concat($config:baseDir, "/examples/");


xdmp:document-load(concat($baseDir, "Docbook4-Sample.xml"),
    <options xmlns="xdmp:document-load">
      <uri>/documents/Docbook4-Sample.xml</uri>
      <repair>none</repair>
      <permissions>{xdmp:default-permissions()}</permissions>
    </options>),

xdmp:document-load(concat($baseDir, "Docbook5-Sample.xml"),
    <options xmlns="xdmp:document-load">
      <uri>/documents/Docbook5-Sample.xml</uri>
      <repair>none</repair>
      <permissions>{xdmp:default-permissions()}</permissions>
    </options>),

<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
    <title>document-load-from-file.xqy</title>
  </head>
  <body>
    <p>
      Loaded <b>/examples/Docbook4-Sample.xml</b>
      as "/documents/Docbook4-Sample.xml".
    </p>
    <p>
      Loaded <b>/examples/Docbook5-Sample.xml</b>
      as "/documents/Docbook5-Sample.xml".
    </p>
  </body>
</html>
