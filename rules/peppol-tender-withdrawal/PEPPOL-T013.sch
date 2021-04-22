<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

    <title>eSENS business and syntax rules for Tender Withdrawal (TRDM089)</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:TenderWithdrawal-2"/>

    <pattern>
        <rule context="*">
            <report id="eSENS-T45-S002" flag="fatal" test="normalize-space(.) = '' and not(*)">A Tender Withdrawal
                document MUST NOT contain empty elements.
            </report>
        </rule>
    </pattern>

    <pattern>
        <let name="syntaxError"
             value="string('[eSENS-T45-S003] A Tender Withdrawal document SHOULD only contain elements and attributes described in the syntax mapping. - ')"/>

        <rule context="ubl:TenderWithdrawal">
            <assert id="eSENS-T013-R001" flag="fatal" test="(cbc:UBLVersionID)">[eSENS-T013-R001] A Tender Withdrawal
                MUST have a syntax identifier.
            </assert>
            <report id="eSENS-T013-S301" flag="warning" test="(ext:UBLExtensions)">
                <value-of select="$syntaxError"/>
                [eSENS-T013-S301] UBLExtensions SHOULD NOT be used.
            </report>
            <report id="eSENS-T013-S305" flag="warning" test="(cbc:ProfileExectuionID)"><value-of
                    select="$syntaxError"/>[eSENS-T013-S305] ProfileExecutionID SHOULD NOT be used.
            </report>
            <report id="eSENS-T013-S307" flag="warning" test="(cbc:CopyIndicator)">
                <value-of select="$syntaxError"/>
                [eSENS-T013-S307] CopyIndicator SHOULD NOT be used.
            </report>
            <report id="eSENS-T013-S308" flag="warning" test="(cbc:UUID)">
                <value-of select="$syntaxError"/>
                [eSENS-T013-S308] UUID SHOULD NOT be used.
            </report>
            <report id="eSENS-T013-S310" flag="warning" test="count (cbc:ConctractName) &gt; 1"><value-of
                    select="$syntaxError"/>[eSENS-T013-S310] ContractName SHOULD NOT be used more than once.
            </report>
            <report id="eSENS-T013-S312" flag="warning" test="(cbc:Note)">
                <value-of select="$syntaxError"/>
                [eSENS-T013-S312] Note SHOULD NOT be used.
            </report>
            <report id="eSENS-T013-S313" flag="warning" test="count (cac:TenderDocumentReference) &gt; 1"><value-of
                    select="$syntaxError"/>[eSENS-T013-S313] TenderDocumentReference SHOULD NOT be used more than once.
            </report>
            <report id="eSENS-T013-S322" flag="warning" test="(cac:Signature)">
                <value-of select="$syntaxError"/>
                [eSENS-T013-S322] Signature SHOULD NOT be used.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:UBLVersionID">
            <assert id="eSENS-T013-R019" flag="fatal" test="normalize-space(.) = '2.2'">[eSENS-T013-R019] UBLVersionID
                value MUST be '2.2'
            </assert>
            <report id="eSENS-T013-S302" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S302]
                UBLVersionID SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:CustomizationID">
            <assert id="eSENS-T013-R002" flag="fatal"
                    test="normalize-space(.) = 'urn:fdc:peppol.eu:2021:pracc:t013:ver1.0'">
                [eSENS-T013-R002] CustomizationID value MUST be
                'urn:fdc:peppol.eu:2021:pracc:t013:ver1.0'
            </assert>
            <report id="eSENS-T013-S303" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S303]
                CustomizationID SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:ProfileID">
            <assert id="eSENS-T013-R003" flag="fatal"
                    test="normalize-space(.) = 'urn:fdc:peppol.eu:2021:pracc:p007:01:1.0'">[eSENS-T013-R003] ProfileID
                value MUST be 'urn:fdc:peppol.eu:2021:pracc:p007:01:1.0'
            </assert>
            <report id="eSENS-T013-S304" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S304]
                ProfileID SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:ID">
            <assert id="eSENS-T013-R004" flag="fatal" test="./@schemeURI">[eSENS-T013-R004] A Tender Withdrawal
                Identifier MUST have a schemeURI attribute.
            </assert>
            <assert id="eSENS-T013-R005" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">[eSENS-T013-R005]
                schemeURI for Tender Withdrawal Identifier MUST be 'urn:uuid'.
            </assert>
            <report id="eSENS-T013-S306" flag="warning" test="./@*[not(name()='schemeURI')]"><value-of
                    select="$syntaxError"/>[eSENS-T013-S306] A Tender Withdrawal Identifier SHOULD NOT have
                any attributes but schemeURI
            </report>
            <assert id="eSENS-T013-R006" flag="fatal"
                    test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">
                [eSENS-T013-R006] A Tender Withdrawal Identifier MUST be expressed in a UUID syntax (RFC 4122)
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:ContractFolderID">
            <report id="eSENS-T013-S309" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S309]
                ContractFolderID SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:IssueTime">
            <assert id="eSENS-T013-R007" flag="fatal"
                    test="matches(normalize-space(.),'^(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?$')">
                [eSENS-T013-R007] IssueTime MUST have a granularity of seconds
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cbc:WithdrawOfferIndicator">
            <report id="eSENS-T013-S311" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S310]
                WithdrawOfferIndicator SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference">
            <assert id="eSENS-T013-S314" flag="warning"
                    test="count(./*) - count(./cbc:ID) - count(./cbc:DocumentTypeCode) - count(./cac:Attachment) - count(./cac:IssuerParty) = 0">
                [eSENS-T013-S314] TenderDocumentReference SHOULD NOT contain any
                elements but ID, DocumentTypeCode, Attachment, IssuerParty.
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference/cbc:ID">
            <assert id="eSENS-T013-R013" flag="fatal"
                    test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">
                [eSENS-T013-R013] The document reference Identifier MUST reference the Tender ID expressed in a UUID
                syntax (RFC 4122)
            </assert>
            <assert id="eSENS-T013-R014" flag="fatal" test="./@schemeURI">[eSENS-T014-R004] A Tender Document Reference
                Identifier MUST have a schemeURI attribute.
            </assert>
            <assert id="eSENS-T013-R015" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">[eSENS-T014-R005]
                schemeURI for Tender Document Reference Identifier MUST be 'urn:uuid'.
            </assert>
            <report id="eSENS-T013-S315" flag="warning" test="./@*[not(name()='schemeURI')]"><value-of
                    select="$syntaxError"/>[eSENS-T014-S306] A Tender Document Reference Identifier SHOULD NOT have
                any attributes but schemeURI
            </report>
            <assert id="eSENS-T013-R016" flag="fatal"
                    test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">
                [eSENS-T014-R006] A Tender Document Reference Identifier MUST be expressed in a UUID syntax (RFC 4122)
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference/cac:Attachment">
            <assert id="eSENS-T013-S316" flag="warning" test="count(./*)-count(./cac:ExternalReference)=0"><value-of
                    select="$syntaxError"/>[eSENS-T013-S316] Attachment SHOULD NOT contain any elements but
                ExternalReference
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference/cac:Attachment/cac:ExternalReference">
            <assert id="eSENS-T013-S317" flag="warning"
                    test="count(./*)-count(./cbc:DocumentHash)-count(./cbc:HashAlgorithmMethod)=0"><value-of
                    select="$syntaxError"/>[eSENS-T013-S317] Attachment/ExternalReference SHOULD NOT contain any
                elements but DocumentHash, HashAlgorithmMethod
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash">
            <assert id="eSENS-T013-R018" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{64}$')">
                [eSENS-T013-R015] DocumentHash MUST resemble a SHA-256 hash value (32 byte HexString)
            </assert>
            <report id="eSENS-T013-S318" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S318]
                DocumentHash SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderDocumentReference/cac:Attachment/cac:ExternalReference/cbc:HashAlgorithmMethod">
            <assert id="eSENS-T013-R023" flag="fatal"
                    test="normalize-space(.)='http://www.w3.org/2001/04/xmlenc#sha256'">[eSENS-T013-R023]
                HashAlgorithmMethod MUST be 'http://www.w3.org/2001/04/xmlenc#sha256'
            </assert>
            <report id="eSENS-T013-S319" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S319]
                HashAlgorithmMethod SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TenderNotificationDocumentReference/cbc:ID">
            <assert id="eSENS-T013-R020" flag="fatal"
                    test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">
                [eSENS-T013-R013] The tender notification document reference Identifier MUST reference the Tender ID
                expressed in
                a UUID
                syntax (RFC 4122)
            </assert>
            <assert id="eSENS-T013-R024" flag="fatal" test="./@schemeURI">[eSENS-T013-R024] A Tender Notification
                Document Reference MUST have a schemeURI attribute.
            </assert>
            <assert id="eSENS-T013-R025" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">[eSENS-T013-R025]
                schemeURI for Tender Notification Document Reference MUST be 'urn:uuid'.
            </assert>
            <report id="eSENS-T013-S320" flag="warning" test="./@*[not(name()='schemeURI')]"><value-of
                    select="$syntaxError"/>[eSENS-T013-S320] A Tender Notification Document Reference SHOULD NOT have
                any attributes but schemeURI
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:ContractingParty/cac:Party">
            <assert id="eSENS-T013-R021" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">
                [eSENS-T013-R017] A Tender Withdrawal MUST identify the Contracting Party by its party and
                endpoint identifiers.
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:TendererParty">
            <assert id="eSENS-T013-R022" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">
                [eSENS-T013-R017] A Tender Withdrawal MUST identify the Tenderer Party by its party and
                endpoint identifiers.
            </assert>
        </rule>

        <rule context="cbc:EndpointID">
            <assert id="eSENS-T013-R010" flag="fatal" test="./@schemeID">[eSENS-T013-R010] An Endpoint Identifier MUST
                have a scheme identifier attribute.
            </assert>
            <assert id="eSENS-T013-R011" flag="fatal"
                    test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">
                [eSENS-T013-R011] An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers
                described in the "PEPPOL Policy for using Identifiers".
            </assert>
            <report id="eSENS-T013-S321" flag="warning" test="./@*[not(name()='schemeID')]"><value-of
                    select="$syntaxError"/>[eSENS-T013-S321] EndpointID SHOULD NOT have any attributes but schemeID
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:ContractingParty/cac:Party | ubl:TenderWithdrawal/cac:TendererParty">
            <assert id="eSENS-T013-S323" flag="warning"
                    test="count(./*) - count(./cac:PartyIdentification) - count(./cbc:EndpointID) - count(./cac:PartyName) = 0">
                [eSENS-T013-S323] ContractingParty or TendererParty SHOULD NOT contain any
                elements but EndpointID, PartyIdentification, PartyName
            </assert>
            <assert id="eSENS-T013-S324" flag="warning" test="count(./cac:PartyIdentification) = 1"><value-of
                    select="$syntaxError"/>[eSENS-T013-S324] PartyIdentification SHOULD be used exactly once.
            </assert>
            <report id="eSENS-T013-S326" flag="warning" test="count(./cac:PartyName) &gt; 1"><value-of
                    select="$syntaxError"/>[eSENS-T013-S326] PartyName SHOULD NOT be used more than once.
            </report>
        </rule>

        <rule context="cac:PartyIdentification/cbc:ID">
            <assert id="eSENS-T013-R008" flag="fatal" test="./@schemeID">[eSENS-T013-R008] A Party Identifier MUST have
                a scheme identifier attribute.
            </assert>
            <assert id="eSENS-T013-R009" flag="fatal"
                    test="matches(normalize-space(./@schemeID),'^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">
                [eSENS-T013-R009] A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described
                in the "PEPPOL Policy for using Identifiers".
            </assert>
            <report id="eSENS-T013-S325" flag="warning" test="./@*[not(name()='schemeID')]"><value-of
                    select="$syntaxError"/>[eSENS-T013-S325] PartyIdentifier SHOULD NOT have any further attributes but
                schemeID
            </report>
        </rule>

        <rule context="cbc:Name">
            <report id="eSENS-T013-S327" flag="warning" test="./@*"><value-of select="$syntaxError"/>[eSENS-T013-S327]
                Name SHOULD NOT contain any attributes.
            </report>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:ContractingParty/cac:Party/cac:PostalAddress">
            <assert id="eSENS-T013-S328" flag="warning"
                    test="count(./*) - count(./cac:StreetName) - count(./cbc:AdditionalStreetName) - count(./cac:CityName) - count(./cac:PostalZone) - count(./cac:CountrySubentity) - count(./cac:Country) = 0">
                [eSENS-T013-S323] PostalAddress SHOULD NOT contain any
                elements but StreetName, AdditionalStreetName, CityName, PostalZone, CountrySubentity, Country
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country">
            <assert id="eSENS-T013-S329" flag="warning"
                    test="count(./*) - count(./cac:IdentificationCode) = 0">
                [eSENS-T013-S323] Country SHOULD NOT contain any elements but IdentificationCode
            </assert>
        </rule>

        <rule context="ubl:TenderWithdrawal/cac:ContractingParty/cac:Party/cac:Contact">
            <assert id="eSENS-T013-S330" flag="warning"
                    test="count(./*) - count(./cac:Name) - count(./cac:Telephone) - count(./cac:Telefax) - count(./cac:ElectronicMail) = 0">
                [eSENS-T013-S323] Contact SHOULD NOT contain any elements but Name, Telephone, Telefax, ElectronicMail
            </assert>
        </rule>

    </pattern>
</schema>