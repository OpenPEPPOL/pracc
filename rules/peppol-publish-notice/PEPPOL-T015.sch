<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for publish notice</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="lcm" uri="urn:oasis:names:tc:ebxml-regrep:xsd:lcm:4.0"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

    <pattern>
        <rule context="lcm:SubmitObjectsRequest">
            <assert id="PEPPOL-T015-R001" flag="fatal" test="matches(normalize-space(./@id), '^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$')">LCM Identifier value MUST be expressed in a UUID syntax (RFC 4122).</assert>
            <assert id="PEPPOL-T015-R012" flag="fatal" test="matches(normalize-space(./@mode), 'CreateOrVersion')">A Notice SubmitObjectsRequest MUST have mode definition with the value "CreateOrVersion".</assert>
            <assert id="PEPPOL-T015-R002" flag="fatal" test="count(rim:Slot[@name='SpecificationIdentification']) = 1">A Notice SubmitObjectsRequest MUST have an identifier.</assert>
            <assert id="PEPPOL-T015-R003" flag="fatal" test="count(rim:Slot[@name='BusinessProcessTypeIdentifier']) = 1">There MUST be exactly 1 BusinessProcessTypeIdentifier.</assert>
            <assert id="PEPPOL-T015-R004" flag="fatal" test="count(rim:Slot[@name='IssueDateTime']) = 1">There MUST be exactly 1 IssueDateTime.</assert>
            <assert id="PEPPOL-T015-R005" flag="fatal" test="count(rim:Slot[@name='SenderElectronicAddress']) = 1">There MUST be exactly 1 SenderElectronicAddress.</assert>
            <assert id="PEPPOL-T015-R006" flag="fatal" test="count(rim:Slot[@name='ReceiverElectronicAddress']) = 1">There MUST be exactly 1 ReceiverElectronicAddress.</assert>
            <assert id="PEPPOL-T015-R020" flag="fatal" test="count(rim:Slot[@name='PublicationRequested']) = 1">There MUST be exactly 1 PublicationRequested.</assert>
            <assert id="PEPPOL-T015-R007" flag="fatal" test="rim:RegistryObjectList">A Publish Notice MUST have a RegistryObjectList.</assert>
        </rule>

        <rule context="
          lcm:SubmitObjectsRequest/rim:Slot[@name='SpecificationIdentification']
        | lcm:SubmitObjectsRequest/rim:Slot[@name='BusinessProcessTypeIdentifier']
        | lcm:SubmitObjectsRequest/rim:Slot[@name='SenderElectronicAddress']
        | lcm:SubmitObjectsRequest/rim:Slot[@name='ReceiverElectronicAddress']
        | lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='UBLDocumentSchema']
        | lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='AdditionalDocumentInformation']
        | lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='BuyerPartyIdentification']
        | lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='BuyerElectronicAddress']
        ">
            <assert id="PEPPOL-T015-R008" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">This SlotValue MUST have a xsi:type rim:StringValueType.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:Slot[@name='SpecificationIdentification']">
            <assert id="PEPPOL-T015-R009" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:prac:trns:t015:1.0']">SpecificationIdentification value MUST be 'urn:fdc:peppol.eu:prac:trns:t015:1.0'.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert id="PEPPOL-T015-R010" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:prac:bis:p008:1.0']">BusinessProcessTypeIdentifier value MUST be 'urn:fdc:peppol.eu:prac:bis:p008:1.0'.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:Slot[@name='SenderElectronicAddress'] | lcm:SubmitObjectsRequest/rim:Slot[@name='ReceiverElectronicAddress']">
            <assert id="PEPPOL-T015-R011" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A SenderElectronicAddress MUST have a scheme identifier attribute from the list of "PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:Slot[@name='PublicationRequested']">
            <assert id="PEPPOL-T015-R021" flag="fatal" test="rim:SlotValue[@xsi:type='rim:BooleanValueType']">PublicationRequested MUST have an element SlotValue with xsi:type of rim:BooleanValueType.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='UBLDocumentSchema']">
            <assert id="PEPPOL-T015-R016" flag="fatal" test="@type = 'http://docs.peppol.eu/document-type-code'">The UBLDocumentSchema MUST have a type of the value of "http://docs.peppol.eu/document-type-code".</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='NoticeVersion']/rim:SlotValue/rim:Value">
            <assert id="PEPPOL-T015-R013" flag="fatal" test="./text()[matches(normalize-space(), '^\d{1,2}$')]">The Notice Version MUST be consecutive numbers made of 1 or 2 digits.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='BuyerPartyIdentification']">
            <assert id="PEPPOL-T015-R017" flag="fatal" test="@type = 'https://docs.peppol.eu/poacc/billing/3.0/codelist/ICD/'">The DocumentTypeCode MUST have a type of the value of "https://docs.peppol.eu/poacc/billing/3.0/codelist/ICD/".</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='BuyerElectronicAddress']">
            <assert id="PEPPOL-T015-R014" flag="fatal" test="@type = 'https://docs.peppol.eu/poacc/billing/3.0/codelist/ICD/'">The DocumentTypeCode MUST have a type of the value of "https://docs.peppol.eu/poacc/billing/3.0/codelist/ICD/".</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']">
            <assert id="PEPPOL-T015-R018" flag="fatal" test="count(rim:Slot) > 0">At least one element for Buyer Information MUST be given.</assert>
            <assert id="PEPPOL-T015-R019" flag="fatal" test="count(rim:Slot) &lt; 4">There MUST NOT be more than 3 elements for Buyer Information.</assert>
            <assert id="PEPPOL-T015-R023" flag="fatal" test="count(rim:Slot[@name='BuyerPartyIdentification']) &lt; 2">The rim:Slot name "BuyerPartyIdentification" can only be used once.</assert>
            <assert id="PEPPOL-T015-R024" flag="fatal" test="count(rim:Slot[@name='BuyerElectronicAddress']) &lt; 2">The rim:Slot name "BuyerElectronicAddress" can only be used once.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerInformation']/rim:Slot">
            <assert id="PEPPOL-T015-R025" flag="fatal" test="@name = 'BuyerPartyIdentification' or @name = 'BuyerElectronicAddress'">The name of the slots under Buyer Information MUST be either "BuyerPartyIdentification" or "BuyerElectronicAddress".</assert>
        </rule>

        <rule context="
            lcm:SubmitObjectsRequest/rim:Slot[@name='IssueDateTime']/rim:SlotValue">
            <assert id="PEPPOL-T015-R033" flag="fatal" test="@xsi:type='rim:DateTimeValueType'">A Date MUST have an element SlotValue with xsi:type of rim:DateTimeValue.</assert>
        </rule>

        <rule context="
            lcm:SubmitObjectsRequest/rim:Slot[@name='IssueDateTime']/rim:SlotValue">
            <assert id="PEPPOL-T015-R034" flag="fatal" test="./text()[matches(normalize-space(),'^([0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]))T(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))$')]">A Date MUST have timezone and a granularity of seconds.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='NoticeVersion']">
            <assert id="PEPPOL-T015-R036" flag="fatal" test="rim:SlotValue[@xsi:type='rim:IntegerValueType']">NoticeVersion MUST have an element SlotValue with xsi:type of rim:IntegerValueType.</assert>
        </rule>

        <rule context="lcm:SubmitObjectsRequest/rim:RegistryObjectList/rim:RegistryObject/rim:RepositoryItemRef">
            <assert id="PEPPOL-T015-R015" flag="fatal" test="matches(normalize-space(./@xlink:href), '^\./[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}\.eform\.xml$')">The xlink:href MUST be expressed in a UUID syntax (RFC 4122). The file referenced by the xlink:href MUST be present in the ASiC-E Container. </assert>
        </rule>

        <!--Gobal Rules (only matches if no other does)-->

          <rule context="*/rim:Value">
              <assert id="PEPPOL-T015-R037" flag="fatal" test="./text()[normalize-space() != '']">Value MUST have a text.</assert>
          </rule>

          <rule context="*/rim:SlotValue[@xsi:type!='rim:CollectionValueType']">
              <assert id="PEPPOL-T015-R038" flag="fatal" test="count(rim:Value) > 0">A Value for each SlotValue MUST be given.</assert>
          </rule>

          <rule context="*/rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element">
              <assert id="PEPPOL-T015-R039" flag="fatal" test="@xsi:type='rim:StringValueType'">rim:Element be of type rim:StringValueType.</assert>
              <assert id="PEPPOL-T015-R040" flag="fatal" test="count(rim:Value) > 0">At least one element MUST be given in a CollectionValueType.</assert>
          </rule>

      </pattern>

</schema>
