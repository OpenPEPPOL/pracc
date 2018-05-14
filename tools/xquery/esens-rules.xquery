declare namespace saxon = "http://saxon.sf.net/";
declare namespace iso = "http://purl.oclc.org/dsdl/schematron";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "text";


for
$x in //iso:pattern/iso:rule/iso:assert | //iso:pattern/iso:rule/iso:report

let $RuleId := string($x/@id)
let $rule := replace(normalize-space(string($x/../@context)), '\|', '\\|')
let $flag := string($x/@flag)
let $assert := replace(normalize-space(string($x/@test)), '\|', '\\|')
let $tekst := normalize-space($x/text())

where starts-with ($x/@id,'eSENS') and substring($x/@id,11,2) ='-R'
order by $x/@id

return

    concat(".3+| ", $RuleId, " *(", $flag , ")* | *", $tekst, "* | [small]#",  $rule, "# | [small]#", $assert, "# &#10;")