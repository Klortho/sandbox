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

    <dl>
      <dt><a href='examples/'>examples/</a></dt>
      <dd>
        Examples that I wrote.
      </dd>
      <dt><a href='use-cases/'>use-cases/</a></dt>
      <dd>
        This batch of samples came with the Mark Logic 4.x installation, I copied the whole 
        'use-cases' directory from the "Docs" database to this app, and it seemed to work with
        no problem.  Update for my 7.0 AWS install:  I think it needs some data to be
        preloaded, but I don't know where to get that.
      </dd>
      <dt><a href='cq/'>cq/</a></dt>
      <dd>
        "Current XQuery" - a tool for doing interactive queries.  Can also reverse engineer
        it for stuff.  It has a very nice error display when there are XQuery errors.
      </dd>
    </dl>
  </body>
</html>)

