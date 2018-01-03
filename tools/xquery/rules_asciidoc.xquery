declare namespace saxon = "http://saxon.sf.net/";
declare namespace iso = "http://purl.oclc.org/dsdl/schematron";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "text";

declare function local:wrap-line($str, $pos, $rplstr)
{
  if (string-length($str) < $pos+1 or (contains(substring($str,1,$pos),' ') ))
  then $str
  else 
    let $wrapped := concat(substring($str,1,$pos),$rplstr)
    let $wrapped2 := substring($str,$pos+1)	
    return concat($wrapped,
                  local:wrap-line($wrapped2,$pos,$rplstr))
};

declare function local:word-wrap($str,$pos,$rplstr)
{
  string-join(
    for $line in tokenize($str,"&#10;")
    return local:wrap-line($line,$pos,$rplstr),
    "&#10;")
};

for
$x in //iso:pattern/iso:rule/iso:assert

let $RuleId := string($x/@id)
let $rule := replace(normalize-space(string($x/../@context)), '\|', '\\|')
let $flag := string($x/@flag) 
let $wrap := local:word-wrap($x/@test,50, '&#8203;')
let $assert := replace(string($wrap), '\|', '\\|')
let $tekst := normalize-space($x/text())
order by ($x/@id)

return
    concat(".3+| ", $RuleId, " *(", $flag , ")* | *", $tekst, "* | [small]#",  $rule, "# | [small]#", $assert, "#&#10;")
