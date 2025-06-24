<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_H021_de-DE_4.4.1_6.0.1.xslt</xsl:variable>
  <xsl:variable name="version">4.4.1_6.0.1</xsl:variable>
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/">
    <fo:root font-family="Arial Unicode MS" font-size="10pt">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="Standard" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1.25cm" margin-right="1.25cm">
          <fo:region-body margin-top="3.5cm" margin-left="1.0cm"/>
          <fo:region-before extent="2.5cm" margin-left="1.5cm"/>
          <fo:region-after extent="1.5cm" margin-left="1.5cm"/>
          <fo:region-start region-name="vertikal" extent="0.5cm" reference-orientation="90"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="Standard">
        <fo:static-content flow-name="xsl-region-before">
          <fo:table table-layout="fixed" width="100%" margin="5mm 0mm 0mm 0mm">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">H021 - Antwort auf Erstattungsforderung - Verwaltungskontrolle/medizinische Informationen</fo:block>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="8pt" text-align="start">H021 - Reply to Claim for Reimbursement - Administrative Check /Medical information</fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block text-align="right" font-weight="bold">EESSI-Datensatz</fo:block>
                  <fo:block text-align="right" font-weight="bold">Kopie gleichlautend zu Original</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-family="Arial Unicode MS" font-size="8pt" margin-top="50pt" margin-left="15pt">
            <fo:block>[Seite 
              <fo:page-number/> /
              <fo:page-number-citation ref-id="endofflow"/>] [Case-ID: 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'BusinessScope']/*[local-name() = 'CaseId']/*[local-name() = 'InstanceIdentifier']"/>] [Original SED from 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'DocumentIdentification']/*[local-name() = 'CreationDateAndTime']"/>]
            </fo:block>
            <fo:block>[Absender:
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Sender']/*[local-name() = 'Identifier']"/> (
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Sender']/*[local-name() = 'ContactTypeIdentifier']"/>)] [Empfänger: 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Receiver']/*[local-name() = 'Identifier']"/> (
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Receiver']/*[local-name() = 'ContactTypeIdentifier']"/>)]
            </fo:block>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="vertikal">
          <fo:block padding-before="4pt" font-size="8pt">PDF generiert mit
            <xsl:value-of select="$filename"/> - v.
            <xsl:value-of select="$version"/> - 2025, DVKA, Bonn.
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Arial Unicode MS" font-size="10pt">Artikel 87 der Verordnung (EG) Nr. 987/2009</fo:block>
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>1. Gesamtforderung</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>1.1. Forderungsberechtigter Träger</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.1. Träger-ID</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalClaim/CreditorInstitution/institutionID"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.2. Name des Trägers</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalClaim/CreditorInstitution/institutionName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.2. Globale Referenz des forderungsberechtigten Trägers</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalClaim/globalReferenceSetByCreditorInstitution"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.3. Globale Referenz des leistungspflichtigen Trägers</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalClaim/globalReferenceSetByDebtorInstitution"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.4. Gesamtzahl der Rechnungen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalClaim/totalNumberInvoices"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>1.5. Zahlung</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block>
                                  <fo:block>
                                    <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                      <fo:table-column column-width="45%"/>
                                      <fo:table-column column-width="53.5%"/>
                                      <fo:table-header background-color="LightGrey">
                                        <fo:table-row border="solid 0.2mm Grey">
                                          <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>1.5.1. Gesamtbetrag der Forderung in der Währung des forderungsberechtigten Staates</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.1.1. Betrag</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.1.2. Währung</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='HRK'">
                                                    <fo:block>Kroatische Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='CHF'">
                                                    <fo:block>Schweizer Franken</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='ISK'">
                                                    <fo:block>Isländische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='LVL'">
                                                    <fo:block>lettische Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='DKK'">
                                                    <fo:block>Dänische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='LTL'">
                                                    <fo:block>litauische Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='BGN'">
                                                    <fo:block>Bulgarischer Lew</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='NOK'">
                                                    <fo:block>Norwegische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='RON'">
                                                    <fo:block>Rumänischer Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='PLN'">
                                                    <fo:block>Polnischer Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='GBP'">
                                                    <fo:block>Britisches Pfund</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='CZK'">
                                                    <fo:block>Tschechische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='HUF'">
                                                    <fo:block>Ungarischer Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountInCurrencyCreditorInstitution/currency/value='SEK'">
                                                    <fo:block>Schwedische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <fo:block>-/-</fo:block>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </fo:block>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-body>
                                    </fo:table>
                                  </fo:block>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block>
                                  <fo:block>
                                    <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                      <fo:table-column column-width="45%"/>
                                      <fo:table-column column-width="53.5%"/>
                                      <fo:table-header background-color="LightGrey">
                                        <fo:table-row border="solid 0.2mm Grey">
                                          <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>1.5.2. Betrag der abgelehnten Gesamtforderung in der Währung des forderungsberechtigten Staates</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.2.1. Betrag</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.2.2. Währung</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='HRK'">
                                                    <fo:block>Kroatische Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='CHF'">
                                                    <fo:block>Schweizer Franken</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='ISK'">
                                                    <fo:block>Isländische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='LVL'">
                                                    <fo:block>lettische Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='DKK'">
                                                    <fo:block>Dänische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='LTL'">
                                                    <fo:block>litauische Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='BGN'">
                                                    <fo:block>Bulgarischer Lew</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='NOK'">
                                                    <fo:block>Norwegische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='RON'">
                                                    <fo:block>Rumänischer Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='PLN'">
                                                    <fo:block>Polnischer Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='GBP'">
                                                    <fo:block>Britisches Pfund</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='CZK'">
                                                    <fo:block>Tschechische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='HUF'">
                                                    <fo:block>Ungarischer Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalClaimAmountRejectedInCreditorCurrency/currency/value='SEK'">
                                                    <fo:block>Schwedische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <fo:block>-/-</fo:block>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </fo:block>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-body>
                                    </fo:table>
                                  </fo:block>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block>
                                  <fo:block>
                                    <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                      <fo:table-column column-width="45%"/>
                                      <fo:table-column column-width="53.5%"/>
                                      <fo:table-header background-color="LightGrey">
                                        <fo:table-row border="solid 0.2mm Grey">
                                          <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>1.5.3. Zahlungsbetrag insgesamt in der Währung des forderungsberechtigten Staates</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.3.1. Betrag</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.5.3.2. Währung</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='HRK'">
                                                    <fo:block>Kroatische Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='CHF'">
                                                    <fo:block>Schweizer Franken</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='ISK'">
                                                    <fo:block>Isländische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='LVL'">
                                                    <fo:block>lettische Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='DKK'">
                                                    <fo:block>Dänische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='LTL'">
                                                    <fo:block>litauische Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='BGN'">
                                                    <fo:block>Bulgarischer Lew</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='NOK'">
                                                    <fo:block>Norwegische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='RON'">
                                                    <fo:block>Rumänischer Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='PLN'">
                                                    <fo:block>Polnischer Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='GBP'">
                                                    <fo:block>Britisches Pfund</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='CZK'">
                                                    <fo:block>Tschechische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='HUF'">
                                                    <fo:block>Ungarischer Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalClaim/Payment/TotalPaymentInCreditorCurrency/currency/value='SEK'">
                                                    <fo:block>Schwedische Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <fo:block>-/-</fo:block>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </fo:block>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-body>
                                    </fo:table>
                                  </fo:block>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.5.4. Zahlungsreferenz für die Überweisung an den forderungsberechtigten Träger</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalClaim/Payment/paymentReferenceForTransferCreditorInstitution"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>2. Forderung</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>2.1. Person</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block>
                                  <fo:block>
                                    <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                      <fo:table-column column-width="45%"/>
                                      <fo:table-column column-width="53.5%"/>
                                      <fo:table-header background-color="LightGrey">
                                        <fo:table-row border="solid 0.2mm Grey">
                                          <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>2.1.1. Angaben zur Person</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.1.1. Familienname(n)</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonInformation/familyName"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.1.2. Vorname(n)</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonInformation/forename"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.1.3. Geburtsdatum</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonInformation/dateBirth"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.1.4. Geschlecht</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonInformation/sex"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//Claim/Person/PersonInformation/sex/value='01'">
                                                    <fo:block>Männlich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//Claim/Person/PersonInformation/sex/value='02'">
                                                    <fo:block>Weiblich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//Claim/Person/PersonInformation/sex/value='98'">
                                                    <fo:block>Nicht bekannt</fo:block>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <fo:block>-/-</fo:block>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </fo:block>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-body>
                                    </fo:table>
                                  </fo:block>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.2. Familienname(n) bei der Geburt</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Claim/Person/familyNameAtBirth"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.3. Vorname(n) bei der Geburt</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Claim/Person/forenameAtBirth"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block>
                                  <fo:block>
                                    <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                      <fo:table-column column-width="45%"/>
                                      <fo:table-column column-width="53.5%"/>
                                      <fo:table-header background-color="LightGrey">
                                        <fo:table-row border="solid 0.2mm Grey">
                                          <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>2.1.4. Persönliche Identifikationsnummer</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.4.1. PIN der Person im zuständigen Mitgliedstaat</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonIdentificationNumber/pINPersonInCompetentMemberState"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">2.1.4.2. PIN der Person im Aufenthalts- oder Wohnmitgliedstaat</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Claim/Person/PersonIdentificationNumber/pINPersonInMemberStateStayOrResidence"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-body>
                                    </fo:table>
                                  </fo:block>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <xsl:for-each select="//Claim/Reimbursement">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block>
                        <fo:block>
                          <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                            <fo:table-column column-width="45%"/>
                            <fo:table-column column-width="53.5%"/>
                            <fo:table-header background-color="LightGrey">
                              <fo:table-row border="solid 0.2mm Grey">
                                <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>2.2.[
                                    <xsl:value-of select="position()"/>] Erstattung
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                            </fo:table-header>
                            <fo:table-body start-indent="2mm">
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.2.1.[
                                    <xsl:value-of select="position()"/>] In Bezug auf unser(e/en)
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="inReferenceOur"/>
                                    <fo:block>
                                      <xsl:choose>
                                        <xsl:when test="inReferenceOur/value='01'">
                                          <fo:block>Ersuchen um verwaltungsmäßige Kontrolle</fo:block>
                                        </xsl:when>
                                        <xsl:when test="inReferenceOur/value='02'">
                                          <fo:block>Ersuchen um ärztliche Untersuchung</fo:block>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <fo:block>-/-</fo:block>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.2.2.[
                                    <xsl:value-of select="position()"/>] Ausgestellt am
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="issuedOn"/>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.2.3.[
                                    <xsl:value-of select="position()"/>] Rechnungsnummer des forderungsberechtigten Trägers
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="invoiceNumberCreditorInstitution"/>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block>
                                    <fo:block>
                                      <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                        <fo:table-column column-width="45%"/>
                                        <fo:table-column column-width="53.5%"/>
                                        <fo:table-header background-color="LightGrey">
                                          <fo:table-row border="solid 0.2mm Grey">
                                            <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>2.2.4.[
                                                <xsl:value-of select="position()"/>] Rechnungsbetrag in der Währung des forderungsberechtigten Staates
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.2.4.1.[
                                                <xsl:value-of select="position()"/>] Betrag
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="InvoiceAmountInCurrencyCreditorInstitution/amount"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.2.4.2.[
                                                <xsl:value-of select="position()"/>] Währung
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="InvoiceAmountInCurrencyCreditorInstitution/currency"/>
                                                <fo:block>
                                                  <xsl:choose>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='HRK'">
                                                      <fo:block>Kroatische Kuna</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='CHF'">
                                                      <fo:block>Schweizer Franken</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='ISK'">
                                                      <fo:block>Isländische Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='EUR'">
                                                      <fo:block>Euro</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='LVL'">
                                                      <fo:block>lettische Lats</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='DKK'">
                                                      <fo:block>Dänische Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='LTL'">
                                                      <fo:block>litauische Litas</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='BGN'">
                                                      <fo:block>Bulgarischer Lew</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='NOK'">
                                                      <fo:block>Norwegische Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='RON'">
                                                      <fo:block>Rumänischer Leu</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='PLN'">
                                                      <fo:block>Polnischer Zloty</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='GBP'">
                                                      <fo:block>Britisches Pfund</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='CZK'">
                                                      <fo:block>Tschechische Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='HUF'">
                                                      <fo:block>Ungarischer Forint</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="InvoiceAmountInCurrencyCreditorInstitution/currency/value='SEK'">
                                                      <fo:block>Schwedische Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                      <fo:block>-/-</fo:block>
                                                    </xsl:otherwise>
                                                  </xsl:choose>
                                                </fo:block>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-body>
                                      </fo:table>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.2.5.[
                                    <xsl:value-of select="position()"/>] Zurückweisung:
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="rejection"/>
                                    <fo:block>
                                      <xsl:choose>
                                        <xsl:when test="rejection/value='01'">
                                          <fo:block>Keine Zurückweisung</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejection/value='02'">
                                          <fo:block>Teilweise Zurückweisung</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejection/value='03'">
                                          <fo:block>Vollständige Zurückweisung</fo:block>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <fo:block>-/-</fo:block>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block>
                                    <fo:block>
                                      <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                        <fo:table-column column-width="45%"/>
                                        <fo:table-column column-width="53.5%"/>
                                        <fo:table-header background-color="LightGrey">
                                          <fo:table-row border="solid 0.2mm Grey">
                                            <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>2.2.6.[
                                                <xsl:value-of select="position()"/>] Einzelheiten zur teilweisen oder vollständigen Zurückweisung
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell number-columns-spanned="2">
                                              <fo:block>
                                                <fo:block>
                                                  <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                                    <fo:table-column column-width="45%"/>
                                                    <fo:table-column column-width="53.5%"/>
                                                    <fo:table-header background-color="LightGrey">
                                                      <fo:table-row border="solid 0.2mm Grey">
                                                        <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>2.2.6.1.[
                                                            <xsl:value-of select="position()"/>] Zurückgewiesener Rechnungsbetrag in der Währung des forderungsberechtigten Staates
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.2.6.1.1.[
                                                            <xsl:value-of select="position()"/>] Betrag
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/amount"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.2.6.1.2.[
                                                            <xsl:value-of select="position()"/>] Währung
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='HRK'">
                                                                  <fo:block>Kroatische Kuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='CHF'">
                                                                  <fo:block>Schweizer Franken</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='ISK'">
                                                                  <fo:block>Isländische Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='EUR'">
                                                                  <fo:block>Euro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='LVL'">
                                                                  <fo:block>lettische Lats</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='DKK'">
                                                                  <fo:block>Dänische Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='LTL'">
                                                                  <fo:block>litauische Litas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='BGN'">
                                                                  <fo:block>Bulgarischer Lew</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='NOK'">
                                                                  <fo:block>Norwegische Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='RON'">
                                                                  <fo:block>Rumänischer Leu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='PLN'">
                                                                  <fo:block>Polnischer Zloty</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='GBP'">
                                                                  <fo:block>Britisches Pfund</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='CZK'">
                                                                  <fo:block>Tschechische Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='HUF'">
                                                                  <fo:block>Ungarischer Forint</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="DetailPartialFullRejection/InvoiceAmountRejectedInCurrencyCreditor/currency/value='SEK'">
                                                                  <fo:block>Schwedische Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                  <fo:block>-/-</fo:block>
                                                                </xsl:otherwise>
                                                              </xsl:choose>
                                                            </fo:block>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-body>
                                                  </fo:table>
                                                </fo:block>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-body>
                                      </fo:table>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.2.7.[
                                    <xsl:value-of select="position()"/>] Grund der Zurückweisung
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="rejectionReason"/>
                                    <fo:block>
                                      <xsl:choose>
                                        <xsl:when test="rejectionReason/value='99'">
                                          <fo:block>Sonstiges</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejectionReason/value='01'">
                                          <fo:block>Diese Rechnung betrifft uns nicht</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejectionReason/value='02'">
                                          <fo:block>Keine Zahlung möglich für diese Rechnung</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejectionReason/value='03'">
                                          <fo:block>Keine Antwort auf die Anfrage erhalten</fo:block>
                                        </xsl:when>
                                        <xsl:when test="rejectionReason/value='04'">
                                          <fo:block>Erhaltene Informationen entsprechen nicht der ursprünglichen Anfrage</fo:block>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <fo:block>-/-</fo:block>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block>
                                    <fo:block>
                                      <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                        <fo:table-column column-width="45%"/>
                                        <fo:table-column column-width="53.5%"/>
                                        <fo:table-header background-color="LightGrey">
                                          <fo:table-row border="solid 0.2mm Grey">
                                            <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>2.2.8.[
                                                <xsl:value-of select="position()"/>] Füllen Sie bitte folgendes Feld aus, wenn „Grund der Zurückweisung“ = „Sonstiges“
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.2.8.1.[
                                                <xsl:value-of select="position()"/>] Sonstige
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="PleaseFillInFollowingIfRejectionReasonOther/other"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-body>
                                      </fo:table>
                                    </fo:block>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                            </fo:table-body>
                          </fo:table>
                        </fo:block>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:for-each>
                <xsl:if test="not(//Claim/Reimbursement)">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block/>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
              </fo:table-body>
            </fo:table>
          </fo:block>
          <fo:block id="endofflow"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
