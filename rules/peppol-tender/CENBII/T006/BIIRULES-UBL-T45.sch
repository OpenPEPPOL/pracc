<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
        xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
        xmlns:UBL="urn:oasis:names:specification:ubl:schema:xsd:TenderReceipt-2"
        queryBinding="xslt2">
  <title>BIIRULES  T45 bound to UBL</title>
  <ns prefix="cbc"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl"
       uri="urn:oasis:names:specification:ubl:schema:xsd:TenderReceipt-2"/>
  <phase id="BIIRULEST45_phase">
      <active pattern="UBL-T45"/>
  </phase>
  <phase id="codelist_phase">
      <active pattern="CodesT45"/>
  </phase>
  
  
  <!--Suppressed abstract pattern T45 was here-->
  
  
  <!--Start pattern based on abstract T45--><pattern id="UBL-T45">
      <rule context="/ubl:TenderReceipt">
         <assert test="(cbc:ID)" flag="fatal" id="BII3-T45-R001">[BII3-T45-R001]-A Tender Receipt Notification MUST have an identifer</assert>
         <assert test="(cbc:IssueDate)" flag="fatal" id="BII3-T45-R002">[BII3-T45-R002]-A Tender Receipt Notification MUST have an issue date</assert>
         <assert test="(cbc:IssueTime)" flag="fatal" id="BII3-T45-R003">[BII3-T45-R003]-A Tender Receipt Notification MUST have an issue time</assert>
         <assert test="count(timezone-from-time(cbc:IssueTime)) &gt; 0"
                 flag="fatal"
                 id="BII3-T45-R004">[BII3-T45-R004]-Issue time MUST include timezone information</assert>
         <assert test="(cac:SenderParty)" flag="fatal" id="BII3-T45-R005">[BII3-T45-R005]-A Tender Receipt Notification MUST have information about the Contracting Authority</assert>
         <assert test="(cac:ReceiverParty)" flag="fatal" id="BII3-T45-R006">[BII3-T45-R006]-A Tender Receipt Notification MUST have information about the Economic Operator</assert>
         <assert test="(cbc:ContractFolderID)" flag="fatal" id="BII3-T45-R007">[BII3-T45-R007]-A Tender Receipt Notification MUST have a procurement project identifier</assert>
         <assert test="(cac:TenderDocumentReference)"
                 flag="fatal"
                 id="BII3-T45-R008">[BII3-T45-R008]-A Tender Receipt Notification MUST have references to the Tender documents received</assert>
         <assert test="(cbc:CustomizationID)" flag="fatal" id="BII3-T45-R009">[BII3-T45-R009]-A Tender Receipt Notification MUST have a customization identifier</assert>
         <assert test="(cbc:ProfileID)" flag="fatal" id="BII3-T45-R010">[BII3-T45-R010]-A Tender Receipt Notification MUST have a profile identifier</assert>
         <assert test="(cbc:RegisteredDate)" flag="fatal" id="BII3-T45-R011">[BII3-T45-R011]-A Tender Receipt Notification MUST state the date the Tender was received</assert>
         <assert test="(cbc:RegisteredTime)" flag="fatal" id="BII3-T45-R012">[BII3-T45-R012]-A Tender Receipt Notification MUST state the time the Tender was received</assert>
         <assert test="count(timezone-from-time(cbc:RegisteredTime)) &gt; 0"
                 flag="fatal"
                 id="BII3-T45-R017">[BII3-T45-R017]-Reception of tender time MUST include timezone information</assert>
      </rule>
      <rule context="//cac:TenderDocumentReference">
         <assert test="(cbc:ID)" flag="fatal" id="BII3-T45-R013">[BII3-T45-R013]-A document reference MUST have a document identifier</assert>
         <assert test="(cbc:DocumentTypeCode)" flag="fatal" id="BII3-T45-R014">[BII3-T45-R014]-A document reference MUST have a document type code</assert>
      </rule>
      <rule context="//cbc:DocumentTypeCode">
         <assert test="(./@listID = 'UNCL1001')" flag="fatal" id="BII3-T45-R016">[BII3-T45-R016]-A document type code MUST have a list identifier attribute 'UNCL1001'</assert>
      </rule>
   </pattern>
  
  
  <pattern id="CodesT45">



   </pattern>
</schema>
