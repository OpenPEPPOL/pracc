<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <title>Rules for the Pre-Award Catalogue</title>
    
    <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
    <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
    <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
    <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CallForTenders-2"/>
    
<sch:pattern id="cc">
  <sch:rule context="ubl:Catalogue/cac:CatalogueLine/cac:Item">
    <sch:assert test="cac:BuyersItemIdentification/cbc:ID
                      or cac:SellersItemIdentification/cbc:ID
                      or cac:ManufacturersItemIdentification/cbc:ID
                      or cac:StandardItemIdentification/cbc:ID">
      At least one item identifier (Buyer, Seller, Manufacturer or Standard) MUST be present on each catalogue line.
    </sch:assert>
  </sch:rule>
</sch:pattern>

</schema>