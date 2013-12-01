module namespace fsupv="http://www.chrisbaloney.com/ns/filesystem-upload-view";

import module namespace fsup="http://www.chrisbaloney.com/ns/filesystem-upload"
       at "upload-model.xqy";

declare namespace xpath="http://www.w3.org/2005/xpath-functions";
declare namespace html="http://www.w3.org/1999/xhtml";
declare namespace error="http://marklogic.com/xdmp/error";


(:
  uploadStatus()
  For debugging:  if you want to view XML that's been stuffed into $debugInfo,
  try changing the return type of this from "html:html" to just "html",
  and taking out the xmlns attribute of the <html> element.  Then you'll be
  able to view it in the tree view in your browser.
  
  $files is in the format described in upload-model.xqy, uploadFiles().
:)
declare function uploadStatus($files as element(fsup:files),
                              $debugInfo as element(debug-info)?)
        as element(html:html)
{
  <html xmlns='http://www.w3.org/1999/xhtml'>
    <head>
      <title>upload-from-filesystem</title>
      { myCSS() }
    </head>
    <body>
      <h1>Upload Results</h1>

      <table border='1'>
        <tr>
          <th>Db URI</th>
          <th>Status</th>
        </tr>
        {
          for $f in $files/fsup:file
          return
            let $dbUri := xpath:data($f/fsup:db-uri)
            let $status := statusHtml($f/fsup:load-status)
            return
              <tr>
                <td>
                  <a href='../file-view.xqy?uri={$dbUri}'>{$dbUri}</a>
                </td>
                <td>{$status}</td>
              </tr>
        }
      </table>

      {
        if ($debugInfo) 
        then (
          <hr/>,
          <p>
            <b>Debug:</b>
          </p>,
          <pre>{$debugInfo}</pre>
        )
        else ()
      }
    </body>
  </html>
};

(:
  statusHtml($s)
  This function takes the <fsup:load-status> in, and renders it into
  XHTML ready for displaying inside the table cell (or wherever else you want).
:)
declare function statusHtml($s as element(fsup:load-status))
        as element(html:div)
{
  let $pass_fail := xpath:data($s/@status)
  return
    <div xmlns='http://www.w3.org/1999/xhtml'>{
      if ($pass_fail = "pass") 
      then
        <span class='pass'>Pass</span>
      else
        let $e := $s/error:error
        let $ecode := xpath:string($e/error:code)

        (: For some $!&#! reason this doesn't work when I specify it as $e/error:name/error:message :)
        let $emessage := xpath:string($e//error:message)

        return (
          <span class='fail'>Fail</span>,
          <div>
            Error:  { $ecode } - { $emessage }
          </div>
        )
    }</div>
};

declare function myCSS()
        as element(html:style)
{
  <style xmlns='http://www.w3.org/1999/xhtml' type='text/css'>
    .pass, .fail {{
      font-weight: bold;
      font-family: helvetica, sans-serif;
    }}
    .pass {{ 
      color: green; 
    }}
    .fail {{
      color: red;
    }}
  </style>
};
