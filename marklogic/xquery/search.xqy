xdmp:set-response-content-type("text/html"),

('<!doctype html>',
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Sample MarkLogic App</title>
  </head>
  <body>
    <form method="get" action="./results.xqy">
      Speaker to search for? 
      <input type="text" name="query"/>
      <input type="submit" value="Search"/>
    </form>
  </body>
</html>)
