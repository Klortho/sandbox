xquery version "1.0";
(: $Id: namespace-db-file.xql 3527 2013-02-02 03:23:51Z maloneyc $ :)

declare namespace dc="http://purl.org/dc/elements/1.1/";
declare option exist:serialize "method=text media-type=text/plain";

(: Get data directory on the filesystem from a system property (value is defined in startup.sh) :)
declare variable $data-dir := util:system-property("cfm.example.data-dir");

(: 
  Get the file on the filesystem.  I don't know how to tell it that the file resides in
  the same directory as this .xql module.  This page: http://exist.sourceforge.net/xquery.html
  has some information, but it's not clear.

  This doesn't work:  
    let $fsDoc := doc("biblio.xml")
:)

let $nl := "&#xA;"

(: From filesystem :)
let $fsDoc := doc(concat($data-dir, "/cfm/biblio.xml"))



(: From the db.  :)
let $dbDoc := doc('/db/sandbox/test/biblio.rdf')

for $doc in ($fsDoc, $dbDoc)
return
(
  "-----------------------------", $nl,
  "document root node name: ", name($doc/*), $nl,
  "first dc:title node:", ($doc//dc:title)[1], $nl
)
