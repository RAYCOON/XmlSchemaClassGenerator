<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_S041_de-DE_4.4.1_6.0.1.xslt</xsl:variable>
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
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">S041 - Antwort auf Auskunftsersuchen zu Zeiten - Art des Versicherungsrisikos: Krankheit, Mutterschaft oder Vaterschaft</fo:block>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="8pt" text-align="start">S041 - Reply to Request for Periods - Insurance Risk Type: Sickness, Maternity or Paternity</fo:block>
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
          <fo:block font-family="Arial Unicode MS" font-size="10pt">Artikel 6 der Verordnung (EG) Nr. 883/2004; Artikel 12 Absatz 1 der Verordnung (EG) Nr. 987/2009</fo:block>
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
                    <fo:block>2. Anschrift der Person</fo:block>
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
                                <fo:block>2.1. Anschrift</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.1. Straße</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.2. Gebäudename/-bezeichnung</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/buildingName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.3. Ort</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.4. Postleitzahl</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.5. Region</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/region"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.1.6. Land</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//PersonAddress/Address/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//PersonAddress/Address/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//PersonAddress/Address/country/value='PN'">
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
                    <fo:block wrap-option="wrap">2.2. In diesem Land wohnhaft seit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//PersonAddress/residenceInThisCountrySince"/>
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
                    <fo:block>3. Antwort</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">3.1. In Beantwortung Ihres S040</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//Reply/inReplyS040"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//Reply/inReplyS040/value='01'">
                            <fo:block>Wir teilen Ihnen mit, dass die betreffende Person keine Zeiten nach unseren Rechtsvorschriften zurückgelegt hat</fo:block>
                          </xsl:when>
                          <xsl:when test="//Reply/inReplyS040/value='02'">
                            <fo:block>Wir bestätigen, dass die betreffende Person die folgenden Zeiträume gemäß unseren Rechtsvorschriften abgeschlossen hat</fo:block>
                          </xsl:when>
                          <xsl:when test="//Reply/inReplyS040/value='03'">
                            <fo:block>Wir können nicht bestätigen, ob die betreffende Person die angefragten Zeiten nach unseren Rechtsvorschriften zurückgelegt hat</fo:block>
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
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>4. Antwort auf Auskunftsersuchen zu Zeiten</fo:block>
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
                                <fo:block>4.1. Versicherungszeiten</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <xsl:for-each select="//ReplyRequestForPeriods/InsurancePeriods/InsurancePeriod">
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
                                                <xsl:value-of select="position()"/>] Versicherungszeit
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
                                                            <xsl:value-of select="position()"/>] Zeitraum
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
                                                                      <fo:block>4.1.1.1.1.[
                                                                        <xsl:value-of select="position()"/>] Feststehender Zeitraum
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                  </fo:table-row>
                                                                </fo:table-header>
                                                                <fo:table-body start-indent="2mm">
                                                                  <fo:table-row>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block wrap-option="wrap">4.1.1.1.1.1.[
                                                                        <xsl:value-of select="position()"/>] Datum Beginn
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Period/FixedPeriod/startDate"/>
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                  </fo:table-row>
                                                                  <fo:table-row>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block wrap-option="wrap">4.1.1.1.1.2.[
                                                                        <xsl:value-of select="position()"/>] Datum Ende
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Period/FixedPeriod/endDate"/>
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
                                                                      <fo:block>4.1.1.1.2.[
                                                                        <xsl:value-of select="position()"/>] Offener Zeitraum
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                  </fo:table-row>
                                                                </fo:table-header>
                                                                <fo:table-body start-indent="2mm">
                                                                  <fo:table-row>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block wrap-option="wrap">4.1.1.1.2.1.[
                                                                        <xsl:value-of select="position()"/>] Art des offenen Zeitraums
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Period/OpenPeriod/typeOpenPeriod"/>
                                                                        <fo:block>
                                                                          <xsl:choose>
                                                                            <xsl:when test="Period/OpenPeriod/typeOpenPeriod/value='01'">
                                                                              <fo:block>Unbefristeter Zeitraum</fo:block>
                                                                            </xsl:when>
                                                                            <xsl:when test="Period/OpenPeriod/typeOpenPeriod/value='98'">
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
                                                                      <fo:block wrap-option="wrap">4.1.1.1.2.2.[
                                                                        <xsl:value-of select="position()"/>] Datum Beginn
                                                                      </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                                      <fo:block>
                                                                        <xsl:value-of select="Period/OpenPeriod/startDate"/>
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
                                              <fo:block wrap-option="wrap">4.1.1.2.[
                                                <xsl:value-of select="position()"/>] Art der Versicherung
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="insurance"/>
                                                <fo:block>
                                                  <xsl:choose>
                                                    <xsl:when test="insurance/value='01'">
                                                      <fo:block>Pflichtversicherung</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="insurance/value='02'">
                                                      <fo:block>Freiwillige Versicherung</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="insurance/value='03'">
                                                      <fo:block>Freiwillige Weiterversicherung</fo:block>
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
                            <xsl:if test="not(//ReplyRequestForPeriods/InsurancePeriods/InsurancePeriod)">
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
                                <fo:block>4.2. Beschäftigungszeiten</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <xsl:for-each select="//ReplyRequestForPeriods/EmploymentPeriods/EmploymentPeriod">
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
                                              <fo:block>4.2.1.[
                                                <xsl:value-of select="position()"/>] Beschäftigungszeit
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.2.1.1.[
                                                <xsl:value-of select="position()"/>] Beginndatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="startDate"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.2.1.2.[
                                                <xsl:value-of select="position()"/>] Enddatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="endDate"/>
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
                            <xsl:if test="not(//ReplyRequestForPeriods/EmploymentPeriods/EmploymentPeriod)">
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
                                <fo:block>4.3. Zeiten einer selbstständigen Erwerbstätigkeit</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <xsl:for-each select="//ReplyRequestForPeriods/SelfEmploymentPeriods/SelfEmploymentPeriod">
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
                                              <fo:block>4.3.1.[
                                                <xsl:value-of select="position()"/>] Zeit einer selbstständigen Erwerbstätigkeit
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.3.1.1.[
                                                <xsl:value-of select="position()"/>] Beginndatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="startDate"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.3.1.2.[
                                                <xsl:value-of select="position()"/>] Enddatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="endDate"/>
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
                            <xsl:if test="not(//ReplyRequestForPeriods/SelfEmploymentPeriods/SelfEmploymentPeriod)">
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
                                <fo:block>4.4. Wohnzeiten</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <xsl:for-each select="//ReplyRequestForPeriods/ResidencePeriods/ResidencePeriod">
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
                                              <fo:block>4.4.1.[
                                                <xsl:value-of select="position()"/>] Wohnzeit
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.4.1.1.[
                                                <xsl:value-of select="position()"/>] Beginndatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="startDate"/>
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">4.4.1.2.[
                                                <xsl:value-of select="position()"/>] Enddatum
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="endDate"/>
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
                            <xsl:if test="not(//ReplyRequestForPeriods/ResidencePeriods/ResidencePeriod)">
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
                    <fo:block>5. Zusätzliche Informationen</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">5.1. Zusätzliche Informationen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//AdditionalInformation/additionalInformation"/>
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
