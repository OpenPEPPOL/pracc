<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for tender clarification request</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Enquiry-2" />

    <pattern>
        <rule context="*">
            <assert id="PEPPOL-T009-S001" flag="fatal" test="not(normalize-space(.) = '' and not(*))">A tender clarification request document MUST NOT contain empty elements.</assert>
        </rule>
    </pattern>

    <pattern>
        <let name="syntaxError" value="string('A tender clarification request document SHOULD only contain elements and attributes described in the syntax mapping. - ')" />
        <rule context="ubl:Enquiry">
            <assert id="PEPPOL-T009-R001" flag="fatal" test="(cbc:UBLVersionID)">A tender clarification request MUST have a syntax identifier.</assert>
            <assert id="PEPPOL-T009-R002" flag="fatal" test="(cbc:CustomizationID)">A tender clarification request MUST have a specification (customization) identifier.</assert>
            <assert id="PEPPOL-T009-R003" flag="fatal" test="(cbc:ProfileID)">A tender clarification request MUST have a business process (profile) identifier.</assert>
            <assert id="PEPPOL-T009-R004" flag="fatal" test="(cbc:ID)">A tender clarification request MUST have an identifier.</assert>
            <assert id="PEPPOL-T009-R005" flag="fatal" test="(cbc:IssueTime)">A tender clarification request MUST have an issue time.</assert>
            <assert id="PEPPOL-T009-R006" flag="fatal" test="cac:AdditionalDocumentReference[1]/cbc:ID[@schemeName='ContractFolderID']/text()">A tender clarification request MUST have an AdditionalDocumentReference containing an cbc:ID with an schemeName set to 'ContractFolderID' as the first element of AdditionalDocumentReference</assert>
            <assert id="PEPPOL-T009-R007" flag="fatal" test="count(cac:AdditionalDocumentReference/cbc:ID[@schemeName='ContractFolderID']) = 1">A tender clarification request MUST have only one AdditionalDocumentReference containing an cbc:ID with an schemeName set to 'ContractFolderID'</assert>
            <assert id="PEPPOL-T009-R008" flag="fatal" test="count(cac:AdditionalDocumentReference) >= 1">A tender clarification request MUST have at least one AdditionalDocumentReference</assert>
            <assert id="PEPPOL-T009-R009" flag="fatal" test="count(cac:AdditionalDocumentReference/cbc:XPath) > 0">A tender clarification request MUST have at least one XPath.</assert>
            <assert id="PEPPOL-T009-R010" flag="fatal" test="count(cac:Attachment/cac:ExternalReference/cbc:Description) >= 1">A tender clarification request MUST have a request (Description).</assert>

            <!-- disallowed elements from ubl:Enquiry -->
            <assert id="PEPPOL-T009-S002" flag="warning" test="not(cbc:Description)"><value-of select="$syntaxError" />Description SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T009-S003" flag="warning" test="not(cbc:LatestReplyDate)"><value-of select="$syntaxError" />LatestReplyDate SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T009-S004" flag="warning" test="not(cbc:LatestReplyTime)"><value-of select="$syntaxError" />LatestReplyTime SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T009-S005" flag="warning" test="not(cbc:CopyIndicator)"><value-of select="$syntaxError" />CopyIndicator SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T009-S006" flag="warning" test="not(cbc:UUID)"><value-of select="$syntaxError" />UUID SHOULD NOT be used.</assert>
            <assert id="PEPPOL-T009-S007" flag="warning" test="not(cbc:Signature)"><value-of select="$syntaxError" />Signature SHOULD NOT be used.</assert>
        </rule>


        <rule context="ubl:Enquiry/cbc:UBLVersionID">
            <assert id="PEPPOL-T009-R011" flag="fatal" test="normalize-space(.) = '2.2'">UBLVersionID value MUST be '2.2'</assert>
            <assert id="PEPPOL-T009-S008" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />UBLVersionID SHOULD NOT contain any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:CustomizationID">
            <assert id="PEPPOL-T009-R012" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:trns:t009:1.1'">CustomizationID value MUST be 'urn:fdc:peppol.eu:prac:trns:t009:1.1'</assert>
            <assert id="PEPPOL-T009-S009" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />CustomizationID SHOULD NOT have any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:ProfileID">
            <assert id="PEPPOL-T009-R013" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:bis:p005:1.1'">ProfileID value MUST be 'urn:fdc:peppol.eu:prac:bis:p005:1.1'</assert>
            <assert id="PEPPOL-T009-S010" flag="warning" test="not(./@*)"><value-of select="$syntaxError" />ProfileID SHOULD NOT have any attributes.</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:ID">
            <assert id="PEPPOL-T009-R014" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">A tender clarification request Identifier MUST be expressed in a UUID syntax (RFC 4122)</assert>
            <assert id="PEPPOL-T009-R015" flag="fatal" test="./@schemeURI">A tender clarification request Identifier MUST have a schemeURI attribute.</assert>
            <assert id="PEPPOL-T009-R016" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">schemeURI for tender clarification Identifier MUST be 'urn:uuid'.</assert>

            <assert id="PEPPOL-T009-S011" flag="warning" test="not(./@*[not(name()='schemeURI')])"><value-of select="$syntaxError" />ID SHOULD NOT have any further attributes but schemeURI</assert>
        </rule>

        <rule context="ubl:Enquiry/cbc:IssueTime">
            <assert id="PEPPOL-T009-R017" flag="fatal" test="count(timezone-from-time(.)) &gt; 0">IssueTime MUST include timezone information.</assert>
            <assert id="PEPPOL-T009-R018" flag="fatal" test="matches(normalize-space(.),'^(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?$')">IssueTime MUST have a granularity of seconds</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty">
            <assert id="PEPPOL-T009-R019" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">A tender clarification request MUST identify the contracting body by its party identifier and its endpoint identifier.</assert>
            <assert id="PEPPOL-T009-R020" flag="warning" test="(./cac:PartyName)">A tender clarification request SHOULD include the name of the contracting body.</assert>

            <assert id="PEPPOL-T009-S012" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>
            <assert id="PEPPOL-T009-S013" flag="warning" test="not(count(./cac:PartyName) > 1)"><value-of select="$syntaxError" />PartyName SHOULD NOT be used more than once</assert>
            <assert id="PEPPOL-T009-S014" flag="warning" test="not(count(./cac:PartyIdentification) > 1)"><value-of select="$syntaxError" />PartyIdentification SHOULD NOT be used more than once</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cbc:EndpointID">
            <assert id="PEPPOL-T009-R021" flag="fatal" test="./@schemeID">A Requestor Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T009-R022" flag="fatal" test="matches(normalize-space(./@schemeID),'^(0002|0007|0009|0037|0060|0088|0096|0097|0106|0130|0135|0142|0151|0183|0184|0190|0191|0192|0193|0195|0196|0198|0199|0200|0201|0202|0204|0208|0209|0210|0211|0212|0213|9901|9906|9907|9910|9913|9914|9915|9918|9919|9920|9922|9923|9924|9925|9926|9927|9928|9929|9930|9931|9932|9933|9934|9935|9936|9937|9938|9939|9940|9941|9942|9943|9944|9945|9946|9947|9948|9949|9950|9951|9952|9953|9955|9957)')">An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T009-S015" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />EndpointID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T009-R023" flag="fatal" test="./@schemeID">A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T009-R024" flag="fatal" test="matches(normalize-space(./@schemeID),'^(0002|0007|0009|0037|0060|0088|0096|0097|0106|0130|0135|0142|0151|0183|0184|0190|0191|0192|0193|0195|0196|0198|0199|0200|0201|0202|0204|0208|0209|0210|0211|0212|0213|9901|9906|9907|9910|9913|9914|9915|9918|9919|9920|9922|9923|9924|9925|9926|9927|9928|9929|9930|9931|9932|9933|9934|9935|9936|9937|9938|9939|9940|9941|9942|9943|9944|9945|9946|9947|9948|9949|9950|9951|9952|9953|9955|9957)')">A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T009-S016" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty">
            <assert id="PEPPOL-T009-R025" flag="fatal" test="(./cac:PartyIdentification) and (./cbc:EndpointID)">A tender clarification request MUST identify the economic operator by its party identifier and its endpoint identifier.</assert>

            <assert id="PEPPOL-T009-S017" flag="warning" test="count(./*)-count(./cac:PartyIdentification)-count(./cbc:EndpointID)-count(./cac:PartyName)= 0"><value-of select="$syntaxError" />Party SHOULD NOT contain any elements but EndpointID, PartyIdentification, PartyName</assert>
            <assert id="PEPPOL-T009-S018" flag="warning" test="not(count(./cac:PartyName) > 1)"><value-of select="$syntaxError" />PartyName SHOULD NOT be used more than once</assert>
            <assert id="PEPPOL-T009-S019" flag="warning" test="not(count(./cac:PartyIdentification) > 1)"><value-of select="$syntaxError" />PartyIdentification SHOULD NOT be used more than once</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:ResponderParty/cbc:EndpointID">
            <assert id="PEPPOL-T009-R026" flag="fatal" test="./@schemeID">A Responder Party Endpoint Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T009-R027" flag="fatal" test="matches(normalize-space(./@schemeID),'^(0002|0007|0009|0037|0060|0088|0096|0097|0106|0130|0135|0142|0151|0183|0184|0190|0191|0192|0193|0195|0196|0198|0199|0200|0201|0202|0204|0208|0209|0210|0211|0212|0213|9901|9906|9907|9910|9913|9914|9915|9918|9919|9920|9922|9923|9924|9925|9926|9927|9928|9929|9930|9931|9932|9933|9934|9935|9936|9937|9938|9939|9940|9941|9942|9943|9944|9945|9946|9947|9948|9949|9950|9951|9952|9953|9955|9957)')">An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T009-S020" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />EndpointID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:RequestorParty/cac:PartyIdentification/cbc:ID">
            <assert id="PEPPOL-T009-R028" flag="fatal" test="./@schemeID">A Party Identifier MUST have a scheme identifier attribute.</assert>
            <assert id="PEPPOL-T009-R029" flag="fatal" test="matches(normalize-space(./@schemeID),'^(0002|0007|0009|0037|0060|0088|0096|0097|0106|0130|0135|0142|0151|0183|0184|0190|0191|0192|0193|0195|0196|0198|0199|0200|0201|0202|0204|0208|0209|0210|0211|0212|0213|9901|9906|9907|9910|9913|9914|9915|9918|9919|9920|9922|9923|9924|9925|9926|9927|9928|9929|9930|9931|9932|9933|9934|9935|9936|9937|9938|9939|9940|9941|9942|9943|9944|9945|9946|9947|9948|9949|9950|9951|9952|9953|9955|9957)')">A Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>

            <assert id="PEPPOL-T009-S021" flag="warning" test="not(./@*[not(name()='schemeID')])"><value-of select="$syntaxError" />cac:PartyIdentification/cbc:ID SHOULD NOT have any attributes but schemeID</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:AdditionalDocumentReference/cbc:XPath">
            <assert id="PEPPOL-T009-R030" flag="fatal" test="matches(./text(), '^/Enquiry/([a-zA-Z]+:)?Attachment\[\d?\]')">Only references to an attachment are allowed.</assert>
        </rule>

        <rule context="ubl:Enquiry/cac:Attachment/cac:ExternalReference">
            <assert id="PEPPOL-T009-R031" flag="fatal" test="count(./cbc:FileName) = 1 or count(./cbc:Description) > 0">At least one question or file reference MUST be given.</assert>
            <assert id="PEPPOL-T009-R032" flag="fatal" test="not(count(./cbc:FileName) > 0 and count(./cbc:Description) > 0)">A combination of questions and file reference is not allowed.</assert>
        </rule>
    </pattern>
</schema>
