<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="">
	<xsl:output method="html" encoding="utf-8"/>


	<xsl:template match="/">
		<html>
			<body>
				<h1 style="text-align:center;">Lab 5-2</h1>

				<ul>

					<xsl:apply-templates select="/lab5_2/element">
						<xsl:sort select="@price" data-type="number"/>
					</xsl:apply-templates>

				</ul>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="element">
		<xsl:choose>
			<xsl:when test="position() mod 2 = 0">
				<li>
					<xsl:attribute name="style">background:#CCC;padding:5px;list-style:none;</xsl:attribute>
					<xsl:value-of select="@name"/><xsl:text> : </xsl:text><xsl:value-of select="@value"/>
					<xsl:text> - </xsl:text><xsl:value-of select="@price"/><xsl:text> руб.</xsl:text>
				</li>

			</xsl:when>
			<xsl:when test="position() mod 2 != 0">
				<li>
					<xsl:attribute name="style">background:white;padding:5px;list-style:none;</xsl:attribute>
					<xsl:value-of select="@name"/><xsl:text> : </xsl:text><xsl:value-of select="@value"/>
					<xsl:text> - </xsl:text><xsl:value-of select="@price"/><xsl:text> руб.</xsl:text>
				</li>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="element">
		<tr>
			<xsl:if test="position() mod 2 = 0">
				<xsl:attribute name="style">background:#ccc;padding:5px;list-style:none;</xsl:attribute>
			</xsl:if>
			<td><xsl:value-of select="@name"/></td>
			<td><xsl:value-of select="@value"/></td>
			<td><xsl:value-of select="@price"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>