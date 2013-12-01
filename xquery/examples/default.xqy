xquery version "1.0-ml";

import module namespace config="http://chrismaloney.org/ns/config"
       at "config.xqy";

declare namespace h="http://www.w3.org/1999/xhtml";
declare namespace cfb="http://chrismaloney.org/ns/doc";

(:
  This function takes the name of a tag, which might have embedded spaces,
  and creates a hyperlinked version of it, as an <a> element, suitable
  for putting on a page.
:)
declare function cfb:makeTagLink($tagName as xs:string)
    as element(h:a)
{
  let $noSpaceTagName := replace($tagName, "\s", "")
  return
    <h:a onclick='setTag("{$noSpaceTagName}"); return false;' href=''>{
      $tagName
    }</h:a>
};

(:
  I would like to change this to use a template style pattern to produce
  the HTML output from a style of markup similar to my notes XML pages.
  I would implement transformations in XQuery using typeswitch.  See Chapter 8 of
  the Application Developer's guide, and the <a
  href='http://developer.marklogic.com/code/#bill'>Shakespeare demo app</a>.
:)
let $examples :=
  <Examples xmlns='http://chrismaloney.org/ns/doc'>
    <Title>Mark Logic Examples</Title>

    <Example>
      <Title>Manual document insert</Title>
      <Modules>
        <Module>manual-document-insert.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Loading documents</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          This inserts a document into the database called "freakybooks.xml",
          with hard-coded content.
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Count root elements</Title>
      <Modules>
        <Module>count-root-elements.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Anomalies</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          This just queries the database returning some information about the
          root elements of the various files.  There's an interesting namespace
          anomaly here.
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Load documents from files</Title>
      <Modules>
        <Module>document-load-from-files.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Loading documents</Tag>
        <Tag>Filesystem</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          Loads XML documents from the filesystem, giving them new names in
          the database.
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Dump documents</Title>
      <Modules>
        <Module>dump-documents.xqy</Module>
      </Modules>
      <Tags>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          Dumps out the above-loaded documents as XML - very simple.
          Note the way that namespaces are preserved in the output - no namespace on the Docbook4
          sample, and "http://docbook.org/ns/docbook" on the Docbook 5 sample.
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>DB View</Title>
      <Modules>
        <Module>db-view.xqy</Module>
      </Modules>
      <Tags>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          Lists all the documents in the database, with hyperlinks to file-view.xqy
        </div>
      </Desc>
    </Example>

    <Example href='file-view.xqy?uri=freakybooks.xml'>
      <Title>File view</Title>
      <Modules>
        <Module>file-view.xqy</Module>
      </Modules>
      <Tags>
        <Tag>URL parsing</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          View one XML file from the database.  Shows how to get a query string parameter.
          This assumes the file is XML.
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Update book publisher</Title>
      <Modules>
        <Module>update-book-publisher-form.xqy</Module>
        <Module>update-book-publisher.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Updates</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <p>
            Presents an HTML form that can be used to update the publisher of one of
            any of the books from the "freakybooks.xml" document (loaded by
            manual-document-insert.xqy, above).
          </p>
          <p>
            The form then submits it's data to the update-book-publisher.xqy module.
            This module has a little
            more nuances in the HTML area - such as XQuery-style comments (using
            "{{(:" and ":)}}" inside the literal
            XML constructor section, and double-curly brackets for use in the &lt;style&gt;
            element.  If successful, this uses xdmp:redirect-response to redirect the
            request to file-view.xqy.
          </p>
          <p>
            You can call this directly with GET query parameters, for example,
            <a href='update-book-publisher.xqy?bookid=2&amp;publisher=Gargantuan+Happiness'>update-book-publisher.xqy?bookid=2&amp;publisher=Gargantuan+Happiness</a>
            (no error) or
            <a href='update-book-publisher.xqy?bookid=999&amp;publisher=Gargantuan+Happiness'>update-book-publisher.xqy?bookid=999&amp;publisher=Gargantuan+Happiness</a>
            (error).
          </p>
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Directory listing</Title>
      <Modules>
        <Module>directory-listing.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Filesystem</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <p>
            List the contents of a directory that is given as the value of the query string
            parameter 'dir', relative to the $baseDir
            ({ $config:baseDir }).
            Lists $baseDir if dir is empty or not given.
            "dir" is normalized such that all backslashes are converted to slashes, and trailing
            slashes are removed.
            We will do two simple security checks, and throw an error if "dir"
            contains the substring ".." or if it begins with a drive letter or a slash.
          </p>
          <p>
            This one is a bit more involved, with some fancy pattern matching and error
            handling with try-catch (which is a MarkLogic XQuery extension).
          </p>
        </div>
      </Desc>
    </Example>


    <Example href='filesystem-view.xqy?file=fun-stuff'>
      <Title>Filesystem view</Title>
      <Modules>
        <Module>filesystem-view.xqy</Module>
        <Module>filesystem-module.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Filesystem</Tag>
        <Tag>Anomalies</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <p>
            This example extends the one above.
            Like that one, this takes a parameter which is a relative pathname.  But now,
            the pathname can either point to a directory or a file.
            If it is a file, it is served using the document-get() function.
          </p>
          <p>
            This does
            the same normalization and security checks, but those functions are
            are encapsulated in a separate module, filesystem-module.xqy.
          </p>
          <p>
            Note how this is different from file-view.xqy, above.  That example gets a file
            in the database; this one gets a file from the local filesystem.  Also, in this
            one, we will not assume the file is XML.  document-get() serves the
            correct mime-type and headers based on the file.
          </p>
          <p>
            Fix me:  this doesn't work with files that have strange characters in their
            names, including Chinese (UTF-8) characters.  Also, haven't tested it with
            various encodings within the files themselves.
          </p>
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Upload from filesystem</Title>
      <Modules base='upload-from-filesystem'>
        <Module>default.xqy</Module>
        <Module>upload.xqy</Module>
        <Module>upload-model.xqy</Module>
        <Module>upload-view.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Filesystem</Tag>
        <Tag>MVC</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <p>
            This will be my first little mini-application.
            It will upload files to the database from a filesystem directory that is
            hardcoded (the "upload directory").  You can optionally specify a filename
            filter.  Should generate a nice report of what it did, and if there were
            any problems.
          </p>
          <p>
            I tried to follow a simple MVC pattern while writing this.  See the
            summary on the default page for more details.
          </p>
        </div>
      </Desc>
    </Example>

    <Example>
      <Title>Invoke load document</Title>
      <Modules>
        <Module>invoke-load-doc.xqy</Module>
      </Modules>
      <Tags>
        <Tag>Transactions</Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          <em>This one need serious work!!</em><br/>
          Using xdmp:invoke() to load a document to the database and then work on it
          within the same query.  Without invoke(), you can't do this because the
          entire query acts as a single transaction.  The query modules that are
          invoked by this are invoke-load-doc-e1.xqy,
          invoke-load-doc-e2.xqy, etc. ("invokee", get it?).
        </div>
      </Desc>
    </Example>

    <Example href='default.xqy'>
      <Title>This Examples page</Title>
      <Modules>
        <Module>default.xqy</Module>
        <Module>examples.css</Module>
        <Module>examples.js</Module>
      </Modules>
      <Tags>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
          Generating this examples page involves a little more XML-to-XHTML
          munging in XQuery, and the addition of some CSS and JavaScript.
        </div>
      </Desc>
    </Example>

<!--
    If no @href is given, the first Module is used.  @href allows you
    to override the hyperlink URL; for example, adding query-string
    parameters.

    <Example href='.xqy'>
      <Title></Title>
      <Modules base='dir-w-no-trailing-slash'>
        <Module></Module>
      </Modules>
      <Tags>
        <Tag></Tag>
      </Tags>
      <Desc>
        <div xmlns='http://www.w3.org/1999/xhtml'>
        </div>
      </Desc>
    </Example>

-->

  </Examples>

return

(
  (:
    I played around some with
      - xdmp:set-response-content-type('text/html')
      - Returning various <!DOCTYPE ... >s
    I think the best solution is to just return the <html> with the namespace,
    as below.
    If you specify the return type as "text/xml" instead of "text/html", then
    jQuery doesn't work.
  :)
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>{ xs:string($examples/cfb:Title/node()) }</title>
      <link href="examples.css" rel="stylesheet" type="text/css"/>

      <script type="text/javascript"
              src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.js"></script>
      <script type="text/javascript"
              src='examples.js'></script>
    </head>
    <body>
      <div id='pagebox'>
        <h1>{ $examples/cfb:Title/node() }</h1>

        <div id='taglist-column'>
          <h2>Tags</h2>
          <ul>
            <li>
              <a onclick='setAllTags(); return false;' href=''><em>All</em></a>
            </li>
          {
            for $t in distinct-values(xs:string($examples/cfb:Example/cfb:Tags/cfb:Tag))
            order by $t
            return
              <li>{ cfb:makeTagLink($t) }</li>
          }</ul>
        </div>

        <div id='example-column'>{

          for $e in $examples/cfb:Example
          let $modules := $e/cfb:Modules
          let $moduleList := $modules/cfb:Module
          let $href :=
            if ($e/@href)
            then $e/@href
            else
              if ($modules/@base)
              then concat($modules/@base, "/", $moduleList[1])
              else $moduleList[1]

          let $tags := $e/cfb:Tags/cfb:Tag
          let $classes := ("example",
            for $tag in $tags
            let $noSpaceTagName := replace($tag, "\s", "")
            return concat(" ", "tag_", $noSpaceTagName)
          )
          let $class := xs:string($classes)

          return
            <div class='{$class}'>
              <div class='example-title'>
                <a href='{ $href }'>{
                  $e/cfb:Title/node()
                }</a>
              </div>

              <div class='example-tags-line'>
                <span class='example-line-head'>Tags: </span>
                {
                (:
                  Here we use the "at" keyword of the 'for' clause.
                :)
                  let $numTags := count($tags)
                  for $tag at $n in $tags
                  return (
                    cfb:makeTagLink($tag/node()),
                    if ($n = $numTags) then () else ", "
                  )
                }
              </div>

              <div class='example-modules'>
                <span class='example-line-head'>{
                  concat("Modules",
                    if ($modules/@base)
                    then concat(" (base ", $modules/@base, ")")
                    else "",
                    ": "
                  )
                }</span>
                {
                  let $numModules := count($moduleList)
                  for $m at $n in $moduleList
                  let $path :=
                    if ($modules/@base)
                    then concat($modules/@base, "/", $m)
                    else $m
                  return (
                    <a href='filesystem-view.xqy?file={$path}'>{
                      xs:string($m)
                    }</a>,
                    if ($n = $numModules) then "" else ", "
                  )
                }
              </div>

              <div class='example-desc'>{
                $e/cfb:Desc/node()
              }</div>
            </div>
        }</div>
        <div id='footer'>
          &#160;
        </div>
      </div>
    </body>
  </html>
)
