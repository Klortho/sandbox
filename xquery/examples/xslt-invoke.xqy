xquery version "1.0-ml";

(:
  This example invokes hello.xslt.
:)

xdmp:xslt-invoke("hello.xsl", document{ <foo/> })
