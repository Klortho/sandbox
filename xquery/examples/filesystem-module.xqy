xquery version "1.0-ml";

module namespace fs="http://www.chrismaloney.com/ns/filesystem/";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare namespace html = "http://www.w3.org/1999/xhtml";


declare option xdmp:mapping "false"; 



declare function fs:getPathQueryParam($baseDir as xs:string, $paramName as xs:string) 
    as xs:string
{
  (: Get the query string parameter value(s) :)
  let $param := xdmp:get-request-field($paramName)

  (: 
    When retrieving and validating a query string parameter, care must be taken.
    If the parameter is absent, the value returned is ().  If the value is present,
    it is a string atomic type.  But it might also be a sequence, for example,
    "...?dir=foo&dir=bar" will result in ( "foo", "bar" ).
  :)
  let $raw := if (count($param) = 0) 
                 then ""
                 else (
                   if (count($param) = 1)
                   then string($param)
                   else error(QName("http://chrismaloney.org/ns/error", "Error"), 
                              concat("OMGWTFBBQ!  ",
                                     "You gave me to more than one value of '", $paramName,
                                     "', dude ..."))
                 )
  (:
    Now normalize by replacing backslashes with slashes, and chopping off trailing
    slashes (in that order).  The results are the pathname, relative to $baseDir
  :)
  let $rel := replace(
                replace($raw, "\\", "/"),
                "/+$", "")

  (:
    Security checks here
  :)
  let $check :=
    if (matches($rel, "^[a-zA-Z]:") or
        matches($rel, "^/") or
        matches($rel, "\.\."))
    then
      error(QName("http://www.chrismaloney.com/ns/error", "Error"),
            "OMGWTFBBQ!  What are you trying to do, man??")
    else ()

  (:
    Now compute the absolute directory name.  If $relDir is empty, then it's
    just the same as $baseDir.  Otherwise, we have to put a slash between
    $baseDir and $relDir.
  :)
  let $path := if ($rel = "")
               then $baseDir
               else concat($baseDir, "/", $rel)

  return $path
};


(:
  dirListing($dir)
  Returns a listing of the contents of the directory as a <ul> element.
  It assumes that $dir is a subdirectory of $baseDir, and only displays
  the relative portion.
:)
declare function fs:dirListing($baseDir as xs:string, $dir as xs:string)
                 as element(html:ul)
{
  let $xfd := xdmp:filesystem-directory($dir)
  return
    <ul xmlns='http://www.w3.org/1999/xhtml'>
      {
        for $d in $xfd/dir:entry
        let $absDir := replace($d/dir:pathname, "\\", "/")
        (: 
          Convert the absolute pathname back into a relative pathname by chopping off
          the leading $baseDir + "/".  The way I do it here, with a simple pattern match,
          is a little bit brittle, I think.
        :)
        let $relDir := replace($absDir, concat("^", $baseDir, "/"), "")
        let $class := if ($d/dir:type = "directory") then "directory" else "filename"
        return 
          <li>
            <span class='{ $class }'>
              <a href='filesystem-view.xqy?file={$relDir}'>{data($d/dir:filename)}</a>
            </span>
          </li>
      }
    </ul>
};

declare function fs:htmlPage($h1 as xs:string,
                             $content as element(html:div))
                 as element(html:html)
{
  <html xmlns='http://www.w3.org/1999/xhtml'>
    <head>
      <title>filesystem-view.xqy</title>
      <style type='text/css'>
        .error-msg {{ 
          font-weight: bold;
          color: red; 
        }}
        span.directory {{
          font-weight: bold;
          font-style: italic;
        }}
      </style>
    </head>
    <body>
      <h1>{ $h1 }</h1>
      { $content }
    </body>
  </html>
};


