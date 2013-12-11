xquery version "1.0";
(: $Id: external-document.xql 3527 2013-02-02 03:23:51Z maloneyc $ :)

import module namespace httpclient="http://exist-db.org/xquery/httpclient"
    at "java:org.exist.xquery.modules.httpclient.HTTPClientModule";

(: Get stuff from system properties (values defined in startup.sh) :)
declare variable $self-base-url := util:system-property("cfm.example.self-base-url");
declare variable $data-dir      := util:system-property("cfm.example.data-dir");

(: Get the remote document :)
declare function local:get-document($url as xs:string)
as node()
{
    let $uri := xs:anyURI($url)
    let $response := httpclient:get($uri, false(), <headers/>)
    return
        if ($response/@statusCode eq "200") then
            $response/httpclient:body/*
        else if ($response/httpclient:body//error) then
            $response/httpclient:body//error/string()
        else
            concat("Error: ", $response/@statusCode)
};


let $title := "External Documents Example"
return
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>
      <h1>{$title}</h1>
      <p>
        This example reads and processes an XML document from the interwebs.
        Do View -> source to see the actual XML.
      </p>


      <h2>XML file over HTTP using doc()</h2>
      <p>
        This demonstrates one way to aggregate data in pipelines.
      </p>
      <div>
        doc("{concat($self-base-url, "/exist/cfm/splits.xml")}"):
      </div>
      <div>
        { doc(concat($self-base-url, "/exist/cfm/splits.xml")) }
      </div>

      <h2>XML file with `file:` scheme</h2>
      <div>
        doc("{ concat("file://", $data-dir, "/cfm/splits.xml") }"):
      </div>
      <div>
        { doc(concat("file://", $data-dir, "/cfm/splits.xml")) }
      </div>

      <h2>XML file using httpclient:get()</h2>
      <div>
        httpclient:get(
          xs:anyURI("{ concat($self-base-url, "/exist/cfm/splits.xml") }"),
          false(), &lt;headers/>):
      </div>
      <div>
        {httpclient:get(
          xs:anyURI(concat($self-base-url, "/exist/cfm/splits.xml")),
          false(), <headers/>)}
      </div>

      <h2>XML file using local:get-document()</h2>
      <div>
        local:get-document("{ concat($self-base-url, "/exist/cfm/splits.xml") }"):
      </div>
      <div>
        {local:get-document(concat($self-base-url, "/exist/cfm/splits.xml"))}
      </div>

      <h2>Text file</h2>
      <div>
        {httpclient:get(
          xs:anyURI(concat($self-base-url, "/exist/cfm/readme.txt")),
          false(), <headers/>)}
      </div>

      <h2>Binary file</h2>
      <div>
        {httpclient:get(
          xs:anyURI(concat($self-base-url, "/exist/cfm/external.png")),
          false(), <headers/>)}
      </div>

      <h2>404 - No such file</h2>
      <div>
        {httpclient:get(
          xs:anyURI(concat($self-base-url, "/exist/cfm/drooper.txt")),
          false(), <headers/>)}
      </div>
    </body>
  </html>
