xquery version '1.0-ml';

import module namespace fsup="http://www.chrisbaloney.com/ns/filesystem-upload"
       at "upload-model.xqy";
       
<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
    <title>upload-from-filesystem</title>
  </head>
  <body>
    <h1>Upload From Filesystem</h1>
    
    <form action='upload.xqy'>
      <p>
        Put the files you want to upload into 
        { $fsup:uploadDir }, enter a prefix here, and then click "submit".
      </p>
      <p>
        Prefix:  <input type='text' name='prefix'/>
      </p>
      <p>
        <input type='Submit' name='Submit' value='Submit'/>
      </p>
    </form>
    <hr/>

    <h2>Summary</h2>
    <p>
      This application will let you upload files to the Mark Logic server database
      from a filesystem directory.  It will recurse through the entire directory
      tree, adding files it finds, regardless of type (XML, BLOBs and 
      CLOBs).
    </p>
    <p>
      The upload directory is hardcoded as <i>{ $fsup:uploadDir }</i>.  This uses the
      function <a 
      href='http://developer.marklogic.com/pubs/4.1/apidocs/UpdateBuiltins.html#xdmp:document-load'>xdmp:document-load()</a> 
      to perform the work.  If a document already exists in the database at the uri that is computed
      for one of the files, then it is replaced as an update operation.
    </p>
    <p>
      You can optionally specify a prefix that will be applied to each file's
      names before it gets entered.  The prefix will have slashes added to the
      front and back, to turn it into a subdirectory of "/".
      For example, if the prefix given is "newfiles", and a file in the
      filesystem has the relative pathname "dir1/foo.txt", then it will be entered
      into the database as "/newfiles/dir1/foo.txt".
    </p>
    <p>
      In implementing this, I've tried to use the MVC pattern as described in
      <a href='http://xqmvc.googlecode.com/files/Palmitesta-An-MVC-Driven-Web%20Application-Framework-Why-and-How.pdf'>this
      presentation</a> on <a href='http://xqmvc.googlecode.com/'>xqmvc</a> (but
      note that it doesn't actually use the xqmvc code). So
      there are three separate modules corresponding to each M, V, and C:
    </p>
    <dl>
      <dt>Controller - upload.xqy</dt>
      <dd>
        This contains no HTML.  This decides what action to perform, and calls
        the relevant functions in the model.  It then calls a function in the 
        view to display results.
      </dd>
      <dt>Model - upload-model.xqy</dt>
      <dd>
        This also contains no HTML.  This is the workhorse of the application.
      </dd>
      <dt>View - upload-view.xqy</dt>
      <dd>
        This is used to display results.
      </dd>
    </dl>
    <p>
      Here's the list of "good practices" from that presentation:
    </p>
    <ul>
      <li>
        Views shouldn't be invoked directly (not sure what this means)
      </li>
      <li>
        Models/Controllers shouldn't contain XHTML
      </li>
      <li>
        Controllers/Views should directly access the database
      </li>
      <li>
        Models shouldn't read request variables.
      </li>
    </ul>

    <h2>To Do</h2>
    <ul>
      <li>
        I'd like to record each file upload request in the database, as a log,
        and have that browsable, so that you can display the results of all
        previous requests.
      </li>
      <li>
        To help keep the database clean, while testing, it might be nice to have a 
        "delete all" button on the status pages, which would delete all the files
        that were uploaded.  Of course, this isn't really an "undo", because if the
        files were in the db prior to uploading, deleting them won't restore the old
        versions.
      </li>
      <li>
        Can't the view and the model (i.e. two separate modules) have the same
        namespace?  Need to find out.
      </li>
      <li>
        To really make it useful, there should be an intermediate page which lists
        all the files that were found, before uploading them to the database.
        The user has to confirm, before any action is taken.
      </li>
    <!--
      <li>
      </li>
    -->
    </ul>
  </body>
</html>


