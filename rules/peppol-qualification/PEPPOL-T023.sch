<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>PEPPOL business and syntax rules for QualificationRejection</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:TendererQualificationResponse-2"/>

    <pattern>
        <rule context="*">
            <report id="PEPPOL-T023-R001" flag="fatal" test="normalize-space(.) = '' and not(*)">A Qualification document MUST NOT contain empty elements.</report>
        </rule>
    </pattern>
    <pattern>
        <let name="syntaxError" value="string('A QualificationRejection document SHOULD only contain elements and attributes described in the syntax mapping. - ')"/>

        <rule context="/ubl:TendererQualificationResponse">
            <assert test="cbc:UBLVersionID" flag="fatal" id="PEPPOL-T023-R002">Element 'cbc:CustomizationID' MUST be provided.</assert>
            <assert test="cbc:CustomizationID" flag="fatal" id="PEPPOL-T023-R003">Element 'cbc:CustomizationID' MUST be provided.</assert>
            <assert test="cbc:ProfileID" flag="fatal" id="PEPPOL-T023-R004">Element 'cbc:ProfileID' MUST be provided.</assert>
            <assert test="cbc:ID" flag="fatal" id="PEPPOL-T023-R005">Element 'cbc:ID' MUST be provided.</assert>
            <assert test="cbc:ContractFolderID" flag="fatal" id="PEPPOL-T023-R006">Element 'cbc:ContractFolderID' MUST be provided.</assert>
            <assert test="cbc:IssueDate" flag="fatal" id="PEPPOL-T023-R007">Element 'cbc:IssueDate' MUST be provided.</assert>
            <assert test="cbc:IssueTime" flag="fatal" id="PEPPOL-T023-R008">Element 'cbc:IssueTime' MUST be provided.</assert>
            <assert test="cac:SenderParty" flag="fatal" id="PEPPOL-T023-R009">Element 'cac:SenderParty' MUST be provided.</assert>
            <assert test="cac:ReceiverParty" flag="fatal" id="PEPPOL-T023-R010">Element 'cac:ReceiverParty' MUST be provided.</assert>
            <assert test="cac:QualificationResolution" flag="fatal" id="PEPPOL-T023-R011">Element 'cac:QualificationResolution' MUST be provided.</assert>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:UBLVersionID">
            <assert id="PEPPOL-T023-R013" flag="fatal" test="normalize-space(.) = '2.2'">UBLVersionID value MUST be '2.2'.</assert>
            <report id="PEPPOL-T023-R014" flag="warning" test="./@*"><value-of select="$syntaxError"/>UBLVersionID SHOULD NOT contain any attributes.</report>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:CustomizationID">
            <assert id="PEPPOL-T023-R015" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:trns:t023:1.0'">CustomizationID value MUST be 'urn:fdc:peppol.eu:prac:trns:t023:1.0'</assert>
            <report id="PEPPOL-T023-R016" flag="warning" test="./@*"><value-of select="$syntaxError"/>CustomizationID SHOULD NOT contain any attributes.</report>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:ProfileID">
            <assert id="PEPPOL-T023-R017" flag="fatal" test="normalize-space(.) = 'urn:fdc:peppol.eu:prac:bis:p012:1.0'">ProfileID value MUST be 'urn:fdc:peppol.eu:prac:bis:p012:1.0'</assert>
            <report id="PEPPOL-T023-R018" flag="warning" test="./@*"><value-of select="$syntaxError"/>ProfileID SHOULD NOT contain any attributes.</report>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:ID">
            <assert id="PEPPOL-T023-R019" flag="fatal" test="./@schemeURI">A Submit Tender Identifier MUST have a schemeURI attribute.</assert>
            <assert id="PEPPOL-T023-R020" flag="fatal" test="normalize-space(./@schemeURI)='urn:uuid'">schemeURI for Submit Tender Identifier MUST be 'urn:uuid'.</assert>
            <report id="PEPPOL-T023-R021" flag="warning" test="./@*[not(name()='schemeURI')]"><value-of select="$syntaxError"/>A Submit Tender Identifier SHOULD NOT have any attributes but schemeURI</report>
            <assert id="PEPPOL-T023-R022" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">A Submit Tender Identifier MUST be expressed in a UUID syntax (RFC 4122)</assert>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:ContractFolderID">
            <report id="PEPPOL-T023-R023" flag="warning" test="./@*"><value-of select="$syntaxError"/>ContractFolderID SHOULD NOT contain any attributes.</report>
            <assert id="PEPPOL-T023-R024" flag="fatal" test="matches(normalize-space(.),'^[a-fA-F0-9]{8}(\-[a-fA-F0-9]{4}){3}\-[a-fA-F0-9]{12}$')">The ContractFolderID MUST be expressed in a UUID syntax (RFC 4122).</assert>
        </rule>

        <rule context="ubl:TendererQualificationResponse/cbc:IssueTime">
            <assert id="PEPPOL-T023-R025" flag="fatal" test="matches(normalize-space(.),'^(([01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]|(24:00:00))(Z|(\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))?$')">IssueTime MUST have a granularity of seconds</assert>
        </rule>
        <rule context="ubl:TendererQualificationResponse/cac:QualificationResolution/cbc:AdmissionCode">
            <assert id="PEPPOL-T023-R026" flag="fatal" test="(not(cbc:AdmissionCode = false()))">AdmissionCode must always be "false" in a QualificationRejection</assert>
        </rule>
        <rule context="ubl:TendererQualificationResponse/cac:QualificationResolution/cbc:Resolution">
            <assert id="PEPPOL-T023-R027" flag="fatal" test="(not(cbc:ExclusionReason) OR not(cbc:Resolution))">At least one Resolution or one ExclusionReason has to be provided in a QualificationRejection </assert>
        </rule>
    </pattern>
</schema>