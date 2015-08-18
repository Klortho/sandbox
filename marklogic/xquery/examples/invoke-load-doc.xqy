xquery version "1.0-ml";

declare variable $n :=
      xdmp:document-insert("/examples/invoke-load-doc.xml",
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <em>Jade! value</em>
        </div>
      )
;

$n;

<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
  </head>
  <body>
    <h1>invoke-load-doc.xqy</h1>
    <p>
      timestamp:  { xdmp:request-timestamp() }<br/>
      $n: { $n }
    </p>
    <h2>Initially:</h2>
    {
      doc("/examples/invoke-load-doc.xml")
    }
    <h2>Inserting from this module itself:</h2>
    {
      doc("/examples/invoke-load-doc.xml")
    }
    <h2>After e1:</h2>
    {(:
      xdmp:invoke("invoke-load-doc-e1.xqy", (),
          <options xmlns="xdmp:eval">
            <isolation>different-transaction</isolation>
            <prevent-deadlocks>true</prevent-deadlocks>
          </options>),
      doc("/examples/invoke-load-doc.xml")
    :)}
    <h2>After e2:</h2>
    {(:
      xdmp:invoke("invoke-load-doc-e2.xqy", (),
          <options xmlns="xdmp:eval">
            <isolation>different-transaction</isolation>
            <prevent-deadlocks>true</prevent-deadlocks>
          </options>),
      doc("/examples/invoke-load-doc.xml")
    :)}
    <h2>After local insert:</h2>
    {(:
      xdmp:document-insert("/examples/invoke-load-doc.xml",
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <em>Final value</em>
        </div> 
      )
    :)}

  </body>
</html>
