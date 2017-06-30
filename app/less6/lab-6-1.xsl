<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="teachersKey" match="/lab6_1/course" use="teachers/teacher"/>
	<xsl:key name="keywordsKey" match="/lab6_1/course" use="keywords/keyword"/>
	<xsl:template match="/">
		<html>
			<body>
				<h1>Лабораторная 6-1</h1>
				<h2 style="color:green;">Курсы Никитина И. Г.:</h2>
				<xsl:for-each select="key('teachersKey','Никитин И. Г.')">
					<xsl:value-of select="title"/>
					<br/>
				</xsl:for-each>
				<!--<xsl:apply-templates select="key('teachersKey','Никитин И. Г.')"/>-->

				<h2 style="color:green;">Курсы, в которых рассматривается тема XML:</h2>
				<xsl:for-each select="key('keywordsKey','XML')">
					<xsl:value-of select="title"/>
					<br/>
				</xsl:for-each>
				<!--<xsl:apply-templates select="key('keywordsKey','XML')"/>-->

				<h2 style="color:green;">Курсы, которые читает Щуйков С. Ю., и в которых есть тема XSLT:</h2>
				<!--<xsl:for-each select="key('teachersKey','Щуйков С. Ю.')">-->
					<!--<xsl:if test="./keywords[keyword='XSLT']">-->
						<!--<xsl:value-of select="title"/>-->
					<!--</xsl:if>-->
					<!--<br/>-->
				<!--</xsl:for-each>-->
				<xsl:for-each select="key('teachersKey','Щуйков С. Ю.')[keywords/keyword='XSLT']">
					<xsl:value-of select="title"/>
					<br/>
				</xsl:for-each>

			</body>
		</html>
	</xsl:template>

	<!--<xsl:template match="course">-->
		<!--<div>-->

				<!--<xsl:value-of select="./title"/>-->
				<!--&lt;!&ndash;<xsl:value-of select="key('teachersKey','Никитин И. Г.')"/>&ndash;&gt;-->
				<!--<br/>-->
		<!--</div>-->
	<!--</xsl:template>-->

</xsl:stylesheet>

							  