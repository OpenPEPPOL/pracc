<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T90 -->
<!-- Timestamp: 2015-11-25 14:13:44 +0100 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T90">
  <rule context="$Tender">
    <assert test="$BII3-T90-R001" flag="Fatal" id="BII3-T90-R001">[BII3-T90-R001]-A Submit Tender MUST have a customization identifier</assert>
    <assert test="$BII3-T90-R002" flag="Fatal" id="BII3-T90-R002">[BII3-T90-R002]-A Submit Tender MUST have a profile identifier</assert>
    <assert test="$BII3-T90-R003" flag="Fatal" id="BII3-T90-R003">[BII3-T90-R003]-A Submit Tender MUST have an Economic Operator</assert>
    <assert test="$BII3-T90-R004" flag="fatal" id="BII3-T90-R004">[BII3-T90-R004]-A Submit Tender MUST have a Contracting Authority</assert>
    <assert test="$BII3-T90-R005" flag="Fatal" id="BII3-T90-R005">[BII3-T90-R005]-A Submit Tender MUST have the issue date</assert>
    <assert test="$BII3-T90-R006" flag="Fatal" id="BII3-T90-R006">[BII3-T90-R006]-A Submit Tender MUST have the issue time</assert>
    <assert test="$BII3-T90-R007" flag="Fatal" id="BII3-T90-R007">[BII3-T90-R007]-Issue time MUST include timezone information</assert>
    <assert test="$BII3-T90-R008" flag="Fatal" id="BII3-T90-R008">[BII3-T90-R008]-A Submit Tender MUST have a tender identifier</assert>
    <assert test="$BII3-T90-R009" flag="Fatal" id="BII3-T90-R009">[BII3-T90-R009]-A Submit Tender MUST have the Procurement Reference identifier</assert>
    <assert test="$BII3-T90-R010" flag="Fatal" id="BII3-T90-R010">[BII3-T90-R010]-A Submit Tender MUST have the call for tenders reference</assert>
    <assert test="$BII3-T90-R011" flag="Fatal" id="BII3-T90-R011">[BII3-T90-R011]-A Submit Tender MUST have the call for tenders version number</assert>
    <assert test="$BII3-T90-R012" flag="Fatal" id="BII3-T90-R012">[BII3-T90-R012]-A Submit Tender MUST have attached documents</assert>
  </rule>
  <rule context="$attachment">
    <assert test="$BII3-T90-R013" flag="Fatal" id="BII3-T90-R013">[BII3-T90-R013]-An attached document MUST have a document identifier</assert>
    <assert test="$BII3-T90-R014" flag="fatal" id="BII3-T90-R014">[BII3-T90-R014]-An attached document MUST have a document description</assert>
    <assert test="$BII3-T90-R015" flag="Fatal" id="BII3-T90-R015">[BII3-T90-R015]-An attached document MUST have a document type code</assert>
  </rule>
  <rule context="$file">
    <assert test="$BII3-T90-R016" flag="Fatal" id="BII3-T90-R016">[BII3-T90-R016]-An attached document MUST have a file name</assert>
    <assert test="$BII3-T90-R017" flag="Fatal" id="BII3-T90-R017">[BII3-T90-R017]-An attached document MUST have a document digest</assert>
    <assert test="$BII3-T90-R018" flag="Fatal" id="BII3-T90-R018">[BII3-T90-R018]-An attached document MUST have a document digest method code</assert>
  </rule>
  <rule context="$country">
    <assert test="$BII3-T90-R020" flag="Fatal" id="BII3-T90-R020">[BII3-T90-R020]-List identifier for country code must be 'ISO3166-1:Alpha2'</assert>
  </rule>
  <rule context="$documenttype">
    <assert test="$BII3-T90-R021" flag="Fatal" id="BII3-T90-R021">[BII3-T90-R021]-List identifier for document type code must be 'UNCL1001'</assert>
  </rule>
</pattern>
