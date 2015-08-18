
xquery version "1.0";

(:
   This is the library module for Use Case 9.11
 :)

module namespace c="http://www.example.com/calc";
import schema namespace ipo="http://www.example.com/IPO" at "ipo.xsd";

declare function c:total-price( $i as element(item)* )
  as xs:decimal
{
  let $subtotals := for $s in $i return $s/quantity * $s/USPrice
  return fn:sum( $subtotals )
};