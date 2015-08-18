xquery version "1.0";
(: $Id: transform.xql 2055 2011-09-24 07:25:11Z maloneyc $ :)

declare namespace transform="http://exist-db.org/xquery/transform";



let $title := "XSLT Transform Example"
return 
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>
      <h1>{$title}</h1>
      {
        transform:transform(
          <splits>
            <split>drooper</split>
            <split>bingo</split>
            <split>fleegle</split>
            <split>snorky</split>
          </splits>,
          "xslt.xsl",
          ()
        )
      }
    </body>
  </html>
