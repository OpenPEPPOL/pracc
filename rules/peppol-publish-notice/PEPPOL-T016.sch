<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">


    <title>PEPPOL business and syntax rules for notice publication response</title>

    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"/>
    <pattern>
        <rule context="//*[not(*) and not(normalize-space())]">
            <assert id="PEPPOL-T016-R049" test="false()" flag="fatal">Document MUST not contain empty elements.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="/*">
            <assert id="PEPPOL-T016-R002"
                    test="not(@*:schemaLocation)"
                    flag="warning">Document SHOULD not contain schema location.
            </assert>

        </rule>

        <rule context="cbc:IssueDate">
            <assert id="PEPPOL-T016-R003"
                    test="(string(.) castable as xs:date) and (string-length(.) = 10)"
                    flag="fatal">A date must be formatted YYYY-MM-DD.
            </assert>
        </rule>

    </pattern>

    <pattern>

        <rule context="/ubl:ApplicationResponse">
            <assert test="cbc:CustomizationID" flag="fatal" id="PEPPOL-T016-R040">Element 'cbc:CustomizationID' MUST be
                provided.
            </assert>
            <assert test="cbc:ProfileID" flag="fatal" id="PEPPOL-T016-R041">Element 'cbc:ProfileID' MUST be provided.
            </assert>
            <assert test="cbc:ID" flag="fatal" id="PEPPOL-T016-R042">Element 'cbc:ID' MUST be provided.</assert>
            <assert test="cbc:IssueDate" flag="fatal" id="PEPPOL-T016-R043">Element 'cbc:IssueDate' MUST be provided.
            </assert>
            <assert test="cac:SenderParty" flag="fatal" id="PEPPOL-T016-R044">Element 'cac:SenderParty' MUST be
                provided.
            </assert>
            <assert test="cac:ReceiverParty" flag="fatal" id="PEPPOL-T016-R045">Element 'cac:ReceiverParty' MUST be
                provided.
            </assert>
            <assert test="cac:DocumentResponse" flag="fatal" id="PEPPOL-T016-R046">Element 'cac:DocumentResponse' MUST
                be provided.
            </assert>
        </rule>
        <rule context="/ubl:ApplicationResponse/cbc:CustomizationID"/>
        <rule context="/ubl:ApplicationResponse/cbc:ProfileID">
            <assert test="normalize-space(text()) = 'urn:fdc:peppol.eu:prac:bis:p008:1.0'"
                    flag="fatal"
                    id="PEPPOL-T016-R001">Element 'cbc:ProfileID' MUST contain value
                'urn:fdc:peppol.eu:prac:bis:p008:1.0'.
            </assert>
        </rule>
        <rule context="/ubl:ApplicationResponse/cbc:ID"/>
        <rule context="/ubl:ApplicationResponse/cbc:IssueDate"/>
        <rule context="/ubl:ApplicationResponse/cbc:IssueTime"/>
        <rule context="/ubl:ApplicationResponse/cac:SenderParty">
            <assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T016-R014">Element 'cbc:EndpointID' MUST be
                provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:SenderParty/cbc:EndpointID">
            <assert test="@schemeID" flag="fatal" id="PEPPOL-T016-R015">Attribute 'schemeID' MUST be present.</assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:SenderParty/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R016">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:ReceiverParty">
            <assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T016-R017">Element 'cbc:EndpointID' MUST be
                provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID">
            <assert test="@schemeID" flag="fatal" id="PEPPOL-T016-R018">Attribute 'schemeID' MUST be present.</assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:ReceiverParty/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R020">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse">
            <assert test="cac:Response" flag="fatal" id="PEPPOL-T71-B01301">Element 'cac:Response' MUST be provided.
            </assert>
            <assert test="cac:DocumentReference" flag="fatal" id="PEPPOL-T016-R021">Element 'cac:DocumentReference' MUST
                be provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response">
            <assert test="cbc:ResponseCode" flag="fatal" id="PEPPOL-T016-R022">Element 'cbc:ResponseCode' MUST be
                provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:Description"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:EffectiveDate"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:EffectiveTime"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cac:Status"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cac:Status/cbc:ConditionCode"/>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R024">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference">
            <assert test="cbc:ID" flag="fatal" id="PEPPOL-T016-R025">Element 'cbc:ID' MUST be provided.</assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:UUID"/>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R027">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse">
            <assert test="cac:LineReference" flag="fatal" id="PEPPOL-T016-R028">Element 'cac:LineReference' MUST be
                provided.
            </assert>
            <assert test="cac:Response" flag="fatal" id="PEPPOL-T016-R029">Element 'cac:Response' MUST be provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference">
            <assert test="cbc:LineID" flag="fatal" id="PEPPOL-T016-R030">Element 'cbc:LineID' MUST be provided.</assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cac:DocumentReference"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cac:DocumentReference/cbc:ID"/>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R031">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response">
            <assert test="cbc:Description" flag="fatal" id="PEPPOL-T016-R032">Element 'cbc:Description' MUST be
                provided.
            </assert>
            <assert test="cac:Status" flag="fatal" id="PEPPOL-T016-R033">Element 'cac:Status' MUST be provided.</assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode"/>
        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:Description"/>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status">
            <assert test="cbc:StatusReasonCode" flag="fatal" id="PEPPOL-T016-R035">Element 'cbc:StatusReasonCode' MUST
                be provided.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode"/>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R037">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R038">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R039">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>

        <rule context="/ubl:ApplicationResponse/cbc:UBLVersionID"/>

        <rule context="/ubl:ApplicationResponse/*">
            <assert test="false()" flag="fatal" id="PEPPOL-T016-R047">Document MUST NOT contain elements not part of the
                data model.
            </assert>
        </rule>
    </pattern>

    <pattern>

        <rule context="cbc:CustomizationID">
            <assert id="PEPPOL-T016-R048"
                    test="starts-with(normalize-space(.), 'urn:fdc:peppol.eu:prac:trns:t016:1.0')"
                    flag="fatal">Specification identifier SHALL start with the value
                'urn:fdc:peppol.eu:prac:trns:t016:1.0'.
            </assert>
        </rule>

    </pattern>

</schema>
