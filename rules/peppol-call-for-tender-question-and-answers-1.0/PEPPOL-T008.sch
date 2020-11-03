<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for Tendering Questions</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Enquiry-2" />

    <pattern>
        <rule context="*">
            <report id="PEPPOL-T008-S001" flag="fatal" test="normalize-space(.) = '' and not(*)">[PEPPOL-T008-S001] A Tendering Question document MUST NOT contain empty elements.</report>
        </rule>
    </pattern>

    <pattern>
        <let name="syntaxError" value="string('[PEPPOL-T008-S002] A Tendering Question document SHOULD only contain elements and attributes described in the syntax mapping. - ')" />
        <rule context="ubl:Enquiry">
            <assert id="PEPPOL-T008-R001" flag="fatal" test="(cbc:UBLVersionID)">[PEPPOL-T008-R001] A Tendering Question MUST have a syntax identifier.</assert>
            <assert id="PEPPOL-T008-R003" flag="fatal" test="(cbc:CustomizationID)">[PEPPOL-T008-R003] A Tendering Question MUST have a specification (customization) identifier.</assert>
            <assert id="PEPPOL-T008-R005" flag="fatal" test="(cbc:ProfileID)">[PEPPOL-T008-R005] A Tendering Question MUST have a business process (profile) identifier.</assert>
            <assert id="PEPPOL-T008-R007" flag="fatal" test="(cbc:ID)">[PEPPOL-T008-R007] A Tendering Question MUST have a Tendering Question identifier.</assert>
            <assert id="PEPPOL-T008-R010" flag="fatal" test="(cbc:IssueTime)">[PEPPOL-T008-R010] A Tendering Question MUST have an issue time.</assert>
            <assert id="PEPPOL-T008-R013" flag="fatal" test="count(cbc:Description) > 0">[PEPPOL-T008-R013] A Tendering Question MUST have a Tendering request.</assert>

            <!-- disallowed elements from ubl:Enquiry -->
            <report id="PEPPOL-T008-S301" flag="warning" test="(cbc:LatestReplyDate)"><value-of select="$syntaxError" />[PEPPOL-T008-S301] LatestReplyDate SHOULD NOT be used.</report>
            <report id="PEPPOL-T008-S302" flag="warning" test="(cbc:LatestReplyTime)"><value-of select="$syntaxError" />[PEPPOL-T008-S302] LatestReplyTime SHOULD NOT be used.</report>
            <report id="PEPPOL-T008-S303" flag="warning" test="(cbc:CopyIndicator)"><value-of select="$syntaxError" />[PEPPOL-T008-S303] CopyIndicator SHOULD NOT be used.</report>
            <report id="PEPPOL-T008-S304" flag="warning" test="(cbc:UUID)"><value-of select="$syntaxError" />[PEPPOL-T008-S304] UUID SHOULD NOT be used.</report>
            <report id="PEPPOL-T008-S305" flag="warning" test="(cbc:Signature)"><value-of select="$syntaxError" />[PEPPOL-T008-S305] Signature SHOULD NOT be used.</report>
        </rule>

        <rule context="ubl:Enquiry/cbc:UBLVersionID">
            <assert id="PEPPOL-T008-R002" flag="fatal" test="normalize-space(.) = '2.3'">[PEPPOL-T008-R002] UBLVersionID value MUST be '2.3'</assert>
            <report id="PEPPOL-T008-S306" flag="warning" test="./@*"><value-of select="$syntaxError" />[PEPPOL-T008-S306] UBLVersionID SHOULD NOT contain any attributes.</report>
        </rule>

        <rule context="ubl:Enquiry/cbc:CustomizationID">
            <assert id="PEPPOL-T008-R004" flag="fatal" test="normalize-space(.) = 'urn:www.cenbii.eu:transaction:biitrdm084:ver3.0:extended:urn:fdc:peppol.eu:2020:pracc:t007:ver1.0'">[PEPPOL-T008-R004] CustomizationID value MUST be 'urn:www.cenbii.eu:transaction:biitrdm084:ver3.0:extended:urn:fdc:peppol.eu:2020:pracc:t007:ver1.0'</assert>
            <report id="PEPPOL-T008-S307" flag="warning" test="./@*"><value-of select="$syntaxError" />[PEPPOL-T008-S307] CustomizationID SHOULD NOT have any attributes.</report>
        </rule>

        <rule context="ubl:Enquiry/cbc:ProfileID">
            <assert id="PEPPOL-T008-R006" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:2020:pracc:p004:01:1.0'">[PEPPOL-T008-R006] ProfileID value MUST be 'urn:fdc:peppol.eu:2020:pracc:p004:01:1.0'</assert>
            <report id="PEPPOL-T008-S308" flag="warning" test="./@*"><value-of select="$syntaxError" />[PEPPOL-T008-S308] ProfileID SHOULD NOT have any attributes.</report>
        </rule>

        <rule context="ubl:Enquiry/cbc:ID">
            <assert id="PEPPOL-T008-R008" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">[PEPPOL-T008-R008] A Tendering Question Identifier MUST be expressed in a UUID syntax (RFC 4122)</assert>
            <assert id="PEPPOL-T008-R009" flag="fatal" test="./@schemeURI">[PEPPOL-T008-R009] A Tendering Question Identifier MUST have a schemeURI attribute.</assert>
            <report id="PEPPOL-T008-S309" flag="warning" test="./@*[not(name()='schemeURI')]"><value-of select="$syntaxError" />[PEPPOL-T008-S309] ID SHOULD NOT have any further attributes but schemeURI</report>
        </rule>

        <rule context="ubl:Enquiry/cbc:IssueTime">
            <assert id="PEPPOL-T008-R011" flag="fatal" test="count(timezone-from-time(.)) &gt; 0">[PEPPOL-T008-R011] IssueTime MUST include timezone information.</assert>
            <assert id="PEPPOL-T008-R012" flag="fatal" test="matches(normalize-space(.),'^(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?$')">[PEPPOL-T008-R012] IssueTime MUST have a granularity of seconds</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty">
            <assert id="PEPPOL-T008-R014" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">[PEPPOL-T008-R014] A Tendering Question MUST identify the Economic Operator by its party identifier and its endpoint identifier.</assert>
            <assert id="PEPPOL-T008-R019" flag="warning" test="(./cac:PartyName)">[PEPPOL-T008-R019] A Tendering Question SHOULD include the name of the Economic Operator.</assert>

            <assert id="PEPPOL-T008-S310" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />[PEPPOL-T008-S310] Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>
            <report id="PEPPOL-T008-S311" flag="warning" test="count(./cac:PartyName) &gt; 1"><value-of select="$syntaxError" />[PEPPOL-T008-S311] PartyName SHOULD NOT be used more than once</report>
            <report id="PEPPOL-T008-S312" flag="warning" test="count(./cac:PartyIdentification) &gt; 1"><value-of select="$syntaxError" />[PEPPOL-T008-S312] PartyIdentification SHOULD NOT be used more than once</report>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cbc:EndpointID">
            <assert id="PEPPOL-T008-R015" flag="fatal" test="./@schemeID">[PEPPOL-T008-R015] A Requestor Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T008-R016" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">[PEPPOL-T008-R016] An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <report id="PEPPOL-T008-S313" flag="warning" test="./@*[not(name()='schemeID')]"><value-of select="$syntaxError" />[PEPPOL-T008-S313] EndpointID SHOULD NOT have any attributes but schemeID</report>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T008-R017" flag="fatal" test="./@schemeID">[PEPPOL-T008-R017] A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T008-R018" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">[PEPPOL-T008-R018] A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <report id="PEPPOL-T008-S314" flag="warning" test="./@*[not(name()='schemeID')]"><value-of select="$syntaxError" />[PEPPOL-T008-S314] cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</report>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty">
            <assert id="PEPPOL-T008-R020" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">[PEPPOL-T008-R020] A Tendering Question MUST identify the contracting body by its party identifier and its endpoint identifier.</assert>
            <assert id="PEPPOL-T008-S315" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />[PEPPOL-T008-S315] Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>

            <report id="PEPPOL-T008-S316" flag="warning" test="count(./cac:PartyName) &gt; 1"><value-of select="$syntaxError" />[PEPPOL-T008-S316] PartyName SHOULD NOT be used more than once</report>
            <report id="PEPPOL-T008-S317" flag="warning" test="count(./cac:PartyIdentification) &gt; 1"><value-of select="$syntaxError" />[PEPPOL-T008-S317] PartyIdentification SHOULD NOT be used more than once</report>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty/cbc:EndpointID">
            <assert id="PEPPOL-T008-R021" flag="fatal" test="./@schemeID">[PEPPOL-T008-R021] A Responder Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T008-R022" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">[PEPPOL-T008-R022] An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <report id="PEPPOL-T008-S318" flag="warning" test="./@*[not(name()='schemeID')]"><value-of select="$syntaxError" />[PEPPOL-T008-S318] EndpointID SHOULD NOT have any attributes but schemeID</report>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T008-R023" flag="fatal" test="./@schemeID">[PEPPOL-T008-R023] A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T008-R024" flag="fatal" test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">[PEPPOL-T008-R024] A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <report id="PEPPOL-T008-S319" flag="warning" test="./@*[not(name()='schemeID')]"><value-of select="$syntaxError" />[PEPPOL-T008-S319] cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</report>
        </rule>

    </pattern>
</schema>
