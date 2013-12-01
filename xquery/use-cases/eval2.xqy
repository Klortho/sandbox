xquery version "1.0-ml";

try {
  xdmp:eval(xdmp:get-request-field("queryInput"), (),
	<options xmlns="xdmp:eval">
		<default-xquery-version>1.0</default-xquery-version>
	</options>) 
} catch ($e) {
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>XQuery Results</title>
      <link rel="stylesheet" href="use-cases.css"/>
    </head>
    <body>
      <table width="100%">
      <tr>
        <td class="title" colspan="2">XQuery Error</td>
      </tr>
      <tr>
        <td colspan="2">
          <dl xmlns:e="http://marklogic.com/xdmp/error">
            <dt>{$e/e:format-string/text()}</dt>
            { 
              for $f in $e/e:stack/e:frame
              return
                (<dt>{$f/e:uri/text()} line {$f/e:line/text()}
                     { if (fn:exists ($f/e:xquery-version))
                       then fn:concat (" [", $f/e:xquery-version/text(), "]")
                       else ()
                     }
                 </dt>,
                 <dd>{
	           for $v in $f/e:variables
                   return <span>{$v/name} = {$v/value}<br/></span>
                 }</dd>)
            }
          </dl>
        </td>
      </tr>
      </table>
    </body>
  </html>
}
