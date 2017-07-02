<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output 
		method="html" 
		doctype-public="-//W3C//DTD HTML 4.01//EN" 
		doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
		indent="yes"
		encoding="utf-8"/>

	<xsl:key name="ixCity" match="/lab7/item" use="@city"/>
	<xsl:key name="ixOrgInCity" match="/lab7/item" use="concat(@city,':',@org)"/>

	<xsl:variable name="city" select="/lab7/item/@city[
	generate-id(.) = generate-id(key('ixCity',.)/@city)]"/>
	<!--<xsl:key name="ixOrg" match="key('ixCity','Москва')" use="."/>-->

	<!-- Шаблон корневого элемента -->
	<xsl:template match="/">
		<html>
			<body>
				<ul>
					<xsl:value-of select="key('ixCity','Москва')/@org"/>
					<xsl:value-of select="key('ixOrgInCity','Москва:ООО Рога и Копыта')/@title"/>
					<p><xsl:value-of select="/lab7/item/@city[generate-id(.)]"/></p>
					<p><xsl:value-of select="$city"/></p>
				</ul>

			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>

							  