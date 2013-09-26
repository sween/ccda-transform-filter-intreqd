<?xml version="1.0" encoding="UTF-8" ?>
<!--
* Copyright Epic Systems Corporation 2010-2012. All rights reserved.
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cldoc="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc">
	<xsl:variable name="docID" select="generate-id(cldoc:ClinicalDocument/cldoc:id)" />
	<xsl:variable name="lucyMyCh" select="boolean(cldoc:ClinicalDocument/cldoc:templateId/@root='1.2.840.114350.1.72.1.77896772')" />
	
	<!-- Force out of quirks mode -->
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" />
	
	<xsl:template match="cldoc:ClinicalDocument">
		
		<html lang="en">
			<head>
				<title><xsl:value-of select="cldoc:title" /> - <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:name/cldoc:family" />, <xsl:value-of select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:name/cldoc:given" /></title>
				<style type="text/css">	
					.SectionWrapper {
						padding-bottom: 10px;
					}
					#document { 
						margin: 0px;
					}
					
					<xsl:choose>
						<xsl:when test="$lucyMyCh">
							#document { 
								max-width: 910px; 
							}
							/* font-size: 10pt / 12pt = 83.33% */
							body {
								background: #FFFFFF;
								font-family: 'Segoe UI', Tahoma, Arial, Helvetica, Sans-Serif;
								font-size: 83.33%;
								padding: 30px;
							}
							/* head:
							   Top bar: Patient name, birth date, sex
							*/
							.head  {
								width: 100%;
								padding-top: 2px;
								line-height: 4em;
							}
							/* foot:
							   Text at bottom about using thumb drive/CDA
							*/
							#foot > * {
								float: left;
							}
							#foot > div {
								text-align: left;
								position: relative;
								max-width: 672px;
								padding-left: 20px;
							}
							/* h1.patientName:
							   Tops the page: Patient name, birth date, sex
							*/
							h1.patientName {									
								padding: 3px;
								padding-left: 6px;
								padding-top: 10px;
								font-weight: normal;
								margin: 0;
							}		
							/* #Current:
							   Lucy Personal Health Summary, as of Date
							*/
							#Current {
								float: right;
								white-space: nowrap;
								font-style: italic;
							}
							/* img.logo:
							   The organization's logo
						   	*/
						   	img.logo {
						   		width: 910px;
						   		height: auto;						   		
					   		}
					   		/* span.ptName
					   			The patient's name
					   		*/				
								
					   		span.ptName {
					   			font-family:'Century Gothic', 'Futura', Verdana, Arial, Helvetica, Sans-Serif;
								color: #000;
								font-size: 1em;			
					   		}
					   		/* span.ptDetails
					   			Male, birthdate
					   		*/
					   		span.ptDetails {
					   			padding-left: 50px;
					   			font-size: 0.55em;
					   		}
		   			   		/* .notificationTitle
					   			Note from organization - the title
				   			*/
				   			.notificationTitle {
				   				font-style: italic;
				   			}
		   			   		/* .notificationBody
					   			Text that appears under Note from Organization
				   			*/
				   			.notificationBody {
				   				padding-bottom: 20px
				   			}
							/* div.innerHead:
							   Tops each clinical section (e.g., Allergies, Current Medications, etc
							*/							div.innerHead {
								font-family: 'Century Gothic', 'Futura', Verdana, Arial, Helvetica, Sans-Serif;
								color: #10A0C5;  /* TODO: Set programmatically ... somehow */ 
								font-size: 1.6em;
								padding: 3px;
								padding-left: 12px;
							}
							/* .body_:
							   The div that contains all the content for the section
							*/
							.body_ {
								/* border-left: 1px solid #10A0C5;   */ 
								 border-top: 1px solid #10A0C5;   
							}
							/* .observationItem:
								This would be, for example, each allergy entry, or each medication entry
							*/
							.observationItem {
								text-indent: -30px;
								padding-left: 30px;
								list-style-type: none;
								padding-bottom: 8px;
								page-break-inside: avoid;
							}
							/* .observationItemSubItem:
								This is a list within a list. It gets bullets. (Note - not yet used.)
							*/
							.observationItemSubItem {
								text-indent: -20px;
								padding-left: 20px;
								list-style-type: disc;
								padding-bottom: 4px;
							}				   		
							/* .ContentTable
								This is a table within a list. Results, primarily.
							*/
							.ContentTable {
								width: 800px;
							}
							div.ContentTable {
								display: table;
							}
							/* div.ContentTable > div
								A row within the fake table in the header
							*/
							div.ContentTable > div {
								display: table-row;
							}
							/* div.ContentTable > div > div
								A cell within the fake table in the header
							*/
							div.ContentTable > div > div {
								display: table-cell;
								vertical-align: middle;
								padding: 1px;
								width: 36%;
							}
							/* .Icon
								The icons for home and phone are narrower than the data
							*/
							.ContentTable .Icon {
								width: 14%;
							}
							/* .Address
								The patient's address
							*/
							.ContentTable .Address {
								padding: 1px 30px;
							}
							/* .ContentText
								This is content within a table. Results, primarily.
							*/
							div.ContentText td {
								font-size: 1em;
							}
							td.DocGenText, #copyright {
								font-size: 0.8em;
							}
							.Warning, .Comment {
								font-size: 1.2em;
							}
						</xsl:when>
						<xsl:otherwise>
							body {
								background: #F0F3E4;
								font-family: Arial;
								font-size: 66.67%;
								padding: 10px;
							}

							a, a:hover, a:visited { color: #00F; }
							a { text-decoration: none; }
							a:hover { text-decoration: underline; }
							
							.head  {
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#CCCCCC);
								background-color: #CCC;
								font-weight: bold;
								color: #000; 
								width: 100%;
								border: 1px solid #CCC;
								font-size: 1.5em;
								padding-top: 2px;
							}
							.headerBody {
								background: #FFF;
								border: 1px solid #CCC;
								width: 100%;
							}
							.headerBody td {
								vertical-align: top;
							}
		
							.h_R, .body_R
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#EE9977);
								background-color: #E97;
								border: 1px solid #E97;
							}
							
							.h_O, .body_O
							{								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#EEAA55);
								background-color: #EA5;
								border: 1px solid #EA5;
							}
							
							.h_Y, .body_Y
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#ffff99);
								background-color: #FF9;
								border: 1px solid #CC0;
							}
							
							.h_G, .body_G
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#88BB88);
								background-color: #8B8;
								border: 1px solid #8B8;
							}
							
							.h_B, .body_B
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#99AAEE);
								background-color: #9AE;
								border: 1px solid #9AE;
							}
							
							.h_C, .body_C
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#AAD1D5);
								background-color: #ADD;
								border: 1px solid #AAD1D5;
							}
							
							.h_E, .body_E
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#CCCCCC);
								background-color: #CCC;
								border: 1px solid #CCC;
							}
							
							.h_P, .body_P
							{
								filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#FFFFFF,EndColorStr=#DD33DD);
								background-color: #D3D;
								border: 1px solid #D3D;
							}
							
							.h_R, .h_O, .h_Y, .h_G, .h_B, .h_C, .h_E, .h_P
							{
								width: 100%;
								border-bottom: none;
								font-weight: bold;
								font-size: 1.25em;
								color: #000;
							}
							
							.body_R, .body_O, .body_Y, .body_G, .body_B, .body_C, .body_E, .body_P
							{
								width: 100%;
								filter: "";
								background-color: #FFF;
							}
		
							div.innerHead {
								padding: 3px;
								padding-left: 6px;
								page-break-inside: avoid;
							}
							div.innerHead h1 {
								font-size: 1em;
								margin: 0;
							}
							.body_E {
								width: 100%;
								background-color: #FFF;
							}
					
							.ContentTable
							{
								width: 100%;
								font-size: 1em;
							}	
							.ContentText
							{
								/*margin: 3 0;*/
								color: #000;
								width: 100%;
								font-size: 1em;
							}
							div.ContentText td, td.DocGenText, #copyright {
								font-size: 1em;
							}
							.Warning, .Comment {
								font-size: 1.5em;
							}
												
							tr {
								page-break-inside: avoid;
							}
							
							.SectionWrapper {
								page-break-inside: avoid;
							}
							
						</xsl:otherwise>
					</xsl:choose>

					.ColumnDataRow td
					{
						border-bottom: 1px solid #E0E0E0;
						text-indent: -10px;
						padding-left: 16px;
					}

					.ColumnDataLastRow td
					{
						text-indent: -10px;
						padding-left: 16px;
					}

					.ColumnDataRow td.monospace, .ColumnDataLastRow td.monospace
					{
						text-indent: 0px;
						padding-left: 6px;
					}

					.ColumnHeaderRow th
					{
						border-bottom: 1px solid #BFBFBF;
						color: #6E6E6E;
						text-align: left;
						vertical-align: bottom;
					}

					.ListDataRow
					{
						border-top: 1px solid #BFBFBF;						padding-left: 6px;
					}
					
					.ListHeading {
						padding: 1px 1px 1px 6px;
						width: auto;
					}

					.RowFieldHeader
					{
						color: #6E6E6E;
						text-align: left;
						vertical-align: top;
						border-bottom: 1px solid #E0E0E0;
					}
					
					tr.SRonly th
					{
						width: 0;
						margin: 0;
						padding: 0;
						line-height: 0;
						text-align: right;
						top: 0;
						display: inline-block;
						font-size: 0 !important;
						position: absolute !important;
						left: -500px;
						height: 0;
					}

					#SectionLinks a { display: inline-block; }

					.DocGenText { font-weight: bold; color: Black; padding: 0px 6px; }

					.CaptionText { font-weight: bold; color: #2E2E2E; text-align: left; }

					.historical td { color: #8E8E8E; font-weight: normal; }

					.cellHeader { color: #6E6E6E; font-weight: bold; }

					.monospace{ font-family: Courier New, monospace !important; }

					.FlagData { color: #F00; font-weight:bold; }

					.loseTheHang { text-indent: 0px !important; padding-left: 6px !important; }
					.italics { font-style: italic !important; }
					.bold { font-weight: bold !important; }
					.underline { text-decoration: underline !important; }
					.delete { text-decoration: line-through; }
					.dn { display:none; }
					span.textAlignCenter, span.textAlignRight { display:block; }
					.textAlignCenter { text-align: center; }
					.textAlignRight { text-align: right; }
					.allIndent { padding-left: 16px; text-indent: 0px; display: block; }
					/* when the allIndent applies to a table cell, its contents is fully-indented with no hanging indent. */
					td.allIndent {
						padding-left: 22px;
						text-indent: 0px;
						display: table-cell;
					}

					.Warning {
						background-color: #FF0;
						height: 24px;
						border: 1px solid #CC0;
						margin-bottom: 10px;
						padding: 3px;
					}

					.Comment {
						padding: 3px;
						background-color: #FFF;
						border: 1px solid #000;
					}

					.LeftPad, .RowFieldHeader, .ColumnHeaderRow th { padding-left: 6px; }

					.alt td { background-color: #f3f3f3; }

					img.CElogo {
						float: left;
						margin-top: -3px;
						margin-right: 8px;
					}
					#Current {
						float: right;
						white-space: nowrap;
					}
					#HeaderText { float: left; }

					.clear { clear: both; }
					#copyright {
						text-align: center;
						padding-top: 20px;
					}
				</style>
				<xsl:call-template name="StandardStyleCodeCSS" />
				<xsl:if test="$lucyMyCh">
					<link rel="stylesheet" type="text/css" href="../../HTML/STYLE/lucy_colors.css" />
				</xsl:if>
			</head>
			<body id="document">
				<div id="SectionLinks" role="complementary">
					<div id='DocumentHeaderSection' class='SectionWrapper'>
						<div class='head' id="Head0">
							<xsl:choose>
								<xsl:when test="$lucyMyCh">
									<div id="Current">
										<img src="../../HTML/IMAGES/LucyLogo.png" alt=""></img>				
										<xsl:text>Personal Health Summary, as of </xsl:text>
										<xsl:call-template name="Date">
											<xsl:with-param name="date" select="cldoc:effectiveTime/@value"/>
											<xsl:with-param name="includeTime" select="boolean(true)"/>
										</xsl:call-template>
									</div>
									<div class="clear"></div>
									
									<div class="textAlignCenter">										<img src="../../HTML/IMAGES/org.png" class="logo" alt="Personal Health Summary Logo"></img>
									</div>										
									<h1 class="patientName">
										<xsl:apply-templates select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient"/>															
									</h1>
								</xsl:when>
								<xsl:otherwise>
									<div class='innerHead'>
										<h1>
											<span id="HeaderText">
												<xsl:value-of select="cldoc:title" /> - <xsl:apply-templates select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient" />
											</span>
											<span id="Current">
												<xsl:text>As of </xsl:text>
												<xsl:call-template name='Date'>
													<xsl:with-param name='date' select='cldoc:effectiveTime/@value' />
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
											</span>
										</h1>
										<br class="clear" />
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>

						<xsl:variable name='Address'>
							<xsl:value-of select='cldoc:recordTarget/cldoc:patientRole/cldoc:addr' />
						</xsl:variable>
						<xsl:variable name='ContactInfo'>
							<xsl:value-of select='cldoc:recordTarget/cldoc:patientRole/cldoc:telecom/@value' />
						</xsl:variable>
						<xsl:variable name='StartDate'>
							<xsl:call-template name='Date'>
								<xsl:with-param name='date' select='cldoc:componentOf/cldoc:encompassingEncounter/cldoc:effectiveTime/cldoc:low/@value' />
								<xsl:with-param name="includeTime" select='$lucyMyCh' />
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name='EndDate'>
							<xsl:call-template name='Date'>
								<xsl:with-param name='date' select='cldoc:componentOf/cldoc:encompassingEncounter/cldoc:effectiveTime/cldoc:high/@value'/>
								<xsl:with-param name="includeTime" select='$lucyMyCh' />
							</xsl:call-template>
						</xsl:variable>

						<xsl:if test="$Address!='' or $ContactInfo!='' or $StartDate!=''">
							<div class='headerBody'>
								<xsl:choose>
									<xsl:when test="$lucyMyCh">
										<div class="ContentTable">
											<div>
												<div class="loseTheHang Icon">
													<img src="../../HTML/IMAGES/address.png" alt="Mailing address" />
												</div>
												<div class="loseTheHang Address">
													<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr">
														<xsl:call-template name='Address'>
															<xsl:with-param name='address' select='.' />
															<xsl:with-param name='numAddresses' select='count(cldoc:recordTarget/cldoc:patientRole/cldoc:addr)' />
														</xsl:call-template>
													</xsl:for-each>
												</div>
												<div class="loseTheHang Icon">
													<img src="../../HTML/IMAGES/phone.png" alt="Phone and email" />
												</div>
												<div class="loseTheHang">
													<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom">
														<xsl:call-template name='Telephone'>
															<xsl:with-param name='telecom' select='.' />
														</xsl:call-template>
													</xsl:for-each>
												</div>
											</div>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<table class='ContentTable' cellspacing='0' summary='Patient contact information'>
											<xsl:choose>
												<xsl:when test="$StartDate=''">													<colgroup width="20%" span="3" />
													<colgroup>
														<col width="40%" />
													</colgroup>
												</xsl:when>
												<xsl:otherwise>
													<colgroup width="20%" span="5"></colgroup>
												</xsl:otherwise>
											</xsl:choose>
											<thead>
												<tr class="ColumnHeaderRow">
													<th scope='col'>Address</th>
													<th scope='col'>Contact Information</th>
													<th scope='col'>Patient Language</th>
													<th scope='col'>Patient Race / Ethnicity</th>
													<xsl:if test="not($StartDate='')">
														<xsl:choose>
															<xsl:when test="not($EndDate='') and not($StartDate=$EndDate)">
																<th scope='col'>Encounter Dates</th>
															</xsl:when>
															<xsl:otherwise>
																<th scope='col'>Encounter Date</th>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
												</tr>
											</thead>
											<tbody>
												<tr class="ColumnDataLastRow">
													<td class="loseTheHang demographics">
														<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:addr">
															<xsl:call-template name='Address'>
																<xsl:with-param name='address' select='.' />
																<xsl:with-param name='numAddresses' select='count(cldoc:recordTarget/cldoc:patientRole/cldoc:addr)' />
															</xsl:call-template>
														</xsl:for-each>
													</td>
													<td class="loseTheHang">
														<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:telecom">
															<xsl:call-template name='Telephone'>
																<xsl:with-param name='telecom' select='.' />
															</xsl:call-template>
														</xsl:for-each>
													</td>
													<td class="loseTheHang DocGenText">
														<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:languageCommunication">
															<xsl:call-template name="Language">
																<xsl:with-param name="language" select='.' />
															</xsl:call-template>												
														</xsl:for-each>
													</td>
													<xsl:element name="td">
														<xsl:attribute name="class">
															<xsl:text>DocGenText</xsl:text>
															<xsl:if test="$StartDate!=''"> loseTheHang</xsl:if>
														</xsl:attribute>
														<!-- Call template for 1st raceCode -->
														<xsl:call-template name="DisplayCode">
															<xsl:with-param name="code" select='cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:raceCode' />
														</xsl:call-template>
														<!-- Call template for additional raceCodes -->
														<xsl:for-each select="cldoc:recordTarget/cldoc:patientRole/cldoc:patient/sdtc:raceCode">
															<xsl:text>, </xsl:text>
															<xsl:call-template name="DisplayCode">
																<xsl:with-param name="code" select="."/>
															</xsl:call-template>
														</xsl:for-each>
														<xsl:text> / </xsl:text>
														<!-- Call template for ethnicGroupCode -->
														<xsl:call-template name="DisplayCode">
															<xsl:with-param name="code" select='cldoc:recordTarget/cldoc:patientRole/cldoc:patient/cldoc:ethnicGroupCode' />
														</xsl:call-template>
													</xsl:element>													<xsl:if test="$StartDate!=''">
														<td class="DocGenText">
															<xsl:value-of select="$StartDate"/>
															<xsl:if test="$EndDate!='' and $StartDate!=$EndDate">
																<xsl:text> - </xsl:text>
																<xsl:choose>
																	<xsl:when test="$EndDate!=''">
																		<xsl:value-of select="$EndDate"/>
																	</xsl:when>
																	<xsl:otherwise>(Open)</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</td>
													</xsl:if>
												</tr>
											</tbody>
										</table>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:if>
						<xsl:if test="$StartDate!='' and boolean($lucyMyCh)">
							<div>
								<xsl:value-of select="$StartDate"/>
								<xsl:choose>
									<xsl:when test="$EndDate!=''">
										to <xsl:value-of select="$EndDate"/>
									</xsl:when>
									<xsl:otherwise>(Open)</xsl:otherwise>
								</xsl:choose>
							</div>																							
						</xsl:if>
					</div>
				</div>
				<div id="DocBody" role="main">
					<div id='InnerDocBody'>
						<xsl:choose>
							<xsl:when test="cldoc:component/cldoc:structuredBody">
			 					<xsl:apply-templates select="cldoc:component/cldoc:structuredBody">
									<xsl:with-param name="docID">
										<xsl:value-of select="$docID" />
									</xsl:with-param>
								</xsl:apply-templates>
							</xsl:when>
							<xsl:when test="cldoc:component/cldoc:nonXMLBody/cldoc:text/cldoc:reference/@value">
							</xsl:when>
							<xsl:when test='cldoc:component/cldoc:nonXMLBody/cldoc:text!=""'>
								<xsl:value-of select="cldoc:component/cldoc:nonXMLBody/cldoc:text" />
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
				<xsl:if test="$lucyMyCh">
					<div class="clear">
						<br /><br /><br />
					</div>
					<div id="foot" role="complementary">
						<img src="../../HTML/IMAGES/LucyDrive.png" alt="Carry Lucy on your thumb drive"></img>
						<div>
							If you take your Lucy record on a thumb drive to a different doctor, he or she might be able to use his computer to read the file
							electronically. Your downloaded, machine-readable Personal Health Summary document is in a format called "CDA." If your doctor has a computer that
							understands CDA, your information is a folder on your thumb drive called <b>MachineReadable_XDMFormat</b>. You might need to enter a password
							before your doctor can use this file.
						</div>				
					</div>
					<div class="clear"></div>
					<div id="copyright" role="contentinfo">Copyright <xsl:text>&#169;</xsl:text> 											
						<xsl:call-template name='Year'>
							<xsl:with-param name='date' select='cldoc:effectiveTime/@value' />
						</xsl:call-template> 
						Epic Systems Corporation</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="cldoc:recordTarget/cldoc:patientRole/cldoc:patient">
		<span class="ptName">
			<xsl:choose>
				<xsl:when test="$lucyMyCh">
					<xsl:value-of select="cldoc:name/cldoc:given[0]"/><xsl:text> </xsl:text>
					<xsl:value-of select="cldoc:name/cldoc:given[1]"/><xsl:text> </xsl:text>
					<xsl:value-of select="cldoc:name/cldoc:given[2]"/><xsl:text> </xsl:text>
					<xsl:value-of select="cldoc:name/cldoc:family"/>
				</xsl:when>				<xsl:otherwise><xsl:value-of select="cldoc:name/cldoc:family" />, <xsl:value-of select="cldoc:name/cldoc:given" /></xsl:otherwise>
			</xsl:choose>
		</span>
		<span class="ptDetails">
			<xsl:text> (</xsl:text>
			<xsl:call-template name="AdministrativeGenderCode">
				<xsl:with-param name="gender_code" select="cldoc:administrativeGenderCode/@code" />
			</xsl:call-template>
			<xsl:text>, born </xsl:text>
			<xsl:call-template name="Date">
				<xsl:with-param name="date" select="cldoc:birthTime/@value" />
			</xsl:call-template>
			<xsl:text>)</xsl:text>
		</span>
	</xsl:template>
	
	<!-- Render any code element in this order:
		1) NullFlavor (expands to English explanation)
		2) DisplayName (with codeSystemName: code as title)
		3) parameter:elseDisplay
		4) 'Unknown' -->
	<xsl:template name="DisplayCode">
		<xsl:param name="code"/>
		<!-- If no nullFlavor or displayName display this -->
		<xsl:param name="elseDisplay"/>
		<xsl:choose>
			<!-- NullFlavors take priority -->
			<xsl:when test="$code/@nullFlavor">
				<xsl:call-template name="NullFlavor">
					<xsl:with-param name="nullFlavor" select="$code/@nullFlavor"/>
				</xsl:call-template>
			</xsl:when>
			<!-- Else take displayName -->
			<xsl:when test="$code/@displayName">
				<xsl:element name="span">
					<xsl:if test="$code/@code">
						<!--
						<xsl:attribute name="title">
							<xsl:if test="$code/@codeSystemName">
								<xsl:value-of select="$code/@codeSystemName"/>
								<xsl:text>: </xsl:text>
							</xsl:if>
							<xsl:value-of select="$code/@code"/>
						</xsl:attribute>
						-->
						<xsl:value-of select="$code/@displayName"/>
					</xsl:if>
				</xsl:element>
			</xsl:when>
			<xsl:when test="$elseDisplay">
				<xsl:value-of select="$elseDisplay"/>
			</xsl:when>
			<xsl:otherwise>Unknown</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Display the patient's Language(s), adding (Preferred) if <preferenceInd value="true" /> -->
	<xsl:template name="Language">
		<xsl:param name="language"/>
		<div>
			<xsl:call-template name="DisplayCode">
				<xsl:with-param name="code" select="cldoc:languageCode"/>
				<xsl:with-param name="elseDisplay">
					<xsl:call-template name="ConvertLanguage">
						<xsl:with-param name="language" select="cldoc:languageCode/@code"/>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:if test="cldoc:preferenceInd/@value='true'">
				<xsl:text> (Preferred)</xsl:text>
			</xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template name="ConvertLanguage">
		<xsl:param name="language"/>
		<xsl:variable name="code">
			<xsl:choose>
				<xsl:when test="contains($language,'-')">
					<xsl:value-of select="substring-before($language,'-')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$language"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<!-- Most common US languages -->
			<xsl:when test="$code='eng' or $code='en' or $code='en-us'">English</xsl:when>
			<xsl:when test="$code='spa' or $code='sp'">Spanish</xsl:when>
			<xsl:when test="$code='fre' or $code='fr'">French</xsl:when>
			<xsl:when test="$code='chi' or $code='zho' or $code='zh'">Chinese</xsl:when>
			<xsl:when test="$code='dut' or $code='nld' or $code='nl'">Dutch</xsl:when>
			<xsl:when test="$code='ger' or $code='deu' or $code='de'">German</xsl:when>
			<xsl:otherwise>				<xsl:value-of select="$code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="NullFlavor">
		<xsl:param name="nullFlavor"/>
		<xsl:choose>
			<xsl:when test="$nullFlavor='NI'">No information</xsl:when>
			<xsl:when test="$nullFlavor='NA'">Not applicable</xsl:when>
			<xsl:when test="$nullFlavor='MSK'">Not Available</xsl:when> <!-- actually masked, but present as not available-->
			<xsl:when test="$nullFlavor='NAV'">Not Available</xsl:when>
			<xsl:when test="$nullFlavor='NASK'">Not asked</xsl:when>
			<xsl:otherwise>Unknown</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="cldoc:component/cldoc:structuredBody">
		<xsl:for-each select="cldoc:component">
			<xsl:choose>
				<xsl:when test="cldoc:section/cldoc:code/@code='X-CE-PFD'">
					<xsl:call-template name="Notification">
						<xsl:with-param name="notification" select="cldoc:section" />
					</xsl:call-template>				
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="cldoc:section">
						<xsl:with-param name="position">
							<xsl:number value="position()"/>
						</xsl:with-param>
						<xsl:with-param name="sectionID">
							<xsl:value-of select="$docID" />
							<xsl:text>.</xsl:text>
							<xsl:number value="position()"/>
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="cldoc:section">
		<xsl:param name="position"/>
		<xsl:param name="isLast"/>
		<xsl:param name="sectionID"/>
		<xsl:param name="titlePrefix"/>
		<xsl:variable name="colorName">
			<xsl:call-template name="ChooseSectionColor">
				<xsl:with-param name="code">
					<xsl:value-of select="cldoc:code/@code"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:element name="div">
			<xsl:attribute name="id">
				<xsl:value-of select="$sectionID"/>
			</xsl:attribute>
			<xsl:attribute name="class">SectionWrapper</xsl:attribute>
			<xsl:if test="$isLast">
				<xsl:attribute name="style">padding-bottom:0px;</xsl:attribute>
			</xsl:if>
			<xsl:element name="div">
				<xsl:attribute name="class">
					<xsl:text>h_ h_</xsl:text>
					<xsl:value-of select="$colorName"/>
				</xsl:attribute>
				<div class='innerHead'>
					<xsl:value-of select="$titlePrefix"/>
					<xsl:value-of select="cldoc:title" />
					<xsl:if test="cldoc:text/cldoc:footnote">
						<xsl:element name="span">
							<xsl:attribute name="style">
								<xsl:text>font-weight:normal;</xsl:text>
							</xsl:attribute>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="cldoc:text/cldoc:footnote" />
						</xsl:element>
					</xsl:if>
				</div>
			</xsl:element>
			<xsl:element name="div">
				<xsl:attribute name="class">
					<xsl:text>body_ body_</xsl:text>
					<xsl:value-of select="$colorName"/>
				</xsl:attribute>
				<div class="ContentText">
					<xsl:apply-templates select="cldoc:text">
						<xsl:with-param name="title"><xsl:value-of select='cldoc:title' /></xsl:with-param>
						<xsl:with-param name="id"><xsl:value-of select='$sectionID' /></xsl:with-param>
					</xsl:apply-templates>
									
					<xsl:if test="cldoc:component">
						<xsl:variable name="parentTitle">
							<xsl:value-of select="cldoc:title"/>
							<xsl:text> - </xsl:text>
						</xsl:variable>
						<xsl:for-each select="cldoc:component">
							<div style='padding:5px'>								<xsl:apply-templates select="cldoc:section">
									<xsl:with-param name="position">
										<xsl:value-of select="$position" />
										<xsl:text>.</xsl:text>
										<xsl:number value="position()" />
									</xsl:with-param>
									<xsl:with-param name="isLast">
										<xsl:number value="position()=last()"/>
									</xsl:with-param>
									<xsl:with-param name="sectionID">
										<xsl:value-of select="$sectionID" />
										<xsl:text>.</xsl:text>
										<xsl:number value="position()"/>
									</xsl:with-param>
									<xsl:with-param name="titlePrefix">
										<xsl:if test="$titlePrefix">
											<xsl:value-of select="$titlePrefix" />
										</xsl:if>
										<xsl:value-of select='$parentTitle' />
									</xsl:with-param>
								</xsl:apply-templates>
							</div>
						</xsl:for-each>
					</xsl:if>	
				</div>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:text">
		<xsl:param name="title" />
		<xsl:param name="id" />
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:text>ContentText</xsl:text>
				<xsl:choose>
					<xsl:when test="cldoc:list" />
					<xsl:when test="cldoc:table" />
					<xsl:otherwise>
						<xsl:text> LeftPad</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test="cldoc:caption">
				<div class="CaptionText LeftPad"><xsl:value-of select="cldoc:caption"/></div>
			</xsl:if>
			<xsl:apply-templates>
				<xsl:with-param name="title"><xsl:value-of select='$title' /></xsl:with-param>
				<xsl:with-param name="id"><xsl:value-of select='$id' /></xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:footnote"></xsl:template>
	
	<xsl:template match="cldoc:list">
		<xsl:param name="title" />
		<xsl:param name="id" />
		<xsl:param name="addlItemData" />
		<xsl:if test="cldoc:caption"><div class="CaptionText LeftPad"><xsl:value-of select="cldoc:caption"/></div></xsl:if>
		
		<xsl:choose>
			<!-- as a list-->
			<xsl:when test="$lucyMyCh">
				<xsl:element name="ul">
					<xsl:if test="$addlItemData">
						<xsl:attribute name="class">LeftPad</xsl:attribute>
					</xsl:if>
					<xsl:for-each select="cldoc:item">
						<xsl:element name="li">
							<xsl:choose>
								<xsl:when test="$addlItemData">
									<xsl:attribute name="class">observationItemSubItem</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="class">observationItem</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:attribute name="id">
								<xsl:value-of select="$id"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="position()"/>
							</xsl:attribute>
							<xsl:if test="cldoc:caption">							
								<span class="CaptionText"><xsl:value-of select="cldoc:caption"/></span>
							</xsl:if>
							<xsl:apply-templates>
								<xsl:with-param name="addlItemData"><xsl:value-of select="boolean('true')"/></xsl:with-param>
							</xsl:apply-templates>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:when>
			<!-- we don't actually have tabular data, so just format it to look like a table instead -->
			<xsl:otherwise>
				<xsl:for-each select="cldoc:item">
					<xsl:element name="div">
						<xsl:attribute name="class">ContentTable ListHeading ListDataRow</xsl:attribute>						<xsl:attribute name="id">
							<xsl:value-of select='$id' />
							<xsl:text>.</xsl:text>
							<xsl:value-of select='position()' />
						</xsl:attribute>
						<xsl:if test="../@listType='ordered'"><xsl:value-of select="position()"/>. </xsl:if>
						<xsl:if test="../@listType='unordered'">&#8226; </xsl:if>
						
						<xsl:if test="cldoc:caption">
							<xsl:if test="cldoc:caption/following-sibling::cldoc:table and cldoc:caption/../preceding-sibling::*"><br/><br/></xsl:if>
						</xsl:if>
						<xsl:apply-templates>
							<xsl:with-param name="id"><xsl:value-of select='$id' /><xsl:text>.</xsl:text><xsl:value-of select='position()' /></xsl:with-param>
							<xsl:with-param name="title"><xsl:value-of select='$title' /></xsl:with-param>
							<xsl:with-param name="captioncol">
								<xsl:if test="cldoc:caption/following-sibling::cldoc:table">
									<xsl:value-of select="cldoc:caption"/>
								</xsl:if>
							</xsl:with-param>
						</xsl:apply-templates>
					</xsl:element>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="cldoc:table">
		<xsl:param name="title" />
		<xsl:param name="id" />
		<xsl:param name="captioncol" />

		<xsl:element name="table">
			<xsl:attribute name="class">ContentTable</xsl:attribute>
			<xsl:attribute name="cellspacing">0</xsl:attribute>
			<xsl:attribute name="id">
				<xsl:value-of select='$id' />
				<xsl:text>.</xsl:text>
				<xsl:value-of select='position()' />
			</xsl:attribute>
			<xsl:attribute name="summary">
				<xsl:value-of select='$title' />
				<xsl:if test="$captioncol">
					<xsl:text> - </xsl:text>
					<xsl:value-of select="$captioncol"/>
				</xsl:if>
				<xsl:if test="cldoc:caption and not(cldoc:caption=$captioncol)">
					<xsl:text> - </xsl:text>
					<xsl:value-of select="cldoc:caption"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:apply-templates>
				<xsl:with-param name="caption">
					<xsl:choose>
						<xsl:when test="$captioncol">
							<xsl:value-of select="$captioncol"/>
						</xsl:when>
						<xsl:when test="cldoc:caption">
							<xsl:value-of select="cldoc:caption"/>
						</xsl:when>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="noPadding">
					<xsl:if test="$captioncol"><xsl:value-of select="boolean('true')"/></xsl:if>
				</xsl:with-param>
				<xsl:with-param name="visiblecap">
					<xsl:if test="cldoc:caption or preceding-sibling::*[1][self::cldoc:caption]"><xsl:value-of select="boolean('true')"/></xsl:if>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:element>
		<xsl:choose>
			<xsl:when test="following-sibling::cldoc:table">
				<br/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="cldoc:colgroup">
		<colgroup>
			<xsl:for-each select="cldoc:col">
				<xsl:element name="col">
					<xsl:if test="@width">
						<xsl:attribute name="width">
							<xsl:value-of select="@width"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="@span">
						<xsl:attribute name="span">
							<xsl:value-of select="@span"/>
						</xsl:attribute>
					</xsl:if>
				</xsl:element>
			</xsl:for-each>
		</colgroup>
	</xsl:template>

	<xsl:template match="cldoc:thead">
		<xsl:param name="caption" />
		<xsl:param name="visiblecap" />
		<xsl:param name="noPadding" />

		<thead>
			<xsl:if test="$caption!=''">
				<xsl:element name="tr">					<xsl:if test="$visiblecap=''">
						<xsl:attribute name="class">SRonly</xsl:attribute>
					</xsl:if>
					<xsl:element name="th">
						<xsl:attribute name="class">
							<xsl:if test="$noPadding=''">LeftPad </xsl:if>
							<xsl:text>CaptionText</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="colspan"><xsl:value-of select="count(child::cldoc:tr/child::cldoc:th)"/></xsl:attribute>
						<xsl:attribute name="scope">colgroup</xsl:attribute>
						<xsl:value-of select="$caption"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<xsl:apply-templates select="cldoc:tr"/>
		</thead>
	</xsl:template>

	<xsl:template match="cldoc:tbody">
		<tbody>
			<xsl:apply-templates select="cldoc:tr"/>
		</tbody>
	</xsl:template>

	<xsl:template match="cldoc:tr">
		<xsl:element name="tr">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test='contains(@styleCode,"altRow")'>alt </xsl:when>
					<xsl:when test='contains(@styleCode,"normRow")'/>
					<xsl:when test='(position() mod 2 = 0)'>alt </xsl:when>
				</xsl:choose>
				<xsl:if test='contains(@styleCode,"historical")'>historical </xsl:if>
				<xsl:choose>
					<xsl:when test='parent::cldoc:thead'>ColumnHeaderRow</xsl:when>
					<xsl:when test='following-sibling::*'>ColumnDataRow</xsl:when>
					<xsl:otherwise>ColumnDataLastRow</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:th">
		<xsl:variable name="positionIndex" select="position()"/>
		<xsl:element name="th">
			<xsl:attribute name="scope">col</xsl:attribute>
			<xsl:if test="name(../..)='tbody'"><xsl:attribute name="class">RowFieldHeader</xsl:attribute></xsl:if>
			<xsl:if test="@colspan"><xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute></xsl:if>
			<xsl:if test="@rowspan"><xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute></xsl:if>
			<xsl:if test="@styleCode">
				<xsl:attribute name="class">
					<xsl:call-template name="StyleCodeClass">
						<xsl:with-param name="styleCode" select="@styleCode" />
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:td">
		<xsl:variable name="positionIndex" select="position()"/>
		<xsl:element name="td">
			<xsl:attribute name="valign">top</xsl:attribute>
			<xsl:if test="@colspan"><xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute></xsl:if>
			<xsl:if test="@rowspan"><xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute></xsl:if>
			<xsl:if test="@styleCode">
				<xsl:attribute name="class">
					<xsl:call-template name="StyleCodeClass">
						<xsl:with-param name="styleCode" select="@styleCode" />
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="cldoc:caption"><div class="CaptionText LeftPad"><xsl:value-of select="cldoc:caption"/></div></xsl:if>

			<xsl:apply-templates/>
			<xsl:if test="not(./node())"><xsl:if test="string-length(text())=0"><xsl:text>&#160;</xsl:text></xsl:if></xsl:if>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:content">
		<xsl:element name="span">
			<xsl:if test="@emphasis!='' or @revised!='' or @styleCode!=''">
				<xsl:attribute name="class">
					<xsl:if test="@emphasis='bold'">bold </xsl:if>					<xsl:if test="@emphasis='underline'">underline </xsl:if>
					<xsl:if test="@emphasis='italics'">italics </xsl:if>
					<xsl:if test="@emphasis='yes'">italics </xsl:if>
					<xsl:if test="@revised='delete'">delete </xsl:if>
					<xsl:if test="@styleCode">
						<xsl:call-template name="StyleCodeClass">
							<xsl:with-param name="styleCode" select="@styleCode" />
						</xsl:call-template>
					</xsl:if>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="cldoc:br">
		<br/>
	</xsl:template>

	<xsl:template match="cldoc:paragraph">
		<xsl:param name="addlItemData" />
		<xsl:element name="div">
			<xsl:if test="$addlItemData">
				<xsl:attribute name="class">LeftPad</xsl:attribute>
			</xsl:if>
			<xsl:if test="cldoc:caption"><div class="CaptionText"><xsl:value-of select="cldoc:caption"/></div></xsl:if>
			<xsl:element name="div">
				<xsl:if test="@styleCode">
					<xsl:attribute name="class">
						<xsl:call-template name="StyleCodeClass">
							<xsl:with-param name="styleCode" select="@styleCode" />
						</xsl:call-template>
					</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates/>&#160;
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template match="cldoc:sub">
		<sub><xsl:apply-templates/></sub>
	</xsl:template>

	<xsl:template match="cldoc:sup">
		<sup><xsl:apply-templates/></sup>
	</xsl:template>

	<xsl:template match="cldoc:caption" />

	<xsl:template match="cldoc:link">
		<xsl:if test="cldoc:linkHtml">
			<xsl:element name="a">
				<xsl:if test="cldoc:linkHtml/@href">
					<xsl:attribute name="href"><xsl:value-of select="cldoc:linkHtml/@href"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="cldoc:linkHtml/@name">
					<xsl:attribute name="name"><xsl:value-of select="cldoc:linkHtml/@name"/></xsl:attribute>
				</xsl:if>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
	</xsl:template>

	<xsl:template name="StyleCodeClass">
		<xsl:param name="styleCode" />
		<xsl:choose>
			<!-- If styleCode contains a space (multiple Stylecodes), break apart and try again... -->
			<xsl:when test="contains($styleCode,' ')">
				<!-- first create a variable to store the result (to clean-up spaces when done) -->
				<xsl:variable name="normalizedStyleCodeClasses">
					<!-- process the first space-piece as a single styleCode -->
					<xsl:call-template name="StyleCodeClass">
						<xsl:with-param name="styleCode" select="substring-before($styleCode,' ')" />
					</xsl:call-template>
					<!-- insert a space (or else, we'll just mash them together) -->
					<xsl:text> </xsl:text>
					<!-- process the rest of the string... if it contains more spaces, it'll just do this logic again the next time around -->
					<xsl:call-template name="StyleCodeClass">
						<xsl:with-param name="styleCode" select="substring-after($styleCode,' ')" />
					</xsl:call-template>
				</xsl:variable>
				<!-- now that we have the classes, clean up extra spaces -->
				<xsl:value-of select="normalize-space($normalizedStyleCodeClasses)"/>
			</xsl:when>
			<!-- If styleCode starts with an x, strip it off -->
			<xsl:when test="substring($styleCode,1,1)='x'">
				<xsl:call-template name="StyleCodeClass">
					<xsl:with-param name="styleCode" select="substring($styleCode,2)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$styleCode='pre'">monospace</xsl:when>			<xsl:when test="$styleCode='flagData'">FlagData</xsl:when>
			<xsl:when test="$styleCode='secondaryText'">secondaryText</xsl:when>
			<xsl:when test="$styleCode='cellHeader'">cellHeader</xsl:when>
			<xsl:when test="$styleCode='header'">bold</xsl:when>
			<xsl:when test="$styleCode='emphasis'">bold</xsl:when>
			<xsl:when test="$styleCode='allIndent'">allIndent</xsl:when>
			<xsl:when test="$styleCode='noIndent'">loseTheHang</xsl:when>
			<xsl:when test="$styleCode='center'">textAlignCenter</xsl:when>
			<xsl:when test="$styleCode='right'">textAlignRight</xsl:when>
			<!-- standard CDA R2 stylecodes (see below for CSS)-->
			<xsl:when test="$styleCode='bold' or $styleCode='Bold'">scBold</xsl:when>
			<xsl:when test="$styleCode='underline' or $styleCode='Underline'">scUnderline</xsl:when>
			<xsl:when test="$styleCode='italics' or $styleCode='Italics'">scItalics</xsl:when>
			<xsl:when test="$styleCode='emphasis' or $styleCode='Emphasis'">scEmphasis</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="StandardStyleCodeCSS">
		<!-- default styleCode renderings -->
		<style type="text/css">
					.scBold { font-weight: bold }
					.scUnderline { text-decoration: underline }
					.scItalics { font-style: italic }
					.scEmphasis { font-variant: small-caps }
				</style>
	</xsl:template>

	<xsl:template name="AdministrativeGenderCode">
		<xsl:param name="gender_code" />
		<xsl:choose>
			<xsl:when test="$gender_code=&quot;M&quot;"><xsl:text>Male</xsl:text></xsl:when>
			<xsl:when test="$gender_code=&quot;F&quot;"><xsl:text>Female</xsl:text></xsl:when>
			<xsl:otherwise><xsl:value-of select="$gender_code" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="Year">
		<xsl:param name="date" />
		<xsl:value-of select="substring ($date, 1, 4)" />
	</xsl:template>
	
	<xsl:template name="Date">
		<xsl:param name="date" />
		<xsl:param name="includeTime" />
		<xsl:choose>
			<xsl:when test="$date">
				<xsl:variable name="year" select="substring ($date, 1, 4)" />
				<xsl:variable name="month" select="substring ($date, 5, 2)" />
				<xsl:variable name="day" select="substring ($date, 7, 2)" />
				<xsl:variable name="hour" select="substring ($date, 9, 2)"/>
				<xsl:variable name="min" select="substring ($date, 11, 2)"/>
				<xsl:variable name="sec" select="substring ($date, 13, 2)"/>
				<xsl:variable name="zone" select="substring ($date, 15, 5)"/>
				<xsl:choose>
					<xsl:when test="$month=01">Jan. </xsl:when>
					<xsl:when test="$month=02">Feb. </xsl:when>
					<xsl:when test="$month=03">Mar. </xsl:when>
					<xsl:when test="$month=04">Apr. </xsl:when>
					<xsl:when test="$month=05">May </xsl:when>
					<xsl:when test="$month=06">Jun. </xsl:when>
					<xsl:when test="$month=07">Jul. </xsl:when>
					<xsl:when test="$month=08">Aug. </xsl:when>
					<xsl:when test="$month=09">Sep. </xsl:when>
					<xsl:when test="$month=10">Oct. </xsl:when>
					<xsl:when test="$month=11">Nov. </xsl:when>
					<xsl:when test="$month=12">Dec. </xsl:when>
				</xsl:choose>
				<xsl:value-of select="$day" />
				<xsl:text>, </xsl:text>
				<xsl:value-of select="$year" />
				<xsl:if test="$hour != '' and $min != '' and boolean($includeTime)">
					<xsl:text> </xsl:text>
					<xsl:choose>
						<xsl:when test="$hour > 12"><xsl:value-of select="$hour - 12" /></xsl:when>						<xsl:when test="$hour &lt;= 12 and $hour > 0"><xsl:value-of select="$hour"/></xsl:when>
						<xsl:when test="$hour = 00">12</xsl:when>
					</xsl:choose>
					<xsl:text>:</xsl:text>
					<xsl:value-of select="$min"/>
					<xsl:choose>
						<xsl:when test="$hour > 12"> p.m.</xsl:when>
						<xsl:when test="$hour &lt;= 12"> a.m.</xsl:when>
					</xsl:choose>
					<xsl:if test="$zone != ''">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="$zone"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ChooseSectionColor">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code='X-DOCCMT'">E</xsl:when>
			<xsl:when test="$code='10155-0'">R</xsl:when>
			<xsl:when test="$code='48765-2'">R</xsl:when>
			<xsl:when test="$code='11450-4'">O</xsl:when>
			<xsl:when test="$code='11348-0'">O</xsl:when>
			<xsl:when test="$code='10160-0'">B</xsl:when>
			<xsl:when test="$code='18610-6'">B</xsl:when>
			<xsl:when test="$code='10183-2'">B</xsl:when>
			<xsl:when test="$code='11369-6'">B</xsl:when>

			<xsl:when test="$code='X-HADX'">O</xsl:when>
			<xsl:when test="$code='46241-6'">O</xsl:when>
			<xsl:when test="$code='X-VDX'">O</xsl:when>
			<xsl:when test="$code='11535-2'">O</xsl:when>

			<xsl:when test="$code='8716-3'">C</xsl:when>
			<xsl:when test="$code='29299-5'">C</xsl:when>
			<xsl:when test="$code='X-RFR'">C</xsl:when>

			<xsl:when test="$code='10164-2'">C</xsl:when>
			<xsl:when test="$code='8648-8'">C</xsl:when>
			<xsl:when test="$code='X-DD'">C</xsl:when>
			<xsl:when test="$code='18776-5'">C</xsl:when>

			<xsl:when test="$code='30954-2'">G</xsl:when>

			<xsl:when test="$code='10157-6'">C</xsl:when>
			<xsl:when test="$code='29762-2'">C</xsl:when>
			<xsl:when test="$code='10167-5'">C</xsl:when>
			<xsl:when test="$code='X-HE'">C</xsl:when>
			<xsl:when test="$code='X-FV'">C</xsl:when>
			<xsl:otherwise>C</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="Address">
		<xsl:param name="address"/>
		<xsl:param name="numAddresses"/>
		
		<xsl:if test='$address/@use = "HP" or $numAddresses = 1'>
			<xsl:for-each select="$address/cldoc:streetAddressLine">
				<xsl:value-of select="." />
				<br />
			</xsl:for-each>
			<xsl:value-of select="$address/cldoc:city" />
			<xsl:if test="$address/cldoc:city">
				<xsl:if test="$address/cldoc:state or $address/cldoc:postalCode">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="$address/cldoc:state" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="$address/cldoc:postalCode" />
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="Notification">
		<xsl:param name="notification"/>
		<div class="notificationTitle">
			<xsl:value-of select="$notification/cldoc:title"/>
		</div>
		<div class="notificationBody">
			<xsl:value-of select="$notification/cldoc:text" />
		</div>
	</xsl:template>

	<xsl:template name="Telephone">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test='contains($telecom/@value,"tel:+1-")'>
				<xsl:value-of select='substring-before($telecom/@value,"tel:+1-")'/>
				<xsl:value-of select='substring-after($telecom/@value,"tel:+1-")'/>
			</xsl:when>
			<xsl:when test='contains($telecom/@value,"tel:")'>
				<xsl:value-of select='substring-before($telecom/@value,"tel:")'/>				<xsl:value-of select='substring-after($telecom/@value,"tel:")'/>
			</xsl:when>
			<xsl:when test='contains($telecom/@value,"mailto://")'>
				<xsl:value-of select='substring-before($telecom/@value,"mailto://")'/>
				<xsl:value-of select='substring-after($telecom/@value,"mailto://")'/>
			</xsl:when>
			<xsl:when test='contains($telecom/@value,"mailto:")'>
				<xsl:value-of select='substring-before($telecom/@value,"mailto:")'/>
				<xsl:value-of select='substring-after($telecom/@value,"mailto:")'/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select='$telecom/@value' />
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="$telecom/@use">
			<xsl:text> (</xsl:text>
			<xsl:choose>
				<xsl:when test='$telecom/@use = "H" or $telecom/@use = "HP"'>Home</xsl:when>
				<xsl:when test='$telecom/@use = "WP"'>Work</xsl:when>
				<xsl:when test='$telecom/@use = "MC"'>Mobile</xsl:when>
				<xsl:when test='$telecom/@use = "AS"'>Answering Service</xsl:when>
				<xsl:when test='$telecom/@use = "EC"'>Emergency Contact</xsl:when>
				<xsl:when test='$telecom/@use = "PG"'>Pager</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select='$telecom/@use' />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<br/>
	</xsl:template>
</xsl:stylesheet>