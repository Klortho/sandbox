xquery version "1.0";

(:
 : This is the library module for Use Case 9.3, it's imported by 9.4.
 :)

module namespace p="http://www.example.com/xq/postals";
import schema namespace ipo = "http://www.example.com/IPO" at "ipo.xsd";
import schema namespace pst = "http://www.example.com/postals" at "postals.xsd";

declare function p:postal-ok($a as element(*, ipo:UKAddress))
  as xs:boolean
{
  some $i in fn:doc("postals.xml")/pst:postals/element(pst:row)
  satisfies $i/pst:city = $a/city
       and fn:starts-with($a/postcode, $i/pst:prefix)
};