<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_S116_en-UK_4.4.1_6.0.1.xslt</xsl:variable>
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
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">S116 - Information on payment of individual claim - fixed amounts (PAY_IMO)</fo:block>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="8pt" text-align="start">S116 - Information on payment of individual claim - fixed amounts (PAY_IMO)</fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block text-align="right" font-weight="bold">EESSI data record</fo:block>
                  <fo:block text-align="right" font-weight="bold">Copy identical to original</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-family="Arial Unicode MS" font-size="8pt" margin-top="50pt" margin-left="15pt">
            <fo:block>[Page 
              <fo:page-number/> /
              <fo:page-number-citation ref-id="endofflow"/>] [Case-ID: 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'BusinessScope']/*[local-name() = 'CaseId']/*[local-name() = 'InstanceIdentifier']"/>] [Original SED from 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'DocumentIdentification']/*[local-name() = 'CreationDateAndTime']"/>]
            </fo:block>
            <fo:block>[Sender:
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Sender']/*[local-name() = 'Identifier']"/> (
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Sender']/*[local-name() = 'ContactTypeIdentifier']"/>)] [Recipient: 
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Receiver']/*[local-name() = 'Identifier']"/> (
              <xsl:value-of select="//*[local-name() = 'StandardBusinessDocumentHeader']/*[local-name() = 'Receiver']/*[local-name() = 'ContactTypeIdentifier']"/>)]
            </fo:block>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="vertikal">
          <fo:block padding-before="4pt" font-size="8pt">PDF generated with
            <xsl:value-of select="$filename"/> - v.
            <xsl:value-of select="$version"/> - 2025, DVKA, Bonn.
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Arial Unicode MS" font-size="10pt">Articles 63, 64, 65, 66, 67 of Regulation (EC) No 987/2009</fo:block>
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>1. Global Note PAY_IMO</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.1. Global IMO Reference Creditor Liaison Body</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/globalIMOReferenceCreditorLiaisonBody"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.2. Global CLA_IMO Reference Creditor Liaison Body</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/globalCLAIMOReferenceCreditorLiaisonBody"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.3. Global PAY_IMO Reference Debtor Liaison Body</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/globalPAYIMOReferenceDebtorLiaisonBody"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.4. Total number of months CLA_IMO</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/totalNumberMonthsCLAIMO"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.5. Date Of Submission</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/dateOfSubmission"/>
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
                                <fo:block>1.6. Lump sum</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.6.1. Amount</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/LumpSum/amount"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.6.2. Currency</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/LumpSum/currency"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='HRK'">
                                        <fo:block>Croatian Kuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='CHF'">
                                        <fo:block>Swiss Franc</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='ISK'">
                                        <fo:block>Icelandic Krona</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='EUR'">
                                        <fo:block>Euro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='LVL'">
                                        <fo:block>Latvian Lats</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='DKK'">
                                        <fo:block>Danish Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='LTL'">
                                        <fo:block>Lithuanian Litas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='BGN'">
                                        <fo:block>Bulgarian Lev</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='NOK'">
                                        <fo:block>Norwegian Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='RON'">
                                        <fo:block>Romanian New Leu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='PLN'">
                                        <fo:block>Polish Zloty</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='GBP'">
                                        <fo:block>British Pound</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='CZK'">
                                        <fo:block>Czech Koruna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='HUF'">
                                        <fo:block>Hungarian Forint</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/LumpSum/currency/value='SEK'">
                                        <fo:block>Swedish Krona</fo:block>
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
                    <fo:block wrap-option="wrap">1.7. Total number of individual payments</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//GlobalNotePAYIMO/totalNumberIndividualPayments"/>
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
                                <fo:block>1.8. Total payment amount</fo:block>
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
                                            <fo:block>1.8.1. Total payment amount to be paid</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.8.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.8.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountPaid/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                                            <fo:block>1.8.2. Total payment amount to be refunded</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.8.2.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.8.2.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/TotalPaymentAmount/TotalPaymentAmountRefunded/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>1.9. Total claim amount</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.9.1. Amount</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalClaimAmount/amount"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.9.2. Currency</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalClaimAmount/currency"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='HRK'">
                                        <fo:block>Croatian Kuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='CHF'">
                                        <fo:block>Swiss Franc</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='ISK'">
                                        <fo:block>Icelandic Krona</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='EUR'">
                                        <fo:block>Euro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='LVL'">
                                        <fo:block>Latvian Lats</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='DKK'">
                                        <fo:block>Danish Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='LTL'">
                                        <fo:block>Lithuanian Litas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='BGN'">
                                        <fo:block>Bulgarian Lev</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='NOK'">
                                        <fo:block>Norwegian Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='RON'">
                                        <fo:block>Romanian New Leu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='PLN'">
                                        <fo:block>Polish Zloty</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='GBP'">
                                        <fo:block>British Pound</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='CZK'">
                                        <fo:block>Czech Koruna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='HUF'">
                                        <fo:block>Hungarian Forint</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalClaimAmount/currency/value='SEK'">
                                        <fo:block>Swedish Krona</fo:block>
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
                                <fo:block>1.10. Total amount of credit notes</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.10.1. Amount</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalAmountCreditNotes/amount"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.10.2. Currency</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='HRK'">
                                        <fo:block>Croatian Kuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='CHF'">
                                        <fo:block>Swiss Franc</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='ISK'">
                                        <fo:block>Icelandic Krona</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='EUR'">
                                        <fo:block>Euro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='LVL'">
                                        <fo:block>Latvian Lats</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='DKK'">
                                        <fo:block>Danish Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='LTL'">
                                        <fo:block>Lithuanian Litas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='BGN'">
                                        <fo:block>Bulgarian Lev</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='NOK'">
                                        <fo:block>Norwegian Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='RON'">
                                        <fo:block>Romanian New Leu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='PLN'">
                                        <fo:block>Polish Zloty</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='GBP'">
                                        <fo:block>British Pound</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='CZK'">
                                        <fo:block>Czech Koruna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='HUF'">
                                        <fo:block>Hungarian Forint</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountCreditNotes/currency/value='SEK'">
                                        <fo:block>Swedish Krona</fo:block>
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
                                <fo:block>1.11. Total amount of accepted contestations</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.11.1. Amount</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/amount"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.11.2. Currency</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='HRK'">
                                        <fo:block>Croatian Kuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='CHF'">
                                        <fo:block>Swiss Franc</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='ISK'">
                                        <fo:block>Icelandic Krona</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='EUR'">
                                        <fo:block>Euro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='LVL'">
                                        <fo:block>Latvian Lats</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='DKK'">
                                        <fo:block>Danish Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='LTL'">
                                        <fo:block>Lithuanian Litas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='BGN'">
                                        <fo:block>Bulgarian Lev</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='NOK'">
                                        <fo:block>Norwegian Krone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='RON'">
                                        <fo:block>Romanian New Leu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='PLN'">
                                        <fo:block>Polish Zloty</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='GBP'">
                                        <fo:block>British Pound</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='CZK'">
                                        <fo:block>Czech Koruna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='HUF'">
                                        <fo:block>Hungarian Forint</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//GlobalNotePAYIMO/TotalAmountAcceptedContestations/currency/value='SEK'">
                                        <fo:block>Swedish Krona</fo:block>
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
                                <fo:block>1.12. Down Payment</fo:block>
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
                                            <fo:block>1.12.1. Total Amount of Down Payment</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.12.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.12.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/DownPayment/TotalAmountDownPayment/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                                <fo:block wrap-option="wrap">1.12.2. Down Payment Reference</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//GlobalNotePAYIMO/DownPayment/downPaymentReference"/>
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
                                <fo:block>1.13. Overpayment</fo:block>
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
                                            <fo:block>1.13.1. Total Amount of Overpayment</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.13.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.13.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Overpayment/TotalAmountOverpayment/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                            <xsl:for-each select="//GlobalNotePAYIMO/Overpayment/Overpayments">
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
                                              <fo:block>1.13.2.[
                                                <xsl:value-of select="position()"/>] Overpayments
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
                                                          <fo:block>1.13.2.1.[
                                                            <xsl:value-of select="position()"/>] Amount of overpayment
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.13.2.1.1.[
                                                            <xsl:value-of select="position()"/>] Amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="AmountOverpayment/amount"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.13.2.1.2.[
                                                            <xsl:value-of select="position()"/>] Currency
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="AmountOverpayment/currency"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="AmountOverpayment/currency/value='HRK'">
                                                                  <fo:block>Croatian Kuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='CHF'">
                                                                  <fo:block>Swiss Franc</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='ISK'">
                                                                  <fo:block>Icelandic Krona</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='EUR'">
                                                                  <fo:block>Euro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='LVL'">
                                                                  <fo:block>Latvian Lats</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='DKK'">
                                                                  <fo:block>Danish Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='LTL'">
                                                                  <fo:block>Lithuanian Litas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='BGN'">
                                                                  <fo:block>Bulgarian Lev</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='NOK'">
                                                                  <fo:block>Norwegian Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='RON'">
                                                                  <fo:block>Romanian New Leu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='PLN'">
                                                                  <fo:block>Polish Zloty</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='GBP'">
                                                                  <fo:block>British Pound</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='CZK'">
                                                                  <fo:block>Czech Koruna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='HUF'">
                                                                  <fo:block>Hungarian Forint</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="AmountOverpayment/currency/value='SEK'">
                                                                  <fo:block>Swedish Krona</fo:block>
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
                                              <fo:block wrap-option="wrap">1.13.2.2.[
                                                <xsl:value-of select="position()"/>] Overpayment reference
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="overpaymentReference"/>
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
                            <xsl:if test="not(//GlobalNotePAYIMO/Overpayment/Overpayments)">
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block/>
                                </fo:table-cell>
                              </fo:table-row>
                            </xsl:if>
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
                                <fo:block>1.14. Offsetting</fo:block>
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
                                            <fo:block>1.14.1. Total Offsetting Amount</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.14.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.14.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/Offsetting/TotalOffsettingAmount/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                            <xsl:for-each select="//GlobalNotePAYIMO/Offsetting/Offsettings">
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
                                              <fo:block>1.14.2.[
                                                <xsl:value-of select="position()"/>] Offsettings
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
                                                          <fo:block>1.14.2.1.[
                                                            <xsl:value-of select="position()"/>] Offsetting Amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.14.2.1.1.[
                                                            <xsl:value-of select="position()"/>] Amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="OffsettingAmount/amount"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.14.2.1.2.[
                                                            <xsl:value-of select="position()"/>] Currency
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="OffsettingAmount/currency"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="OffsettingAmount/currency/value='HRK'">
                                                                  <fo:block>Croatian Kuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='CHF'">
                                                                  <fo:block>Swiss Franc</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='ISK'">
                                                                  <fo:block>Icelandic Krona</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='EUR'">
                                                                  <fo:block>Euro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='LVL'">
                                                                  <fo:block>Latvian Lats</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='DKK'">
                                                                  <fo:block>Danish Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='LTL'">
                                                                  <fo:block>Lithuanian Litas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='BGN'">
                                                                  <fo:block>Bulgarian Lev</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='NOK'">
                                                                  <fo:block>Norwegian Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='RON'">
                                                                  <fo:block>Romanian New Leu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='PLN'">
                                                                  <fo:block>Polish Zloty</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='GBP'">
                                                                  <fo:block>British Pound</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='CZK'">
                                                                  <fo:block>Czech Koruna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='HUF'">
                                                                  <fo:block>Hungarian Forint</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="OffsettingAmount/currency/value='SEK'">
                                                                  <fo:block>Swedish Krona</fo:block>
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
                                                          <fo:block>1.14.2.2.[
                                                            <xsl:value-of select="position()"/>] null
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.14.2.2.1.[
                                                            <xsl:value-of select="position()"/>] null
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="OffsettingReferences/originalGlobalIMOReferenceCreditorLiaisonBody"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.14.2.2.2.[
                                                            <xsl:value-of select="position()"/>] null
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="OffsettingReferences/offsettingReference"/>
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
                            <xsl:if test="not(//GlobalNotePAYIMO/Offsetting/Offsettings)">
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block/>
                                </fo:table-cell>
                              </fo:table-row>
                            </xsl:if>
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
                                <fo:block>1.15. Credit Notes after payment</fo:block>
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
                                            <fo:block>1.15.1. Total Credit Notes amount</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.15.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.15.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/CreditNotesAfterPayment/TotalCreditNotesAmount/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                            <xsl:for-each select="//GlobalNotePAYIMO/CreditNotesAfterPayment/CreditNotes">
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
                                              <fo:block>1.15.2.[
                                                <xsl:value-of select="position()"/>] Credit Notes
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
                                                          <fo:block>1.15.2.1.[
                                                            <xsl:value-of select="position()"/>] Credit note amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.15.2.1.1.[
                                                            <xsl:value-of select="position()"/>] Amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="CreditNoteAmount/amount"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.15.2.1.2.[
                                                            <xsl:value-of select="position()"/>] Currency
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="CreditNoteAmount/currency"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="CreditNoteAmount/currency/value='HRK'">
                                                                  <fo:block>Croatian Kuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='CHF'">
                                                                  <fo:block>Swiss Franc</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='ISK'">
                                                                  <fo:block>Icelandic Krona</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='EUR'">
                                                                  <fo:block>Euro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='LVL'">
                                                                  <fo:block>Latvian Lats</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='DKK'">
                                                                  <fo:block>Danish Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='LTL'">
                                                                  <fo:block>Lithuanian Litas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='BGN'">
                                                                  <fo:block>Bulgarian Lev</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='NOK'">
                                                                  <fo:block>Norwegian Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='RON'">
                                                                  <fo:block>Romanian New Leu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='PLN'">
                                                                  <fo:block>Polish Zloty</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='GBP'">
                                                                  <fo:block>British Pound</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='CZK'">
                                                                  <fo:block>Czech Koruna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='HUF'">
                                                                  <fo:block>Hungarian Forint</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="CreditNoteAmount/currency/value='SEK'">
                                                                  <fo:block>Swedish Krona</fo:block>
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
                                                          <fo:block>1.15.2.2.[
                                                            <xsl:value-of select="position()"/>] References of Credit Note
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.15.2.2.1.[
                                                            <xsl:value-of select="position()"/>] null
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferencesCreditNote/originalGlobalIMOReferenceCreditorLiaisonBody"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.15.2.2.2.[
                                                            <xsl:value-of select="position()"/>] Global Reference of Credit Note
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferencesCreditNote/globalReferenceCreditNote"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.15.2.2.3.[
                                                            <xsl:value-of select="position()"/>] Individual Reference of Credit Note
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferencesCreditNote/individualReferenceCreditNote"/>
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
                            <xsl:if test="not(//GlobalNotePAYIMO/CreditNotesAfterPayment/CreditNotes)">
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block/>
                                </fo:table-cell>
                              </fo:table-row>
                            </xsl:if>
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
                                <fo:block>1.16. Former Payments</fo:block>
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
                                            <fo:block>1.16.1. Total amount of former payments</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.16.1.1. Amount</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/amount"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.16.1.2. Currency</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='HRK'">
                                                    <fo:block>Croatian Kuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='CHF'">
                                                    <fo:block>Swiss Franc</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='ISK'">
                                                    <fo:block>Icelandic Krona</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='EUR'">
                                                    <fo:block>Euro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='LVL'">
                                                    <fo:block>Latvian Lats</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='DKK'">
                                                    <fo:block>Danish Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='LTL'">
                                                    <fo:block>Lithuanian Litas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='BGN'">
                                                    <fo:block>Bulgarian Lev</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='NOK'">
                                                    <fo:block>Norwegian Krone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='RON'">
                                                    <fo:block>Romanian New Leu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='PLN'">
                                                    <fo:block>Polish Zloty</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='GBP'">
                                                    <fo:block>British Pound</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='CZK'">
                                                    <fo:block>Czech Koruna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='HUF'">
                                                    <fo:block>Hungarian Forint</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//GlobalNotePAYIMO/FormerPayments/TotalAmountFormerPayments/currency/value='SEK'">
                                                    <fo:block>Swedish Krona</fo:block>
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
                            <xsl:for-each select="//GlobalNotePAYIMO/FormerPayments/FormerPayments">
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
                                              <fo:block>1.16.2.[
                                                <xsl:value-of select="position()"/>] Former Payments
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
                                                          <fo:block>1.16.2.1.[
                                                            <xsl:value-of select="position()"/>] Former payment
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.16.2.1.1.[
                                                            <xsl:value-of select="position()"/>] Amount
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="FormerPayment/amount"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.16.2.1.2.[
                                                            <xsl:value-of select="position()"/>] Currency
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="FormerPayment/currency"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="FormerPayment/currency/value='HRK'">
                                                                  <fo:block>Croatian Kuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='CHF'">
                                                                  <fo:block>Swiss Franc</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='ISK'">
                                                                  <fo:block>Icelandic Krona</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='EUR'">
                                                                  <fo:block>Euro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='LVL'">
                                                                  <fo:block>Latvian Lats</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='DKK'">
                                                                  <fo:block>Danish Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='LTL'">
                                                                  <fo:block>Lithuanian Litas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='BGN'">
                                                                  <fo:block>Bulgarian Lev</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='NOK'">
                                                                  <fo:block>Norwegian Krone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='RON'">
                                                                  <fo:block>Romanian New Leu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='PLN'">
                                                                  <fo:block>Polish Zloty</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='GBP'">
                                                                  <fo:block>British Pound</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='CZK'">
                                                                  <fo:block>Czech Koruna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='HUF'">
                                                                  <fo:block>Hungarian Forint</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="FormerPayment/currency/value='SEK'">
                                                                  <fo:block>Swedish Krona</fo:block>
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
                                                          <fo:block>1.16.2.2.[
                                                            <xsl:value-of select="position()"/>] Reference of former payment
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.16.2.2.1.[
                                                            <xsl:value-of select="position()"/>] null
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferenceFormerPayment/originalGlobalIMOReferenceCreditorLiaisonBody"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.16.2.2.2.[
                                                            <xsl:value-of select="position()"/>] Global Reference of former payment
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferenceFormerPayment/globalReferenceFormerPayment"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.16.2.2.3.[
                                                            <xsl:value-of select="position()"/>] Individual Reference of former payment
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ReferenceFormerPayment/individualReferenceFormerPayment"/>
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
                            <xsl:if test="not(//GlobalNotePAYIMO/FormerPayments/FormerPayments)">
                              <fo:table-row>
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block/>
                                </fo:table-cell>
                              </fo:table-row>
                            </xsl:if>
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
                    <fo:block>2. Individual PAY_IMOs</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <xsl:for-each select="//IndividualPAYIMOs/IndividualPAYIMO">
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
                                  <fo:block>2.1.[
                                    <xsl:value-of select="position()"/>] Individual PAY_IMO
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
                                              <fo:block>2.1.1.[
                                                <xsl:value-of select="position()"/>] ID Creditor Institution
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.1.1.[
                                                <xsl:value-of select="position()"/>] Institution ID
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="IDCreditorInstitution/institutionID"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.1.2.[
                                                <xsl:value-of select="position()"/>] Institution Name
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="IDCreditorInstitution/institutionName"/>
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
                                              <fo:block>2.1.2.[
                                                <xsl:value-of select="position()"/>] ID Debtor Institution
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.2.1.[
                                                <xsl:value-of select="position()"/>] Institution ID
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="IDDebtorInstitution/institutionID"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.2.2.[
                                                <xsl:value-of select="position()"/>] Institution Name
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="IDDebtorInstitution/institutionName"/>
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
                                              <fo:block>2.1.3.[
                                                <xsl:value-of select="position()"/>] References
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.3.1.[
                                                <xsl:value-of select="position()"/>] Global IMO Reference Creditor Liaison Body
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="References/globalIMOReferenceCreditorLiaisonBody"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.3.2.[
                                                <xsl:value-of select="position()"/>] Global CLA_IMO Reference Creditor Liaison Body
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="References/globalCLAIMOReferenceCreditorLiaisonBody"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.3.3.[
                                                <xsl:value-of select="position()"/>] Global PAY_IMO Reference Debtor Liaison Body
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="References/globalPAYIMOReferenceDebtorLiaisonBody"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.3.4.[
                                                <xsl:value-of select="position()"/>] Individual IMO Number Creditor Liaison Body
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="References/individualIMONumberCreditorLiaisonBody"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.3.5.[
                                                <xsl:value-of select="position()"/>] Individual PAY_IMO Number Debtor Liaison Body
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="References/individualPAYIMONumberDebtorLiaisonBody"/>
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
                                                          <fo:block>2.1.3.6.[
                                                            <xsl:value-of select="position()"/>] COC_IMO References Debtor Liaison Body
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <xsl:for-each select="References/COCIMOReferencesDebtorLiaisonBody/COCIMOReferenceDebtorLiaisonBody">
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
                                                                        <fo:block>2.1.3.6.1.[
                                                                          <xsl:value-of select="position()"/>] COC_IMO Reference Debtor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                  </fo:table-header>
                                                                  <fo:table-body start-indent="2mm">
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.3.6.1.1.[
                                                                          <xsl:value-of select="position()"/>] Global COC_IMO reference Debtor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="globalCOCIMOReferenceDebtorLiaisonBody"/>
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.3.6.1.2.[
                                                                          <xsl:value-of select="position()"/>] Individual COC_IMO number Debtor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="individualCOCIMONumberDebtorLiaisonBody"/>
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
                                                      <xsl:if test="not(References/COCIMOReferencesDebtorLiaisonBody/COCIMOReferenceDebtorLiaisonBody)">
                                                        <fo:table-row>
                                                          <fo:table-cell number-columns-spanned="2">
                                                            <fo:block/>
                                                          </fo:table-cell>
                                                        </fo:table-row>
                                                      </xsl:if>
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
                                <fo:table-cell number-columns-spanned="2">
                                  <fo:block>
                                    <fo:block>
                                      <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                                        <fo:table-column column-width="45%"/>
                                        <fo:table-column column-width="53.5%"/>
                                        <fo:table-header background-color="LightGrey">
                                          <fo:table-row border="solid 0.2mm Grey">
                                            <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>2.1.4.[
                                                <xsl:value-of select="position()"/>] Person Receiving Benefits
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
                                                          <fo:block>2.1.4.1.[
                                                            <xsl:value-of select="position()"/>] Person Information
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.1.1.[
                                                            <xsl:value-of select="position()"/>] Family name(s)
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonInformation/familyName"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.1.2.[
                                                            <xsl:value-of select="position()"/>] Forename(s)
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonInformation/forename"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.1.3.[
                                                            <xsl:value-of select="position()"/>] Date of birth
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonInformation/dateBirth"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.1.4.[
                                                            <xsl:value-of select="position()"/>] Sex
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonInformation/sex"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="PersonReceivingBenefits/PersonInformation/sex/value='01'">
                                                                  <fo:block>Male</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="PersonReceivingBenefits/PersonInformation/sex/value='02'">
                                                                  <fo:block>Female</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="PersonReceivingBenefits/PersonInformation/sex/value='98'">
                                                                  <fo:block>Unknown</fo:block>
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
                                              <fo:block wrap-option="wrap">2.1.4.2.[
                                                <xsl:value-of select="position()"/>] Family name(s) at birth
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="PersonReceivingBenefits/familyNameAtBirth"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.4.3.[
                                                <xsl:value-of select="position()"/>] Forename(s) at birth
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="PersonReceivingBenefits/forenameAtBirth"/>
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
                                                          <fo:block>2.1.4.4.[
                                                            <xsl:value-of select="position()"/>] Person Identification Number
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.4.1.[
                                                            <xsl:value-of select="position()"/>] PIN of the person in Competent Member State
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonIdentificationNumber/pINPersonInCompetentMemberState"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">2.1.4.4.2.[
                                                            <xsl:value-of select="position()"/>] PIN of the person in Member State of Stay or Residence
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="PersonReceivingBenefits/PersonIdentificationNumber/pINPersonInMemberStateStayOrResidence"/>
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
                                  <fo:block wrap-option="wrap">2.1.5.[
                                    <xsl:value-of select="position()"/>] Number of months claim IMO
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="numberOfMonthsClaimIMO"/>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.1.6.[
                                    <xsl:value-of select="position()"/>] Number of months CRN_IMO
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="numberOfMonthsCRNIMO"/>
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.1.7.[
                                    <xsl:value-of select="position()"/>] Number of months COC_IMO
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="numberMonthsCOCIMO"/>
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
                                              <fo:block>2.1.8.[
                                                <xsl:value-of select="position()"/>] Total individual amount of payment IMO
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.8.1.[
                                                <xsl:value-of select="position()"/>] Amount
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="TotalIndividualAmountPaymentIMO/amount"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.8.2.[
                                                <xsl:value-of select="position()"/>] Currency
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="TotalIndividualAmountPaymentIMO/currency"/>
                                                <fo:block>
                                                  <xsl:choose>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='HRK'">
                                                      <fo:block>Croatian Kuna</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='CHF'">
                                                      <fo:block>Swiss Franc</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='ISK'">
                                                      <fo:block>Icelandic Krona</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='EUR'">
                                                      <fo:block>Euro</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='LVL'">
                                                      <fo:block>Latvian Lats</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='DKK'">
                                                      <fo:block>Danish Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='LTL'">
                                                      <fo:block>Lithuanian Litas</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='BGN'">
                                                      <fo:block>Bulgarian Lev</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='NOK'">
                                                      <fo:block>Norwegian Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='RON'">
                                                      <fo:block>Romanian New Leu</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='PLN'">
                                                      <fo:block>Polish Zloty</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='GBP'">
                                                      <fo:block>British Pound</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='CZK'">
                                                      <fo:block>Czech Koruna</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='HUF'">
                                                      <fo:block>Hungarian Forint</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountPaymentIMO/currency/value='SEK'">
                                                      <fo:block>Swedish Krona</fo:block>
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
                                              <fo:block>2.1.9.[
                                                <xsl:value-of select="position()"/>] Total individual amount of claim IMO
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.9.1.[
                                                <xsl:value-of select="position()"/>] Amount
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="TotalIndividualAmountClaimIMO/amount"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">2.1.9.2.[
                                                <xsl:value-of select="position()"/>] Currency
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="TotalIndividualAmountClaimIMO/currency"/>
                                                <fo:block>
                                                  <xsl:choose>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='HRK'">
                                                      <fo:block>Croatian Kuna</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='CHF'">
                                                      <fo:block>Swiss Franc</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='ISK'">
                                                      <fo:block>Icelandic Krona</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='EUR'">
                                                      <fo:block>Euro</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='LVL'">
                                                      <fo:block>Latvian Lats</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='DKK'">
                                                      <fo:block>Danish Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='LTL'">
                                                      <fo:block>Lithuanian Litas</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='BGN'">
                                                      <fo:block>Bulgarian Lev</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='NOK'">
                                                      <fo:block>Norwegian Krone</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='RON'">
                                                      <fo:block>Romanian New Leu</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='PLN'">
                                                      <fo:block>Polish Zloty</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='GBP'">
                                                      <fo:block>British Pound</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='CZK'">
                                                      <fo:block>Czech Koruna</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='HUF'">
                                                      <fo:block>Hungarian Forint</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="TotalIndividualAmountClaimIMO/currency/value='SEK'">
                                                      <fo:block>Swedish Krona</fo:block>
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
                                              <fo:block>2.1.10.[
                                                <xsl:value-of select="position()"/>] Credit Notes
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <xsl:for-each select="CreditNotes/CreditNote">
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
                                                            <fo:block>2.1.10.1.[
                                                              <xsl:value-of select="position()"/>] Credit Note
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
                                                                        <fo:block>2.1.10.1.1.[
                                                                          <xsl:value-of select="position()"/>] Individual Amount of Credit Note
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                  </fo:table-header>
                                                                  <fo:table-body start-indent="2mm">
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.10.1.1.1.[
                                                                          <xsl:value-of select="position()"/>] Amount
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="IndividualAmountCreditNote/amount"/>
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.10.1.1.2.[
                                                                          <xsl:value-of select="position()"/>] Currency
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="IndividualAmountCreditNote/currency"/>
                                                                          <fo:block>
                                                                            <xsl:choose>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='HRK'">
                                                                                <fo:block>Croatian Kuna</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='CHF'">
                                                                                <fo:block>Swiss Franc</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='ISK'">
                                                                                <fo:block>Icelandic Krona</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='EUR'">
                                                                                <fo:block>Euro</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='LVL'">
                                                                                <fo:block>Latvian Lats</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='DKK'">
                                                                                <fo:block>Danish Krone</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='LTL'">
                                                                                <fo:block>Lithuanian Litas</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='BGN'">
                                                                                <fo:block>Bulgarian Lev</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='NOK'">
                                                                                <fo:block>Norwegian Krone</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='RON'">
                                                                                <fo:block>Romanian New Leu</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='PLN'">
                                                                                <fo:block>Polish Zloty</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='GBP'">
                                                                                <fo:block>British Pound</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='CZK'">
                                                                                <fo:block>Czech Koruna</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='HUF'">
                                                                                <fo:block>Hungarian Forint</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountCreditNote/currency/value='SEK'">
                                                                                <fo:block>Swedish Krona</fo:block>
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
                                                                        <fo:block>2.1.10.1.2.[
                                                                          <xsl:value-of select="position()"/>] Credit Note References
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                  </fo:table-header>
                                                                  <fo:table-body start-indent="2mm">
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.10.1.2.1.[
                                                                          <xsl:value-of select="position()"/>] Global CRN_IMO Reference Creditor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="CreditNoteReferences/globalCRNIMOReferenceCreditorLiaisonBody"/>
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.10.1.2.2.[
                                                                          <xsl:value-of select="position()"/>] Individual CRN_IMO number Creditor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="CreditNoteReferences/individualCRNIMONumberCreditorLiaisonBody"/>
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
                                          <xsl:if test="not(CreditNotes/CreditNote)">
                                            <fo:table-row>
                                              <fo:table-cell number-columns-spanned="2">
                                                <fo:block/>
                                              </fo:table-cell>
                                            </fo:table-row>
                                          </xsl:if>
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
                                              <fo:block>2.1.11.[
                                                <xsl:value-of select="position()"/>] Accepted contestations
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <xsl:for-each select="AcceptedContestations/AcceptedContestation">
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
                                                            <fo:block>2.1.11.1.[
                                                              <xsl:value-of select="position()"/>] Accepted contestation
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
                                                                        <fo:block>2.1.11.1.1.[
                                                                          <xsl:value-of select="position()"/>] Individual amount of accepted contestation
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                  </fo:table-header>
                                                                  <fo:table-body start-indent="2mm">
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.11.1.1.1.[
                                                                          <xsl:value-of select="position()"/>] Amount
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="IndividualAmountAcceptedContestation/amount"/>
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.11.1.1.2.[
                                                                          <xsl:value-of select="position()"/>] Currency
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="IndividualAmountAcceptedContestation/currency"/>
                                                                          <fo:block>
                                                                            <xsl:choose>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='HRK'">
                                                                                <fo:block>Croatian Kuna</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='CHF'">
                                                                                <fo:block>Swiss Franc</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='ISK'">
                                                                                <fo:block>Icelandic Krona</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='EUR'">
                                                                                <fo:block>Euro</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='LVL'">
                                                                                <fo:block>Latvian Lats</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='DKK'">
                                                                                <fo:block>Danish Krone</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='LTL'">
                                                                                <fo:block>Lithuanian Litas</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='BGN'">
                                                                                <fo:block>Bulgarian Lev</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='NOK'">
                                                                                <fo:block>Norwegian Krone</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='RON'">
                                                                                <fo:block>Romanian New Leu</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='PLN'">
                                                                                <fo:block>Polish Zloty</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='GBP'">
                                                                                <fo:block>British Pound</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='CZK'">
                                                                                <fo:block>Czech Koruna</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='HUF'">
                                                                                <fo:block>Hungarian Forint</fo:block>
                                                                              </xsl:when>
                                                                              <xsl:when test="IndividualAmountAcceptedContestation/currency/value='SEK'">
                                                                                <fo:block>Swedish Krona</fo:block>
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
                                                                        <fo:block>2.1.11.1.2.[
                                                                          <xsl:value-of select="position()"/>] References of accepted contestation
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                  </fo:table-header>
                                                                  <fo:table-body start-indent="2mm">
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.11.1.2.1.[
                                                                          <xsl:value-of select="position()"/>] Global COC_CLA_IMO reference Debtor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="ReferencesAcceptedContestation/globalCOCCLAIMOReferenceDebtorLiaisonBody"/>
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                    </fo:table-row>
                                                                    <fo:table-row>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block wrap-option="wrap">2.1.11.1.2.2.[
                                                                          <xsl:value-of select="position()"/>] Individual COC_CLA_IMO number Debtor Liaison Body
                                                                        </fo:block>
                                                                      </fo:table-cell>
                                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                        <fo:block>
                                                                          <xsl:value-of select="ReferencesAcceptedContestation/individualCOCCLAIMONumberDebtorLiaisonBody"/>
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
                                          <xsl:if test="not(AcceptedContestations/AcceptedContestation)">
                                            <fo:table-row>
                                              <fo:table-cell number-columns-spanned="2">
                                                <fo:block/>
                                              </fo:table-cell>
                                            </fo:table-row>
                                          </xsl:if>
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
                <xsl:if test="not(//IndividualPAYIMOs/IndividualPAYIMO)">
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
