xquery version "1.0-ml";

(: 
  manual-document-insert.xqy 
:)

xdmp:document-insert("freakybooks.xml",
  <books xmlns='http://www.marklogic.com/ns/gs-books'>
    <book bookid='1'>
      <title>A Quick Path to Nowhere</title>
      <author>
        <last>Smith</last>
        <first>Jim</first>
      </author>
      <publisher>Simpleton Press</publisher>
      <isbn>1234-12341234</isbn>
      <abstract>
        This book is really not very good at all.
      </abstract>
    </book>
    <book bookid='2'>
      <title>Another Boondoggle</title>
      <author>
        <last>Jones</last>
        <first>Zhang</first>
      </author>
      <publisher>Gargantuan Mistake</publisher>
      <isbn>1234-12341235</isbn>
      <abstract>
        Much better than whats-his-name's.
      </abstract>
    </book>
  </books>
),

<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
    <title>manual-document-insert.xqy</title>
  </head>
  <body>
    <b>Source XML Loaded as <a href='file-view.xqy?uri=freakybooks.xml'>freakybooks.xml</a>,
    presumably.</b>
  </body>
</html>
