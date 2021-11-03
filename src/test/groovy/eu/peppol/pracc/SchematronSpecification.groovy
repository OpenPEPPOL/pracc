/*
 * This Spock specification was generated by the Gradle 'init' task.
 */
package eu.peppol.pracc


import com.helger.schematron.sch.SchematronResourceSCH
import com.helger.schematron.svrl.jaxb.FailedAssert
import com.helger.schematron.svrl.jaxb.SchematronOutputType
import com.helger.schematron.svrl.jaxb.SuccessfulReport
import groovy.util.logging.Slf4j
import spock.lang.Specification

import javax.xml.XMLConstants
import javax.xml.transform.stream.StreamSource
import javax.xml.validation.Schema
import javax.xml.validation.SchemaFactory

@Slf4j
class SchematronSpecification extends Specification {

    def 'run schematron on instances'() {
        given:
        def schematronFile = new File(schematronFileName)
        def schematronResource = SchematronResourceSCH.fromFile(schematronFile)

        when:
        def xmlFile = new File(xmlFileName)

        SchematronOutputType result = null
        schematronResource.setAllowForeignElements(true)
        xmlFile.withInputStream { InputStream is ->
            result = schematronResource.applySchematronValidationToSVRL(new StreamSource(is))
        }

        def failedAsserts = result?.getActivePatternAndFiredRuleAndFailedAssert()?.findAll { it instanceof FailedAssert || it instanceof SuccessfulReport }
        failedAsserts?.each {
            log.error("found ${it.id}: '${it.text.content}' when validating ${xmlFile.absolutePath} with ${schematronFile.name}")
        }


        then:
        failedAsserts?.isEmpty() && result != null

        where:
        schematronFileName                                                      | xmlFileName
        'rules/peppol-procurement-procedure-subscription-1.0/PEPPOL-T001.sch'   | 'guides/transactions/T001/files/ExpressionOfInterestRequest-instance.xml'
        'rules/peppol-procurement-procedure-subscription-1.0/PEPPOL-T002.sch'   | 'guides/transactions/T002/files/ExpressionOfInterestResponse-instance.xml'
        'rules/peppol-tender-status-inquiry-1.0/PEPPOL-T003.sch'                | 'guides/transactions/T003/files/TenderStatusRequest-instance.xml'
        'rules/peppol-call-for-tender-1.0/peppol/PEPPOL-T004.sch'               | 'guides/transactions/T004/files/call-for-tenders-instance.xml'
        'rules/peppol-tender-1.0/peppol/PEPPOL-T005.sch'                        | 'guides/transactions/T005/files/tender-instance.xml'
        'rules/peppol-tender-1.0/peppol/PEPPOL-T006.sch'                        | 'guides/transactions/T006/files/tender-receipt-instance.xml'
        'rules/peppol-call-for-tender-question-and-answers-1.0/PEPPOL-T007.sch' | 'guides/transactions/T007/files/TenderingQuestions-doc.xml'
        'rules/peppol-call-for-tender-question-and-answers-1.0/PEPPOL-T008.sch' | 'guides/transactions/T008/files/TenderingAnswers-doc.xml'
        'rules/tender-clarification-1.0/PEPPOL-T009.sch'                        | 'guides/transactions/T009/files/TenderClarificationRequest-doc.xml'
        'rules/tender-clarification-1.0/PEPPOL-T010.sch'                        | 'guides/transactions/T010/files/TenderClarification-doc.xml'
        'rules/peppol-search-notice/PEPPOL-T011.sch'                            | 'guides/transactions/T011/files/ExampleSearchNoticeRequest.xml'
        'rules/peppol-search-notice/PEPPOL-T012.sch'                            | 'guides/transactions/T012/files/ExampleSearchNoticeResponse.xml'
        'rules/peppol-tender-withdrawal/PEPPOL-T013.sch'                        | 'guides/transactions/T013/files/TenderWithdrawal.xml'
        'rules/peppol-tender-withdrawal/PEPPOL-T014.sch'                        | 'guides/transactions/T014/files/TenderWithdrawalReceptionNotification.xml'
        'rules/peppol-publish-notice/PEPPOL-T015.sch'                           | 'guides/transactions/T015/files/ExamplePublishNotice.xml'
        'rules/peppol-publish-notice/PEPPOL-T016.sch'                           | 'guides/transactions/T016/files/ExampleNoticePublicationResponse.xml'
        'rules/peppol-notify-awarding/PEPPOL-T017.sch'                          | 'guides/transactions/T017/files/NotifyAwarding.xml'
    }

