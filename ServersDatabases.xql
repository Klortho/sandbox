xquery version "1.0";

(: $Id: ServersDatabases.xql 3526 2013-02-01 22:29:48Z maloneyc $ :)

import module namespace httpclient="http://exist-db.org/xquery/httpclient"
    at "java:org.exist.xquery.modules.httpclient.HTTPClientModule";

(: 
  Get the URL of the XML file that holds information about the servers and databases.
:)
declare variable $servers-databases-xml := util:system-property("cfm.example.servers-databases-xml");



let $title := "PMC Servers and Databases"
let $sd := doc($servers-databases-xml)
return 
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>

      <h2 id='servers'>Servers</h2>
      <table border='1'>
        <tr>
          <th>Server</th>
          <th>MSSQL Version</th>
          <th>Aliases</th>
          <th>Databases</th>
          <th>Comments</th>
        </tr>
      {
        for $s in $sd//Server
        let $a := string($s/@aliases)
        let $aliases := 
            if (string-length($a) = 0) 
                then ""
                else concat(" (", string-join(tokenize($s/@aliases, "\s"), ", "), ")")
        
        return 
          <tr>
            <td>{string($s/@name)}</td>
            <td>{$s/@mssql-version}</td>
            <td>{$aliases}</td>
            <td>{ string-join(tokenize($s/@databases, "\s"), ", ") }</td>
            <td>{ $s/node() }</td>
          <!--
            <h3>{concat($s/@name, $aliases, " - ", $s/@mssql-version)}</h3>,
            <p>
              <b>Databases: </b>
              { string-join(tokenize($s/@databases, "\s"), ", ") }
            </p>,
            <div>
              { $s/node() }
            </div>
          -->
          </tr>
      }</table>
      
      <h2 id='aliases'>Server aliases</h2>
      <ul>{
        for $alias in distinct-values(
            for $s in $sd//Server
            return tokenize($s/@aliases, "\s")
        )
        order by $alias
        return 
          <li>{$alias} - {$sd//Server[contains(@aliases, $alias)]/@name/string()}</li>
      }</ul>

      <h2 id='databases'>Databases</h2>
      <table border='1'>
        <tr>
          <th>Database</th>
          <th>Served by</th>
        </tr>
        {
          for $db in distinct-values(
              for $s in $sd//Server
              return tokenize($s/@databases, "\s")
          )
          order by upper-case($db)
          return 
            <tr>
              <td>{$db}</td>
              <td>{
                string-join($sd//Server[contains(@databases, $db)]/@name/string(), ", ")
              }</td>
            </tr>
          }
      </table>
    </body>
  </html>
