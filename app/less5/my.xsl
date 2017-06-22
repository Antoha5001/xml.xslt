<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<xsl:call-template name="hello"/>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="processing-instruction()">
		<div style="color:blue;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="comment()">
		<div style="color:green;">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>

	<xsl:template match="pricelist">
		<xsl:apply-templates select="./book[position() mod 2 != 0]" mode="green"/>
		<xsl:apply-templates select="./book[position() mod 2 = 0]" mode="blue"/>
	</xsl:template>

	<xsl:template match="book" mode="blue">
		<p style="color:blue;">
			<xsl:value-of select="./title"/>
		</p>
	</xsl:template>

	<xsl:template match="book" mode="green">
		<p style="color:green;">
			<xsl:value-of select="./title"/>
		</p>
	</xsl:template>

	<xsl:template match="book[price &gt; 200]">
		<p style="color:red;">
			<xsl:value-of select="./title"/>
		</p>
	</xsl:template>
	<xsl:template name="hello">
		<h1 style="font-family:sans-serif;">Заголовок</h1>
	</xsl:template>
</xsl:stylesheet>
