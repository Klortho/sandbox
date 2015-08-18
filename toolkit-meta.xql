xquery version "1.0";
(: $Id: toolkit-meta.xql 2055 2011-09-24 07:25:11Z maloneyc $ :)

let $toolkit := /book[contains(book-meta/book-id, "toolkit")]
let $title := "Toolkit meta"
return 
  <html>
    <head>
      <title>{$title}</title>
    </head>
    <body>
      <h1>{$title}</h1>
      <p>
        This example shows some very simple queries to pull some data from the
        database.
      </p>
      <table>
        <tr>
          <th>Book id:</th>
          <td>{$toolkit/book-meta/book-id}</td>
        </tr>
        <tr>
          <th>Title:</th>
          <td>{$toolkit/book-meta/book-title-group/book-title}</td>
        </tr>
      </table>
      <p>
        Below is the raw XML.  Do View → Source to see it.
      </p>
      <div>
        {$toolkit//book-meta}
      </div>
    </body>
  </html>

