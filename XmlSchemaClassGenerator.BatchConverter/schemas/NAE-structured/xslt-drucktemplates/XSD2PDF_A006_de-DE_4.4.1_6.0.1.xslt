<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_A006_de-DE_4.4.1_6.0.1.xslt</xsl:variable>
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
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">A006 - Antwort auf Ersuchen um weitere Informationen</fo:block>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="8pt" text-align="start">A006 - Reply to Request for more information</fo:block>
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
          <fo:block font-family="Arial Unicode MS" font-size="10pt">Titel II der Verordnung (EG) Nr. 883/2004</fo:block>
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>1. Person</fo:block>
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
                                <fo:block>1.1. Identifizierung der Person</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.1. Familienname(n)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/familyName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.2. Vorname(n)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/forename"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.3. Geburtsdatum</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/dateBirth"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.4. Geschlecht</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/sex"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//Person/PersonIdentification/sex/value='01'">
                                        <fo:block>Männlich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//Person/PersonIdentification/sex/value='02'">
                                        <fo:block>Weiblich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//Person/PersonIdentification/sex/value='98'">
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
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.5. Familienname(n) bei der Geburt</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/familyNameAtBirth"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.6. Vorname(n) bei der Geburt</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/PersonIdentification/forenameAtBirth"/>
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
                                            <fo:block>1.1.7. PIN der Person bei jedem Träger</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <xsl:for-each select="//Person/PersonIdentification/PINPersonInEachInstitution/PersonalIdentificationNumber">
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
                                                          <fo:block>1.1.7.1.[
                                                            <xsl:value-of select="position()"/>] Persönliche Identifikationsnummer(n)
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.1.7.1.1.[
                                                            <xsl:value-of select="position()"/>] Land
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="country"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="country/value='DE'">
                                                                  <fo:block>Deutschland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='NO'">
                                                                  <fo:block>Norwegen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='BE'">
                                                                  <fo:block>Belgien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='FI'">
                                                                  <fo:block>Finnland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='PT'">
                                                                  <fo:block>Portugal</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='BG'">
                                                                  <fo:block>Bulgarien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='DK'">
                                                                  <fo:block>Dänemark</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='LT'">
                                                                  <fo:block>Litauen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='LU'">
                                                                  <fo:block>Luxemburg</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='HR'">
                                                                  <fo:block>Kroatien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='LV'">
                                                                  <fo:block>Lettland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='FR'">
                                                                  <fo:block>Frankreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='HU'">
                                                                  <fo:block>Ungarn</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='SE'">
                                                                  <fo:block>Schweden</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='SI'">
                                                                  <fo:block>Slowenien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='UK'">
                                                                  <fo:block>Vereinigtes Königreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='SK'">
                                                                  <fo:block>Slowakei</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='IE'">
                                                                  <fo:block>Irland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='EE'">
                                                                  <fo:block>Estland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='CH'">
                                                                  <fo:block>Schweiz</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='EL'">
                                                                  <fo:block>Griechenland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='MT'">
                                                                  <fo:block>Malta</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='IS'">
                                                                  <fo:block>Island</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='IT'">
                                                                  <fo:block>Italien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='ES'">
                                                                  <fo:block>Spanien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='AT'">
                                                                  <fo:block>Österreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='CY'">
                                                                  <fo:block>Zypern</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='CZ'">
                                                                  <fo:block>Tschechien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='PL'">
                                                                  <fo:block>Polen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='LI'">
                                                                  <fo:block>Liechtenstein</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='RO'">
                                                                  <fo:block>Rumänien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="country/value='NL'">
                                                                  <fo:block>Niederlande</fo:block>
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
                                                          <fo:block wrap-option="wrap">1.1.7.1.2.[
                                                            <xsl:value-of select="position()"/>] Persönliche Identifikationsnummer (PIN)
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="personalIdentificationNumber"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.1.7.1.3.[
                                                            <xsl:value-of select="position()"/>] Sektor
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="sector"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="sector/value='01'">
                                                                  <fo:block>Arbeitsunfälle und Berufskrankheiten</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='02'">
                                                                  <fo:block>Familienleistungen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='03'">
                                                                  <fo:block>Alle</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='04'">
                                                                  <fo:block>Renten</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='05'">
                                                                  <fo:block>Beitreibung</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='06'">
                                                                  <fo:block>Krankheit</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="sector/value='07'">
                                                                  <fo:block>Arbeitslosenleistungen</fo:block>
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
                                                                      <fo:block>1.1.7.1.4.[
                                                                        <xsl:value-of select="position()"/>] Träger
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                  </fo:table-row>
                                                                </fo:table-header>
                                                                <fo:table-body start-indent="2mm">
                                                                  <fo:table-row>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block wrap-option="wrap">1.1.7.1.4.1.[
                                                                        <xsl:value-of select="position()"/>] Träger-ID
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Institution/institutionID"/>
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                  </fo:table-row>
                                                                  <fo:table-row>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block wrap-option="wrap">1.1.7.1.4.2.[
                                                                        <xsl:value-of select="position()"/>] Name des Trägers
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Institution/institutionName"/>
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
                                        <xsl:if test="not(//Person/PersonIdentification/PINPersonInEachInstitution/PersonalIdentificationNumber)">
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
                                            <fo:block>1.1.8. Wenn nicht für jeden Träger eine PIN vorliegt, bitte folgende Angaben machen</fo:block>
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
                                                        <fo:block>1.1.8.1. Geburtsort</fo:block>
                                                      </fo:table-cell>
                                                    </fo:table-row>
                                                  </fo:table-header>
                                                  <fo:table-body start-indent="2mm">
                                                    <fo:table-row>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block wrap-option="wrap">1.1.8.1.1. Ort</fo:block>
                                                      </fo:table-cell>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block>
                                                          <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/town"/>
                                                        </fo:block>
                                                      </fo:table-cell>
                                                    </fo:table-row>
                                                    <fo:table-row>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block wrap-option="wrap">1.1.8.1.2. Region</fo:block>
                                                      </fo:table-cell>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block>
                                                          <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/region"/>
                                                        </fo:block>
                                                      </fo:table-cell>
                                                    </fo:table-row>
                                                    <fo:table-row>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block wrap-option="wrap">1.1.8.1.3. Land</fo:block>
                                                      </fo:table-cell>
                                                      <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                        <fo:block>
                                                          <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country"/>
                                                          <fo:block>
                                                            <xsl:choose>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PR'">
                                                                <fo:block>Puerto Rico</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PS'">
                                                                <fo:block>Palästina (Staat)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PT'">
                                                                <fo:block>Portugal</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PW'">
                                                                <fo:block>Palau</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PY'">
                                                                <fo:block>Paraguay</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='QA'">
                                                                <fo:block>Katar</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PCHH'">
                                                                <fo:block>Jungferninseln, Treuhandgebiet</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AD'">
                                                                <fo:block>Andorra</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AE'">
                                                                <fo:block>Vereinigte Arabische Emirate</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AF'">
                                                                <fo:block>Afghanistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AG'">
                                                                <fo:block>Antigua und Barbuda</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AI'">
                                                                <fo:block>Anguilla</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AL'">
                                                                <fo:block>Albanien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AM'">
                                                                <fo:block>Armenien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AO'">
                                                                <fo:block>Angola</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AQ'">
                                                                <fo:block>Antarktis</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AR'">
                                                                <fo:block>Argentinien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AS'">
                                                                <fo:block>Amerikanisch-Samoa</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AT'">
                                                                <fo:block>Österreich</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RE'">
                                                                <fo:block>Réunion</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AU'">
                                                                <fo:block>Australien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AW'">
                                                                <fo:block>Aruba</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AX'">
                                                                <fo:block>Ålandinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AZ'">
                                                                <fo:block>Aserbaidschan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RO'">
                                                                <fo:block>Rumänien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BA'">
                                                                <fo:block>Bosnien und Herzegowina</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BB'">
                                                                <fo:block>Barbados</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RS'">
                                                                <fo:block>Serbien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BD'">
                                                                <fo:block>Bangladesch</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BE'">
                                                                <fo:block>Belgien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RU'">
                                                                <fo:block>Russische Föderation</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BF'">
                                                                <fo:block>Burkina Faso</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='WKUM'">
                                                                <fo:block>Wake</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BG'">
                                                                <fo:block>Bulgarien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RW'">
                                                                <fo:block>Ruanda</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BH'">
                                                                <fo:block>Bahrain</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BI'">
                                                                <fo:block>Burundi</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BJ'">
                                                                <fo:block>Benin</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BL'">
                                                                <fo:block>Saint-Barthélemy</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BM'">
                                                                <fo:block>Bermuda</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BN'">
                                                                <fo:block>Brunei Darussalam</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BO'">
                                                                <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SA'">
                                                                <fo:block>Saudi-Arabien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BQ'">
                                                                <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SB'">
                                                                <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BR'">
                                                                <fo:block>Brasilien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SC'">
                                                                <fo:block>Seychellen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BS'">
                                                                <fo:block>Bahamas</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SD'">
                                                                <fo:block>Sudan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SE'">
                                                                <fo:block>Schweden</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BT'">
                                                                <fo:block>Bhutan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BV'">
                                                                <fo:block>Bouvetinsel</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SG'">
                                                                <fo:block>Singapur</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BW'">
                                                                <fo:block>Botswana</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SH'">
                                                                <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SI'">
                                                                <fo:block>Slowenien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BY'">
                                                                <fo:block>Belarus</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SJ'">
                                                                <fo:block>Svalbard und Jan Mayen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SK'">
                                                                <fo:block>Slowakei</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BZ'">
                                                                <fo:block>Belize</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SL'">
                                                                <fo:block>Sierra Leone</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SM'">
                                                                <fo:block>San Marino</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SN'">
                                                                <fo:block>Senegal</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SO'">
                                                                <fo:block>Somalia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CA'">
                                                                <fo:block>Kanada</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SR'">
                                                                <fo:block>Suriname</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CC'">
                                                                <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SS'">
                                                                <fo:block>Südsudan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CD'">
                                                                <fo:block>Kongo, Demokratische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ST'">
                                                                <fo:block>São Tomé und Príncipe</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CF'">
                                                                <fo:block>Zentralafrikanische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SV'">
                                                                <fo:block>El Salvador</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CG'">
                                                                <fo:block>Kongo</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CH'">
                                                                <fo:block>Schweiz</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SX'">
                                                                <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CI'">
                                                                <fo:block>Elfenbeinküste</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SY'">
                                                                <fo:block>Arabische Republik Syrien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SZ'">
                                                                <fo:block>Swasiland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CK'">
                                                                <fo:block>Cookinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CL'">
                                                                <fo:block>Chile</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CM'">
                                                                <fo:block>Kamerun</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CN'">
                                                                <fo:block>China</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CO'">
                                                                <fo:block>Kolumbien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CR'">
                                                                <fo:block>Costa Rica</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TC'">
                                                                <fo:block>Turks- und Caicosinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TD'">
                                                                <fo:block>Tschad</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CU'">
                                                                <fo:block>Kuba</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TF'">
                                                                <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CV'">
                                                                <fo:block>Kap Verde</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TG'">
                                                                <fo:block>Togo</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CW'">
                                                                <fo:block>Curaçao</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TH'">
                                                                <fo:block>Thailand</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CX'">
                                                                <fo:block>Weihnachtsinsel</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CY'">
                                                                <fo:block>Zypern</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TJ'">
                                                                <fo:block>Tadschikistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CZ'">
                                                                <fo:block>Tschechische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TK'">
                                                                <fo:block>Tokelau</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TL'">
                                                                <fo:block>Timor-Leste</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TM'">
                                                                <fo:block>Turkmenistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TN'">
                                                                <fo:block>Tunesien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TO'">
                                                                <fo:block>Tonga</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TR'">
                                                                <fo:block>Türkei</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GEHH'">
                                                                <fo:block>Gilbert- und Elliceinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TT'">
                                                                <fo:block>Trinidad und Tobago</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DE'">
                                                                <fo:block>Deutschland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TV'">
                                                                <fo:block>Tuvalu</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TW'">
                                                                <fo:block>Taiwan, chinesische Provinz</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DJ'">
                                                                <fo:block>Dschibuti</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TZ'">
                                                                <fo:block>Tansania, Vereinigte Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DK'">
                                                                <fo:block>Dänemark</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DM'">
                                                                <fo:block>Dominica</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DO'">
                                                                <fo:block>Dominikanische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UA'">
                                                                <fo:block>Ukraine</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UG'">
                                                                <fo:block>Uganda</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UK'">
                                                                <fo:block>Vereinigtes Königreich</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DZ'">
                                                                <fo:block>Algerien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UM'">
                                                                <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='EC'">
                                                                <fo:block>Ecuador</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='US'">
                                                                <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='EE'">
                                                                <fo:block>Estland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BQAQ'">
                                                                <fo:block>Britisches Territorium in der Antarktis</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='EG'">
                                                                <fo:block>Ägypten</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='EH'">
                                                                <fo:block>Westsahara</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UY'">
                                                                <fo:block>Uruguay</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='UZ'">
                                                                <fo:block>Usbekistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='YUCS'">
                                                                <fo:block>Jugoslawien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='EL'">
                                                                <fo:block>Griechenland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BYAA'">
                                                                <fo:block>Weißrussische Sozialistische Sowjetrepublik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VA'">
                                                                <fo:block>Heiliger Stuhl</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ER'">
                                                                <fo:block>Eritrea</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VC'">
                                                                <fo:block>St. Vincent und die Grenadinen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ES'">
                                                                <fo:block>Spanien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ET'">
                                                                <fo:block>Äthiopien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VE'">
                                                                <fo:block>Venezuela, Bolivarische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='AIDJ'">
                                                                <fo:block>Französisches Afar- und Issa-Territorium</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VG'">
                                                                <fo:block>Jungferninseln, Britische</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VI'">
                                                                <fo:block>Jungferninseln, Amerikanische</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VN'">
                                                                <fo:block>Vietnam</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VU'">
                                                                <fo:block>Vanuatu</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FI'">
                                                                <fo:block>Finnland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FJ'">
                                                                <fo:block>Fidschi</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FK'">
                                                                <fo:block>Falklandinseln (Malwinen)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SUHH'">
                                                                <fo:block>UdSSR</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FM'">
                                                                <fo:block>Mikronesien, Föderierte Staaten von</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FO'">
                                                                <fo:block>Färöer</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FR'">
                                                                <fo:block>Frankreich</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='WF'">
                                                                <fo:block>Wallis und Futuna</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GA'">
                                                                <fo:block>Gabun</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='WS'">
                                                                <fo:block>Samoa</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GD'">
                                                                <fo:block>Grenada</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GE'">
                                                                <fo:block>Georgien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GF'">
                                                                <fo:block>Französisch-Guayana</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GG'">
                                                                <fo:block>Guernsey</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GH'">
                                                                <fo:block>Ghana</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GI'">
                                                                <fo:block>Gibraltar</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GL'">
                                                                <fo:block>Grönland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GM'">
                                                                <fo:block>Gambia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GN'">
                                                                <fo:block>Guinea</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GP'">
                                                                <fo:block>Guadeloupe</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GQ'">
                                                                <fo:block>Äquatorialguinea</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GS'">
                                                                <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GT'">
                                                                <fo:block>Guatemala</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GU'">
                                                                <fo:block>Guam</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GW'">
                                                                <fo:block>Guinea-Bissau</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='GY'">
                                                                <fo:block>Guyana</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='XK'">
                                                                <fo:block>Kosovo</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HK'">
                                                                <fo:block>Hongkong</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HM'">
                                                                <fo:block>Heard und die McDonaldinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HN'">
                                                                <fo:block>Honduras</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HR'">
                                                                <fo:block>Kroatien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HT'">
                                                                <fo:block>Haiti</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='YE'">
                                                                <fo:block>Jemen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HU'">
                                                                <fo:block>Ungarn</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MIUM'">
                                                                <fo:block>Midwayinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NQAQ'">
                                                                <fo:block>Königin-Maud-Land</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ID'">
                                                                <fo:block>Indonesien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='YT'">
                                                                <fo:block>Mayotte</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IE'">
                                                                <fo:block>Irland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DDDE'">
                                                                <fo:block>Deutsche Demokratische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IL'">
                                                                <fo:block>Israel</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IM'">
                                                                <fo:block>Isle of Man</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IN'">
                                                                <fo:block>Indien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IO'">
                                                                <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ZA'">
                                                                <fo:block>Südafrika</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IQ'">
                                                                <fo:block>Irak</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IR'">
                                                                <fo:block>Iran, Islamische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IS'">
                                                                <fo:block>Island</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FQHH'">
                                                                <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='IT'">
                                                                <fo:block>Italien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='BUMM'">
                                                                <fo:block>Burma</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ZM'">
                                                                <fo:block>Sambia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='JE'">
                                                                <fo:block>Jersey</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ZW'">
                                                                <fo:block>Simbabwe</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='FXFR'">
                                                                <fo:block>Metropolitan-Frankreich</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='JTUM'">
                                                                <fo:block>Johnston-Atoll</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='JM'">
                                                                <fo:block>Jamaika</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='JO'">
                                                                <fo:block>Jordanien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='JP'">
                                                                <fo:block>Japan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KE'">
                                                                <fo:block>Kenia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='SKIN'">
                                                                <fo:block>Sikkim</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KG'">
                                                                <fo:block>Kirgisistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KH'">
                                                                <fo:block>Kambodscha</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KI'">
                                                                <fo:block>Kiribati</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PZPA'">
                                                                <fo:block>Panamakanalzone</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KM'">
                                                                <fo:block>Komoren</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NTHH'">
                                                                <fo:block>Neutrale Zone</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KN'">
                                                                <fo:block>St. Kitts und Nevis</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KP'">
                                                                <fo:block>Korea, demokratische Volksrepublik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KR'">
                                                                <fo:block>Korea, Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KW'">
                                                                <fo:block>Kuwait</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KY'">
                                                                <fo:block>Cayman Islands</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='KZ'">
                                                                <fo:block>Kasachstan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CSHH'">
                                                                <fo:block>Tschechoslowakei</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CSXX'">
                                                                <fo:block>Serbien und Montenegro</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LA'">
                                                                <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LB'">
                                                                <fo:block>Libanon</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LC'">
                                                                <fo:block>St. Lucia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PUUM'">
                                                                <fo:block>Sonstige US-Pazifik-Inseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LI'">
                                                                <fo:block>Liechtenstein</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='YDYE'">
                                                                <fo:block>Demokratische Volksrepublik Jemen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LK'">
                                                                <fo:block>Sri Lanka</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LR'">
                                                                <fo:block>Liberia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LS'">
                                                                <fo:block>Lesotho</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LT'">
                                                                <fo:block>Litauen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LU'">
                                                                <fo:block>Luxemburg</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LV'">
                                                                <fo:block>Lettland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='LY'">
                                                                <fo:block>Libyen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='CTKI'">
                                                                <fo:block>Die Inseln Canton und Enderbury</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MA'">
                                                                <fo:block>Marokko</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MC'">
                                                                <fo:block>Monaco</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MD'">
                                                                <fo:block>MOLDAWIEN, Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ME'">
                                                                <fo:block>Montenegro</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MF'">
                                                                <fo:block>St. Martin (französischer Teil)</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MG'">
                                                                <fo:block>Madagaskar</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MH'">
                                                                <fo:block>Marshallinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MK'">
                                                                <fo:block>Mazedonien, ehemalige jugoslawische Republik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ML'">
                                                                <fo:block>Mali</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MM'">
                                                                <fo:block>Myanmar</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MN'">
                                                                <fo:block>Mongolei</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MO'">
                                                                <fo:block>Macau</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MP'">
                                                                <fo:block>Nördliche Marianen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MQ'">
                                                                <fo:block>Martinique</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MR'">
                                                                <fo:block>Mauretanien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MS'">
                                                                <fo:block>Montserrat</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MT'">
                                                                <fo:block>Malta</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MU'">
                                                                <fo:block>Mauritius</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MV'">
                                                                <fo:block>Malediven</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MW'">
                                                                <fo:block>Malawi</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MX'">
                                                                <fo:block>Mexiko</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MY'">
                                                                <fo:block>Malaysia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='MZ'">
                                                                <fo:block>Mosambik</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NA'">
                                                                <fo:block>Namibia</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ZRCD'">
                                                                <fo:block>Zaire</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NC'">
                                                                <fo:block>Neukaledonien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NE'">
                                                                <fo:block>Niger</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NF'">
                                                                <fo:block>Norfolkinseln</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NG'">
                                                                <fo:block>Nigeria</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NI'">
                                                                <fo:block>Nicaragua</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='DYBJ'">
                                                                <fo:block>Dahomey</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NL'">
                                                                <fo:block>Niederlande</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NO'">
                                                                <fo:block>Norwegen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NP'">
                                                                <fo:block>Nepal</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NR'">
                                                                <fo:block>Nauru</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NU'">
                                                                <fo:block>Niue</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NZ'">
                                                                <fo:block>Neuseeland</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='VDVN'">
                                                                <fo:block>Demokratische Republik Vietnam</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='TPTL'">
                                                                <fo:block>Osttimor</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='RHZW'">
                                                                <fo:block>Südrhodesien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='NHVU'">
                                                                <fo:block>Kondominium Neue Hebriden</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='OM'">
                                                                <fo:block>Oman</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='HVBF'">
                                                                <fo:block>Obervolta</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PA'">
                                                                <fo:block>Panama</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='ANHH'">
                                                                <fo:block>Niederländische Antillen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PE'">
                                                                <fo:block>Peru</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PF'">
                                                                <fo:block>Französisch-Polynesien</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PG'">
                                                                <fo:block>Papua-Neuguinea</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PH'">
                                                                <fo:block>Philippinen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PK'">
                                                                <fo:block>Pakistan</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PL'">
                                                                <fo:block>Polen</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PM'">
                                                                <fo:block>St. Pierre und Miquelon</fo:block>
                                                              </xsl:when>
                                                              <xsl:when test="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/PlaceBirth/country/value='PN'">
                                                                <fo:block>Pitcairninseln</fo:block>
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
                                            <fo:block wrap-option="wrap">1.1.8.2. Geburtsname des Vaters</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/fatherFamilyNameAtBirth"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.1.8.3. Vorname des Vaters</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/forenameFather"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.1.8.4. Geburtsname der Mutter</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/motherFamilyNameAtBirth"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.1.8.5. Vorname der Mutter</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//Person/PersonIdentification/IfPINNotProvidedForEveryInstitutionPleaseProvide/forenameMother"/>
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
                                <fo:block>1.2. Zusätzliche Angaben zur Person</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.2.1. Staatsangehörigkeit</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//Person/AdditionalInformationPerson/nationality"/>
                                  <fo:block>
                                    <xsl:for-each select="//Person/AdditionalInformationPerson/nationality/value">
                                      <xsl:choose>
                                        <xsl:when test=".='PS'">
                                          <fo:block>Palästina (Staat)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PT'">
                                          <fo:block>Portugal</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PW'">
                                          <fo:block>Palau</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PY'">
                                          <fo:block>Paraguay</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='QA'">
                                          <fo:block>Katar</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PCHH'">
                                          <fo:block>Jungferninseln, Treuhandgebiet</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AD'">
                                          <fo:block>Andorra</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AE'">
                                          <fo:block>Vereinigte Arabische Emirate</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AF'">
                                          <fo:block>Afghanistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AG'">
                                          <fo:block>Antigua und Barbuda</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AL'">
                                          <fo:block>Albanien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AM'">
                                          <fo:block>Armenien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AO'">
                                          <fo:block>Angola</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AR'">
                                          <fo:block>Argentinien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AT'">
                                          <fo:block>Österreich</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AU'">
                                          <fo:block>Australien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AZ'">
                                          <fo:block>Aserbaidschan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='RO'">
                                          <fo:block>Rumänien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BA'">
                                          <fo:block>Bosnien und Herzegowina</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BB'">
                                          <fo:block>Barbados</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='RS'">
                                          <fo:block>Serbien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BD'">
                                          <fo:block>Bangladesch</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BE'">
                                          <fo:block>Belgien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='RU'">
                                          <fo:block>Russische Föderation</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BF'">
                                          <fo:block>Burkina Faso</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='WKUM'">
                                          <fo:block>Wake</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BG'">
                                          <fo:block>Bulgarien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='RW'">
                                          <fo:block>Ruanda</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BH'">
                                          <fo:block>Bahrain</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BI'">
                                          <fo:block>Burundi</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BJ'">
                                          <fo:block>Benin</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BN'">
                                          <fo:block>Brunei Darussalam</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BO'">
                                          <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SA'">
                                          <fo:block>Saudi-Arabien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SB'">
                                          <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BR'">
                                          <fo:block>Brasilien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SC'">
                                          <fo:block>Seychellen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BS'">
                                          <fo:block>Bahamas</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SD'">
                                          <fo:block>Sudan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SE'">
                                          <fo:block>Schweden</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BT'">
                                          <fo:block>Bhutan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SG'">
                                          <fo:block>Singapur</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BW'">
                                          <fo:block>Botswana</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SI'">
                                          <fo:block>Slowenien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BY'">
                                          <fo:block>Belarus</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SK'">
                                          <fo:block>Slowakei</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BZ'">
                                          <fo:block>Belize</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SL'">
                                          <fo:block>Sierra Leone</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SM'">
                                          <fo:block>San Marino</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SN'">
                                          <fo:block>Senegal</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SO'">
                                          <fo:block>Somalia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CA'">
                                          <fo:block>Kanada</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SR'">
                                          <fo:block>Suriname</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SS'">
                                          <fo:block>Südsudan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CD'">
                                          <fo:block>Kongo, Demokratische Republik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ST'">
                                          <fo:block>São Tomé und Príncipe</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CF'">
                                          <fo:block>Zentralafrikanische Republik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SV'">
                                          <fo:block>El Salvador</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CG'">
                                          <fo:block>Kongo</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CH'">
                                          <fo:block>Schweiz</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CI'">
                                          <fo:block>Elfenbeinküste</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SY'">
                                          <fo:block>Arabische Republik Syrien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SZ'">
                                          <fo:block>Swasiland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CL'">
                                          <fo:block>Chile</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CM'">
                                          <fo:block>Kamerun</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CN'">
                                          <fo:block>China</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CO'">
                                          <fo:block>Kolumbien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CR'">
                                          <fo:block>Costa Rica</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TD'">
                                          <fo:block>Tschad</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CU'">
                                          <fo:block>Kuba</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CV'">
                                          <fo:block>Kap Verde</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TG'">
                                          <fo:block>Togo</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TH'">
                                          <fo:block>Thailand</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CY'">
                                          <fo:block>Zypern</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TJ'">
                                          <fo:block>Tadschikistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CZ'">
                                          <fo:block>Tschechien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TL'">
                                          <fo:block>Timor-Leste</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TM'">
                                          <fo:block>Turkmenistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TN'">
                                          <fo:block>Tunesien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TO'">
                                          <fo:block>Tonga</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TR'">
                                          <fo:block>Türkei</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GEHH'">
                                          <fo:block>Gilbert- und Elliceinseln</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TT'">
                                          <fo:block>Trinidad und Tobago</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DE'">
                                          <fo:block>Deutschland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TV'">
                                          <fo:block>Tuvalu</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DJ'">
                                          <fo:block>Dschibuti</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TZ'">
                                          <fo:block>Tansania, Vereinigte Republik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DK'">
                                          <fo:block>Dänemark</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DM'">
                                          <fo:block>Dominica</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DO'">
                                          <fo:block>Dominikanische Republik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='UA'">
                                          <fo:block>Ukraine</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='UG'">
                                          <fo:block>Uganda</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='UK'">
                                          <fo:block>Vereinigtes Königreich</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DZ'">
                                          <fo:block>Algerien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='EC'">
                                          <fo:block>Ecuador</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='US'">
                                          <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='EE'">
                                          <fo:block>Estland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BQAQ'">
                                          <fo:block>Britisches Territorium in der Antarktis</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='EG'">
                                          <fo:block>Ägypten</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='UY'">
                                          <fo:block>Uruguay</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='UZ'">
                                          <fo:block>Usbekistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='YUCS'">
                                          <fo:block>Jugoslawien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='EL'">
                                          <fo:block>Griechenland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BYAA'">
                                          <fo:block>Weißrussische Sozialistische Sowjetrepublik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VA'">
                                          <fo:block>Heiliger Stuhl</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ER'">
                                          <fo:block>Eritrea</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VC'">
                                          <fo:block>St. Vincent und die Grenadinen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ES'">
                                          <fo:block>Spanien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ET'">
                                          <fo:block>Äthiopien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VE'">
                                          <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='AIDJ'">
                                          <fo:block>Französisches Afar- und Issa-Territorium</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VN'">
                                          <fo:block>Vietnam</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VU'">
                                          <fo:block>Vanuatu</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FI'">
                                          <fo:block>Finnland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FJ'">
                                          <fo:block>Fidschi</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SUHH'">
                                          <fo:block>UdSSR</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FM'">
                                          <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FR'">
                                          <fo:block>Frankreich</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GA'">
                                          <fo:block>Gabun</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='WS'">
                                          <fo:block>Samoa</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GD'">
                                          <fo:block>Grenada</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GE'">
                                          <fo:block>Georgien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GH'">
                                          <fo:block>Ghana</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GM'">
                                          <fo:block>Gambia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GN'">
                                          <fo:block>Guinea</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GQ'">
                                          <fo:block>Äquatorialguinea</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GT'">
                                          <fo:block>Guatemala</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GW'">
                                          <fo:block>Guinea-Bissau</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='GY'">
                                          <fo:block>Guyana</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='XK'">
                                          <fo:block>Kosovo</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='XR'">
                                          <fo:block>Flüchtling</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='XS'">
                                          <fo:block>Staatenlose Person</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='XU'">
                                          <fo:block>Nicht bekannt</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='HN'">
                                          <fo:block>Honduras</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='HR'">
                                          <fo:block>Kroatien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='HT'">
                                          <fo:block>Haiti</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='YE'">
                                          <fo:block>Jemen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='HU'">
                                          <fo:block>Ungarn</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MIUM'">
                                          <fo:block>Midwayinseln</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NQAQ'">
                                          <fo:block>Königin-Maud-Land</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ID'">
                                          <fo:block>Indonesien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IE'">
                                          <fo:block>Irland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DDDE'">
                                          <fo:block>Deutsche Demokratische Republik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IL'">
                                          <fo:block>Israel</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IN'">
                                          <fo:block>Indien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ZA'">
                                          <fo:block>Südafrika</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IQ'">
                                          <fo:block>Irak</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IR'">
                                          <fo:block>Iran (Islamische Republik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IS'">
                                          <fo:block>Island</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FQHH'">
                                          <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='IT'">
                                          <fo:block>Italien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='BUMM'">
                                          <fo:block>Burma</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ZM'">
                                          <fo:block>Sambia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ZW'">
                                          <fo:block>Simbabwe</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='FXFR'">
                                          <fo:block>Metropolitan-Frankreich</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='JTUM'">
                                          <fo:block>Johnston-Atoll</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='JM'">
                                          <fo:block>Jamaika</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='JO'">
                                          <fo:block>Jordanien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='JP'">
                                          <fo:block>Japan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KE'">
                                          <fo:block>Kenia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='SKIN'">
                                          <fo:block>Sikkim</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KG'">
                                          <fo:block>Kirgisistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KH'">
                                          <fo:block>Kambodscha</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KI'">
                                          <fo:block>Kiribati</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PZPA'">
                                          <fo:block>Panamakanalzone</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KM'">
                                          <fo:block>Komoren</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NTHH'">
                                          <fo:block>Neutrale Zone</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KN'">
                                          <fo:block>St. Kitts und Nevis</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KP'">
                                          <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KR'">
                                          <fo:block>Korea (Republik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KW'">
                                          <fo:block>Kuwait</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='KZ'">
                                          <fo:block>Kasachstan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CSHH'">
                                          <fo:block>Tschechoslowakei</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CSXX'">
                                          <fo:block>Serbien und Montenegro</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LA'">
                                          <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LB'">
                                          <fo:block>Libanon</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LC'">
                                          <fo:block>St. Lucia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PUUM'">
                                          <fo:block>Sonstige US-Pazifik-Inseln</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LI'">
                                          <fo:block>Liechtenstein</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='YDYE'">
                                          <fo:block>Demokratische Volksrepublik Jemen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LK'">
                                          <fo:block>Sri Lanka</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LR'">
                                          <fo:block>Liberia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LS'">
                                          <fo:block>Lesotho</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LT'">
                                          <fo:block>Litauen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LU'">
                                          <fo:block>Luxemburg</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LV'">
                                          <fo:block>Lettland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='LY'">
                                          <fo:block>Libyen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='CTKI'">
                                          <fo:block>Die Inseln Canton und Enderbury</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MA'">
                                          <fo:block>Marokko</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MC'">
                                          <fo:block>Monaco</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MD'">
                                          <fo:block>Moldawien (Republik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ME'">
                                          <fo:block>Montenegro</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MG'">
                                          <fo:block>Madagaskar</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MH'">
                                          <fo:block>Marshallinseln</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MK'">
                                          <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ML'">
                                          <fo:block>Mali</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MM'">
                                          <fo:block>Myanmar</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MN'">
                                          <fo:block>Mongolei</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MR'">
                                          <fo:block>Mauretanien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MT'">
                                          <fo:block>Malta</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MU'">
                                          <fo:block>Mauritius</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MV'">
                                          <fo:block>Malediven</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MW'">
                                          <fo:block>Malawi</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MX'">
                                          <fo:block>Mexiko</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MY'">
                                          <fo:block>Malaysia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='MZ'">
                                          <fo:block>Mosambik</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NA'">
                                          <fo:block>Namibia</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ZRCD'">
                                          <fo:block>Zaire</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NE'">
                                          <fo:block>Niger</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NG'">
                                          <fo:block>Nigeria</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NI'">
                                          <fo:block>Nicaragua</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='DYBJ'">
                                          <fo:block>Dahomey</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NL'">
                                          <fo:block>Niederlande</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NO'">
                                          <fo:block>Norwegen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NP'">
                                          <fo:block>Nepal</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NR'">
                                          <fo:block>Nauru</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NZ'">
                                          <fo:block>Neuseeland</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='VDVN'">
                                          <fo:block>Demokratische Republik Vietnam</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='TPTL'">
                                          <fo:block>Osttimor</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='RHZW'">
                                          <fo:block>Südrhodesien</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='NHVU'">
                                          <fo:block>Kondominium Neue Hebriden</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='OM'">
                                          <fo:block>Oman</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='HVBF'">
                                          <fo:block>Obervolta</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PA'">
                                          <fo:block>Panama</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='ANHH'">
                                          <fo:block>Niederländische Antillen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PE'">
                                          <fo:block>Peru</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PG'">
                                          <fo:block>Papua-Neuguinea</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PH'">
                                          <fo:block>Philippinen</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PK'">
                                          <fo:block>Pakistan</fo:block>
                                        </xsl:when>
                                        <xsl:when test=".='PL'">
                                          <fo:block>Polen</fo:block>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <fo:block>-/-</fo:block>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </xsl:for-each>
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
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>2. Weitere Informationen zu Sachverhalten, die unter folgenden Artikel (Verordnung (EG) Nr. 883/2004 und Verordnung (EG) Nr. 987/2009) fallen, erbeten.</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">2.1. Weitere Informationen zu Sachverhalten, die unter folgenden Artikel fallen, erbeten</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationRequestedForSituationsCovered/moreInformationRequestedForSituationsCoveredByArticle"/>
                      <fo:block>
                        <xsl:for-each select="//MoreInformationRequestedForSituationsCovered/moreInformationRequestedForSituationsCoveredByArticle/value">
                          <xsl:choose>
                            <xsl:when test=".='11'">
                              <fo:block>Artikel 15</fo:block>
                            </xsl:when>
                            <xsl:when test=".='99'">
                              <fo:block>Sonstiges</fo:block>
                            </xsl:when>
                            <xsl:when test=".='01'">
                              <fo:block>Artikel 11 Absatz 2</fo:block>
                            </xsl:when>
                            <xsl:when test=".='12'">
                              <fo:block>Artikel 16</fo:block>
                            </xsl:when>
                            <xsl:when test=".='02'">
                              <fo:block>Artikel 11 Absatz 3 Buchstabe a</fo:block>
                            </xsl:when>
                            <xsl:when test=".='13'">
                              <fo:block>Artikel 87 Absatz 8</fo:block>
                            </xsl:when>
                            <xsl:when test=".='03'">
                              <fo:block>Artikel 11 Absatz 4</fo:block>
                            </xsl:when>
                            <xsl:when test=".='14'">
                              <fo:block>Artikel 87a</fo:block>
                            </xsl:when>
                            <xsl:when test=".='04'">
                              <fo:block>Artikel 11 Absatz 5</fo:block>
                            </xsl:when>
                            <xsl:when test=".='15'">
                              <fo:block>Artikel 14 Absatz 11 VO 987/2009</fo:block>
                            </xsl:when>
                            <xsl:when test=".='05'">
                              <fo:block>Artikel 12 Absatz 1</fo:block>
                            </xsl:when>
                            <xsl:when test=".='06'">
                              <fo:block>Artikel 12 Absatz 2</fo:block>
                            </xsl:when>
                            <xsl:when test=".='07'">
                              <fo:block>Artikel 13 Absatz 1</fo:block>
                            </xsl:when>
                            <xsl:when test=".='08'">
                              <fo:block>Artikel 13 Absatz 2</fo:block>
                            </xsl:when>
                            <xsl:when test=".='09'">
                              <fo:block>Artikel 13 Absatz 3</fo:block>
                            </xsl:when>
                            <xsl:when test=".='10'">
                              <fo:block>Artikel 13 Absatz 4</fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                              <fo:block>-/-</fo:block>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                      </fo:block>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">2.2. Sonstiges</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationRequestedForSituationsCovered/other"/>
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
                    <fo:block>3. Weitere Informationen zu Artikel 11 Absatz 2</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <xsl:for-each select="//MoreInformationFor112/KindBenefitsPaid">
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
                                  <fo:block>3.1.[
                                    <xsl:value-of select="position()"/>] Art der gezahlten Leistungen
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                            </fo:table-header>
                            <fo:table-body start-indent="2mm">
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">3.1.1.[
                                    <xsl:value-of select="position()"/>] Gezahlte Leistungen
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="benefitsPaid"/>
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
                <xsl:if test="not(//MoreInformationFor112/KindBenefitsPaid)">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block/>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
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
                                <fo:block>3.2. Zahlungszeitraum</fo:block>
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
                                            <fo:block>3.2.1. Feststehender Zeitraum</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">3.2.1.1. Datum Beginn</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor112/PeriodPayment/FixedPeriod/startDate"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">3.2.1.2. Datum Ende</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor112/PeriodPayment/FixedPeriod/endDate"/>
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
                                            <fo:block>3.2.2. Offener Zeitraum</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">3.2.2.1. Art des offenen Zeitraums</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor112/PeriodPayment/OpenPeriod/typeOpenPeriod"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//MoreInformationFor112/PeriodPayment/OpenPeriod/typeOpenPeriod/value='01'">
                                                    <fo:block>Unbefristeter Zeitraum</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor112/PeriodPayment/OpenPeriod/typeOpenPeriod/value='98'">
                                                    <fo:block>Ende des Zeitraums ist nicht bekannt.</fo:block>
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
                                            <fo:block wrap-option="wrap">3.2.2.2. Datum Beginn</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor112/PeriodPayment/OpenPeriod/startDate"/>
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
                                <fo:block>3.3. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">3.3.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor112/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>4. Weitere Informationen zu Artikel 11 Absatz 3 Buchstabe a</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <xsl:for-each select="//MoreInformationFor113a/MoreInformationFor113a">
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
                                  <fo:block>4.1.[
                                    <xsl:value-of select="position()"/>] Weitere Informationen zu Artikel 11 Absatz 3 Buchstabe a
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
                                              <fo:block>4.1.1.[
                                                <xsl:value-of select="position()"/>] Anwendbare Rechtsvorschriften - Zeitraum
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
                                                          <fo:block>4.1.1.1.[
                                                            <xsl:value-of select="position()"/>] Feststehender Zeitraum
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">4.1.1.1.1.[
                                                            <xsl:value-of select="position()"/>] Datum Beginn
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ApplicableLegislationPeriod/FixedPeriod/startDate"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">4.1.1.1.2.[
                                                            <xsl:value-of select="position()"/>] Datum Ende
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ApplicableLegislationPeriod/FixedPeriod/endDate"/>
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
                                                          <fo:block>4.1.1.2.[
                                                            <xsl:value-of select="position()"/>] Offener Zeitraum
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">4.1.1.2.1.[
                                                            <xsl:value-of select="position()"/>] Art des offenen Zeitraums
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ApplicableLegislationPeriod/OpenPeriod/typeOpenPeriod"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="ApplicableLegislationPeriod/OpenPeriod/typeOpenPeriod/value='01'">
                                                                  <fo:block>Unbefristeter Zeitraum</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="ApplicableLegislationPeriod/OpenPeriod/typeOpenPeriod/value='98'">
                                                                  <fo:block>Ende des Zeitraums ist nicht bekannt.</fo:block>
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
                                                          <fo:block wrap-option="wrap">4.1.1.2.2.[
                                                            <xsl:value-of select="position()"/>] Datum Beginn
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="ApplicableLegislationPeriod/OpenPeriod/startDate"/>
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
                              <xsl:for-each select="StatusPerson">
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
                                                <fo:block>4.1.2.[
                                                  <xsl:value-of select="position()"/>] Status der Person
                                                </fo:block>
                                              </fo:table-cell>
                                            </fo:table-row>
                                          </fo:table-header>
                                          <fo:table-body start-indent="2mm">
                                            <fo:table-row>
                                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                <fo:block wrap-option="wrap">4.1.2.1.[
                                                  <xsl:value-of select="position()"/>] Status der Person
                                                </fo:block>
                                              </fo:table-cell>
                                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                <fo:block>
                                                  <xsl:value-of select="statusPerson"/>
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
                              <xsl:if test="not(StatusPerson)">
                                <fo:table-row>
                                  <fo:table-cell number-columns-spanned="2">
                                    <fo:block/>
                                  </fo:table-cell>
                                </fo:table-row>
                              </xsl:if>
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
                                              <fo:block>4.1.3.[
                                                <xsl:value-of select="position()"/>] Zusätzliche Informationen
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.1.3.1.[
                                                <xsl:value-of select="position()"/>] Zusätzliche Informationen
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="AdditionalInformation/additionalInformation"/>
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
                <xsl:if test="not(//MoreInformationFor113a/MoreInformationFor113a)">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block/>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
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
                    <fo:block>5. Weitere Informationen zu Artikel 11 Absätze 4 und 5</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">5.1. Flaggenstaat/Heimatbasis</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor114115/flagStateHomeBase"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PR'">
                            <fo:block>Puerto Rico</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PS'">
                            <fo:block>Palästina (Staat)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PT'">
                            <fo:block>Portugal</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PW'">
                            <fo:block>Palau</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PY'">
                            <fo:block>Paraguay</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='QA'">
                            <fo:block>Katar</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AD'">
                            <fo:block>Andorra</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AE'">
                            <fo:block>Vereinigte Arabische Emirate</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AF'">
                            <fo:block>Afghanistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AG'">
                            <fo:block>Antigua und Barbuda</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AI'">
                            <fo:block>Anguilla</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AL'">
                            <fo:block>Albanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AM'">
                            <fo:block>Armenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AO'">
                            <fo:block>Angola</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AQ'">
                            <fo:block>Antarktis</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AR'">
                            <fo:block>Argentinien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AS'">
                            <fo:block>Amerikanisch-Samoa</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AT'">
                            <fo:block>Österreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='RE'">
                            <fo:block>Réunion</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AU'">
                            <fo:block>Australien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AW'">
                            <fo:block>Aruba</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AX'">
                            <fo:block>Ålandinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='AZ'">
                            <fo:block>Aserbaidschan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='RO'">
                            <fo:block>Rumänien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BA'">
                            <fo:block>Bosnien und Herzegowina</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BB'">
                            <fo:block>Barbados</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='RS'">
                            <fo:block>Serbien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BD'">
                            <fo:block>Bangladesch</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BE'">
                            <fo:block>Belgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='RU'">
                            <fo:block>Russische Föderation</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BF'">
                            <fo:block>Burkina Faso</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BG'">
                            <fo:block>Bulgarien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='RW'">
                            <fo:block>Ruanda</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BH'">
                            <fo:block>Bahrain</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BI'">
                            <fo:block>Burundi</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BJ'">
                            <fo:block>Benin</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BL'">
                            <fo:block>Saint-Barthélemy</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BM'">
                            <fo:block>Bermuda</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BN'">
                            <fo:block>Brunei Darussalam</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BO'">
                            <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SA'">
                            <fo:block>Saudi-Arabien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BQ'">
                            <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SB'">
                            <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BR'">
                            <fo:block>Brasilien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SC'">
                            <fo:block>Seychellen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BS'">
                            <fo:block>Bahamas</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SD'">
                            <fo:block>Sudan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SE'">
                            <fo:block>Schweden</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BT'">
                            <fo:block>Bhutan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BV'">
                            <fo:block>Bouvetinsel</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SG'">
                            <fo:block>Singapur</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BW'">
                            <fo:block>Botswana</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SH'">
                            <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SI'">
                            <fo:block>Slowenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BY'">
                            <fo:block>Belarus</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SJ'">
                            <fo:block>Svalbard und Jan Mayen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SK'">
                            <fo:block>Slowakei</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='BZ'">
                            <fo:block>Belize</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SL'">
                            <fo:block>Sierra Leone</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SM'">
                            <fo:block>San Marino</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SN'">
                            <fo:block>Senegal</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SO'">
                            <fo:block>Somalia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CA'">
                            <fo:block>Kanada</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SR'">
                            <fo:block>Suriname</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CC'">
                            <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SS'">
                            <fo:block>Südsudan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CD'">
                            <fo:block>Kongo, Demokratische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ST'">
                            <fo:block>São Tomé und Príncipe</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CF'">
                            <fo:block>Zentralafrikanische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SV'">
                            <fo:block>El Salvador</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CG'">
                            <fo:block>Kongo</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CH'">
                            <fo:block>Schweiz</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SX'">
                            <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CI'">
                            <fo:block>Côte d'Ivoire</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SY'">
                            <fo:block>Arabische Republik Syrien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='SZ'">
                            <fo:block>Swasiland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CK'">
                            <fo:block>Cookinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CL'">
                            <fo:block>Chile</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CM'">
                            <fo:block>Kamerun</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CN'">
                            <fo:block>China</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CO'">
                            <fo:block>Kolumbien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CR'">
                            <fo:block>Costa Rica</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TC'">
                            <fo:block>Turks- und Caicosinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TD'">
                            <fo:block>Tschad</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CU'">
                            <fo:block>Kuba</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TF'">
                            <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CV'">
                            <fo:block>Kap Verde</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TG'">
                            <fo:block>Togo</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CW'">
                            <fo:block>Curaçao</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TH'">
                            <fo:block>Thailand</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CX'">
                            <fo:block>Weihnachtsinsel</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CY'">
                            <fo:block>Zypern</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TJ'">
                            <fo:block>Tadschikistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='CZ'">
                            <fo:block>Tschechien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TK'">
                            <fo:block>Tokelau</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TL'">
                            <fo:block>Timor-Leste</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TM'">
                            <fo:block>Turkmenistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TN'">
                            <fo:block>Tunesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TO'">
                            <fo:block>Tonga</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TR'">
                            <fo:block>Türkei</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TT'">
                            <fo:block>Trinidad und Tobago</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DE'">
                            <fo:block>Deutschland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TV'">
                            <fo:block>Tuvalu</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TW'">
                            <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DJ'">
                            <fo:block>Dschibuti</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='TZ'">
                            <fo:block>Tansania, Vereinigte Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DK'">
                            <fo:block>Dänemark</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DM'">
                            <fo:block>Dominica</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DO'">
                            <fo:block>Dominikanische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UA'">
                            <fo:block>Ukraine</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UG'">
                            <fo:block>Uganda</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UK'">
                            <fo:block>Vereinigtes Königreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='DZ'">
                            <fo:block>Algerien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UM'">
                            <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='EC'">
                            <fo:block>Ecuador</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='US'">
                            <fo:block>Vereinigte Staaten von Amerika</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='EE'">
                            <fo:block>Estland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='EG'">
                            <fo:block>Ägypten</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='EH'">
                            <fo:block>Westsahara</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UY'">
                            <fo:block>Uruguay</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='UZ'">
                            <fo:block>Usbekistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='EL'">
                            <fo:block>Griechenland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VA'">
                            <fo:block>Heiliger Stuhl</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ER'">
                            <fo:block>Eritrea</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VC'">
                            <fo:block>St. Vincent und die Grenadinen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ES'">
                            <fo:block>Spanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ET'">
                            <fo:block>Äthiopien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VE'">
                            <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VG'">
                            <fo:block>Jungferninseln (Britische)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VI'">
                            <fo:block>Jungferninseln (Amerikanische)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VN'">
                            <fo:block>Vietnam</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='VU'">
                            <fo:block>Vanuatu</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FI'">
                            <fo:block>Finnland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FJ'">
                            <fo:block>Fidschi</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FK'">
                            <fo:block>Falklandinseln / (Malwinen)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FM'">
                            <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FO'">
                            <fo:block>Färöer-Inseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='FR'">
                            <fo:block>Frankreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='WF'">
                            <fo:block>Wallis und Futuna</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GA'">
                            <fo:block>Gabun</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='WS'">
                            <fo:block>Samoa</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GD'">
                            <fo:block>Grenada</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GE'">
                            <fo:block>Georgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GF'">
                            <fo:block>Französisch-Guayana</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GG'">
                            <fo:block>Guernsey</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GH'">
                            <fo:block>Ghana</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GI'">
                            <fo:block>Gibraltar</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GL'">
                            <fo:block>Grönland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GM'">
                            <fo:block>Gambia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GN'">
                            <fo:block>Guinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GP'">
                            <fo:block>Guadeloupe</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GQ'">
                            <fo:block>Äquatorialguinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GS'">
                            <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GT'">
                            <fo:block>Guatemala</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GU'">
                            <fo:block>Guam</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GW'">
                            <fo:block>Guinea-Bissau</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='GY'">
                            <fo:block>Guyana</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='XK'">
                            <fo:block>Kosovo</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HK'">
                            <fo:block>Hongkong</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HM'">
                            <fo:block>Heard und die McDonaldinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HN'">
                            <fo:block>Honduras</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HR'">
                            <fo:block>Kroatien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HT'">
                            <fo:block>Haiti</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='YE'">
                            <fo:block>Jemen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='HU'">
                            <fo:block>Ungarn</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ID'">
                            <fo:block>Indonesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='YT'">
                            <fo:block>Mayotte</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IE'">
                            <fo:block>Irland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IL'">
                            <fo:block>Israel</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IM'">
                            <fo:block>Isle of Man</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IN'">
                            <fo:block>Indien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IO'">
                            <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ZA'">
                            <fo:block>Südafrika</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IQ'">
                            <fo:block>Irak</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IR'">
                            <fo:block>Iran (Islamische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IS'">
                            <fo:block>Island</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='IT'">
                            <fo:block>Italien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ZM'">
                            <fo:block>Sambia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='JE'">
                            <fo:block>Jersey</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ZW'">
                            <fo:block>Simbabwe</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='JM'">
                            <fo:block>Jamaika</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='JO'">
                            <fo:block>Jordanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='JP'">
                            <fo:block>Japan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KE'">
                            <fo:block>Kenia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KG'">
                            <fo:block>Kirgisistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KH'">
                            <fo:block>Kambodscha</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KI'">
                            <fo:block>Kiribati</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KM'">
                            <fo:block>Komoren</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KN'">
                            <fo:block>St. Kitts und Nevis</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KP'">
                            <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KR'">
                            <fo:block>Korea (Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KW'">
                            <fo:block>Kuwait</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KY'">
                            <fo:block>Cayman Islands</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='KZ'">
                            <fo:block>Kasachstan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LA'">
                            <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LB'">
                            <fo:block>Libanon</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LC'">
                            <fo:block>St. Lucia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LI'">
                            <fo:block>Liechtenstein</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LK'">
                            <fo:block>Sri Lanka</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LR'">
                            <fo:block>Liberia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LS'">
                            <fo:block>Lesotho</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LT'">
                            <fo:block>Litauen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LU'">
                            <fo:block>Luxemburg</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LV'">
                            <fo:block>Lettland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='LY'">
                            <fo:block>Libyen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MA'">
                            <fo:block>Marokko</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MC'">
                            <fo:block>Monaco</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MD'">
                            <fo:block>Moldawien (Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ME'">
                            <fo:block>Montenegro</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MF'">
                            <fo:block>St. Martin (französischer Teil)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MG'">
                            <fo:block>Madagaskar</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MH'">
                            <fo:block>Marshallinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MK'">
                            <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='ML'">
                            <fo:block>Mali</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MM'">
                            <fo:block>Myanmar</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MN'">
                            <fo:block>Mongolei</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MO'">
                            <fo:block>Macau</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MP'">
                            <fo:block>Nördliche Marianen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MQ'">
                            <fo:block>Martinique</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MR'">
                            <fo:block>Mauretanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MS'">
                            <fo:block>Montserrat</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MT'">
                            <fo:block>Malta</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MU'">
                            <fo:block>Mauritius</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MV'">
                            <fo:block>Malediven</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MW'">
                            <fo:block>Malawi</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MX'">
                            <fo:block>Mexiko</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MY'">
                            <fo:block>Malaysia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='MZ'">
                            <fo:block>Mosambik</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NA'">
                            <fo:block>Namibia</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NC'">
                            <fo:block>Neukaledonien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NE'">
                            <fo:block>Niger</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NF'">
                            <fo:block>Norfolkinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NG'">
                            <fo:block>Nigeria</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NI'">
                            <fo:block>Nicaragua</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NL'">
                            <fo:block>Niederlande</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NO'">
                            <fo:block>Norwegen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NP'">
                            <fo:block>Nepal</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NR'">
                            <fo:block>Nauru</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NU'">
                            <fo:block>Niue</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='NZ'">
                            <fo:block>Neuseeland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='OM'">
                            <fo:block>Oman</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PA'">
                            <fo:block>Panama</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PE'">
                            <fo:block>Peru</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PF'">
                            <fo:block>Französisch-Polynesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PG'">
                            <fo:block>Papua-Neuguinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PH'">
                            <fo:block>Philippinen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PK'">
                            <fo:block>Pakistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PL'">
                            <fo:block>Polen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PM'">
                            <fo:block>St. Pierre und Miquelon</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor114115/flagStateHomeBase/value='PN'">
                            <fo:block>Pitcairninseln</fo:block>
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
                                <fo:block>5.2. Sitz / Geschäftssitz - sämtliche Angaben zur Anschrift</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.1. Straße</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.2. Gebäudename/-bezeichnung</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/buildingName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.3. Ort</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.4. Postleitzahl</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.5. Region</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/region"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.2.6. Land</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceRegisteredOfficePlaceBusinessAllInformation/country/value='PN'">
                                        <fo:block>Pitcairninseln</fo:block>
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
                                <fo:block>5.3. Wohnort der betreffenden Person</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.1. Straße</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.2. Gebäudename/-bezeichnung</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/buildingName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.3. Ort</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.4. Postleitzahl</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.5. Region</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/region"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.6. Land</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/PlaceResidencePersonConcerned/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor114115/PlaceResidencePersonConcerned/country/value='PN'">
                                        <fo:block>Pitcairninseln</fo:block>
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
                                <fo:block>5.4. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.4.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor114115/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>6. Weitere Informationen zu Artikel 12 Absatz 1</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.1. Anwendbare Rechtsvorschriften - Beginn</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/applicableLegislationStartingDate"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.2. Tatsächliche Art der Tätigkeit im Staat des empfangenden Trägers</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/actualNatureActivitiesInStateReceivingInstitution"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.3. Tatsächlicher Tätigkeitsort des Arbeitnehmers/der Arbeitnehmerin im Staat des empfangenden Trägers</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/actualPlaceActivitiesEmployeeStateReceivingInstitution"/>
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
                                <fo:block>6.4. Arbeitgeber/in (entsendendes Unternehmen)</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.4.1. Name</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/name"/>
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
                                            <fo:block>6.4.2. Identifikationsnummern</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <xsl:for-each select="//MoreInformationFor121/EmployerPostingUndertaking/IdentificationNumbers/IdentificationNumber">
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
                                                          <fo:block>6.4.2.1.[
                                                            <xsl:value-of select="position()"/>] Identifikationsnummer
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">6.4.2.1.1.[
                                                            <xsl:value-of select="position()"/>] Nummer
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="number"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">6.4.2.1.2.[
                                                            <xsl:value-of select="position()"/>] Art
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="type"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="type/value='01'">
                                                                  <fo:block>Identifizierung / Registrierung</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="type/value='02'">
                                                                  <fo:block>Soziale Sicherheit</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="type/value='03'">
                                                                  <fo:block>Steuerlich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="type/value='98'">
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
                                        </xsl:for-each>
                                        <xsl:if test="not(//MoreInformationFor121/EmployerPostingUndertaking/IdentificationNumbers/IdentificationNumber)">
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
                                            <fo:block>6.4.3. Anschrift</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.1. Straße</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/street"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.2. Gebäudename/-bezeichnung</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/buildingName"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.3. Ort</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/town"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.4. Postleitzahl</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/postalCode"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.5. Region</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/region"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">6.4.3.6. Land</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor121/EmployerPostingUndertaking/Address/country"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PR'">
                                                    <fo:block>Puerto Rico</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PS'">
                                                    <fo:block>Palästina (Staat)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PT'">
                                                    <fo:block>Portugal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PW'">
                                                    <fo:block>Palau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PY'">
                                                    <fo:block>Paraguay</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='QA'">
                                                    <fo:block>Katar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AD'">
                                                    <fo:block>Andorra</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AE'">
                                                    <fo:block>Vereinigte Arabische Emirate</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AF'">
                                                    <fo:block>Afghanistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AG'">
                                                    <fo:block>Antigua und Barbuda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AI'">
                                                    <fo:block>Anguilla</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AL'">
                                                    <fo:block>Albanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AM'">
                                                    <fo:block>Armenien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AO'">
                                                    <fo:block>Angola</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AQ'">
                                                    <fo:block>Antarktis</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AR'">
                                                    <fo:block>Argentinien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AS'">
                                                    <fo:block>Amerikanisch-Samoa</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AT'">
                                                    <fo:block>Österreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='RE'">
                                                    <fo:block>Réunion</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AU'">
                                                    <fo:block>Australien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AW'">
                                                    <fo:block>Aruba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AX'">
                                                    <fo:block>Ålandinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='AZ'">
                                                    <fo:block>Aserbaidschan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='RO'">
                                                    <fo:block>Rumänien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BA'">
                                                    <fo:block>Bosnien und Herzegowina</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BB'">
                                                    <fo:block>Barbados</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='RS'">
                                                    <fo:block>Serbien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BD'">
                                                    <fo:block>Bangladesch</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BE'">
                                                    <fo:block>Belgien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='RU'">
                                                    <fo:block>Russische Föderation</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BF'">
                                                    <fo:block>Burkina Faso</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BG'">
                                                    <fo:block>Bulgarien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='RW'">
                                                    <fo:block>Ruanda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BH'">
                                                    <fo:block>Bahrain</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BI'">
                                                    <fo:block>Burundi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BJ'">
                                                    <fo:block>Benin</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BL'">
                                                    <fo:block>Saint-Barthélemy</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BM'">
                                                    <fo:block>Bermuda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BN'">
                                                    <fo:block>Brunei Darussalam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BO'">
                                                    <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SA'">
                                                    <fo:block>Saudi-Arabien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BQ'">
                                                    <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SB'">
                                                    <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BR'">
                                                    <fo:block>Brasilien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SC'">
                                                    <fo:block>Seychellen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BS'">
                                                    <fo:block>Bahamas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SD'">
                                                    <fo:block>Sudan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SE'">
                                                    <fo:block>Schweden</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BT'">
                                                    <fo:block>Bhutan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BV'">
                                                    <fo:block>Bouvetinsel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SG'">
                                                    <fo:block>Singapur</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BW'">
                                                    <fo:block>Botswana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SH'">
                                                    <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SI'">
                                                    <fo:block>Slowenien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BY'">
                                                    <fo:block>Belarus</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SJ'">
                                                    <fo:block>Svalbard und Jan Mayen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SK'">
                                                    <fo:block>Slowakei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='BZ'">
                                                    <fo:block>Belize</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SL'">
                                                    <fo:block>Sierra Leone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SM'">
                                                    <fo:block>San Marino</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SN'">
                                                    <fo:block>Senegal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SO'">
                                                    <fo:block>Somalia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CA'">
                                                    <fo:block>Kanada</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SR'">
                                                    <fo:block>Suriname</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CC'">
                                                    <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SS'">
                                                    <fo:block>Südsudan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CD'">
                                                    <fo:block>Kongo, Demokratische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ST'">
                                                    <fo:block>São Tomé und Príncipe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CF'">
                                                    <fo:block>Zentralafrikanische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SV'">
                                                    <fo:block>El Salvador</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CG'">
                                                    <fo:block>Kongo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CH'">
                                                    <fo:block>Schweiz</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SX'">
                                                    <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CI'">
                                                    <fo:block>Côte d'Ivoire</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SY'">
                                                    <fo:block>Arabische Republik Syrien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='SZ'">
                                                    <fo:block>Swasiland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CK'">
                                                    <fo:block>Cookinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CL'">
                                                    <fo:block>Chile</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CM'">
                                                    <fo:block>Kamerun</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CN'">
                                                    <fo:block>China</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CO'">
                                                    <fo:block>Kolumbien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CR'">
                                                    <fo:block>Costa Rica</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TC'">
                                                    <fo:block>Turks- und Caicosinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TD'">
                                                    <fo:block>Tschad</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CU'">
                                                    <fo:block>Kuba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TF'">
                                                    <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CV'">
                                                    <fo:block>Kap Verde</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TG'">
                                                    <fo:block>Togo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CW'">
                                                    <fo:block>Curaçao</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TH'">
                                                    <fo:block>Thailand</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CX'">
                                                    <fo:block>Weihnachtsinsel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CY'">
                                                    <fo:block>Zypern</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TJ'">
                                                    <fo:block>Tadschikistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='CZ'">
                                                    <fo:block>Tschechien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TK'">
                                                    <fo:block>Tokelau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TL'">
                                                    <fo:block>Timor-Leste</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TM'">
                                                    <fo:block>Turkmenistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TN'">
                                                    <fo:block>Tunesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TO'">
                                                    <fo:block>Tonga</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TR'">
                                                    <fo:block>Türkei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TT'">
                                                    <fo:block>Trinidad und Tobago</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DE'">
                                                    <fo:block>Deutschland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TV'">
                                                    <fo:block>Tuvalu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TW'">
                                                    <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DJ'">
                                                    <fo:block>Dschibuti</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='TZ'">
                                                    <fo:block>Tansania, Vereinigte Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DK'">
                                                    <fo:block>Dänemark</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DM'">
                                                    <fo:block>Dominica</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DO'">
                                                    <fo:block>Dominikanische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UA'">
                                                    <fo:block>Ukraine</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UG'">
                                                    <fo:block>Uganda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UK'">
                                                    <fo:block>Vereinigtes Königreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='DZ'">
                                                    <fo:block>Algerien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UM'">
                                                    <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='EC'">
                                                    <fo:block>Ecuador</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='US'">
                                                    <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='EE'">
                                                    <fo:block>Estland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='EG'">
                                                    <fo:block>Ägypten</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='EH'">
                                                    <fo:block>Westsahara</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UY'">
                                                    <fo:block>Uruguay</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='UZ'">
                                                    <fo:block>Usbekistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='EL'">
                                                    <fo:block>Griechenland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VA'">
                                                    <fo:block>Heiliger Stuhl</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ER'">
                                                    <fo:block>Eritrea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VC'">
                                                    <fo:block>St. Vincent und die Grenadinen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ES'">
                                                    <fo:block>Spanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ET'">
                                                    <fo:block>Äthiopien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VE'">
                                                    <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VG'">
                                                    <fo:block>Jungferninseln (Britische)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VI'">
                                                    <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VN'">
                                                    <fo:block>Vietnam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='VU'">
                                                    <fo:block>Vanuatu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FI'">
                                                    <fo:block>Finnland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FJ'">
                                                    <fo:block>Fidschi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FK'">
                                                    <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FM'">
                                                    <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FO'">
                                                    <fo:block>Färöer-Inseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='FR'">
                                                    <fo:block>Frankreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='WF'">
                                                    <fo:block>Wallis und Futuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GA'">
                                                    <fo:block>Gabun</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='WS'">
                                                    <fo:block>Samoa</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GD'">
                                                    <fo:block>Grenada</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GE'">
                                                    <fo:block>Georgien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GF'">
                                                    <fo:block>Französisch-Guayana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GG'">
                                                    <fo:block>Guernsey</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GH'">
                                                    <fo:block>Ghana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GI'">
                                                    <fo:block>Gibraltar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GL'">
                                                    <fo:block>Grönland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GM'">
                                                    <fo:block>Gambia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GN'">
                                                    <fo:block>Guinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GP'">
                                                    <fo:block>Guadeloupe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GQ'">
                                                    <fo:block>Äquatorialguinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GS'">
                                                    <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GT'">
                                                    <fo:block>Guatemala</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GU'">
                                                    <fo:block>Guam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GW'">
                                                    <fo:block>Guinea-Bissau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='GY'">
                                                    <fo:block>Guyana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='XK'">
                                                    <fo:block>Kosovo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HK'">
                                                    <fo:block>Hongkong</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HM'">
                                                    <fo:block>Heard und die McDonaldinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HN'">
                                                    <fo:block>Honduras</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HR'">
                                                    <fo:block>Kroatien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HT'">
                                                    <fo:block>Haiti</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='YE'">
                                                    <fo:block>Jemen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='HU'">
                                                    <fo:block>Ungarn</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ID'">
                                                    <fo:block>Indonesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='YT'">
                                                    <fo:block>Mayotte</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IE'">
                                                    <fo:block>Irland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IL'">
                                                    <fo:block>Israel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IM'">
                                                    <fo:block>Isle of Man</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IN'">
                                                    <fo:block>Indien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IO'">
                                                    <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ZA'">
                                                    <fo:block>Südafrika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IQ'">
                                                    <fo:block>Irak</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IR'">
                                                    <fo:block>Iran (Islamische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IS'">
                                                    <fo:block>Island</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='IT'">
                                                    <fo:block>Italien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ZM'">
                                                    <fo:block>Sambia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='JE'">
                                                    <fo:block>Jersey</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ZW'">
                                                    <fo:block>Simbabwe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='JM'">
                                                    <fo:block>Jamaika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='JO'">
                                                    <fo:block>Jordanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='JP'">
                                                    <fo:block>Japan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KE'">
                                                    <fo:block>Kenia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KG'">
                                                    <fo:block>Kirgisistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KH'">
                                                    <fo:block>Kambodscha</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KI'">
                                                    <fo:block>Kiribati</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KM'">
                                                    <fo:block>Komoren</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KN'">
                                                    <fo:block>St. Kitts und Nevis</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KP'">
                                                    <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KR'">
                                                    <fo:block>Korea (Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KW'">
                                                    <fo:block>Kuwait</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KY'">
                                                    <fo:block>Cayman Islands</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='KZ'">
                                                    <fo:block>Kasachstan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LA'">
                                                    <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LB'">
                                                    <fo:block>Libanon</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LC'">
                                                    <fo:block>St. Lucia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LI'">
                                                    <fo:block>Liechtenstein</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LK'">
                                                    <fo:block>Sri Lanka</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LR'">
                                                    <fo:block>Liberia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LS'">
                                                    <fo:block>Lesotho</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LT'">
                                                    <fo:block>Litauen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LU'">
                                                    <fo:block>Luxemburg</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LV'">
                                                    <fo:block>Lettland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='LY'">
                                                    <fo:block>Libyen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MA'">
                                                    <fo:block>Marokko</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MC'">
                                                    <fo:block>Monaco</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MD'">
                                                    <fo:block>Moldawien (Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ME'">
                                                    <fo:block>Montenegro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MF'">
                                                    <fo:block>St. Martin (französischer Teil)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MG'">
                                                    <fo:block>Madagaskar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MH'">
                                                    <fo:block>Marshallinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MK'">
                                                    <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='ML'">
                                                    <fo:block>Mali</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MM'">
                                                    <fo:block>Myanmar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MN'">
                                                    <fo:block>Mongolei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MO'">
                                                    <fo:block>Macau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MP'">
                                                    <fo:block>Nördliche Marianen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MQ'">
                                                    <fo:block>Martinique</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MR'">
                                                    <fo:block>Mauretanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MS'">
                                                    <fo:block>Montserrat</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MT'">
                                                    <fo:block>Malta</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MU'">
                                                    <fo:block>Mauritius</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MV'">
                                                    <fo:block>Malediven</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MW'">
                                                    <fo:block>Malawi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MX'">
                                                    <fo:block>Mexiko</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MY'">
                                                    <fo:block>Malaysia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='MZ'">
                                                    <fo:block>Mosambik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NA'">
                                                    <fo:block>Namibia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NC'">
                                                    <fo:block>Neukaledonien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NE'">
                                                    <fo:block>Niger</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NF'">
                                                    <fo:block>Norfolkinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NG'">
                                                    <fo:block>Nigeria</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NI'">
                                                    <fo:block>Nicaragua</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NL'">
                                                    <fo:block>Niederlande</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NO'">
                                                    <fo:block>Norwegen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NP'">
                                                    <fo:block>Nepal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NR'">
                                                    <fo:block>Nauru</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NU'">
                                                    <fo:block>Niue</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='NZ'">
                                                    <fo:block>Neuseeland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='OM'">
                                                    <fo:block>Oman</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PA'">
                                                    <fo:block>Panama</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PE'">
                                                    <fo:block>Peru</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PF'">
                                                    <fo:block>Französisch-Polynesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PG'">
                                                    <fo:block>Papua-Neuguinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PH'">
                                                    <fo:block>Philippinen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PK'">
                                                    <fo:block>Pakistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PL'">
                                                    <fo:block>Polen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PM'">
                                                    <fo:block>St. Pierre und Miquelon</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor121/EmployerPostingUndertaking/Address/country/value='PN'">
                                                    <fo:block>Pitcairninseln</fo:block>
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
                    <fo:block wrap-option="wrap">6.5. Anzahl der Verwaltungsmitarbeiter/innen im Entsendestaat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/numberManagementStaffInStatePosting"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.6. Anzahl der Verwaltungsmitarbeiter/innen im Beschäftigungsstaat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/numberManagementStaffInStateEmployment"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.7. Anzahl der in sämtliche Mitgliedstaaten entsandten Arbeitnehmer/innen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/numberPostedWorkersAllMemberStates"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.8. Anzahl der internen Verwaltungsmitarbeiter/innen im Entsendestaat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/numberInternalManagementStaffInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.9. Gesamtzahl der Mitarbeiter/innen im Entsendestaat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/totalNumberStaffInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.10. Einstellungsort des entsandten Arbeitnehmers/der entsandten Arbeitnehmerin</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/placeRecruitmentPostedWorker"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.11. Ort, an dem die Mehrzahl der Verträge des entsendenden Unternehmens mit dessen Kunden und Arbeitnehmern unterzeichnet wird und das für diese Verträge geltende Recht</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/placeMajorityContractsSignedByPostingUndertaking"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.12. Anzahl der im Entsendestaat und im Beschäftigungsstaat ausgeführten Verträge</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/numberContractsExecutedInPostingStateInStateEmployment"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.13. Umsatz in %, den das entsendende Unternehmen im Entsendestaat sowie im Beschäftigungsstaat in einem hinreichend charakteristischen Zeitraum erzielt hat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/turnoverAchievedInStatePostingEmploymentDuringPeriod"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.14. Ersetzt der Arbeitnehmer/die Arbeitnehmerin eine/n andere/n entsandte/n Arbeitnehmer/in?</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor121/doesWorkerReplaceAnotherPostedWorkerIndicator"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//MoreInformationFor121/doesWorkerReplaceAnotherPostedWorkerIndicator/value='0'">
                            <fo:block>Nein</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor121/doesWorkerReplaceAnotherPostedWorkerIndicator/value='1'">
                            <fo:block>Ja</fo:block>
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
                                <fo:block>6.15. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.15.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor121/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>7. Weitere Informationen zu Artikel 12 Absatz 2</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.1. Beginn der Tätigkeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/startingDateActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.2. Tatsächliche Art der Tätigkeit im Entsendestaat (um zu ermitteln, ob es sich um eine ähnliche Tätigkeit handelt)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/actualNatureActivitiesInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.3. Tatsächliche Art der Tätigkeit im Staat der Erwerbstätigkeit (um zu ermitteln, ob es sich um eine ähnliche Tätigkeit handelt)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/actualNatureActivitiesInStateEmployment"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.4. Aufrechterhaltung der erforderlichen Infrastruktur</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/maintenanceRequisiteMeans"/>
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
                                <fo:block>7.5. Anschrift des während des Entsendezeitraums beibehaltenen Büros</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.1. Straße</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.2. Gebäudename/-bezeichnung</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/buildingName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.3. Ort</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.4. Postleitzahl</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.5. Region</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/region"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.5.6. Land</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//MoreInformationFor122/AddressOfficeKeptDuringPostingPeriod/country/value='PN'">
                                        <fo:block>Pitcairninseln</fo:block>
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
                    <fo:block wrap-option="wrap">7.6. Tatsächlicher Tätigkeitsort im Staat der Erwerbstätigkeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/actualPlaceActivitiesInStateEmployment"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.7. Auskunft darüber, ob im Entsendestaat Steuern gezahlt werden</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/informationWhetherTaxesArePaidInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.8. Auskunft darüber, ob im Entsendestaat Beiträge gezahlt werden</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/informationWhetherContributionsArePaidInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.9. USt-Nr. im Entsendestaat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/vATNumberInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.10. Mitgliedschaft in der Handelskammer (Wirtschaftskammer) des Entsendestaats</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/subscriptionChamberCommerceInPostingState"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.11. Mitgliedschaft in Berufsverbänden des Entsendestaats</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor122/subscriptionProfessionalAssociationsInPostingState"/>
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
                                <fo:block>7.12. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">7.12.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor122/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>8. Weitere Informationen zu Artikel 13 Absatz 1</fo:block>
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
                                <fo:block>8.1. Tätigkeitsdauer</fo:block>
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
                                            <fo:block>8.1.1. Feststehender Zeitraum</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">8.1.1.1. Datum Beginn</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor131/DurationActivities/FixedPeriod/startDate"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">8.1.1.2. Datum Ende</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor131/DurationActivities/FixedPeriod/endDate"/>
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
                                            <fo:block>8.1.2. Offener Zeitraum</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">8.1.2.1. Art des offenen Zeitraums</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor131/DurationActivities/OpenPeriod/typeOpenPeriod"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//MoreInformationFor131/DurationActivities/OpenPeriod/typeOpenPeriod/value='01'">
                                                    <fo:block>Unbefristeter Zeitraum</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//MoreInformationFor131/DurationActivities/OpenPeriod/typeOpenPeriod/value='98'">
                                                    <fo:block>Ende des Zeitraums ist nicht bekannt.</fo:block>
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
                                            <fo:block wrap-option="wrap">8.1.2.2. Datum Beginn</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//MoreInformationFor131/DurationActivities/OpenPeriod/startDate"/>
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
                    <fo:block wrap-option="wrap">8.2. Tätigkeitsorte</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor131/placesActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">8.3. Arbeitszeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor131/workingTime"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">8.4. Entgelt in Euro</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor131/remunerationInEuro"/>
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
                                <fo:block>8.5. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">8.5.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor131/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>9. Weitere Informationen zu Artikel 13 Absatz 2</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.1. Art der Tätigkeiten</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/natureActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.2. Tätigkeitsdauer</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/durationActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.3. Geschäftssitz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/placeBusiness"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.4. Tätigkeitsort</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/placeActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.5. Arbeitszeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/workingTime"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.6. Anzahl der Dienstleistungen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/numberServices"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.7. Umsatz in Euro</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/turnoverInEuro"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.8. Einkommen in Euro</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/incomeInEuro"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">9.9. Mittelpunkt der Tätigkeiten</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor132/centreInterest"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='DE'">
                            <fo:block>Deutschland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='NO'">
                            <fo:block>Norwegen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='BE'">
                            <fo:block>Belgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='FI'">
                            <fo:block>Finnland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='PT'">
                            <fo:block>Portugal</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='BG'">
                            <fo:block>Bulgarien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='DK'">
                            <fo:block>Dänemark</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='LT'">
                            <fo:block>Litauen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='LU'">
                            <fo:block>Luxemburg</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='HR'">
                            <fo:block>Kroatien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='LV'">
                            <fo:block>Lettland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='FR'">
                            <fo:block>Frankreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='HU'">
                            <fo:block>Ungarn</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='SE'">
                            <fo:block>Schweden</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='SI'">
                            <fo:block>Slowenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='UK'">
                            <fo:block>Vereinigtes Königreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='SK'">
                            <fo:block>Slowakei</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='IE'">
                            <fo:block>Irland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='EE'">
                            <fo:block>Estland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='CH'">
                            <fo:block>Schweiz</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='EL'">
                            <fo:block>Griechenland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='MT'">
                            <fo:block>Malta</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='IS'">
                            <fo:block>Island</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='IT'">
                            <fo:block>Italien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='ES'">
                            <fo:block>Spanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='AT'">
                            <fo:block>Österreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='CY'">
                            <fo:block>Zypern</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='CZ'">
                            <fo:block>Tschechien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='PL'">
                            <fo:block>Polen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='LI'">
                            <fo:block>Liechtenstein</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='RO'">
                            <fo:block>Rumänien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor132/centreInterest/value='NL'">
                            <fo:block>Niederlande</fo:block>
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
                                <fo:block>9.10. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">9.10.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor132/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>10. Weitere Informationen zu Artikel 13 Absatz 3</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.1. Art der Tätigkeiten</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/natureActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.2. Tätigkeitsdauer</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/durationActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.3. Geschäftssitz</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/placeBusiness"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.4. Tätigkeitsort</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/placeActivities"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.5. Arbeitszeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/workingTime"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.6. Anzahl der Dienstleistungen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/numberServices"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.7. Umsatz in Euro</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/turnoverInEuro"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.8. Einkommen in Euro</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/incomeInEuro"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">10.9. Mittelpunkt der Tätigkeiten</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//MoreInformationFor133/centreInterest"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='DE'">
                            <fo:block>Deutschland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='NO'">
                            <fo:block>Norwegen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='BE'">
                            <fo:block>Belgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='FI'">
                            <fo:block>Finnland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='PT'">
                            <fo:block>Portugal</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='BG'">
                            <fo:block>Bulgarien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='DK'">
                            <fo:block>Dänemark</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='LT'">
                            <fo:block>Litauen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='LU'">
                            <fo:block>Luxemburg</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='HR'">
                            <fo:block>Kroatien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='LV'">
                            <fo:block>Lettland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='FR'">
                            <fo:block>Frankreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='HU'">
                            <fo:block>Ungarn</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='SE'">
                            <fo:block>Schweden</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='SI'">
                            <fo:block>Slowenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='UK'">
                            <fo:block>Vereinigtes Königreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='SK'">
                            <fo:block>Slowakei</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='IE'">
                            <fo:block>Irland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='EE'">
                            <fo:block>Estland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='CH'">
                            <fo:block>Schweiz</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='EL'">
                            <fo:block>Griechenland</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='MT'">
                            <fo:block>Malta</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='IS'">
                            <fo:block>Island</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='IT'">
                            <fo:block>Italien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='ES'">
                            <fo:block>Spanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='AT'">
                            <fo:block>Österreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='CY'">
                            <fo:block>Zypern</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='CZ'">
                            <fo:block>Tschechien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='PL'">
                            <fo:block>Polen</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='LI'">
                            <fo:block>Liechtenstein</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='RO'">
                            <fo:block>Rumänien</fo:block>
                          </xsl:when>
                          <xsl:when test="//MoreInformationFor133/centreInterest/value='NL'">
                            <fo:block>Niederlande</fo:block>
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
                                <fo:block>10.10. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">10.10.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//MoreInformationFor133/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>11. Weitere Informationen zu Sachverhalten, die unter folgenden Artikel (Verordnung (EG) Nr. 883/2004 und Verordnung (EG) Nr. 987/2009) fallen, erbeten.</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">11.1. Artikel</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//RequestedForSituationsCoveredByArti8832004/article"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='99'">
                            <fo:block>Sonstiges</fo:block>
                          </xsl:when>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='01'">
                            <fo:block>Artikel 13 Absatz 4</fo:block>
                          </xsl:when>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='02'">
                            <fo:block>Artikel 15</fo:block>
                          </xsl:when>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='03'">
                            <fo:block>Artikel 16</fo:block>
                          </xsl:when>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='04'">
                            <fo:block>Artikel 87 Absatz 8</fo:block>
                          </xsl:when>
                          <xsl:when test="//RequestedForSituationsCoveredByArti8832004/article/value='05'">
                            <fo:block>Artikel 87a</fo:block>
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
                    <fo:block wrap-option="wrap">11.2. Sonstiges</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//RequestedForSituationsCoveredByArti8832004/other"/>
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
                                <fo:block>11.3. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">11.3.1. Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//RequestedForSituationsCoveredByArti8832004/AdditionalInformation/additionalInformation"/>
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
                    <fo:block>12. Erbetene Informationen können nicht übermittelt werden</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">12.1. Spezifizierung der Information</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//RequestedInformationCannotProvided/specificationInformation"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">12.2. Grund</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//RequestedInformationCannotProvided/reason"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
          <fo:block id="endofflow"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
