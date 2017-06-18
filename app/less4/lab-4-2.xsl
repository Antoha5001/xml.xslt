<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--Шаблон корневого элемента-->
	<xsl:template match="/">
		<html>
		<xsl:value-of select="count(/time_table/lesson)" />
		<xsl:value-of select="/time_table/lesson[1]/@no" />
		<h2>
		<xsl:value-of select="/time_table/lesson[2]/time" />
		</h2>>
		</html>
	</xsl:template>
</xsl:stylesheet>