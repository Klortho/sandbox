xquery version "3.0";

(:
  This is a throw-away script that I wrote to query the XML catalog files that are present in all of 
  the downloaded JATS packages from the NLM JATS FTP site. It produces a YAML file as output, with
  the FPI, system ID, and other information, for each ".dtd" that it finds.
:)

declare namespace catalog="urn:oasis:names:tc:entity:xmlns:xml:catalog";

(: Get the list of distinct fpis :)
let $public_elems := //catalog:public
let $fpis := distinct-values(
    for $public in $public_elems
    let $publicId := $public/@publicId
    let $uri := $public/@uri
    where ends-with($uri, ".dtd")
    return string($public/@publicId)
)

(: For each FPI, construct our output :)
for $f in $fpis
let $public := $public_elems[@publicId=$f][1]
let $dir := substring-after(util:collection-name($public), "/db/jats/")
let $path := concat($dir, "/", $public/@uri)
order by $path

return 
    let $nlm_niso := if (starts-with($dir, "nlm-dtd")) then "nlm" else "niso"
    return concat('- name: ""&#xA;  fpi: "', $f, '"', '&#xA;',
      '  filename: ', $public/@uri, '&#xA;',
      '  path: ', $path, '&#xA;',
      '  nlm_niso: ', $nlm_niso, '&#xA;',
      '  flavor:&#xA;',
      '  version:&#xA;',
      '  tables:&#xA;',
      '  mml:&#xA;&#xA;'
    )
    