    static Map<String, Schema> schemaCache = new HashMap<>()

    def 'XSD schema validation'() {

        given:
        def factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
        def xsdSource = this.class.classLoader.getResource(xsd)
        Schema schema = loadSchema(factory, xsdSource)
        def validator = schema.newValidator()

        when:
        validator.validate(new StreamSource(new FileReader(new File(xml))))

        then:
        noExceptionThrown()

        where:
        xml                                                                        | xsd
        'guides/transactions/T001/files/ExpressionOfInterestRequest-instance.xml'  | 'xsdrt/maindoc/UBL-ExpressionOfInterestRequest-2.2.xsd'
        'guides/transactions/T002/files/ExpressionOfInterestResponse-instance.xml' | 'xsdrt/maindoc/UBL-ExpressionOfInterestResponse-2.2.xsd'
        'guides/transactions/T003/files/TenderStatusRequest-instance.xml'          | 'xsdrt/maindoc/UBL-TenderStatusRequest-2.2.xsd'
        'guides/transactions/T004/files/call-for-tenders-instance.xml'             | 'xsdrt/maindoc/UBL-CallForTenders-2.2.xsd'
        'guides/transactions/T005/files/tender-instance.xml'                       | 'xsdrt/maindoc/UBL-Tender-2.2.xsd'
        'guides/transactions/T006/files/tender-receipt-instance.xml'               | 'xsdrt/maindoc/UBL-TenderReceipt-2.2.xsd'
        'guides/transactions/T007/files/TenderingQuestions-doc.xml'                | 'xsdrt/maindoc/UBL-Enquiry-2.2.xsd'
        'guides/transactions/T008/files/TenderingAnswers-doc.xml'                  | 'xsdrt/maindoc/UBL-EnquiryResponse-2.2.xsd'
        'guides/transactions/T009/files/TenderClarificationRequest-doc.xml'        | 'xsdrt/maindoc/UBL-Enquiry-2.2.xsd'
        'guides/transactions/T010/files/TenderClarification-doc.xml'               | 'xsdrt/maindoc/UBL-EnquiryResponse-2.2.xsd'
        'guides/transactions/T011/files/ExampleSearchNoticeRequest.xml'            | 'ebXML/query.xsd'
        'guides/transactions/T012/files/ExampleSearchNoticeResponse.xml'           | 'ebXML/query.xsd'
        'guides/transactions/T013/files/TenderWithdrawal.xml'                      | 'xsdrt/maindoc/UBL-TenderWithdrawal-2.2.xsd'
        'guides/transactions/T014/files/TenderWithdrawalReceptionNotification.xml' | 'xsdrt/maindoc/UBL-TenderReceipt-2.2.xsd'
        'guides/transactions/T015/files/ExamplePublishNotice.xml'                  | 'ebXML/lcm.xsd'
        'guides/transactions/T016/files/ExampleNoticePublicationResponse.xml'      | 'xsdrt/maindoc/UBL-ApplicationResponse-2.2.xsd'
        'guides/transactions/T017/files/NotifyAwarding.xml'                        | 'xsdrt/maindoc/UBL-AwardedNotification-2.2.xsd'
    }

    static Schema loadSchema(SchemaFactory factory, URL xsdSource) {
        Schema schema
        if (schemaCache.containsKey(xsdSource.toString())) {
            schema = schemaCache.get(xsdSource.toString())
        } else {
            schema = factory.newSchema(xsdSource)
            schemaCache.put(xsdSource.toString(), schema)
        }
        schema
    }
}
