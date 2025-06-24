<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_X050N_de-DE_6.0.1.xslt</xsl:variable>
  <xsl:variable name="version">6.0.1</xsl:variable>
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
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">X050N - Ausnahmesituation im Verfahrensablauf</fo:block>
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="8pt" text-align="start"></fo:block>
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
          <fo:block font-family="Arial Unicode MS" font-size="10pt"></fo:block>
          <fo:block>
            <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
              <fo:table-column column-width="45%"/>
              <fo:table-column column-width="53.5%"/>
              <fo:table-header background-color="LightGrey">
                <fo:table-row border="solid 0.2mm Grey">
                  <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm" font-weight="bold">
                    <fo:block>1.</fo:block>
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
                                <fo:block>1.1. E2984042-6A6F-E611-80CB-000D3A22E8CD Kontext zur Person</fo:block>
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
                                  <xsl:value-of select="//CaseContext/PersonContext/familyName"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.2. Vorname(n)</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/PersonContext/forename"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.3. Geburtsdatum</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/PersonContext/dateBirth"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.1.4. Geschlecht</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/PersonContext/sex"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//CaseContext/PersonContext/sex/value='01'">
                                        <fo:block>Männlich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//CaseContext/PersonContext/sex/value='02'">
                                        <fo:block>Weiblich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//CaseContext/PersonContext/sex/value='98'">
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
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>1.2. E3984042-6A6F-E611-80CB-000D3A22E8CD Kontext zum Arbeitgeber</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.2.1. Name</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/EmployerContext/name"/>
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
                                            <fo:block>1.2.2. EA2CB44F-9418-E611-80EA-000C292ED0D7 Identifikationsnummern</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <xsl:for-each select="//CaseContext/EmployerContext/IdentificationNumbers/IdentificationNumber">
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
                                                          <fo:block>1.2.2.1.[
                                                            <xsl:value-of select="position()"/>] 4582CE51-F844-E611-80C9-000D3A22E8CD Identifikationsnummer
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.2.2.1.1.[
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
                                                          <fo:block wrap-option="wrap">1.2.2.1.2.[
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
                                        <xsl:if test="not(//CaseContext/EmployerContext/IdentificationNumbers/IdentificationNumber)">
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
                                            <fo:block>1.2.3. 69F382D1-9418-E611-80EA-000C292ED0D7 Anschrift</fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                      </fo:table-header>
                                      <fo:table-body start-indent="2mm">
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.1. Straße</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/street"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.2. Gebäudename/-bezeichnung</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/buildingName"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.3. Ort</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/town"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.4. Postleitzahl</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/postalCode"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.5. Region</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/region"/>
                                            </fo:block>
                                          </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block wrap-option="wrap">1.2.3.6. Land</fo:block>
                                          </fo:table-cell>
                                          <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                            <fo:block>
                                              <xsl:value-of select="//CaseContext/EmployerContext/Address/country"/>
                                              <fo:block>
                                                <xsl:choose>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PR'">
                                                    <fo:block>Puerto Rico</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PS'">
                                                    <fo:block>Palästina (Staat)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PT'">
                                                    <fo:block>Portugal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PW'">
                                                    <fo:block>Palau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PY'">
                                                    <fo:block>Paraguay</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='QA'">
                                                    <fo:block>Katar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AD'">
                                                    <fo:block>Andorra</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AE'">
                                                    <fo:block>Vereinigte Arabische Emirate</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AF'">
                                                    <fo:block>Afghanistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AG'">
                                                    <fo:block>Antigua und Barbuda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AI'">
                                                    <fo:block>Anguilla</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AL'">
                                                    <fo:block>Albanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AM'">
                                                    <fo:block>Armenien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AO'">
                                                    <fo:block>Angola</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AQ'">
                                                    <fo:block>Antarktis</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AR'">
                                                    <fo:block>Argentinien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AS'">
                                                    <fo:block>Amerikanisch-Samoa</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AT'">
                                                    <fo:block>Österreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='RE'">
                                                    <fo:block>Réunion</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AU'">
                                                    <fo:block>Australien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AW'">
                                                    <fo:block>Aruba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AX'">
                                                    <fo:block>Ålandinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='AZ'">
                                                    <fo:block>Aserbaidschan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='RO'">
                                                    <fo:block>Rumänien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BA'">
                                                    <fo:block>Bosnien und Herzegowina</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BB'">
                                                    <fo:block>Barbados</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='RS'">
                                                    <fo:block>Serbien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BD'">
                                                    <fo:block>Bangladesch</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BE'">
                                                    <fo:block>Belgien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='RU'">
                                                    <fo:block>Russische Föderation</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BF'">
                                                    <fo:block>Burkina Faso</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BG'">
                                                    <fo:block>Bulgarien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='RW'">
                                                    <fo:block>Ruanda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BH'">
                                                    <fo:block>Bahrain</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BI'">
                                                    <fo:block>Burundi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BJ'">
                                                    <fo:block>Benin</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BL'">
                                                    <fo:block>Saint-Barthélemy</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BM'">
                                                    <fo:block>Bermuda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BN'">
                                                    <fo:block>Brunei Darussalam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BO'">
                                                    <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SA'">
                                                    <fo:block>Saudi-Arabien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BQ'">
                                                    <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SB'">
                                                    <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BR'">
                                                    <fo:block>Brasilien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SC'">
                                                    <fo:block>Seychellen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BS'">
                                                    <fo:block>Bahamas</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SD'">
                                                    <fo:block>Sudan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SE'">
                                                    <fo:block>Schweden</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BT'">
                                                    <fo:block>Bhutan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BV'">
                                                    <fo:block>Bouvetinsel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SG'">
                                                    <fo:block>Singapur</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BW'">
                                                    <fo:block>Botswana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SH'">
                                                    <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SI'">
                                                    <fo:block>Slowenien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BY'">
                                                    <fo:block>Belarus</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SJ'">
                                                    <fo:block>Svalbard und Jan Mayen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SK'">
                                                    <fo:block>Slowakei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='BZ'">
                                                    <fo:block>Belize</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SL'">
                                                    <fo:block>Sierra Leone</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SM'">
                                                    <fo:block>San Marino</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SN'">
                                                    <fo:block>Senegal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SO'">
                                                    <fo:block>Somalia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CA'">
                                                    <fo:block>Kanada</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SR'">
                                                    <fo:block>Suriname</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CC'">
                                                    <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SS'">
                                                    <fo:block>Südsudan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CD'">
                                                    <fo:block>Kongo, Demokratische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ST'">
                                                    <fo:block>São Tomé und Príncipe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CF'">
                                                    <fo:block>Zentralafrikanische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SV'">
                                                    <fo:block>El Salvador</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CG'">
                                                    <fo:block>Kongo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CH'">
                                                    <fo:block>Schweiz</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SX'">
                                                    <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CI'">
                                                    <fo:block>Côte d'Ivoire</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SY'">
                                                    <fo:block>Arabische Republik Syrien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='SZ'">
                                                    <fo:block>Swasiland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CK'">
                                                    <fo:block>Cookinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CL'">
                                                    <fo:block>Chile</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CM'">
                                                    <fo:block>Kamerun</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CN'">
                                                    <fo:block>China</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CO'">
                                                    <fo:block>Kolumbien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CR'">
                                                    <fo:block>Costa Rica</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TC'">
                                                    <fo:block>Turks- und Caicosinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TD'">
                                                    <fo:block>Tschad</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CU'">
                                                    <fo:block>Kuba</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TF'">
                                                    <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CV'">
                                                    <fo:block>Kap Verde</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TG'">
                                                    <fo:block>Togo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CW'">
                                                    <fo:block>Curaçao</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TH'">
                                                    <fo:block>Thailand</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CX'">
                                                    <fo:block>Weihnachtsinsel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CY'">
                                                    <fo:block>Zypern</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TJ'">
                                                    <fo:block>Tadschikistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='CZ'">
                                                    <fo:block>Tschechien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TK'">
                                                    <fo:block>Tokelau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TL'">
                                                    <fo:block>Timor-Leste</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TM'">
                                                    <fo:block>Turkmenistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TN'">
                                                    <fo:block>Tunesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TO'">
                                                    <fo:block>Tonga</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TR'">
                                                    <fo:block>Türkei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TT'">
                                                    <fo:block>Trinidad und Tobago</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DE'">
                                                    <fo:block>Deutschland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TV'">
                                                    <fo:block>Tuvalu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TW'">
                                                    <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DJ'">
                                                    <fo:block>Dschibuti</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='TZ'">
                                                    <fo:block>Tansania, Vereinigte Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DK'">
                                                    <fo:block>Dänemark</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DM'">
                                                    <fo:block>Dominica</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DO'">
                                                    <fo:block>Dominikanische Republik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UA'">
                                                    <fo:block>Ukraine</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UG'">
                                                    <fo:block>Uganda</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UK'">
                                                    <fo:block>Vereinigtes Königreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='DZ'">
                                                    <fo:block>Algerien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UM'">
                                                    <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='EC'">
                                                    <fo:block>Ecuador</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='US'">
                                                    <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='EE'">
                                                    <fo:block>Estland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='EG'">
                                                    <fo:block>Ägypten</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='EH'">
                                                    <fo:block>Westsahara</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UY'">
                                                    <fo:block>Uruguay</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='UZ'">
                                                    <fo:block>Usbekistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='EL'">
                                                    <fo:block>Griechenland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VA'">
                                                    <fo:block>Heiliger Stuhl</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ER'">
                                                    <fo:block>Eritrea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VC'">
                                                    <fo:block>St. Vincent und die Grenadinen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ES'">
                                                    <fo:block>Spanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ET'">
                                                    <fo:block>Äthiopien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VE'">
                                                    <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VG'">
                                                    <fo:block>Jungferninseln (Britische)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VI'">
                                                    <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VN'">
                                                    <fo:block>Vietnam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='VU'">
                                                    <fo:block>Vanuatu</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FI'">
                                                    <fo:block>Finnland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FJ'">
                                                    <fo:block>Fidschi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FK'">
                                                    <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FM'">
                                                    <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FO'">
                                                    <fo:block>Färöer-Inseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='FR'">
                                                    <fo:block>Frankreich</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='WF'">
                                                    <fo:block>Wallis und Futuna</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GA'">
                                                    <fo:block>Gabun</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='WS'">
                                                    <fo:block>Samoa</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GD'">
                                                    <fo:block>Grenada</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GE'">
                                                    <fo:block>Georgien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GF'">
                                                    <fo:block>Französisch-Guayana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GG'">
                                                    <fo:block>Guernsey</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GH'">
                                                    <fo:block>Ghana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GI'">
                                                    <fo:block>Gibraltar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GL'">
                                                    <fo:block>Grönland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GM'">
                                                    <fo:block>Gambia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GN'">
                                                    <fo:block>Guinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GP'">
                                                    <fo:block>Guadeloupe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GQ'">
                                                    <fo:block>Äquatorialguinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GS'">
                                                    <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GT'">
                                                    <fo:block>Guatemala</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GU'">
                                                    <fo:block>Guam</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GW'">
                                                    <fo:block>Guinea-Bissau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='GY'">
                                                    <fo:block>Guyana</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='XK'">
                                                    <fo:block>Kosovo</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HK'">
                                                    <fo:block>Hongkong</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HM'">
                                                    <fo:block>Heard und die McDonaldinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HN'">
                                                    <fo:block>Honduras</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HR'">
                                                    <fo:block>Kroatien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HT'">
                                                    <fo:block>Haiti</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='YE'">
                                                    <fo:block>Jemen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='HU'">
                                                    <fo:block>Ungarn</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ID'">
                                                    <fo:block>Indonesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='YT'">
                                                    <fo:block>Mayotte</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IE'">
                                                    <fo:block>Irland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IL'">
                                                    <fo:block>Israel</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IM'">
                                                    <fo:block>Isle of Man</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IN'">
                                                    <fo:block>Indien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IO'">
                                                    <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ZA'">
                                                    <fo:block>Südafrika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IQ'">
                                                    <fo:block>Irak</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IR'">
                                                    <fo:block>Iran (Islamische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IS'">
                                                    <fo:block>Island</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='IT'">
                                                    <fo:block>Italien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ZM'">
                                                    <fo:block>Sambia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='JE'">
                                                    <fo:block>Jersey</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ZW'">
                                                    <fo:block>Simbabwe</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='JM'">
                                                    <fo:block>Jamaika</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='JO'">
                                                    <fo:block>Jordanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='JP'">
                                                    <fo:block>Japan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KE'">
                                                    <fo:block>Kenia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KG'">
                                                    <fo:block>Kirgisistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KH'">
                                                    <fo:block>Kambodscha</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KI'">
                                                    <fo:block>Kiribati</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KM'">
                                                    <fo:block>Komoren</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KN'">
                                                    <fo:block>St. Kitts und Nevis</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KP'">
                                                    <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KR'">
                                                    <fo:block>Korea (Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KW'">
                                                    <fo:block>Kuwait</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KY'">
                                                    <fo:block>Cayman Islands</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='KZ'">
                                                    <fo:block>Kasachstan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LA'">
                                                    <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LB'">
                                                    <fo:block>Libanon</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LC'">
                                                    <fo:block>St. Lucia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LI'">
                                                    <fo:block>Liechtenstein</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LK'">
                                                    <fo:block>Sri Lanka</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LR'">
                                                    <fo:block>Liberia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LS'">
                                                    <fo:block>Lesotho</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LT'">
                                                    <fo:block>Litauen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LU'">
                                                    <fo:block>Luxemburg</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LV'">
                                                    <fo:block>Lettland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='LY'">
                                                    <fo:block>Libyen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MA'">
                                                    <fo:block>Marokko</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MC'">
                                                    <fo:block>Monaco</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MD'">
                                                    <fo:block>Moldawien (Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ME'">
                                                    <fo:block>Montenegro</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MF'">
                                                    <fo:block>St. Martin (französischer Teil)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MG'">
                                                    <fo:block>Madagaskar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MH'">
                                                    <fo:block>Marshallinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MK'">
                                                    <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='ML'">
                                                    <fo:block>Mali</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MM'">
                                                    <fo:block>Myanmar</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MN'">
                                                    <fo:block>Mongolei</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MO'">
                                                    <fo:block>Macau</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MP'">
                                                    <fo:block>Nördliche Marianen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MQ'">
                                                    <fo:block>Martinique</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MR'">
                                                    <fo:block>Mauretanien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MS'">
                                                    <fo:block>Montserrat</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MT'">
                                                    <fo:block>Malta</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MU'">
                                                    <fo:block>Mauritius</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MV'">
                                                    <fo:block>Malediven</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MW'">
                                                    <fo:block>Malawi</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MX'">
                                                    <fo:block>Mexiko</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MY'">
                                                    <fo:block>Malaysia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='MZ'">
                                                    <fo:block>Mosambik</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NA'">
                                                    <fo:block>Namibia</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NC'">
                                                    <fo:block>Neukaledonien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NE'">
                                                    <fo:block>Niger</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NF'">
                                                    <fo:block>Norfolkinseln</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NG'">
                                                    <fo:block>Nigeria</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NI'">
                                                    <fo:block>Nicaragua</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NL'">
                                                    <fo:block>Niederlande</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NO'">
                                                    <fo:block>Norwegen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NP'">
                                                    <fo:block>Nepal</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NR'">
                                                    <fo:block>Nauru</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NU'">
                                                    <fo:block>Niue</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='NZ'">
                                                    <fo:block>Neuseeland</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='OM'">
                                                    <fo:block>Oman</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PA'">
                                                    <fo:block>Panama</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PE'">
                                                    <fo:block>Peru</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PF'">
                                                    <fo:block>Französisch-Polynesien</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PG'">
                                                    <fo:block>Papua-Neuguinea</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PH'">
                                                    <fo:block>Philippinen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PK'">
                                                    <fo:block>Pakistan</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PL'">
                                                    <fo:block>Polen</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PM'">
                                                    <fo:block>St. Pierre und Miquelon</fo:block>
                                                  </xsl:when>
                                                  <xsl:when test="//CaseContext/EmployerContext/Address/country/value='PN'">
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
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block>
                      <fo:block>
                        <fo:table table-layout="fixed" width="100%" margin="2mm 0mm 2mm 2mm" border="solid 0.2mm Grey">
                          <fo:table-column column-width="45%"/>
                          <fo:table-column column-width="53.5%"/>
                          <fo:table-header background-color="LightGrey">
                            <fo:table-row border="solid 0.2mm Grey">
                              <fo:table-cell number-columns-spanned="2" padding="1mm 0mm 1mm 0mm">
                                <fo:block>1.3. E4984042-6A6F-E611-80CB-000D3A22E8CD Kontext zur Erstattung</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.3.1. Kennung der Erstattungsforderung</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/ReimbursementContext/reimbursementRequestID"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">1.3.2. Gesamtanzahl der Einzelforderungen</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//CaseContext/ReimbursementContext/totalNumberIndividualClaims"/>
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
                    <fo:block>2.</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <xsl:for-each select="//BusinessExceptionHasOccurred/businessException">
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
                                    <xsl:value-of select="position()"/>]
                                  </fo:block>
                                </fo:table-cell>
                              </fo:table-row>
                            </fo:table-header>
                            <fo:table-body start-indent="2mm">
                              <fo:table-row>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block wrap-option="wrap">2.1.1.[
                                    <xsl:value-of select="position()"/>]exception​Code
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="exceptionCode"/>
                                    <fo:block>
                                      <xsl:for-each select="exceptionCode/value">
                                        <xsl:choose>
                                          <xsl:when test=".='EESSI_NATIONAL_09'">
                                            <fo:block>Die Angaben zum MimeType im Nutzdatensatz sind nicht identisch zu den Angaben im SBDH.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_003'">
                                            <fo:block>Schemaprüfung AP fehlgeschlagen + {AP_Parser_ MESSAGE}.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_002'">
                                            <fo:block>Ungültige Empfänger-IK + [AP-MESSAGE].</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_03'">
                                            <fo:block>Fehler bei der Dekodierung des Anhangs.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_005'">
                                            <fo:block>Absender-IK {DE:000000000} verfügt nicht über die notwendige Kompetenz für den BUC {BUC-Type}.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_02'">
                                            <fo:block>Fehler bei der Dekodierung des Nutzdatensatzes.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_004'">
                                            <fo:block>Versand der Nachricht fehlgeschlagen + {AP-MESSAGE}.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_007'">
                                            <fo:block>Malwareprüfung im AP fehlgeschlagen.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_08'">
                                            <fo:block>Die UUID im Nutzdatensatz zu einem Anhang, ist nicht identisch mit der ID im dazugehörigen SBDH.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_19'">
                                            <fo:block>Die UUID im Nutzdatensatz ist nicht mit identisch zum Feld Instance Identifier im zugehörigen SBDH.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_006'">
                                            <fo:block>Empfänger-IK {DE:000000000} verfügt nicht über die notwendige Kompetenz für den BUC {BUC-Type}.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_18'">
                                            <fo:block>Anzahl der Anhänge im Nutzdatensatz entspricht nicht der Anzahl der Anhänge im SBDH.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_17'">
                                            <fo:block>Schemaprüfung fehlgeschlagen + {Parser_ MESSAGE}.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_NATIONAL_10'">
                                            <fo:block>Die Set ID im Nutzdatensatz ist nicht mit identisch zum Feld SetID im zugehörigen SBDH.</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='EESSI_AP_001'">
                                            <fo:block>Ungültige Absender-IK + [AP-MESSAGE].</fo:block>
                                          </xsl:when>
                                          <xsl:when test=".='CONFORMANCE_02'">
                                            <fo:block>Maximale Dateigröße überschritten.</fo:block>
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
                                  <fo:block wrap-option="wrap">2.1.2.[
                                    <xsl:value-of select="position()"/>]exception​Message
                                  </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                  <fo:block>
                                    <xsl:value-of select="exceptionMessage"/>
                                    <fo:block>
                                      <xsl:choose>
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
                <xsl:if test="not(//BusinessExceptionHasOccurred/businessException)">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block/>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:for-each select="//BusinessExceptionHasOccurred/accessPointErrorMessage">
                  <fo:table-row>
                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                      <fo:block wrap-option="wrap">2.2.[
                        <xsl:value-of select="position()"/>]access​Point​Error​Message
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                      <fo:block>
                        <xsl:value-of select=""/>
                        <fo:block>
                          <xsl:for-each select="//BusinessExceptionHasOccurred/">
                            <xsl:choose>
                              <xsl:otherwise>
                                <fo:block>-/-</fo:block>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </fo:block>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:for-each>
                <xsl:if test="not(//BusinessExceptionHasOccurred/accessPointErrorMessage)">
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
                    <fo:block>3.</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">3.1. SED-Code</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//WhileReceivingFollowingSED/SEDCode"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">3.2. SED-Version</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//WhileReceivingFollowingSED/SEDVersion"/>
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
