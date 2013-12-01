xquery version "1.0-ml";

xdmp:set-response-content-type("text/html"),

(:
  This example just demonstrates that it's possible to access a remote
  web service.
:)

xdmp:http-get(
  "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&amp;id=20301510&amp;version=2.0"
)

