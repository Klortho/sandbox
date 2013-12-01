xquery version "1.0-ml";

(: 
  filesystem-view.xqy 
:)

import module namespace fs="http://www.chrismaloney.com/ns/filesystem/"
       at "/examples/filesystem-module.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare namespace dir = "http://marklogic.com/xdmp/directory";
declare namespace error = "http://marklogic.com/xdmp/error";

(: This gives us $config:baseDir, which points to the test server install dir  :)
import module namespace config="http://www.chrisbaloney.com/ns/config"
       at "config.xqy";
(: But our base dir is in the examples subdirectory :)  
declare variable $baseDir := concat($config:baseDir, "/examples");


declare option xdmp:mapping "false"; 

(:
  I can't yet figure out a very clean way to query the filesystem to tell us
  A, does this object exists, and B, is it a directory or a regular file.
  
  The solution I've come up with is:
    - try xdmp:filesystem-directory().
        - If that works, then it exists and is a directory.
        - If that fails, then try xdmp:document-get()
            - If that works, then it exists and is a file
            - Otherwise, it doesn't exist

  Note that xdmp:uri-is-file() doesn't work for telling us anything about this
  object.  The parameter it takes is a $uri, which is not the same as a pathname
  on the local filesystem.
  
  Also, this doesn't yet work with filenames that have special characters:
    - The directory "\fs1\fS-&$%#iii"
    - The file "\fs1\汉语字的文件名字.txt"
:)

try {

  let $dir := fs:getPathQueryParam($baseDir, "file")

  return
    (:
      First try it as a directory listing
    :)
    try {
      let $dirListing := fs:dirListing($baseDir, $dir)
      return 
        fs:htmlPage(
          concat("Directory listing of ", $dir),
          <div xmlns='http://www.w3.org/1999/xhtml'>
            { $dirListing }
            <p>
              Debug:<br/>
              $dir = {$dir}<br/>
            </p>
          </div>
        )
    }
    catch ($e) {
      (: 
        Failed to get a directory, try to return it as a file  
      :)
      try {(
        if (matches($dir, "\.xqy$"))
        then xdmp:set-response-content-type("text/plain")
        else (),
        xdmp:document-get($dir)
      )}
      catch ($e) {
        error(QName("http://www.chrismaloney.com/ns/error", "Error"),
              "OMGWTFBBQ!  Do you call that a file?")
      }
    }
}

(:
  Output an HTML page if there's an error.
:)
catch ($error) 
{
  fs:htmlPage("filesystem-view ...",
    <div xmlns='http://www.w3.org/1999/xhtml'>
      <h2>Ack!  Encountered an error:</h2>
      <span class='error-msg'>{ $error//error:message }</span>
    </div>
  )
}

