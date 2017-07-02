<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output 
		method="html" 
		doctype-public="-//W3C//DTD HTML 4.01//EN" 
		doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
		indent="yes"
		encoding="utf-8"/>

	<xsl:key name="ixAutor" match="/pricelist/book/author" use="."/>
		
	<!-- Шаблон корневого элемента -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Наши авторы</title>
			</head>
			<body>
				<ul>
					<!-- Выборка -->
					<xsl:variable name="authors"
								  select="/pricelist/book/author
								  [
								  generate-id(.) = generate-id(key('ixAutor',.))
								  ]"/>
					<xsl:for-each select="$authors">
						<li>
							<xsl:value-of select="."/>
						</li>
					</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>

							  