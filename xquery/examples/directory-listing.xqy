xquery version "1.0-ml";

(: 
  directory-listing.xqy 
  List the contents of a directory that is given as the value of the query string
  parameter 'dir', relative to C:/Chris/MarkLogic/TestServer (which is hardcoded
  as the $baseDir variable).    
  Lists the contents of the base directory if dir is empty or not given.
  "dir" is normalized such that all backslashes are converted to slashes, and trailing
  slashes are removed.
  We will do two simple security checks, and throw an error if "dir"
  contains the substring ".." or if it begins with a drive letter or a slash.
  This also lists the contents with hyperlinks for directories, which
  link back to this module.
:)

declare namespace dir = "http://marklogic.com/xdmp/directory";
declare namespace error = "http://marklogic.com/xdmp/error";

(: This gives us $config:baseDir :)
import module namespace config="http://chrismaloney.org/ns/config"
       at "config.xqy";


(:
  The try-catch is a MarkLogic extension -- not standard XQuery!
:)
try {

  (: Get the query string parameter value(s) :)
  let $dirParam := xdmp:get-request-field("dir")

  (: 
    When retrieving and validating a query string parameter, care must be taken.
    If the parameter is absent, the value returned is ().  If the value is present,
    it is a string atomic type.  But it might also be a sequence, for example,
    "...?dir=foo&dir=bar" will result in ( "foo", "bar" ).
  :)
  let $rawDir := if (count($dirParam) = 0) 
                 then ""
                 else (
                   if (count($dirParam) = 1)
                   then string($dirParam)
                   else error(QName("http://chrismaloney.org/ns/error", "Error"), 
                              "OMGWTFBBQ!  You gave me to two values of 'dir', dude ...")
                 )

  (:
    Now normalize by replacing backslashes with slashes, and chopping off trailing
    slashes (in that order).  The results are the directory, relative to $baseDir
  :)
  let $relDir := replace(
                   replace($rawDir, "\\", "/"),
                   "/+$", "")

  (:
    Security checks here
  :)
  let $check :=
    if (matches($relDir, "^[a-zA-Z]:") or
        matches($relDir, "^/") or
        matches($relDir, "\.\."))
    then
      error(QName("http://www.chrismaloney.com/ns/error", "Error"),
            "OMGWTFBBQ!  What are you trying to do, man??")
    else ()

  (:
    Now compute the absolute directory name.  If $relDir is empty, then it's
    just the same as $baseDir.  Otherwise, we have to put a slash between
    $baseDir and $relDir.
  :)
  let $dir := if ($relDir = "")
              then $config:baseDir
              else concat($config:baseDir, "/", $relDir)

  (:
    Finally we're ready to make the system call.  The results will look like this:
    <dir:directory xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                   xmlns:dir="http://marklogic.com/xdmp/directory" 
                   xsi:schemalocation="http://marklogic.com/xdmp/directory directory.xsd">
      <dir:entry>
      	<dir:filename>4.1-docs</dir:filename>
      	<dir:pathname>C:/Chris/MarkLogic/4.1-docs</dir:pathname>
      	<dir:type>directory</dir:type>
      	<dir:content-length>0</dir:content-length>
      	<dir:last-modified>2010-03-31T07:55:06-04:00</dir:last-modified>
      </dir:entry>
      ...
    </dir:directory>
  :)
  let $xfd := xdmp:filesystem-directory($dir)

  let $dirListing :=
    <ul>{
      for $d in $xfd/dir:entry
      let $absDir := replace($d/dir:pathname, "\\", "/")
      (: 
        Convert the absolute pathname back into a relative pathname by chopping off
        the leading $baseDir + "/".  The way I do it here, with a simple pattern match,
        is a little bit brittle, I think.
      :)
      let $relDir := replace($absDir, concat("^", $config:baseDir, "/"), "")
      return 
        <li>{
          if ($d/dir:type = "directory")
          then 
            <span class='directory'>
              <a href='directory-listing.xqy?dir={$relDir}'>{data($d/dir:filename)}</a>
            </span>
          else
            <span class='filename'>
              {data($d/dir:filename)}
            </span>
        }</li>
    }</ul>

  return
    <html xmlns='http://www.w3.org/1999/xhtml'>
      <head>
        <title>directory-listing.xqy</title>
        <style type='text/css'>
          span.directory {{
            font-weight: bold;
            font-style: italic;
          }}
        </style>
      </head>
      <body>
      {(:
        <p>
          Debug:<br/>
          $dirParam = {$dirParam}<br/>
          $rawDir = {$rawDir}<br/>
          $relDir = {$relDir}<br/>
          $dir = {$dir}<br/>
        </p>
      :)}
        <h1>Directory listing of { $dir }</h1>
        { $dirListing }
        <hr/>
        <p>Dump of xdmp:filesystem-directory():</p>
        { $xfd }
      </body>
    </html>
}

(:
  Of course, it would be nicer to use only one <html> shell, and have the
  try-catch block inside the body somewhere, but then, to make that look nice,
  I'd really want to put the bulk of the code into a function so it could still
  appear at the top, and let's defer that till the next example.
:)
catch ($error) 
{
  <html xmlns='http://www.w3.org/1999/xhtml'>
    <head>
      <title>directory-listing.xqy</title>
      <style type='text/css'>
        .error-msg {{ 
          font-weight: bold;
          color: red; 
        }}
      </style>
    </head>
    <body>
      <h1>Directory listing ...</h1>
      <h2>Ack!  Encountered an error:</h2>
      <span class='error-msg'>{ $error//error:message }</span>
    </body>
  </html>
}
