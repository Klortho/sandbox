xquery version "1.0-ml";
module namespace search-lib = "http://www.marklogic.com/tutorial2/search-lib";

declare function search-lib:find-speech($query-term as xs:string) as element(SPEECH)* {
  cts:search(//SPEECH, cts:element-value-query(xs:QName("SPEAKER"), $query-term, ("wildcarded", "case-insensitive")))	
};
