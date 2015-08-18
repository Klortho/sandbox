import module namespace search-lib="http://www.marklogic.com/tutorial2/search-lib" at "modules/search-lib.xqy";

xdmp:set-response-content-type("text/html"),

('<!doctype html>',
<html xmlns:xhtml="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Sample MarkLogic App</title>
  </head>
  <body>
    {
      for $speech in search-lib:find-speech(xdmp:get-request-field("query")) 
      return 
        <p><b>Line:</b>&nbsp;{ $speech/LINE/text() }</p>
    }
  </body>
</html>)
