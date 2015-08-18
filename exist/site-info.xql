xquery version "1.0";

import module namespace request="http://exist-db.org/xquery/request";
import module namespace httpclient="http://exist-db.org/xquery/httpclient"
    at "java:org.exist.xquery.modules.httpclient.HTTPClientModule";

(: 
  Get the URL of the CGI that will feed us our field information in XML format
  (value is defined in startup.sh) 
:)
declare variable $field-info-cgi := util:system-property("cfm.example.field-info-cgi");

let $db := request:get-parameter("db", ())

let $title := concat($db, " Site Info")
let $cgi := concat($field-info-cgi, "?db=", $db)
let $fi := doc($cgi)
return 
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>
      <h2 id='fields'>{$title}</h2>
      
      <table border='1'>
        <tr>
          <th>Name</th>
          <th>Number</th>
          <th>Aliases</th>
          <th>Full name</th>
          <th>Description</th>
          <th>Score</th>
          <th>Record</th>
          <th>Attributes</th>
          <th>Data type</th>
          <th>Width</th>
          <th>Index type</th>
          <th>Index flags</th>
          <th>Default explode mode</th>
          <th>Fuzzy flags</th>
        </tr>
      {
        for $s in $fi//Section
        order by $s/@name
        return 
          <tr>
            <td>{string($s/@name)}</td>
            <td>{$s/Number/node()}</td>
            <td>{$s/Aliases/node()}</td>
            <td>{$s/FullName/node()}</td>
            <td>{$s/Description/node()}</td>
            <td>{$s/Score/node()}</td>
            <td>{$s/Record/node()}</td>
            <td>{$s/Attributes/node()}</td>
            <td>{$s/DataType/node()}</td>
            <td>{$s/Width/node()}</td>
            <td>{$s/IndexType/node()}</td>
            <td>{$s/IndexFlags/node()}</td>
            <td>{$s/DefaultExplodeMode/node()}</td>
            <td>{$s/fuzzyflags/node()}</td>
          </tr>
      }</table>
      
    </body>
  </html>
