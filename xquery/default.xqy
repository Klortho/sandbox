xdmp:set-response-content-type("text/html"),

('<!doctype html>',
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Sample MarkLogic App</title>
  </head>
  <body>
    <h1>Sample MarkLogic App</h1>
    <p>MarkLogic server version:  {xdmp:version()}</p>
    <p>Go <a href='search.xqy'>search.xqy</a> to try it out.</p>
  </body>
</html>)

