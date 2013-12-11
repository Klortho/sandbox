xquery version "1.0";
(: This example came originally from the xquery/guess.xql.
   $Id: guess.xql 2056 2011-09-24 07:52:18Z maloneyc $ :)

declare option exist:serialize "method=xhtml media-type=text/html";

import module namespace request="http://exist-db.org/xquery/request";
import module namespace session="http://exist-db.org/xquery/session";
import module namespace util="http://exist-db.org/xquery/util";


(: 
  This function generates a new random value, and resets the number of
  guesses to 0.  Local functions should have the "local:" prefix. 
:)
declare function local:random($max as xs:integer) 
as empty()
{
  let $r := ceiling(util:random() * $max) cast as xs:integer
  return (
    session:set-attribute("random", $r),
    session:set-attribute("guesses", 0)
  )
};

declare function local:guess($guess as xs:integer,
                             $rand as xs:integer) 
as element()
{
  let $count := session:get-attribute("guesses") + 1
  return (
    (: Increment the number of guesses :)
    session:set-attribute("guesses", $count),
    if ($guess lt $rand) then
        <p>Your number is too small!</p>
    else if ($guess gt $rand) then
        <p>Your number is too large!</p>
    else
        let $newRandom := local:random(100)
        return
            <p>Congratulations! You guessed the right number with
            {$count} tries. Try again!</p>
  )
};

(:
  This return type declaration ("item()*") is about as generic as possible, I think.
:)
declare function local:main() 
as item()*
{
  session:create(),
  let $rand := session:get-attribute("random"),
      $guess := xs:integer(request:get-parameter("guess", ()))
  return
    (: 
      If this is not the first request for this session, then $rand will be
      evaluate to true.
    :)
  	if ($rand) then 
  	  (: If the 'guess' qs param was given ... :)
  		if ($guess) then
  			local:guess($guess, $rand)
  		else
  			"No input!"
  	else 
  	    local:random(100)
};

<html>
  <head><title>Number Guessing</title></head>
  <body>
    <h1>Number Guessing</h1>
    <p>
       This example came originally from the xquery/guess.xql.  It shows a few functions
       for getting information about the request, and for creating and using sessions.
    </p>
    <!-- I'm not sure what the purpose of session:encode-url() is here.  
      It doesn't seem to do anything. -->
    <form action="{session:encode-url(request:get-uri())}">
      <table border="0">
        <tr>
          <th colspan="2">Guess a number</th>
        </tr>
        <tr>
          <td>Number:</td>
          <td><input type="text" name="guess" size="3"/></td>
        </tr>
        <tr>
          <td colspan="2" align="left"><input type="submit"/></td>
        </tr>
      </table> 
    </form>
    { local:main() }
    <p>
      Current session-id is {session:get-id()}.<br />
      Hint:  the number is {session:get-attribute("random")}.
    </p>
    <hr />
    <p>
      Back to <a href='index.xql'>index</a>.
    </p>
  </body>
</html>
