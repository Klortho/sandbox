xquery version "1.0";
(: $Id: table.xql 2055 2011-09-24 07:25:11Z maloneyc $ :)
(: This example was adapted from the table.xql example that came with eXist. :)
(: An example found in Saxon: creates a table with 10x10 cells :)

(: For local functions, either use a namespace URI that you invent ... :)
declare namespace f="http://example.org";

declare function f:background-color($x as xs:integer, $y as xs:integer)
as xs:string 
{
  if($x mod 2 + $y mod 2 <= 0) then "lightgreen"
  else if($y mod 2 <= 0) then "red"
  else if($x mod 2 <= 0) then "lightblue"
  else "white"
};

(: 
  Or use the prefix "local".  "local" is a built-in namespace prefix; see p. 128 of
  the O'Reilly XQuery book.
:)
declare function local:cellText($s as xs:string, $x as xs:integer, $y as xs:integer)
as element()
{
  if ($y > 1 and $x > 1) then <span>{$s}</span> else <b>{$s}</b>
};

let $title := "HTML Table Example"
return 
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>
      <h1>{$title}</h1>
      <p>
        This example is copied from the eXist examples.  It is just a simple example to show
        how to write and invoke local XQuery functions.
      </p>
      <table>
        {
          for $y in 1 to 10 return
            <tr>
              {
                for $x in 1 to 10 return
                  let $bg := f:background-color($x, $y),
                      $prod := $x * $y,
                      $text := local:cellText(xs:string($prod), $x, $y)
                  return
                    <td bgcolor="{$bg}">
                      {$text}
                    </td>
              }
            </tr>
        }
      </table>
    </body>
  </html>
