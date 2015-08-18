xquery version "1.0-ml";

(: 
  manual-document-insert.xqy 
:)

xdmp:document-insert("/examples/invoke-load-doc.xml",
  <div xmlns='http://www.w3.org/1999/xhtml'>
    <em>Initial value</em>
  </div>
)
