<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T45 -->
<!-- Timestamp: 2015-11-25 14:12:58 +0100 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T45">
  <rule context="$tender_reception_notification">
    <assert test="$BII3-T45-R001" flag="fatal" id="BII3-T45-R001">[BII3-T45-R001]-A Tender Receipt Notification MUST have an identifer</assert>
    <assert test="$BII3-T45-R002" flag="fatal" id="BII3-T45-R002">[BII3-T45-R002]-A Tender Receipt Notification MUST have an issue date</assert>
    <assert test="$BII3-T45-R003" flag="fatal" id="BII3-T45-R003">[BII3-T45-R003]-A Tender Receipt Notification MUST have an issue time</assert>
    <assert test="$BII3-T45-R004" flag="fatal" id="BII3-T45-R004">[BII3-T45-R004]-Issue time MUST include timezone information</assert>
    <assert test="$BII3-T45-R005" flag="fatal" id="BII3-T45-R005">[BII3-T45-R005]-A Tender Receipt Notification MUST have information about the Contracting Authority</assert>
    <assert test="$BII3-T45-R006" flag="fatal" id="BII3-T45-R006">[BII3-T45-R006]-A Tender Receipt Notification MUST have information about the Economic Operator</assert>
    <assert test="$BII3-T45-R007" flag="fatal" id="BII3-T45-R007">[BII3-T45-R007]-A Tender Receipt Notification MUST have a procurement project identifier</assert>
    <assert test="$BII3-T45-R008" flag="fatal" id="BII3-T45-R008">[BII3-T45-R008]-A Tender Receipt Notification MUST have references to the Tender documents received</assert>
    <assert test="$BII3-T45-R009" flag="fatal" id="BII3-T45-R009">[BII3-T45-R009]-A Tender Receipt Notification MUST have a customization identifier</assert>
    <assert test="$BII3-T45-R010" flag="fatal" id="BII3-T45-R010">[BII3-T45-R010]-A Tender Receipt Notification MUST have a profile identifier</assert>
    <assert test="$BII3-T45-R011" flag="fatal" id="BII3-T45-R011">[BII3-T45-R011]-A Tender Receipt Notification MUST state the date the Tender was received</assert>
    <assert test="$BII3-T45-R012" flag="fatal" id="BII3-T45-R012">[BII3-T45-R012]-A Tender Receipt Notification MUST state the time the Tender was received</assert>
    <assert test="$BII3-T45-R017" flag="fatal" id="BII3-T45-R017">[BII3-T45-R017]-Reception of tender time MUST include timezone information</assert>
  </rule>
  <rule context="$Document_Reference">
    <assert test="$BII3-T45-R013" flag="fatal" id="BII3-T45-R013">[BII3-T45-R013]-A document reference MUST have a document identifier</assert>
    <assert test="$BII3-T45-R014" flag="fatal" id="BII3-T45-R014">[BII3-T45-R014]-A document reference MUST have a document type code</assert>
  </rule>
  <rule context="$Document_type">
    <assert test="$BII3-T45-R016" flag="fatal" id="BII3-T45-R016">[BII3-T45-R016]-A document type code MUST have a list identifier attribute 'UNCL1001'</assert>
  </rule>
</pattern>
