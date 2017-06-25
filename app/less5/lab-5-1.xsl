<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8"/>

	<xsl:template match="/">
		<!--<xsl:element name="labResult">
			<xsl:comment>Всего <xsl:value-of select="count(/lab5_1/element)"/> элементов!</xsl:comment>
			<xsl:apply-templates select="/lab5_1/element"/>
		</xsl:element>-->
		<labResult>
			<xsl:comment>Всего <xsl:value-of select="count(/lab5_1/element)"/> элементов!</xsl:comment>
			<xsl:apply-templates select="/lab5_1/element"/>
		</labResult>
	</xsl:template>
<!--
	<xsl:template match="element[@name='computer']">
		<xsl:element name="computer">
			<xsl:value-of select="./@value"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="element[@name='monitor']">
		<xsl:element name="monitor">
			<xsl:value-of select="./@value"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="element[@name='printer']">
		<xsl:element name="printer">
			<xsl:value-of select="./@value"/>
		</xsl:element>
	</xsl:template>
-->
	<xsl:template match="element">
		<xsl:element name="{@name}">
		<xsl:value-of select="./@value"/>
	</xsl:element>
	</xsl:template>

</xsl:stylesheet>