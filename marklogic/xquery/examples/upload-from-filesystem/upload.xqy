xquery version '1.0-ml';

(:
  upload.xqy
  This will take the form data and attempt to execute the action.
  Steps:
    - Read the upload directory recursively, constructing a node that has a flat list
      of files to add, like this:
        <files xmlns='http://chrismaloney.org/ns/filesystem-upload'>
          <file>
            <rel-pathname>foo/test.txt</rel-pathname>
            <fs-abs-pathname>C:/Chris/.../upload/foo/test.txt</fs-abs-pathname>
          </file>
          ...
        </files>
    - Try to upload each file to the database, recording the statuc
    - Display a nice table.
:)

(: Question:  can't I have two modules in the same namespace?  :)

import module namespace fsup="http://chrismaloney.org/ns/filesystem-upload"
       at "upload-model.xqy";
import module namespace fsupv="http://chrismaloney.org/ns/filesystem-upload-view"
       at "upload-view.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare option xdmp:mapping "false";

(:
  Get the prefix and normalize it so that it has one leading and one trailing slash.
  If there's nothing in-between, then just one slash total.
:)
let $prefix := 
  replace(
      replace(concat("/", xdmp:get-request-field("prefix"), "/"), "^/+", "/"),
      "/+$", "/")
  
let $allFiles := fsup:allUploadFiles()

(:
  Prepend the prefix to each of the files that was found, changing
  <rel-pathname> into <db-uri>.  This probably should be moved to the model.
:)
let $filesToUpload :=
  <files xmlns="http://chrismaloney.org/ns/filesystem-upload">
  {
    for $f in $allFiles/file
    return
      <file>
        <db-uri>{concat($prefix, string($f/rel-pathname))}</db-uri>
        {$f/fs-abs-pathname}
      </file>
  }
  </files>

let $uploadStatus := fsup:uploadFiles($filesToUpload)
(:
let $status := fsup:uploadOneFile(
  <fsup:file>
    <fsup:db-uri>/documents/Docbook-test2.xml</fsup:db-uri>
    <fsup:fs-abs-pathname>C:\Chris\MarkLogic\TestServer\examples\Docbook4-Sample.xml</fsup:fs-abs-pathname>
  </fsup:file>
)
:)


let $debugInfo := ()
(:
  <debug-info>
    $prefix = { $prefix }
    number of files found:  {count($allFiles/fsup:file)} 
    &#10;
    $filesToUpload = {$filesToUpload}
    &#10;
    $uploadStatus = {$uploadStatus}
  </debug-info>
:)

(:=======================================================:)
return
  fsupv:uploadStatus($uploadStatus, $debugInfo)
