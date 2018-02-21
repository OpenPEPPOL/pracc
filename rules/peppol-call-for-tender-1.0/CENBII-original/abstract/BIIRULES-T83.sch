<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for T83 -->
<!-- Timestamp: 2015-11-25 14:13:29 +0100 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T83">
  <rule context="$Call_for_Tenders">
    <assert test="$BII3-T83-R001" flag="fatal" id="BII3-T83-R001">[BII3-T83-R001]-A Call for Tenders shall have a specification identifier</assert>
    <assert test="$BII3-T83-R002" flag="fatal" id="BII3-T83-R002">[BII3-T83-R002]-A Call for Tenders shall have a business process identifier</assert>
    <assert test="$BII3-T83-R003" flag="fatal" id="BII3-T83-R003">[BII3-T83-R003]-A Call for Tenders shall have a Call for Tenders identifier</assert>
    <assert test="$BII3-T83-R004" flag="fatal" id="BII3-T83-R004">[BII3-T83-R004]-A Call for Tenders shall have a reference number</assert>
    <assert test="$BII3-T83-R005" flag="fatal" id="BII3-T83-R005">[BII3-T83-R005]-A Call for Tenders shall have an issue date</assert>
    <assert test="$BII3-T83-R006" flag="fatal" id="BII3-T83-R006">[BII3-T83-R006]-A Call for Tenders shall identify the Contracting Body</assert>
    <assert test="$BII3-T83-R007" flag="fatal" id="BII3-T83-R007">[BII3-T83-R007]-A Call for Tenders shall define the tendering terms.</assert>
    <assert test="$BII3-T83-R008" flag="fatal" id="BII3-T83-R008">[BII3-T83-R008]-A Call for Tenders shall define the tendering process.</assert>
    <assert test="$BII3-T83-R009" flag="fatal" id="BII3-T83-R009">[BII3-T83-R009]-A Call for Tenders shall define the procedure type (open, restricted, &#8230;.).</assert>
    <assert test="$BII3-T83-R010" flag="fatal" id="BII3-T83-R010">[BII3-T83-R010]-A Call for Tenders shall define the tender submission deadline.</assert>
    <assert test="$BII3-T83-R011" flag="fatal" id="BII3-T83-R011">[BII3-T83-R011]-A Call for Tenders shall define the request for participation deadline.</assert>
    <assert test="$BII3-T83-R012" flag="fatal" id="BII3-T83-R012">[BII3-T83-R012]-A Call for Tenders shall define whether there are variants allowed in the tenders or not</assert>
    <assert test="$BII3-T83-R013" flag="fatal" id="BII3-T83-R013">[BII3-T83-R013]-A Call for Tenders shall define the procurement project name.</assert>
    <assert test="$BII3-T83-R014" flag="fatal" id="BII3-T83-R014">[BII3-T83-R014]-A Call for Tenders shall define the procurement project description.</assert>
    <assert test="$BII3-T83-R015" flag="fatal" id="BII3-T83-R015">[BII3-T83-R015]-A Call for Tenders shall define the procurement project type (works, supplies, ...).</assert>
    <assert test="$BII3-T83-R016" flag="fatal" id="BII3-T83-R016">[BII3-T83-R016]-A Call for Tenders shall define the main CPV code (Common Procurement Vocabulary)</assert>
    <assert test="$BII3-T83-R017" flag="fatal" id="BII3-T83-R017">[BII3-T83-R017]-A Call for Tenders shall define the NUTS code of the execution location.</assert>
  </rule>
  <rule context="$Country">
    <assert test="$BII3-T83-R018" flag="fatal" id="BII3-T83-R018">[BII3-T83-R018]-List identifier for country code must be 'ISO3166-1:Alpha2'</assert>
  </rule>
  <rule context="$CPV">
    <assert test="$BII3-T83-R019" flag="fatal" id="BII3-T83-R019">[BII3-T83-R019]-List identifier for CPV must be 'CPV'</assert>
  </rule>
  <rule context="$NUTS">
    <assert test="$BII3-T83-R020" flag="fatal" id="BII3-T83-R020">[BII3-T83-R020]-Scheme identifier for location codes must be 'NUTS'</assert>
  </rule>
  <rule context="$Procedure">
    <assert test="$BII3-T83-R021" flag="fatal" id="BII3-T83-R021">[BII3-T83-R021]-List identifier for procedure type must be 'PR_PROC'</assert>
  </rule>
  <rule context="$Contracting">
    <assert test="$BII3-T83-R022" flag="fatal" id="BII3-T83-R022">[BII3-T83-R022]-List identifier for contracting system code must be 'CONTRACT_TYPE'</assert>
  </rule>
  <rule context="$Submission">
    <assert test="$BII3-T83-R023" flag="fatal" id="BII3-T83-R023">[BII3-T83-R023]-List identifier for submission type code must be 'BII_SUBMISSION'</assert>
  </rule>
  <rule context="$Project">
    <assert test="$BII3-T83-R024" flag="fatal" id="BII3-T83-R024">[BII3-T83-R024]-List identifier for procurement type must be 'PROJECT_TYPE'</assert>
  </rule>
</pattern>
