xquery version "1.0-ml";
(: 
    count-root-elements.xqy
   
    There is an interesting anomoly having to do with namespaces at work here.
    If you look at the second half of the output, you'll see that $n iterates
    over distinct-values(/*/name()), but within that FLOWR, this expression:
      count(/*[name() = $n])
    yields zero if the name of the root element is in a default namespace
    (for example, postals).  I haven't fully explored this yet.
   
    For example, in the "books.xml" document, the document element is books,
    but it is in a default namespace, as
      <books xmlns="http://www.marklogic.com/ns/gs-books">...

    Another example is in the "Docbook5-Sample.xml" - contrast it with the
   "Docbook4-Sample.xml", which doesn't use namespaces.
   
    Another question:  where are the newlines in the output coming from?
:)

declare variable $all := /*;
declare variable $allNames := $all/name();

(
  xdmp:set-response-content-type('text/plain'),
  "Counts of root elements in the database",
  "---------------------------------------",

  concat("Total number of root elements = ", count($all)),
  for $n in distinct-values($allNames)
  order by $n
  return 
    concat("  Number of '", $n, "': ", count($allNames[. = $n])),
  
  "---------------------------------------",
  concat("Total: ", count(/*)),
  "",
  
  for $n in distinct-values(/*/name())
  order by $n
  return 
    concat($n, " : ", count(/*[name() = $n])),
    
  "---------------------------------------",

  (
    "Let's test, does '", 
    doc("/documents/Docbook5-Sample.xml")/*/name(), 
    "' == 'article'?",
    ( if (doc("/documents/Docbook5-Sample.xml")/*/name() = 'article')
      then "Yes!"
      else "No!"
    ),
    ( if (doc("/documents/Docbook5-Sample.xml")/*[name() = 'article'])
      then "Yes!"
      else "No!"
    )
  )
  
)
