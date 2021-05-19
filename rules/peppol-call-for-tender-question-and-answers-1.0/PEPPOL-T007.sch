<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for tendering questions</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Enquiry-2" />

    <pattern>
        <rule context="*">
            <assert id="PEPPOL-T007-S001" flag="fatal" test="not(normalize-space(.) = '' and not(*))">A tendering questions document MUST NOT contain empty elements.</assert>
        </rule>
    </pattern>

    <pattern>
        <let name="syntaxError" value="string('A tendering questions document SHOULD only contain elements and attributes described in the syntax mapping. - ')" />
        <rule context="ubl:Enquiry">
            <assert id="PEPPOL-T007-R001" flag="fatal" test="(cbc:UBLVersionID)">A tendering questions MUST have a syntax identifier.</assert>
            <assert id="PEPPOL-T007-R002" flag="fatal" test="(cbc:CustomizationID)">A tendering questions MUST have a specification (customization) identifier.</assert>
            <assert id="PEPPOL-T007-R003" flag="fatal" test="(cbc:ProfileID)">A tendering questions MUST have a business process (profile) identifier.</assert>
            <assert id="PEPPOL-T007-R004" flag="fatal" test="(cbc:ID)">A tendering questions MUST have an identifier.</assert>
            <assert id="PEPPOL-T007-R005" flag="fatal" test="(cbc:IssueTime)">A tendering questions MUST have an issue time.</assert>
            <assert id="PEPPOL-T007-R006" flag="fatal" test="cac:AdditionalDocumentReference[1]/cbc:ID[@schemeName='ContractFolderID']/text()">A tendering questions MUST have an AdditionalDocumentReference containing an cbc:ID with an schemeName set to 'ContractFolderID' as the first element of AdditionalDocumentReference</assert>
            <assert id="PEPPOL-T007-R007" flag="fatal" test="count(cac:AdditionalDocumentReference/cbc:ID[@schemeName='ContractFolderID']) = 1">A tendering questions MUST have only one AdditionalDocumentReference containing an cbc:ID with an schemeName set to 'ContractFolderID'</assert>
            <assert id="PEPPOL-T007-R008" flag="fatal" test="count(cac:AdditionalDocumentReference) >= 1">A tendering questions MUST have at least one AdditionalDocumentReference</assert>
            <assert id="PEPPOL-T007-R009" flag="fatal" test="count(cac:Attachment/cac:ExternalReference/cbc:Description) >= 1">A tendering questions MUST have a request (Description).</assert>

            <!-- disallowed elements from ubl:Enquiry -->
            <assert id="PEPPOL-T007-S002" flag="warning" test="not(cbc:Description)"><value-of select="$syntaxError" />Description SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T007-S003" flag="warning" test="not(cbc:LatestReplyDate)"><value-of select="$syntaxError" />LatestReplyDate SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T007-S004" flag="warning" test="not(cbc:LatestReplyTime)"><value-of select="$syntaxError" />LatestReplyTime SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T007-S005" flag="warning" test="not(cbc:CopyIndicator)"><value-of select="$syntaxError" />CopyIndicator SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T007-S006" flag="warning" test="not(cbc:UUID)"><value-of select="$syntaxError" />UUID SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T007-S007" flag="warning" test="not(cbc:Signature)"><value-of select="$syntaxError" />Signature SHOULD NOT be used.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:UBLVersionID">
            <assert id="PEPPOL-T007-R010" flag="fatal" test="normalize-space(.) = '2.2'">UBLVersionID value MUST be '2.2'</assert>
            <assert id="PEPPOL-T007-S008" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />UBLVersionID SHOULD NOT contain any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:CustomizationID">
            <assert id="PEPPOL-T007-R011" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:trns:t007:1.0'">CustomizationID value MUST be 'urn:fdc:peppol.eu:prac:trns:t007:1.0'</assert>
            <assert id="PEPPOL-T007-S009" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />CustomizationID SHOULD NOT have any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:ProfileID">
            <assert id="PEPPOL-T007-R012" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:bis:p004:1.0'">ProfileID value MUST be 'urn:fdc:peppol.eu:prac:bis:p004:1.0'</assert>
            <assert id="PEPPOL-T007-S010" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />ProfileID SHOULD NOT have any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:ID">
            <assert id="PEPPOL-T007-R013" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">A tendering questions Identifier MUST be expressed in a UUID syntax (RFC 4122)</assert>
            <assert id="PEPPOL-T007-R014" flag="fatal" test="./@schemeURI">A tendering questions Identifier MUST have a schemeURI attribute.</assert>
            <assert id="PEPPOL-T007-R015" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">schemeURI for tender clarification Identifier MUST be 'urn:uuid'.</assert>

            <assert id="PEPPOL-T007-S011" flag="warning" test="not(./@*[not(name()='schemeURI')])"><value-of select="$syntaxError" />ID SHOULD NOT have any further attributes but schemeURI</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:IssueTime">
            <assert id="PEPPOL-T007-R016" flag="fatal" test="count(timezone-from-time(.)) &gt; 0">IssueTime MUST include timezone information.</assert>
            <assert id="PEPPOL-T007-R017" flag="fatal" test="matches(normalize-space(.),'^(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?$')">IssueTime MUST have a granularity of seconds</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty">
            <assert id="PEPPOL-T007-R018" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">A tendering questions MUST identify the Economic Operator by its party identifier and its endpoint identifier.</assert>
            <assert id="PEPPOL-T007-R019" flag="warning" test="(./cac:PartyName)">A tendering questions SHOULD include the name of the Economic Operator.</assert>

            <assert id="PEPPOL-T007-S012" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>
            <assert id="PEPPOL-T007-S013" flag="warning" test="not(count(./cac:PartyName) > 1)"><value-of select="$syntaxError" />PartyName SHOULD NOT be used more than once</assert>
            <assert id="PEPPOL-T007-S014" flag="warning" test="not(count(./cac:PartyIdentification) > 1)"><value-of select="$syntaxError" />PartyIdentification SHOULD NOT be used more than once</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cbc:EndpointID">
            <assert id="PEPPOL-T007-R020" flag="fatal" test="./@schemeID">A Requestor Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T007-R021" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T007-S015" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />EndpointID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T007-R022" flag="fatal" test="./@schemeID">A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T007-R023" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T007-S016" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty">
            <assert id="PEPPOL-T007-R024" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">A tendering questions MUST identify the contracting body by its party identifier and its endpoint identifier.</assert>
            <assert id="PEPPOL-T007-S017" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>

            <assert id="PEPPOL-T007-S018" flag="warning" test="not(count(./cac:PartyName) > 1)"><value-of select="$syntaxError" />PartyName SHOULD NOT be used more than once</assert>
            <assert id="PEPPOL-T007-S019" flag="warning" test="not(count(./cac:PartyIdentification) > 1)"><value-of select="$syntaxError" />PartyIdentification SHOULD NOT be used more than once</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty/cbc:EndpointID">
            <assert id="PEPPOL-T007-R025" flag="fatal" test="./@schemeID">A Responder Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T007-R026" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T007-S020" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />EndpointID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T007-R027" flag="fatal" test="./@schemeID">A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T007-R028" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T007-S021" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:AdditionalDocumentReference[position() != 1]">
            <assert id="PEPPOL-T007-R029" flag="fatal" test="count(cbc:XPath) > 0">At least one XPath MUST be given.</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:AdditionalDocumentReference/cbc:XPath">
            <assert id="PEPPOL-T007-R030" flag="fatal" test="matches(./text(), '^/Enquiry/([a-zA-Z]+:)?Attachment\[\d?\]')">Only references to an attachment are allowed.</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:Attachment/cac:ExternalReference">
            <assert id="PEPPOL-T007-R031" flag="fatal" test="count(./cbc:Description) = 1">One question MUST be given.</assert>
        </rule>
    </pattern>
</schema>
