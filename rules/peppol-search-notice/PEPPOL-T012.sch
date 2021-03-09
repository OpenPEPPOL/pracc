<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

    <pattern>
        <rule context="query:QueryResponse">
            <assert id="PEPPOL-T012-R001" flag="fatal" test="./@requestId">A Notice QueryResponse MUST have an provide a reference to the QueryRequest Identifier.</assert>
            <assert id="PEPPOL-T012-R002" flag="fatal" test="matches(normalize-space(./@requestId), '^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$')">The Request Identifier value MUST be expressed in a UUID syntax (RFC 4122).</assert>
            <assert id="PEPPOL-T012-R003" flag="fatal" test="count(rim:Slot[@name='SpecificationIdentification']) = 1">There MUST be exactly 1 SpecificationIdentification.</assert>
            <assert id="PEPPOL-T012-R004" flag="fatal" test="count(rim:Slot[@name='BusinessProcessTypeIdentifier']) = 1">There MUST be exactly 1 BusinessProcessTypeIdentifier.</assert>
            <assert id="PEPPOL-T012-R005" flag="fatal" test="count(rim:Slot[@name='IssueDateTime']) = 1">There MUST be exactly 1 IssueDateTime.</assert>
            <assert id="PEPPOL-T012-R006" flag="fatal" test="count(rim:Slot[@name='SenderElectronicAddress']) = 1">There MUST be exactly 1 SenderElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R007" flag="fatal" test="count(rim:Slot[@name='ReceiverElectronicAddress']) = 1">There MUST be exactly 1 ReceiverElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R008" flag="fatal" test="rim:RegistryObjectList">A Notice QueryResponse MUST have a Registry Object List.</assert>
        </rule>

        <rule context="
          query:QueryResponse/rim:Slot[@name='SpecificationIdentification']
        | query:QueryResponse/rim:Slot[@name='BusinessProcessTypeIdentifier']
        | query:QueryResponse/rim:Slot[@name='SenderElectronicAddress']
        | query:QueryResponse/rim:Slot[@name='ReceiverElectronicAddress']
        | query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='DocumentTypeCode']
        ">
            <assert id="PEPPOL-T012-R009" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">This SlotValue MUST have a xsi:type rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='SpecificationIdentification']">
            <assert id="PEPPOL-T012-R010" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:www.cenbii.eu:transaction:biitrdm100:ver3.0:extended:urn:fdc:peppol.eu:2021:pracc:t012:ver1.0']">SpecificationIdentification value MUST be 'urn:www.cenbii.eu:transaction:biitrdm100:ver3.0:extended:urn:fdc:peppol.eu:2021:pracc:t012:ver1.0'.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert id="PEPPOL-T012-R011" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:2020:pracc:p006:01:1.0']">BusinessProcessTypeIdentifier value MUST be 'urn:fdc:peppol.eu:2020:pracc:p006:01:1.0'.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='IssueDateTime']">
            <assert id="PEPPOL-T012-R012" flag="fatal" test="rim:SlotValue[@xsi:type='rim:DateTimeValueType']">An IssueDateTime MUST have an element SlotValue with xsi:type of rim:DateTimeValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='IssueDateTime']/rim:SlotValue/rim:Value">
            <assert id="PEPPOL-T012-R013" flag="fatal" test="./text()[matches(normalize-space(),'^([0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]))T(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))$')]">A Date MUST have timezone and a granularity of seconds.</assert>
        </rule>

        <rule context="
          query:QueryResponse/rim:Slot[@name='SenderElectronicAddress']
        | query:QueryResponse/rim:Slot[@name='ReceiverElectronicAddress']
        | query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerElectronicAddress']
        ">
            <assert id="PEPPOL-T012-R014" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A SenderElectronicAddress MUST have a scheme identifier attribute from the list of "PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject">
            <assert id="PEPPOL-T012-R015" flag="fatal" test="normalize-space(./@lid) != ''">The Registry Object List MUST have an attribute lid.</assert>
            <assert id="PEPPOL-T012-R016" flag="fatal" test="@xsi:type='rim:ExtrinsicObjectType'">An EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R017" flag="fatal" test="rim:Slot[@name='BuyerElectronicAddress']">A Notice QueryResponse MUST identify the Receiver by its party identifier and its BuyerElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R018" flag="fatal" test="rim:Slot[@name='DocumentTypeCode']">A Registry Object MUST have a Document Type Code.</assert>
            <assert id="PEPPOL-T012-R019" flag="fatal" test="rim:RepositoryItemRef">A Registry Object MUST have a Repository Item Reference.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerElectronicAddress']">
            <assert id="PEPPOL-T012-R020" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A BuyerElectronicAddress MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='DocumentTypeCode']">
            <assert id="PEPPOL-T011-R021" flag="fatal" test="@type = 'http://docs.peppol.eu/document-type-code'">The @type for rim:Slot "DocumentTypeCode" MUST be: list to be created</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:RepositoryItemRef">
            <assert id="PEPPOL-T011-R022" flag="fatal" test="matches(normalize-space(./@xlink:href), '.*[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}.*')">The xlink:href MUST be expressed in a UUID syntax (RFC 4122).</assert>
        </rule>

        <!--Gobal Rules (only matches if no other does)-->

        <rule context="*/rim:Value">
            <assert id="PEPPOL-T012-R023" flag="fatal" test="./text()[normalize-space() != '']">Value MUST have a text.</assert>
        </rule>

        <rule context="*/rim:SlotValue[@xsi:type!='rim:CollectionValueType']">
            <assert id="PEPPOL-T012-R024" flag="fatal" test="count(rim:Value) > 0">A Value for each SlotValue MUST be given.</assert>
        </rule>

    </pattern>
</schema>
