declare namespace saxon = "http://saxon.sf.net/";
declare namespace iso = "http://purl.oclc.org/dsdl/schematron";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "text";

declare function local:wrap-line($str)
{
  if (string-length($str) < 100 or not(contains($str," ")))
  then $str
  else 
    let $wrapped := if (contains(substring($str,1,101)," "))
                    then replace($str, "^(.{0,99}[^ ]) +", "$1&#10;")
                    else replace($str, "^(.*?) ", "$1&#10;")
    return concat(substring-before($wrapped, "&#10;"), "&#10;",
                  local:wrap-line(substring-after($wrapped, "&#10;")))
};

declare function local:word-wrap($str)
{
  string-join(
    for $line in tokenize($str,"&#10;")
    return local:wrap-line($line),
    "&#10;")
};

(
for
$x in //iso:pattern/iso:rule/iso:assert[contains(@id,'-R')]
let $RuleId := string($x/@id)
let $rule := replace(normalize-space(string($x/../@context)), '\|', '\\|')
let $flag := string($x/@flag)
let $bab := replace(concat(normalize-space($x/@test),' '),'(.{0,12}) ','&#8203;')
let $assert := replace(string($bab), '\|', '\\|')
let $tekst := normalize-space($x/text())

return 
concat(".3+| ", $RuleId, " *(", $flag , ")* | *", $tekst, "* | [small]#",  $rule, "# | [small]#",$assert , "#&#10;")
,

concat("&#10;","|===","&#10;","Syntax rules","&#10;","|===","&#10;")
,
for
$x in //iso:pattern/iso:rule/iso:assert[contains(@id,'-S')]
let $RuleId := string($x/@id)
let $rule := replace(normalize-space(string($x/../@context)), '\|', '\\|')
let $flag := string($x/@flag)
let $assert := replace(normalize-space(string($x/@test)), '\|', '\\|')
let $tekst := normalize-space($x/text())


return 
(:if (position($x) = 1) then ("HEI") 

else:) 
concat(".3+| ", $RuleId, " *(", $flag , ")* | *", $tekst, "* | [small]#",  $rule, "# | [small]#", $assert, "#&#10;")

)