xquery version "1.0-ml";

(: 
  update-book-publisher.xqy 
:)
declare namespace bk="http://www.marklogic.com/ns/gs-books";

declare variable $booksXml := "freakybooks.xml";


declare function local:updatePublisher()
{
  if (doc($booksXml)) 
  then
    let $bookid := xdmp:get-request-field("bookid")
    let $publisher := xdmp:get-request-field("publisher")
    let $b := doc($booksXml)/bk:books/bk:book[@bookid = $bookid]
    return
      if ($b) then
        (
          xdmp:node-replace($b/bk:publisher,
            <bk:publisher>{ $publisher }</bk:publisher>),
          xdmp:redirect-response(concat("file-view.xqy?uri=", $booksXml))
        )
      else
        <span class='error-msg'>Could not locate book with bookid { $bookid }
        in { $booksXml }.</span>
  else
    <span class='error-msg'>Unable to access parent XML document
    { $booksXml }.</span>
};


<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>update-book-publisher.xqy</title>
    <style type='text/css'>
    {(:
      Note the double-curly-braces in the CSS.
    :)}
      .error-msg {{ 
        font-weight: bold;
        color: red; 
      }}
    </style>
  </head>
  <body>
    <h1>Error</h1>
    <p>
      Error in completing the update or in redirecting the browser to detail
      page. If you are seeing this page, either the redirect has failed
      or the update has failed.
    </p>
    <p>
      { local:updatePublisher() }
    </p>
  </body>
</html>