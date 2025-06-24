<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:variable name="filename">XSD2PDF_A100N_de-DE_6.0.1.xslt</xsl:variable>
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
                  <fo:block font-family="Arial Unicode MS" margin-left="5mm" font-size="14pt" text-align="start">A100N - Information über die Geltung der deutschen Rechtsvorschriften über soziale Sicherheit.</fo:block>
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
                    <fo:block>1. Angaben zur Person des Inhabers/der Inhaberin Person</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.1. Persönliche Identifikationsnummer (PIN)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/personalInsuranceNumber"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.2. Familienname(n)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/familyName"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.3. Vorname(n)</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/forename"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.4. Geschlecht</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/sex"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//person/sex/value='01'">
                            <fo:block>Männlich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/sex/value='02'">
                            <fo:block>Weiblich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/sex/value='98'">
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
                    <fo:block wrap-option="wrap">1.5. Geburtsdatum</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/dateOfBirth"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.6. Familienname(n) bei der Geburt</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/familyNameAtBirth"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">1.7. Staatsangehörigkeit</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/nationality"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//person/nationality/value='PS'">
                            <fo:block>Palästina (Staat)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PT'">
                            <fo:block>Portugal</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PW'">
                            <fo:block>Palau</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PY'">
                            <fo:block>Paraguay</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='QA'">
                            <fo:block>Katar</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PCHH'">
                            <fo:block>Jungferninseln, Treuhandgebiet</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AD'">
                            <fo:block>Andorra</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AE'">
                            <fo:block>Vereinigte Arabische Emirate</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AF'">
                            <fo:block>Afghanistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AG'">
                            <fo:block>Antigua und Barbuda</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AL'">
                            <fo:block>Albanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AM'">
                            <fo:block>Armenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AO'">
                            <fo:block>Angola</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AR'">
                            <fo:block>Argentinien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AT'">
                            <fo:block>Österreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AU'">
                            <fo:block>Australien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AZ'">
                            <fo:block>Aserbaidschan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='RO'">
                            <fo:block>Rumänien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BA'">
                            <fo:block>Bosnien und Herzegowina</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BB'">
                            <fo:block>Barbados</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='RS'">
                            <fo:block>Serbien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BD'">
                            <fo:block>Bangladesch</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BE'">
                            <fo:block>Belgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='RU'">
                            <fo:block>Russische Föderation</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BF'">
                            <fo:block>Burkina Faso</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='WKUM'">
                            <fo:block>Wake</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BG'">
                            <fo:block>Bulgarien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='RW'">
                            <fo:block>Ruanda</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BH'">
                            <fo:block>Bahrain</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BI'">
                            <fo:block>Burundi</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BJ'">
                            <fo:block>Benin</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BN'">
                            <fo:block>Brunei Darussalam</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BO'">
                            <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SA'">
                            <fo:block>Saudi-Arabien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SB'">
                            <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BR'">
                            <fo:block>Brasilien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SC'">
                            <fo:block>Seychellen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BS'">
                            <fo:block>Bahamas</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SD'">
                            <fo:block>Sudan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SE'">
                            <fo:block>Schweden</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BT'">
                            <fo:block>Bhutan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SG'">
                            <fo:block>Singapur</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BW'">
                            <fo:block>Botswana</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SI'">
                            <fo:block>Slowenien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BY'">
                            <fo:block>Belarus</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SK'">
                            <fo:block>Slowakei</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BZ'">
                            <fo:block>Belize</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SL'">
                            <fo:block>Sierra Leone</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SM'">
                            <fo:block>San Marino</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SN'">
                            <fo:block>Senegal</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SO'">
                            <fo:block>Somalia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CA'">
                            <fo:block>Kanada</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SR'">
                            <fo:block>Suriname</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SS'">
                            <fo:block>Südsudan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CD'">
                            <fo:block>Kongo, Demokratische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ST'">
                            <fo:block>São Tomé und Príncipe</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CF'">
                            <fo:block>Zentralafrikanische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SV'">
                            <fo:block>El Salvador</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CG'">
                            <fo:block>Kongo</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CH'">
                            <fo:block>Schweiz</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CI'">
                            <fo:block>Elfenbeinküste</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SY'">
                            <fo:block>Arabische Republik Syrien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SZ'">
                            <fo:block>Swasiland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CL'">
                            <fo:block>Chile</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CM'">
                            <fo:block>Kamerun</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CN'">
                            <fo:block>China</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CO'">
                            <fo:block>Kolumbien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CR'">
                            <fo:block>Costa Rica</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TD'">
                            <fo:block>Tschad</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CU'">
                            <fo:block>Kuba</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CV'">
                            <fo:block>Kap Verde</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TG'">
                            <fo:block>Togo</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TH'">
                            <fo:block>Thailand</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CY'">
                            <fo:block>Zypern</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TJ'">
                            <fo:block>Tadschikistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CZ'">
                            <fo:block>Tschechien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TL'">
                            <fo:block>Timor-Leste</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TM'">
                            <fo:block>Turkmenistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TN'">
                            <fo:block>Tunesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TO'">
                            <fo:block>Tonga</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TR'">
                            <fo:block>Türkei</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GEHH'">
                            <fo:block>Gilbert- und Elliceinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TT'">
                            <fo:block>Trinidad und Tobago</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DE'">
                            <fo:block>Deutschland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TV'">
                            <fo:block>Tuvalu</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DJ'">
                            <fo:block>Dschibuti</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TZ'">
                            <fo:block>Tansania, Vereinigte Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DK'">
                            <fo:block>Dänemark</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DM'">
                            <fo:block>Dominica</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DO'">
                            <fo:block>Dominikanische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='UA'">
                            <fo:block>Ukraine</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='UG'">
                            <fo:block>Uganda</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='UK'">
                            <fo:block>Vereinigtes Königreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DZ'">
                            <fo:block>Algerien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='EC'">
                            <fo:block>Ecuador</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='US'">
                            <fo:block>Vereinigte Staaten von Amerika</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='EE'">
                            <fo:block>Estland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BQAQ'">
                            <fo:block>Britisches Territorium in der Antarktis</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='EG'">
                            <fo:block>Ägypten</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='UY'">
                            <fo:block>Uruguay</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='UZ'">
                            <fo:block>Usbekistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='YUCS'">
                            <fo:block>Jugoslawien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='EL'">
                            <fo:block>Griechenland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BYAA'">
                            <fo:block>Weißrussische Sozialistische Sowjetrepublik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VA'">
                            <fo:block>Heiliger Stuhl</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ER'">
                            <fo:block>Eritrea</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VC'">
                            <fo:block>St. Vincent und die Grenadinen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ES'">
                            <fo:block>Spanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ET'">
                            <fo:block>Äthiopien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VE'">
                            <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='AIDJ'">
                            <fo:block>Französisches Afar- und Issa-Territorium</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VN'">
                            <fo:block>Vietnam</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VU'">
                            <fo:block>Vanuatu</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FI'">
                            <fo:block>Finnland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FJ'">
                            <fo:block>Fidschi</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SUHH'">
                            <fo:block>UdSSR</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FM'">
                            <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FR'">
                            <fo:block>Frankreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GA'">
                            <fo:block>Gabun</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='WS'">
                            <fo:block>Samoa</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GD'">
                            <fo:block>Grenada</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GE'">
                            <fo:block>Georgien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GH'">
                            <fo:block>Ghana</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GM'">
                            <fo:block>Gambia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GN'">
                            <fo:block>Guinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GQ'">
                            <fo:block>Äquatorialguinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GT'">
                            <fo:block>Guatemala</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GW'">
                            <fo:block>Guinea-Bissau</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='GY'">
                            <fo:block>Guyana</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='XK'">
                            <fo:block>Kosovo</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='XR'">
                            <fo:block>Flüchtling</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='XS'">
                            <fo:block>Staatenlose Person</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='XU'">
                            <fo:block>Nicht bekannt</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='HN'">
                            <fo:block>Honduras</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='HR'">
                            <fo:block>Kroatien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='HT'">
                            <fo:block>Haiti</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='YE'">
                            <fo:block>Jemen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='HU'">
                            <fo:block>Ungarn</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MIUM'">
                            <fo:block>Midwayinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NQAQ'">
                            <fo:block>Königin-Maud-Land</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ID'">
                            <fo:block>Indonesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IE'">
                            <fo:block>Irland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DDDE'">
                            <fo:block>Deutsche Demokratische Republik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IL'">
                            <fo:block>Israel</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IN'">
                            <fo:block>Indien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ZA'">
                            <fo:block>Südafrika</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IQ'">
                            <fo:block>Irak</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IR'">
                            <fo:block>Iran (Islamische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IS'">
                            <fo:block>Island</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FQHH'">
                            <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='IT'">
                            <fo:block>Italien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='BUMM'">
                            <fo:block>Burma</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ZM'">
                            <fo:block>Sambia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ZW'">
                            <fo:block>Simbabwe</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='FXFR'">
                            <fo:block>Metropolitan-Frankreich</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='JTUM'">
                            <fo:block>Johnston-Atoll</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='JM'">
                            <fo:block>Jamaika</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='JO'">
                            <fo:block>Jordanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='JP'">
                            <fo:block>Japan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KE'">
                            <fo:block>Kenia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='SKIN'">
                            <fo:block>Sikkim</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KG'">
                            <fo:block>Kirgisistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KH'">
                            <fo:block>Kambodscha</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KI'">
                            <fo:block>Kiribati</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PZPA'">
                            <fo:block>Panamakanalzone</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KM'">
                            <fo:block>Komoren</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NTHH'">
                            <fo:block>Neutrale Zone</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KN'">
                            <fo:block>St. Kitts und Nevis</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KP'">
                            <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KR'">
                            <fo:block>Korea (Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KW'">
                            <fo:block>Kuwait</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='KZ'">
                            <fo:block>Kasachstan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CSHH'">
                            <fo:block>Tschechoslowakei</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CSXX'">
                            <fo:block>Serbien und Montenegro</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LA'">
                            <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LB'">
                            <fo:block>Libanon</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LC'">
                            <fo:block>St. Lucia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PUUM'">
                            <fo:block>Sonstige US-Pazifik-Inseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LI'">
                            <fo:block>Liechtenstein</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='YDYE'">
                            <fo:block>Demokratische Volksrepublik Jemen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LK'">
                            <fo:block>Sri Lanka</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LR'">
                            <fo:block>Liberia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LS'">
                            <fo:block>Lesotho</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LT'">
                            <fo:block>Litauen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LU'">
                            <fo:block>Luxemburg</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LV'">
                            <fo:block>Lettland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='LY'">
                            <fo:block>Libyen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='CTKI'">
                            <fo:block>Die Inseln Canton und Enderbury</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MA'">
                            <fo:block>Marokko</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MC'">
                            <fo:block>Monaco</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MD'">
                            <fo:block>Moldawien (Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ME'">
                            <fo:block>Montenegro</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MG'">
                            <fo:block>Madagaskar</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MH'">
                            <fo:block>Marshallinseln</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MK'">
                            <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ML'">
                            <fo:block>Mali</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MM'">
                            <fo:block>Myanmar</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MN'">
                            <fo:block>Mongolei</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MR'">
                            <fo:block>Mauretanien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MT'">
                            <fo:block>Malta</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MU'">
                            <fo:block>Mauritius</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MV'">
                            <fo:block>Malediven</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MW'">
                            <fo:block>Malawi</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MX'">
                            <fo:block>Mexiko</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MY'">
                            <fo:block>Malaysia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='MZ'">
                            <fo:block>Mosambik</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NA'">
                            <fo:block>Namibia</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ZRCD'">
                            <fo:block>Zaire</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NE'">
                            <fo:block>Niger</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NG'">
                            <fo:block>Nigeria</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NI'">
                            <fo:block>Nicaragua</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='DYBJ'">
                            <fo:block>Dahomey</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NL'">
                            <fo:block>Niederlande</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NO'">
                            <fo:block>Norwegen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NP'">
                            <fo:block>Nepal</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NR'">
                            <fo:block>Nauru</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NZ'">
                            <fo:block>Neuseeland</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='VDVN'">
                            <fo:block>Demokratische Republik Vietnam</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='TPTL'">
                            <fo:block>Osttimor</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='RHZW'">
                            <fo:block>Südrhodesien</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='NHVU'">
                            <fo:block>Kondominium Neue Hebriden</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='OM'">
                            <fo:block>Oman</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='HVBF'">
                            <fo:block>Obervolta</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PA'">
                            <fo:block>Panama</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='ANHH'">
                            <fo:block>Niederländische Antillen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PE'">
                            <fo:block>Peru</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PG'">
                            <fo:block>Papua-Neuguinea</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PH'">
                            <fo:block>Philippinen</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PK'">
                            <fo:block>Pakistan</fo:block>
                          </xsl:when>
                          <xsl:when test="//person/nationality/value='PL'">
                            <fo:block>Polen</fo:block>
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
                    <fo:block wrap-option="wrap">1.8. null</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//person/placeOfBirth"/>
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
                                <fo:block>1.9. Anschrift(en) im Wohnstaat und/oder Aufenthaltsstaat. Mehrfachnennung möglich. Anschriften</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <xsl:for-each select="//person/addresses/address">
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
                                              <fo:block>1.9.1.[
                                                <xsl:value-of select="position()"/>] Anschrift und Art der Anschrift Anschrift
                                              </fo:block>
                                            </fo:table-cell>
                                          </fo:table-row>
                                        </fo:table-header>
                                        <fo:table-body start-indent="2mm">
                                          <fo:table-row>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block wrap-option="wrap">1.9.1.1.[
                                                <xsl:value-of select="position()"/>] Art der Anschrift
                                              </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                              <fo:block>
                                                <xsl:value-of select="type"/>
                                                <fo:block>
                                                  <xsl:choose>
                                                    <xsl:when test="type/value='01'">
                                                      <fo:block>Wohnstaat</fo:block>
                                                    </xsl:when>
                                                    <xsl:when test="type/value='02'">
                                                      <fo:block>Aufenthaltsstaat</fo:block>
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
                                                          <fo:block>1.9.1.2.[
                                                            <xsl:value-of select="position()"/>] 079D5E97-ED36-E611-80C9-000D3A22E8CD Anschrift
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                    </fo:table-header>
                                                    <fo:table-body start-indent="2mm">
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.9.1.2.1.[
                                                            <xsl:value-of select="position()"/>] Straße
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="address/street"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.9.1.2.2.[
                                                            <xsl:value-of select="position()"/>] Ort
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="address/town"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.9.1.2.3.[
                                                            <xsl:value-of select="position()"/>] Postleitzahl
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="address/postalCode"/>
                                                          </fo:block>
                                                        </fo:table-cell>
                                                      </fo:table-row>
                                                      <fo:table-row>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.9.1.2.4.[
                                                            <xsl:value-of select="position()"/>] Land
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="address/country"/>
                                                            <fo:block>
                                                              <xsl:choose>
                                                                <xsl:when test="address/country/value='PR'">
                                                                  <fo:block>Puerto Rico</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PS'">
                                                                  <fo:block>Palästina (Staat)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PT'">
                                                                  <fo:block>Portugal</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PW'">
                                                                  <fo:block>Palau</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PY'">
                                                                  <fo:block>Paraguay</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='QA'">
                                                                  <fo:block>Katar</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AD'">
                                                                  <fo:block>Andorra</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AE'">
                                                                  <fo:block>Vereinigte Arabische Emirate</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AF'">
                                                                  <fo:block>Afghanistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AG'">
                                                                  <fo:block>Antigua und Barbuda</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AI'">
                                                                  <fo:block>Anguilla</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AL'">
                                                                  <fo:block>Albanien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AM'">
                                                                  <fo:block>Armenien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AO'">
                                                                  <fo:block>Angola</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AQ'">
                                                                  <fo:block>Antarktis</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AR'">
                                                                  <fo:block>Argentinien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AS'">
                                                                  <fo:block>Amerikanisch-Samoa</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AT'">
                                                                  <fo:block>Österreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='RE'">
                                                                  <fo:block>Réunion</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AU'">
                                                                  <fo:block>Australien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AW'">
                                                                  <fo:block>Aruba</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AX'">
                                                                  <fo:block>Ålandinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='AZ'">
                                                                  <fo:block>Aserbaidschan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='RO'">
                                                                  <fo:block>Rumänien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BA'">
                                                                  <fo:block>Bosnien und Herzegowina</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BB'">
                                                                  <fo:block>Barbados</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='RS'">
                                                                  <fo:block>Serbien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BD'">
                                                                  <fo:block>Bangladesch</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BE'">
                                                                  <fo:block>Belgien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='RU'">
                                                                  <fo:block>Russische Föderation</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BF'">
                                                                  <fo:block>Burkina Faso</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BG'">
                                                                  <fo:block>Bulgarien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='RW'">
                                                                  <fo:block>Ruanda</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BH'">
                                                                  <fo:block>Bahrain</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BI'">
                                                                  <fo:block>Burundi</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BJ'">
                                                                  <fo:block>Benin</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BL'">
                                                                  <fo:block>Saint-Barthélemy</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BM'">
                                                                  <fo:block>Bermuda</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BN'">
                                                                  <fo:block>Brunei Darussalam</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BO'">
                                                                  <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SA'">
                                                                  <fo:block>Saudi-Arabien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BQ'">
                                                                  <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SB'">
                                                                  <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BR'">
                                                                  <fo:block>Brasilien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SC'">
                                                                  <fo:block>Seychellen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BS'">
                                                                  <fo:block>Bahamas</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SD'">
                                                                  <fo:block>Sudan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SE'">
                                                                  <fo:block>Schweden</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BT'">
                                                                  <fo:block>Bhutan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BV'">
                                                                  <fo:block>Bouvetinsel</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SG'">
                                                                  <fo:block>Singapur</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BW'">
                                                                  <fo:block>Botswana</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SH'">
                                                                  <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SI'">
                                                                  <fo:block>Slowenien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BY'">
                                                                  <fo:block>Belarus</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SJ'">
                                                                  <fo:block>Svalbard und Jan Mayen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SK'">
                                                                  <fo:block>Slowakei</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='BZ'">
                                                                  <fo:block>Belize</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SL'">
                                                                  <fo:block>Sierra Leone</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SM'">
                                                                  <fo:block>San Marino</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SN'">
                                                                  <fo:block>Senegal</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SO'">
                                                                  <fo:block>Somalia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CA'">
                                                                  <fo:block>Kanada</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SR'">
                                                                  <fo:block>Suriname</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CC'">
                                                                  <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SS'">
                                                                  <fo:block>Südsudan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CD'">
                                                                  <fo:block>Kongo, Demokratische Republik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ST'">
                                                                  <fo:block>São Tomé und Príncipe</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CF'">
                                                                  <fo:block>Zentralafrikanische Republik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SV'">
                                                                  <fo:block>El Salvador</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CG'">
                                                                  <fo:block>Kongo</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CH'">
                                                                  <fo:block>Schweiz</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SX'">
                                                                  <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CI'">
                                                                  <fo:block>Côte d'Ivoire</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SY'">
                                                                  <fo:block>Arabische Republik Syrien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='SZ'">
                                                                  <fo:block>Swasiland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CK'">
                                                                  <fo:block>Cookinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CL'">
                                                                  <fo:block>Chile</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CM'">
                                                                  <fo:block>Kamerun</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CN'">
                                                                  <fo:block>China</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CO'">
                                                                  <fo:block>Kolumbien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CR'">
                                                                  <fo:block>Costa Rica</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TC'">
                                                                  <fo:block>Turks- und Caicosinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TD'">
                                                                  <fo:block>Tschad</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CU'">
                                                                  <fo:block>Kuba</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TF'">
                                                                  <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CV'">
                                                                  <fo:block>Kap Verde</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TG'">
                                                                  <fo:block>Togo</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CW'">
                                                                  <fo:block>Curaçao</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TH'">
                                                                  <fo:block>Thailand</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CX'">
                                                                  <fo:block>Weihnachtsinsel</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CY'">
                                                                  <fo:block>Zypern</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TJ'">
                                                                  <fo:block>Tadschikistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='CZ'">
                                                                  <fo:block>Tschechien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TK'">
                                                                  <fo:block>Tokelau</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TL'">
                                                                  <fo:block>Timor-Leste</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TM'">
                                                                  <fo:block>Turkmenistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TN'">
                                                                  <fo:block>Tunesien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TO'">
                                                                  <fo:block>Tonga</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TR'">
                                                                  <fo:block>Türkei</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TT'">
                                                                  <fo:block>Trinidad und Tobago</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DE'">
                                                                  <fo:block>Deutschland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TV'">
                                                                  <fo:block>Tuvalu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TW'">
                                                                  <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DJ'">
                                                                  <fo:block>Dschibuti</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='TZ'">
                                                                  <fo:block>Tansania, Vereinigte Republik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DK'">
                                                                  <fo:block>Dänemark</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DM'">
                                                                  <fo:block>Dominica</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DO'">
                                                                  <fo:block>Dominikanische Republik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UA'">
                                                                  <fo:block>Ukraine</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UG'">
                                                                  <fo:block>Uganda</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UK'">
                                                                  <fo:block>Vereinigtes Königreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='DZ'">
                                                                  <fo:block>Algerien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UM'">
                                                                  <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='EC'">
                                                                  <fo:block>Ecuador</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='US'">
                                                                  <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='EE'">
                                                                  <fo:block>Estland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='EG'">
                                                                  <fo:block>Ägypten</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='EH'">
                                                                  <fo:block>Westsahara</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UY'">
                                                                  <fo:block>Uruguay</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='UZ'">
                                                                  <fo:block>Usbekistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='EL'">
                                                                  <fo:block>Griechenland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VA'">
                                                                  <fo:block>Heiliger Stuhl</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ER'">
                                                                  <fo:block>Eritrea</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VC'">
                                                                  <fo:block>St. Vincent und die Grenadinen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ES'">
                                                                  <fo:block>Spanien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ET'">
                                                                  <fo:block>Äthiopien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VE'">
                                                                  <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VG'">
                                                                  <fo:block>Jungferninseln (Britische)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VI'">
                                                                  <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VN'">
                                                                  <fo:block>Vietnam</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='VU'">
                                                                  <fo:block>Vanuatu</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FI'">
                                                                  <fo:block>Finnland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FJ'">
                                                                  <fo:block>Fidschi</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FK'">
                                                                  <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FM'">
                                                                  <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FO'">
                                                                  <fo:block>Färöer-Inseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='FR'">
                                                                  <fo:block>Frankreich</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='WF'">
                                                                  <fo:block>Wallis und Futuna</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GA'">
                                                                  <fo:block>Gabun</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='WS'">
                                                                  <fo:block>Samoa</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GD'">
                                                                  <fo:block>Grenada</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GE'">
                                                                  <fo:block>Georgien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GF'">
                                                                  <fo:block>Französisch-Guayana</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GG'">
                                                                  <fo:block>Guernsey</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GH'">
                                                                  <fo:block>Ghana</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GI'">
                                                                  <fo:block>Gibraltar</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GL'">
                                                                  <fo:block>Grönland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GM'">
                                                                  <fo:block>Gambia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GN'">
                                                                  <fo:block>Guinea</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GP'">
                                                                  <fo:block>Guadeloupe</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GQ'">
                                                                  <fo:block>Äquatorialguinea</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GS'">
                                                                  <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GT'">
                                                                  <fo:block>Guatemala</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GU'">
                                                                  <fo:block>Guam</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GW'">
                                                                  <fo:block>Guinea-Bissau</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='GY'">
                                                                  <fo:block>Guyana</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='XK'">
                                                                  <fo:block>Kosovo</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HK'">
                                                                  <fo:block>Hongkong</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HM'">
                                                                  <fo:block>Heard und die McDonaldinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HN'">
                                                                  <fo:block>Honduras</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HR'">
                                                                  <fo:block>Kroatien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HT'">
                                                                  <fo:block>Haiti</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='YE'">
                                                                  <fo:block>Jemen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='HU'">
                                                                  <fo:block>Ungarn</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ID'">
                                                                  <fo:block>Indonesien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='YT'">
                                                                  <fo:block>Mayotte</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IE'">
                                                                  <fo:block>Irland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IL'">
                                                                  <fo:block>Israel</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IM'">
                                                                  <fo:block>Isle of Man</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IN'">
                                                                  <fo:block>Indien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IO'">
                                                                  <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ZA'">
                                                                  <fo:block>Südafrika</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IQ'">
                                                                  <fo:block>Irak</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IR'">
                                                                  <fo:block>Iran (Islamische Republik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IS'">
                                                                  <fo:block>Island</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='IT'">
                                                                  <fo:block>Italien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ZM'">
                                                                  <fo:block>Sambia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='JE'">
                                                                  <fo:block>Jersey</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ZW'">
                                                                  <fo:block>Simbabwe</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='JM'">
                                                                  <fo:block>Jamaika</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='JO'">
                                                                  <fo:block>Jordanien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='JP'">
                                                                  <fo:block>Japan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KE'">
                                                                  <fo:block>Kenia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KG'">
                                                                  <fo:block>Kirgisistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KH'">
                                                                  <fo:block>Kambodscha</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KI'">
                                                                  <fo:block>Kiribati</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KM'">
                                                                  <fo:block>Komoren</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KN'">
                                                                  <fo:block>St. Kitts und Nevis</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KP'">
                                                                  <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KR'">
                                                                  <fo:block>Korea (Republik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KW'">
                                                                  <fo:block>Kuwait</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KY'">
                                                                  <fo:block>Cayman Islands</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='KZ'">
                                                                  <fo:block>Kasachstan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LA'">
                                                                  <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LB'">
                                                                  <fo:block>Libanon</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LC'">
                                                                  <fo:block>St. Lucia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LI'">
                                                                  <fo:block>Liechtenstein</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LK'">
                                                                  <fo:block>Sri Lanka</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LR'">
                                                                  <fo:block>Liberia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LS'">
                                                                  <fo:block>Lesotho</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LT'">
                                                                  <fo:block>Litauen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LU'">
                                                                  <fo:block>Luxemburg</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LV'">
                                                                  <fo:block>Lettland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='LY'">
                                                                  <fo:block>Libyen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MA'">
                                                                  <fo:block>Marokko</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MC'">
                                                                  <fo:block>Monaco</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MD'">
                                                                  <fo:block>Moldawien (Republik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ME'">
                                                                  <fo:block>Montenegro</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MF'">
                                                                  <fo:block>St. Martin (französischer Teil)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MG'">
                                                                  <fo:block>Madagaskar</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MH'">
                                                                  <fo:block>Marshallinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MK'">
                                                                  <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='ML'">
                                                                  <fo:block>Mali</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MM'">
                                                                  <fo:block>Myanmar</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MN'">
                                                                  <fo:block>Mongolei</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MO'">
                                                                  <fo:block>Macau</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MP'">
                                                                  <fo:block>Nördliche Marianen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MQ'">
                                                                  <fo:block>Martinique</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MR'">
                                                                  <fo:block>Mauretanien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MS'">
                                                                  <fo:block>Montserrat</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MT'">
                                                                  <fo:block>Malta</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MU'">
                                                                  <fo:block>Mauritius</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MV'">
                                                                  <fo:block>Malediven</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MW'">
                                                                  <fo:block>Malawi</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MX'">
                                                                  <fo:block>Mexiko</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MY'">
                                                                  <fo:block>Malaysia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='MZ'">
                                                                  <fo:block>Mosambik</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NA'">
                                                                  <fo:block>Namibia</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NC'">
                                                                  <fo:block>Neukaledonien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NE'">
                                                                  <fo:block>Niger</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NF'">
                                                                  <fo:block>Norfolkinseln</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NG'">
                                                                  <fo:block>Nigeria</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NI'">
                                                                  <fo:block>Nicaragua</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NL'">
                                                                  <fo:block>Niederlande</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NO'">
                                                                  <fo:block>Norwegen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NP'">
                                                                  <fo:block>Nepal</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NR'">
                                                                  <fo:block>Nauru</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NU'">
                                                                  <fo:block>Niue</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='NZ'">
                                                                  <fo:block>Neuseeland</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='OM'">
                                                                  <fo:block>Oman</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PA'">
                                                                  <fo:block>Panama</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PE'">
                                                                  <fo:block>Peru</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PF'">
                                                                  <fo:block>Französisch-Polynesien</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PG'">
                                                                  <fo:block>Papua-Neuguinea</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PH'">
                                                                  <fo:block>Philippinen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PK'">
                                                                  <fo:block>Pakistan</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PL'">
                                                                  <fo:block>Polen</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PM'">
                                                                  <fo:block>St. Pierre und Miquelon</fo:block>
                                                                </xsl:when>
                                                                <xsl:when test="address/country/value='PN'">
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
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block wrap-option="wrap">1.9.1.2.5.[
                                                            <xsl:value-of select="position()"/>] Gebäudename/-bezeichnung
                                                          </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                                          <fo:block>
                                                            <xsl:value-of select="address/buildingName"/>
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
                            <xsl:if test="not(//person/addresses/address)">
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
                    <fo:block>2. D0F7B291-A45F-E611-80CB-000D3A22E8CD Entscheidung über die anwendbaren Rechtsvorschriften</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">2.1. Mitgliedstaat, dessen Rechtsvorschriften anzuwenden sind</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//memberState/memberStateWhichLegislationApplies"/>
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
                                <fo:block>2.2. Zeitraum, für den die Entscheidung gilt Zeitraum</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.2.1. Datum Beginn</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//memberState/period/startDate"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.2.2. Datum Ende</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//memberState/period/endDate"/>
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
                                <fo:block>2.3. Zusätzliche Informationen Zusätzliche Informationen</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.3.1. Information: Die Festlegung ist vorläufig gemäß Artikel 16 der Verordnung (EG) Nr. 987/2009</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//memberState/additionalInformation/RulesApplyProvidedForByRegulation"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//memberState/additionalInformation/RulesApplyProvidedForByRegulation/value='0'">
                                        <fo:block>Nein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//memberState/additionalInformation/RulesApplyProvidedForByRegulation/value='1'">
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
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">2.3.2. Übergangsbestimmungen gelten gemäß Verordnung (EG) Nr. 883/2004</fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//memberState/additionalInformation/interimRegulation"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//memberState/additionalInformation/interimRegulation/value='0'">
                                        <fo:block>Nein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//memberState/additionalInformation/interimRegulation/value='1'">
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
                    <fo:block>3. Statusbestätigung</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">3.1.-</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//status/value"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//status/value='11'">
                            <fo:block>Ausnahmevereinbarung</fo:block>
                          </xsl:when>
                          <xsl:when test="//status/value='02'">
                            <fo:block>Arbeitnehmer/in arbeitet in zwei oder mehr Staaten</fo:block>
                          </xsl:when>
                          <xsl:when test="//status/value='04'">
                            <fo:block>Selbstständige/r, die/der in zwei oder mehr Staaten erwerbstätig ist</fo:block>
                          </xsl:when>
                          <xsl:when test="//status/value='08'">
                            <fo:block>In verschiedenen Staaten als beschäftigte und selbstständig erwerbstätige Person tätig</fo:block>
                          </xsl:when>
                          <xsl:when test="//status/value='09'">
                            <fo:block>In einem Staat als Beamter/Beamtin und in einem anderen Staat oder mehreren anderen Staaten als beschäftigte/selbstständig erwerbstätige Person tätig</fo:block>
                          </xsl:when>
                          <xsl:when test="//status/value='10'">
                            <fo:block>Mitglied einer Flug- oder Kabinenbesatzung</fo:block>
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
                    <fo:block>4.[
                      <xsl:value-of select="position()"/>] Identifizierung des Arbeitgebers/der Arbeitgeberin/der Arbeitgeber(innen). Mehrfachnennung möglich. Arbeitgeber/in
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">4.1.[
                      <xsl:value-of select="position()"/>] Name
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//identificationEmployer/name"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">4.2.[
                      <xsl:value-of select="position()"/>] Identifikationsnummer
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//identificationEmployer/identificationNumber"/>
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
                                <fo:block>4.3.[
                                  <xsl:value-of select="position()"/>] 69F382D1-9418-E611-80EA-000C292ED0D7 Anschrift
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">4.3.1.[
                                  <xsl:value-of select="position()"/>] Straße
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationEmployer/address/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">4.3.2.[
                                  <xsl:value-of select="position()"/>] Ort
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationEmployer/address/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">4.3.3.[
                                  <xsl:value-of select="position()"/>] Postleitzahl
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationEmployer/address/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">4.3.4.[
                                  <xsl:value-of select="position()"/>] Land
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationEmployer/address/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//identificationEmployer/address/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationEmployer/address/country/value='PN'">
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
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">4.3.5.[
                                  <xsl:value-of select="position()"/>] Gebäudename/-bezeichnung
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationEmployer/address/buildingName"/>
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
                    <fo:block wrap-option="wrap">4.4.[
                      <xsl:value-of select="position()"/>]Bitte angeben, wenn eine geringfügige Beschäftigung vorliegt (1=Ja/0=Nein)
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//identificationEmployer/minorEmployment"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//identificationEmployer/minorEmployment/value='0'">
                            <fo:block>Nein</fo:block>
                          </xsl:when>
                          <xsl:when test="//identificationEmployer/minorEmployment/value='1'">
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
                    <fo:block>5.[
                      <xsl:value-of select="position()"/>] Identifizierung der selbstständigen Erwerbstätigkeit(en). Mehrfachnennung möglich. Selbstständige Erwerbstätigkeit(en)
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">5.1.[
                      <xsl:value-of select="position()"/>] Name
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//identificationSelfEmployment/name"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">5.2.[
                      <xsl:value-of select="position()"/>] Identifikationsnummer
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//identificationSelfEmployment/identificationNumber"/>
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
                                <fo:block>5.3.[
                                  <xsl:value-of select="position()"/>] 69F382D1-9418-E611-80EA-000C292ED0D7 Anschrift
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.1.[
                                  <xsl:value-of select="position()"/>] Straße
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationSelfEmployment/address/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.2.[
                                  <xsl:value-of select="position()"/>] Ort
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationSelfEmployment/address/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.3.[
                                  <xsl:value-of select="position()"/>] Postleitzahl
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationSelfEmployment/address/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.4.[
                                  <xsl:value-of select="position()"/>] Land
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationSelfEmployment/address/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//identificationSelfEmployment/address/country/value='PN'">
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
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">5.3.5.[
                                  <xsl:value-of select="position()"/>] Gebäudename/-bezeichnung
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//identificationSelfEmployment/address/buildingName"/>
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
                    <fo:block>6.[
                      <xsl:value-of select="position()"/>] Arbeitsorte. Mehrfachnennung möglich. null
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">6.1.[
                      <xsl:value-of select="position()"/>]Firmenname / Schiffsname / Heimatbasis
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//placesWork/companyName"/>
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
                                <fo:block>6.2.[
                                  <xsl:value-of select="position()"/>] 69F382D1-9418-E611-80EA-000C292ED0D7 Anschrift
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-header>
                          <fo:table-body start-indent="2mm">
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.2.1.[
                                  <xsl:value-of select="position()"/>] Straße
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//placesWork/address/street"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.2.2.[
                                  <xsl:value-of select="position()"/>] Ort
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//placesWork/address/town"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.2.3.[
                                  <xsl:value-of select="position()"/>] Postleitzahl
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//placesWork/address/postalCode"/>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.2.4.[
                                  <xsl:value-of select="position()"/>] Land
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//placesWork/address/country"/>
                                  <fo:block>
                                    <xsl:choose>
                                      <xsl:when test="//placesWork/address/country/value='PR'">
                                        <fo:block>Puerto Rico</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PS'">
                                        <fo:block>Palästina (Staat)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PT'">
                                        <fo:block>Portugal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PW'">
                                        <fo:block>Palau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PY'">
                                        <fo:block>Paraguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='QA'">
                                        <fo:block>Katar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AD'">
                                        <fo:block>Andorra</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AE'">
                                        <fo:block>Vereinigte Arabische Emirate</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AF'">
                                        <fo:block>Afghanistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AG'">
                                        <fo:block>Antigua und Barbuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AI'">
                                        <fo:block>Anguilla</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AL'">
                                        <fo:block>Albanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AM'">
                                        <fo:block>Armenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AO'">
                                        <fo:block>Angola</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AQ'">
                                        <fo:block>Antarktis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AR'">
                                        <fo:block>Argentinien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AS'">
                                        <fo:block>Amerikanisch-Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AT'">
                                        <fo:block>Österreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='RE'">
                                        <fo:block>Réunion</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AU'">
                                        <fo:block>Australien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AW'">
                                        <fo:block>Aruba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AX'">
                                        <fo:block>Ålandinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='AZ'">
                                        <fo:block>Aserbaidschan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='RO'">
                                        <fo:block>Rumänien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BA'">
                                        <fo:block>Bosnien und Herzegowina</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BB'">
                                        <fo:block>Barbados</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='RS'">
                                        <fo:block>Serbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BD'">
                                        <fo:block>Bangladesch</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BE'">
                                        <fo:block>Belgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='RU'">
                                        <fo:block>Russische Föderation</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BF'">
                                        <fo:block>Burkina Faso</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BG'">
                                        <fo:block>Bulgarien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='RW'">
                                        <fo:block>Ruanda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BH'">
                                        <fo:block>Bahrain</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BI'">
                                        <fo:block>Burundi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BJ'">
                                        <fo:block>Benin</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BL'">
                                        <fo:block>Saint-Barthélemy</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BM'">
                                        <fo:block>Bermuda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BN'">
                                        <fo:block>Brunei Darussalam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BO'">
                                        <fo:block>Bolivien, Plurinationaler Staat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SA'">
                                        <fo:block>Saudi-Arabien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BQ'">
                                        <fo:block>Bonaire, St. Eustatius und Saba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SB'">
                                        <fo:block>Salomonen (Salomon-Inseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BR'">
                                        <fo:block>Brasilien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SC'">
                                        <fo:block>Seychellen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BS'">
                                        <fo:block>Bahamas</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SD'">
                                        <fo:block>Sudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SE'">
                                        <fo:block>Schweden</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BT'">
                                        <fo:block>Bhutan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BV'">
                                        <fo:block>Bouvetinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SG'">
                                        <fo:block>Singapur</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BW'">
                                        <fo:block>Botswana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SH'">
                                        <fo:block>St. Helena, Ascension und Tristan da Cunha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SI'">
                                        <fo:block>Slowenien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BY'">
                                        <fo:block>Belarus</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SJ'">
                                        <fo:block>Svalbard und Jan Mayen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SK'">
                                        <fo:block>Slowakei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='BZ'">
                                        <fo:block>Belize</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SL'">
                                        <fo:block>Sierra Leone</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SM'">
                                        <fo:block>San Marino</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SN'">
                                        <fo:block>Senegal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SO'">
                                        <fo:block>Somalia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CA'">
                                        <fo:block>Kanada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SR'">
                                        <fo:block>Suriname</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CC'">
                                        <fo:block>Kokosinseln (Keelinginseln)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SS'">
                                        <fo:block>Südsudan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CD'">
                                        <fo:block>Kongo, Demokratische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ST'">
                                        <fo:block>São Tomé und Príncipe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CF'">
                                        <fo:block>Zentralafrikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SV'">
                                        <fo:block>El Salvador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CG'">
                                        <fo:block>Kongo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CH'">
                                        <fo:block>Schweiz</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SX'">
                                        <fo:block>Sint Maarten (niederländischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CI'">
                                        <fo:block>Côte d'Ivoire</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SY'">
                                        <fo:block>Arabische Republik Syrien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='SZ'">
                                        <fo:block>Swasiland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CK'">
                                        <fo:block>Cookinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CL'">
                                        <fo:block>Chile</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CM'">
                                        <fo:block>Kamerun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CN'">
                                        <fo:block>China</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CO'">
                                        <fo:block>Kolumbien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CR'">
                                        <fo:block>Costa Rica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TC'">
                                        <fo:block>Turks- und Caicosinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TD'">
                                        <fo:block>Tschad</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CU'">
                                        <fo:block>Kuba</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TF'">
                                        <fo:block>Französische Süd- und Antarktisgebiete</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CV'">
                                        <fo:block>Kap Verde</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TG'">
                                        <fo:block>Togo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CW'">
                                        <fo:block>Curaçao</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TH'">
                                        <fo:block>Thailand</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CX'">
                                        <fo:block>Weihnachtsinsel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CY'">
                                        <fo:block>Zypern</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TJ'">
                                        <fo:block>Tadschikistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='CZ'">
                                        <fo:block>Tschechien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TK'">
                                        <fo:block>Tokelau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TL'">
                                        <fo:block>Timor-Leste</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TM'">
                                        <fo:block>Turkmenistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TN'">
                                        <fo:block>Tunesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TO'">
                                        <fo:block>Tonga</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TR'">
                                        <fo:block>Türkei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TT'">
                                        <fo:block>Trinidad und Tobago</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DE'">
                                        <fo:block>Deutschland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TV'">
                                        <fo:block>Tuvalu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TW'">
                                        <fo:block>Taiwan (Chinesische Provinz)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DJ'">
                                        <fo:block>Dschibuti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='TZ'">
                                        <fo:block>Tansania, Vereinigte Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DK'">
                                        <fo:block>Dänemark</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DM'">
                                        <fo:block>Dominica</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DO'">
                                        <fo:block>Dominikanische Republik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UA'">
                                        <fo:block>Ukraine</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UG'">
                                        <fo:block>Uganda</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UK'">
                                        <fo:block>Vereinigtes Königreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='DZ'">
                                        <fo:block>Algerien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UM'">
                                        <fo:block>Kleinere Amerikanische Überseeinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='EC'">
                                        <fo:block>Ecuador</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='US'">
                                        <fo:block>Vereinigte Staaten von Amerika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='EE'">
                                        <fo:block>Estland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='EG'">
                                        <fo:block>Ägypten</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='EH'">
                                        <fo:block>Westsahara</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UY'">
                                        <fo:block>Uruguay</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='UZ'">
                                        <fo:block>Usbekistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='EL'">
                                        <fo:block>Griechenland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VA'">
                                        <fo:block>Heiliger Stuhl</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ER'">
                                        <fo:block>Eritrea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VC'">
                                        <fo:block>St. Vincent und die Grenadinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ES'">
                                        <fo:block>Spanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ET'">
                                        <fo:block>Äthiopien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VE'">
                                        <fo:block>Venezuela (Bolivarische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VG'">
                                        <fo:block>Jungferninseln (Britische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VI'">
                                        <fo:block>Jungferninseln (Amerikanische)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VN'">
                                        <fo:block>Vietnam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='VU'">
                                        <fo:block>Vanuatu</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FI'">
                                        <fo:block>Finnland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FJ'">
                                        <fo:block>Fidschi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FK'">
                                        <fo:block>Falklandinseln / (Malwinen)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FM'">
                                        <fo:block>Mikronesien (Föderierte Staaten)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FO'">
                                        <fo:block>Färöer-Inseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='FR'">
                                        <fo:block>Frankreich</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='WF'">
                                        <fo:block>Wallis und Futuna</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GA'">
                                        <fo:block>Gabun</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='WS'">
                                        <fo:block>Samoa</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GD'">
                                        <fo:block>Grenada</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GE'">
                                        <fo:block>Georgien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GF'">
                                        <fo:block>Französisch-Guayana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GG'">
                                        <fo:block>Guernsey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GH'">
                                        <fo:block>Ghana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GI'">
                                        <fo:block>Gibraltar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GL'">
                                        <fo:block>Grönland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GM'">
                                        <fo:block>Gambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GN'">
                                        <fo:block>Guinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GP'">
                                        <fo:block>Guadeloupe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GQ'">
                                        <fo:block>Äquatorialguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GS'">
                                        <fo:block>Südgeorgien und die Südlichen Sandwichinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GT'">
                                        <fo:block>Guatemala</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GU'">
                                        <fo:block>Guam</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GW'">
                                        <fo:block>Guinea-Bissau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='GY'">
                                        <fo:block>Guyana</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='XK'">
                                        <fo:block>Kosovo</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HK'">
                                        <fo:block>Hongkong</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HM'">
                                        <fo:block>Heard und die McDonaldinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HN'">
                                        <fo:block>Honduras</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HR'">
                                        <fo:block>Kroatien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HT'">
                                        <fo:block>Haiti</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='YE'">
                                        <fo:block>Jemen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='HU'">
                                        <fo:block>Ungarn</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ID'">
                                        <fo:block>Indonesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='YT'">
                                        <fo:block>Mayotte</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IE'">
                                        <fo:block>Irland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IL'">
                                        <fo:block>Israel</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IM'">
                                        <fo:block>Isle of Man</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IN'">
                                        <fo:block>Indien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IO'">
                                        <fo:block>Britisches Territorium im Indischen Ozean</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ZA'">
                                        <fo:block>Südafrika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IQ'">
                                        <fo:block>Irak</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IR'">
                                        <fo:block>Iran (Islamische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IS'">
                                        <fo:block>Island</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='IT'">
                                        <fo:block>Italien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ZM'">
                                        <fo:block>Sambia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='JE'">
                                        <fo:block>Jersey</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ZW'">
                                        <fo:block>Simbabwe</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='JM'">
                                        <fo:block>Jamaika</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='JO'">
                                        <fo:block>Jordanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='JP'">
                                        <fo:block>Japan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KE'">
                                        <fo:block>Kenia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KG'">
                                        <fo:block>Kirgisistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KH'">
                                        <fo:block>Kambodscha</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KI'">
                                        <fo:block>Kiribati</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KM'">
                                        <fo:block>Komoren</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KN'">
                                        <fo:block>St. Kitts und Nevis</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KP'">
                                        <fo:block>Korea (Demokratische Volksrepublik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KR'">
                                        <fo:block>Korea (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KW'">
                                        <fo:block>Kuwait</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KY'">
                                        <fo:block>Cayman Islands</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='KZ'">
                                        <fo:block>Kasachstan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LA'">
                                        <fo:block>Laos, Demokratische Volksrepublik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LB'">
                                        <fo:block>Libanon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LC'">
                                        <fo:block>St. Lucia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LI'">
                                        <fo:block>Liechtenstein</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LK'">
                                        <fo:block>Sri Lanka</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LR'">
                                        <fo:block>Liberia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LS'">
                                        <fo:block>Lesotho</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LT'">
                                        <fo:block>Litauen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LU'">
                                        <fo:block>Luxemburg</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LV'">
                                        <fo:block>Lettland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='LY'">
                                        <fo:block>Libyen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MA'">
                                        <fo:block>Marokko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MC'">
                                        <fo:block>Monaco</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MD'">
                                        <fo:block>Moldawien (Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ME'">
                                        <fo:block>Montenegro</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MF'">
                                        <fo:block>St. Martin (französischer Teil)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MG'">
                                        <fo:block>Madagaskar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MH'">
                                        <fo:block>Marshallinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MK'">
                                        <fo:block>Mazedonien (ehemalige jugoslawische Republik)</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='ML'">
                                        <fo:block>Mali</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MM'">
                                        <fo:block>Myanmar</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MN'">
                                        <fo:block>Mongolei</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MO'">
                                        <fo:block>Macau</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MP'">
                                        <fo:block>Nördliche Marianen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MQ'">
                                        <fo:block>Martinique</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MR'">
                                        <fo:block>Mauretanien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MS'">
                                        <fo:block>Montserrat</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MT'">
                                        <fo:block>Malta</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MU'">
                                        <fo:block>Mauritius</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MV'">
                                        <fo:block>Malediven</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MW'">
                                        <fo:block>Malawi</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MX'">
                                        <fo:block>Mexiko</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MY'">
                                        <fo:block>Malaysia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='MZ'">
                                        <fo:block>Mosambik</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NA'">
                                        <fo:block>Namibia</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NC'">
                                        <fo:block>Neukaledonien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NE'">
                                        <fo:block>Niger</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NF'">
                                        <fo:block>Norfolkinseln</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NG'">
                                        <fo:block>Nigeria</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NI'">
                                        <fo:block>Nicaragua</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NL'">
                                        <fo:block>Niederlande</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NO'">
                                        <fo:block>Norwegen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NP'">
                                        <fo:block>Nepal</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NR'">
                                        <fo:block>Nauru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NU'">
                                        <fo:block>Niue</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='NZ'">
                                        <fo:block>Neuseeland</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='OM'">
                                        <fo:block>Oman</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PA'">
                                        <fo:block>Panama</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PE'">
                                        <fo:block>Peru</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PF'">
                                        <fo:block>Französisch-Polynesien</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PG'">
                                        <fo:block>Papua-Neuguinea</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PH'">
                                        <fo:block>Philippinen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PK'">
                                        <fo:block>Pakistan</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PL'">
                                        <fo:block>Polen</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PM'">
                                        <fo:block>St. Pierre und Miquelon</fo:block>
                                      </xsl:when>
                                      <xsl:when test="//placesWork/address/country/value='PN'">
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
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block wrap-option="wrap">6.2.5.[
                                  <xsl:value-of select="position()"/>] Gebäudename/-bezeichnung
                                </fo:block>
                              </fo:table-cell>
                              <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                                <fo:block>
                                  <xsl:value-of select="//placesWork/address/buildingName"/>
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
                    <fo:block wrap-option="wrap">6.3.[
                      <xsl:value-of select="position()"/>] null
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//placesWork/noFixedAddressInStateWorkIndicator"/>
                      <fo:block>
                        <xsl:choose>
                          <xsl:when test="//placesWork/noFixedAddressInStateWorkIndicator/value='0'">
                            <fo:block>Nein</fo:block>
                          </xsl:when>
                          <xsl:when test="//placesWork/noFixedAddressInStateWorkIndicator/value='1'">
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
                    <fo:block>7. Ausstellender Träger</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body start-indent="2mm">
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.1. Träger-ID</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//competentInstitution/competentInstitutionIK"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.2.Seriennummer</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//competentInstitution/documentSerialNumber"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block wrap-option="wrap">7.3.Unser Zeichen</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border-top="solid 0.2mm Grey" border-bottom="solid 0.2mm Grey" padding="1mm 0mm 1mm 0mm">
                    <fo:block>
                      <xsl:value-of select="//competentInstitution/referenceNumber"/>
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
