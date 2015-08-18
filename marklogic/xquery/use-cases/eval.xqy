xquery version "1.0-ml";

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>XQuery Results</title>
    <link rel="stylesheet" href="use-cases.css"/>
  </head>
  <body>
  { 
      xdmp:eval(xdmp:get-request-field("queryInput"), (),
	<options xmlns="xdmp:eval">
		<default-xquery-version>1.0</default-xquery-version>
	</options>) 
  }
  </body>
</html>
