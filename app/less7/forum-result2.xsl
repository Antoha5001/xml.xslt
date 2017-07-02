<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:variable name="li" select="/html/body/ul/li"/>


	<xsl:template match="/">
		<items>
			<xsl:for-each select="$li">
				<xsl:call-template name="item"/>
			</xsl:for-each>
		</items>
	</xsl:template>

	<xsl:template name="item">

		<xsl:param name="pid" select="0"/>
		<item id="{@id}" pid="{$pid}" author="{h3/span}">
			<xsl:value-of select="./p"/>
		</item>
		<xsl:for-each select="ul/li">
			<xsl:call-template name="item">
				<xsl:with-param name="pid">
						<xsl:value-of select="current()/../../@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
