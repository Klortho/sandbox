xquery version "1.0-ml";

(: db-view.xqy :)


(
  xdmp:set-response-content-type("text/html"),

  <html>
    <head>
      <title>Database contents</title>
    </head>
    <body>{
      <ul>
      {
        for $i in collection()
        let $doc := document-uri($i)
        order by $doc
        return
          <li><a href=
            "file-view.xqy?uri={xdmp:url-encode($doc)}"
              >{$doc}</a></li>
      }
      </ul>
    }</body>
  </html>
)
