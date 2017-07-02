<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:variable name="li" select="/html/body/ul/li"/>


	<xsl:template match="/">
		<!--<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>-->

			<xsl:call-template name="items"/>

	</xsl:template>

	<xsl:template name="items">
		<items>
			<xsl:for-each select="$li">
				<xsl:call-template name="item">
					<xsl:with-param name="pid">0

						<xsl:if test="../../@id">
							<xsl:value-of select="current()/../../@id"/>
						</xsl:if>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</items>
	</xsl:template>
	<xsl:template name="item">
		<xsl:param name="id" select="./@id"/>
		<xsl:param name="pid">
			<xsl:value-of select="current()/../../@id"/></xsl:param>
		<xsl:param name="author" select="./h3/span"/>

		<item id="{$id}" pid="{$pid}" author="{$author}">
			<xsl:value-of select="./p"/>
		</item>
		<xsl:for-each select="./ul/li">
			<xsl:call-template name="item"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
