module namespace fsup="http://www.chrisbaloney.com/ns/filesystem-upload";
declare namespace xpath="http://www.w3.org/2005/xpath-functions";
(:declare namespace html="http://www.w3.org/1999/xhtml";:)
declare namespace dir="http://marklogic.com/xdmp/directory";

declare variable $uploadDir := "/pmc/Work/MarkLogic/upload";

(:
  allUploadFiles()
  This returns a flattened out list of all the files in the $uploadDir.
  This is just a shorthand for allDirFiles($uploadDir, "").  See that
  function's description for more information.
:)
declare function allUploadFiles()
        as element(fsup:files)
{
  allDirFiles($uploadDir, "")
};

(:
  allDirFiles($baseDir, $relDir)
  This function returns a bit of XML that represents all the regular files
  (subdirectories are not included in the list)
  in a directory tree, in a flattened out structure, like this:
    <files xmlns='http://www.chrisbaloney.com/ns/filesystem-upload'>
      <file>
        <rel-pathname>foo/test.txt</rel-pathname>
        <fs-abs-pathname>C:/Chris/.../upload/foo/test.txt</fs-abs-pathname>
      </file>
      ...
    </files>

  It uses xdmp:filesystem-directory() to get the info, and calls itself recursively.
  That function returns XML that looks like this:
    <dir:directory xmlns:dir="http://marklogic.com/xdmp/directory">
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
declare function allDirFiles($baseDir as xs:string, $relDir as xs:string)
        as element(fsup:files)
{
  let $directory := xdmp:filesystem-directory($baseDir)
  let $relPathPrefix :=
    if ($relDir = "") then "" else xpath:concat($relDir, "/")
    
  return
    <files xmlns="http://www.chrisbaloney.com/ns/filesystem-upload">
    {
      for $entry in $directory/dir:entry
      return 
        (:
          I only know about 'file's and 'directory's.  If it's anything else,
          skip it.
        :)
        if ($entry/dir:type = "file") 
        then
          <file>
            <rel-pathname>{ 
              xpath:concat($relPathPrefix, xpath:data($entry/dir:filename)) 
            }</rel-pathname>
            <fs-abs-pathname>{
              xpath:data($entry/dir:pathname)
            }</fs-abs-pathname>
          </file>
        else 
          if ($entry/dir:type = "directory")
          then 
            let $fn := xpath:data($entry/dir:filename)
            return
              allDirFiles(xpath:concat($baseDir, "/", $fn),
                          xpath:concat($relPathPrefix, $fn))/file
          else ()
    }
    </files>
};

(:
  uploadOneFile()
  This takes as input something like this
    <file>
      <db-uri>/mystuff/foo/test.txt</rel-pathname>
      <fs-abs-pathname>C:/Chris/.../upload/foo/test.txt</fs-abs-pathname>
    </file>
  And returns
    <load-status status='pass'/>
  or 
    <load-status status='fail'>
      <error:error xmlns:error="http://marklogic.com/xdmp/error">
        ...
      </error>
    </load>
  In the case of failure, the <error:error> object thrown by xdmp:document-load() is
  returned inside <load-status>.
:)

declare function uploadOneFile($file as element(fsup:file))
        as element(fsup:load-status)
{
  let $dbUri := xpath:data($file/fsup:db-uri)
  let $fsAbsPathname := xpath:data($file/fsup:fs-abs-pathname)
  let $result :=
    try {
      xdmp:document-load($fsAbsPathname,
        <options xmlns="xdmp:document-load">
          <uri>{$dbUri}</uri>
          <repair>none</repair>
          <permissions>{xdmp:default-permissions()}</permissions>
        </options>)
      }
    catch($e) {
      $e
    }
  let $status := if ($result) then "fail" else "pass"
    
return
  <fsup:load-status status='{ $status }'>
    { $result }
  </fsup:load-status>
};

(:
  uploadFiles($files)
  This function takes a list of files to upload, which looks like this:
    <files xmlns='http://www.chrisbaloney.com/ns/filesystem-upload'>
      <file>
        <db-uri>/foo/test.txt</db-uri>
        <fs-abs-pathname>C:/Chris/.../upload/foo/test.txt</fs-abs-pathname>
      </file>
      ...
    </files>
  It then attempts to upload one at a time, using uploadOneFile().  It will
  produce output that indicates the pass/fail status of each attempt, like
  this:
    <files xmlns='http://www.chrisbaloney.com/ns/filesystem-upload'>
      <file>
        <db-uri>foo/test.txt</db-uri>
        <fs-abs-pathname>C:/Chris/.../upload/foo/test.txt</fs-abs-pathname>
        <load-status status='pass'/>
      </file>
      ...
    </files>
  where <load-status> is as defined in uploadOneFile().
:)
declare function uploadFiles($files as element(fsup:files))
        as element(fsup:files)
{
  <fsup:files>{
    for $f in $files/fsup:file
    return 
      <fsup:file>{
        $f/fsup:db-uri,
        $f/fsup:fs-abs-pathname,
        uploadOneFile($f)
      }</fsup:file>
  }</fsup:files>
};






