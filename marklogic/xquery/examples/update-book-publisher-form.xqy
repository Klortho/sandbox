xquery version "1.0-ml";

(: 
  update-book-publisher-form.xqy
:)

declare namespace bk="http://www.marklogic.com/ns/gs-books";

<html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
    <title>update-book-publisher-form.xqy</title>
  </head>
  <body>
    {
      for $book in (doc('freakybooks.xml')/bk:books/bk:book)
      let $bookid := $book/@bookid
      return (
        <form action='update-book-publisher.xqy'>
          <input type='hidden' name='bookid'
                 value='{$bookid}'/>
          <p>
            <b>Change publisher for book
            <i>{ $book/bk:title/text() }</i>:</b>
          </p>
          <input type='text' name='publisher'
                 value='{ $book/bk:publisher/text() }'/>
          <input type='submit' value='Update'/>
        </form>,
        <hr/>
      )
    }
  </body>
</html>