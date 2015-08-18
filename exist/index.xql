xquery version "1.0";
(: $Id: index.xql 3527 2013-02-02 03:23:51Z maloneyc $ :)

let $title := "Chris' Examples"

return
  <html>
    <head>
      <title>{$title}</title>
      <style type='text/css'>
        dt {{
          margin-top: 8px;
          border-top: 1px solid #A0A0A0;
          font-weight: bold;

        }}
      </style>
    </head>
    <body>
      <h1>{$title}</h1>
      <p>
        See also <a href='../examples.xml'>the examples that came with the eXist
        installation</a>.
      </p>
      <p>
        You can also access a <a href='.'>directory listing</a> of this examples directory.
      </p>

      <dl>
        <dt><a href='splits.xml'>splits.xml</a></dt>
        <dd>
          A simple XML file will be returned as-is.
        </dd>

        <dt><a href='index.xql'>index.xql</a></dt>
        <dd>
          This file itself is a very simple XQuery script.
        </dd>

        <dt><a href='guess.xql'>guess.xql</a> - Number Guessing</dt>
        <dd>
          This example came originally from the xquery/guess.xql.  It shows how to declare and
          invoke library functions.  In particular, a
          few functions for getting information about the request, and for creating and using sessions.
          Functions used:
          <ul>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/request'>request</a>:<a
              href='http://demo.exist-db.org/exist/functions/request/get-parameter'>get-parameter</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/request'>request</a>:<a
              href='http://demo.exist-db.org/exist/functions/request/get-uri'>get-uri</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/session'>session</a>:<a
              href='http://demo.exist-db.org/exist/functions/session/create'>create</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/session'>session</a>:<a
              href='http://demo.exist-db.org/exist/functions/session/set-attribute'>set-attribute</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/session'>session</a>:<a
              href='http://demo.exist-db.org/exist/functions/session/get-attribute'>get-attribute</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/session'>session</a>:<a
              href='http://demo.exist-db.org/exist/functions/session/encode-url'>encode-url</a>
            </li>
            <li>
              <a href='http://demo.exist-db.org/exist/functions/util'>util</a>:<a
              href='http://demo.exist-db.org/exist/functions/util/random'>random</a>
            </li>
          </ul>
        </dd>

        <dt><a href='/exist/rest/db/sandbox/test/guess.xql'>[xmldb:]guess.xql</a> - Number
        Guessing</dt>
        <dd>
          Just like the above, but the XQuery is stored in the database.
          I loaded the module to sandbox/text, and then run it from the HTTP URL
          /exist/rest/db/sandbox/test/guess.xql.  This utilizes the REST API
          described some <a href='/exist/apps/doc/devguide_rest.xml'>here</a>.
          To fix it so that the REST server puts out the HTTP header Content-Type set
          to "text/html" (instead of text/xml) you need to add this to the query:
          <pre>declare option exist:serialize "method=xhtml media-type=text/html";</pre>
        </dd>

        <dt><a href='table.xql'>table.xql</a></dt>
        <dd>
          Demonstrates how to write and invoke local XQuery functions.
        </dd>

        <dt><a href='external-document.xql'>external-document.xql</a></dt>
        <dd>
          Read and process some XML documents from the interwebs.  The URLs
          are passed in via system properties, that should be set in the
          <em>startup.sh</em> script.
        </dd>

        <dt><a href='transform.xql'>transform.xql</a></dt>
        <dd>
          Shows how to invoke an XSLT transformation from within XQuery.
        </dd>

        <dt><a href='namespace-db-file.xql'>namespace-db-file.xql</a></dt>
        <dd>
          Pretty trivial example of accessing an XML file either in the database or on the
          filesystem.  The file uses namespaces, and this gives a simple example of declaring
          and writing a simple XPath expression using them.
        </dd>

        <dt><a href='FieldInfo.xql'>Entrez field info</a></dt>
        <dd>
          This is actually a useful utility, but right now, the way it is configured is
          pretty brittle.  It gets as input an ini file that has been converted into 
          XML using an external CGI.
          (The location of the CGI is defined by a system property)
        </dd>

        <dt><a href='ServersDatabases.xql'>PMC servers and databases</a></dt>
        <dd>
          Gets data from an external file (location defined by a system property).
        </dd>

        <dt><a href='toolkit-meta.xql'>toolkit-meta.xql</a></dt>
        <dd>
          <b><em>Notes:  This will only work if the Toolkit book is loaded to the
          database.  This query might hang on installations with large databases!</em></b>
          Pulls some data from the database.  Because it does a mindless query over the whole
          database, performance depends (very much) on how much other stuff in the database
          there is.
          The C++ Toolkit book was loaded to the database into the collection toolkit-book,
          from
          ~maloneyc/projects/ToolkitBook/toolkit-orig/toolkit/booktoolkit-flat.xml.
        </dd>



<!--

        <dt><a href=''></a></dt>
        <dd>
        </dd>
      -->
      </dl>

    </body>
  </html>
