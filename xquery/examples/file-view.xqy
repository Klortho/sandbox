xquery version "1.0-ml";

(: 
  file-view.xqy
  Originally, I had this line in to set the response content-type:
    xdmp:set-response-content-type("text/xml"),
  but then I found that it is not necessary.
  For most cases, doc() causes the MLS to set the HTTP response headers
  correctly, based on mime-type settings, I guess.
:)


let $uri := xdmp:get-request-field("uri")
return (
  if (empty(doc($uri)))
  then <error>No content</error>
  else doc($uri)
)