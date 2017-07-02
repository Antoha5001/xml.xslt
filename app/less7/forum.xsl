<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="item" select="/items/item"/>
	<!--<xsl:output-->
		<!--method="html"-->
		<!--doctype-public="-//W3C//DTD HTML 4.01//EN"-->
		<!--doctype-system="http://www.w3.org/TR/html4/strict.dtd"-->
		<!--indent="yes"/>-->
	<!--<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" />-->
	<xsl:output doctype-system="about:legacy-compat" method="html" encoding="utf-8"/>
	<xsl:template match="/">
		<!--<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>-->
		<html>
			<body>
				<ul>
					<xsl:apply-templates />
				</ul>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="items">
		<xsl:apply-templates select="item[@pid = 0]"/>
	</xsl:template>

	<xsl:template match="item">

		<xsl:variable name="id" select="@id"/>
		<li id="{$id}">
			<h3><span><xsl:value-of select="@author"/></span> пишет:</h3>
			<p><xsl:value-of select="."/></p>
			<xsl:if test="../item[@pid = $id]">
				<ul>
					<xsl:apply-templates select="../item[@pid = $id]"/>
					<!--<xsl:apply-templates select="../item[@pid = current()/@id]"/>-->
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>
