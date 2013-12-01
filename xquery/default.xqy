xdmp:set-response-content-type("text/html"),

('<!doctype html>',
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Sample MarkLogic App</title>
  </head>
  <body>
    <h1>Sample MarkLogic App</h1>
    <p>MarkLogic server version:  {xdmp:version()}</p>
    <p>Go <a href='search.xqy'>search.xqy</a> to try it out.</p>


    <p>
      Entry points:
    </p>
    <dl>
      <dt><a href='examples/'>examples/</a></dt>
      <dd>
        Examples
      </dd>
      <dt><a href='use-cases/'>use-cases/</a></dt>
      <dd>
        This batch of samples came with the Mark Logic installation, I copied the whole 
        'use-cases' directory from the "Docs" database to this app, and it seems to work with
        no problem.
      </dd>
      <dt><a href='cq/'>cq/</a></dt>
      <dd>
        "Current XQuery" - a tool for doing interactive queries.  Can also reverse engineer
        it for stuff.  It has a very nice error display when there are XQuery errors.
      </dd>
      <dt><a href='mbb/try.xqy'>mbb/try.xqy</a></dt>
      <dd>
        This is the "Micro-blogging Backup" application that I started to work through,
        as described by Norman Walsh's blog posts starting 
        <a href='http://norman.walsh.name/2009/08/27/mbb01'>here</a>.
        I only made it through the second step -- I shelved it and started working 
        step-by-step through more rudimentary examples first.  This "try.xqy"
        doesn't really do anything except return the value of the /t:account
        element, which describes the Twitter account.
      </dd>
    <!--
      <dt><a href=''></a></dt>
      <dd>
      </dd>
    -->
    </dl>
  </body>
</html>)

