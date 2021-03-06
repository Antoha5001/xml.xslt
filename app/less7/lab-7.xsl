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

	<!--Переменная 1-->
	<xsl:variable name="cities" select="/lab7/item[
	generate-id(.) = generate-id(key('ixCity',@city))]"/>
	<!--<xsl:key name="ixOrg" match="key('ixCity','Москва')" use="."/>-->

	<!-- Шаблон корневого элемента -->
	<xsl:template match="/">
		<html>
			<body>
				<ul>
					<xsl:for-each select="$cities">
						<xsl:variable name="curCity" select="@city"/>

						<!--Переменная 2-->
						<xsl:variable name="orgs" select="/lab7/item[
						generate-id(.) = generate-id(key('ixOrgInCity',concat($curCity,':',@org)))]"/>
						<li><xsl:value-of select="@city"/>
							<ul>
								<xsl:for-each select="$orgs">
									<li>
										<xsl:value-of select="@org"/>
										<ul>

									<xsl:for-each select="/lab7/item[@city = current()/@city and @org = current()/@org]">
										<xsl:sort select="./@title"/>
											<li><xsl:value-of select="./@title"/></li>
									</xsl:for-each>
										</ul>
									</li>
								</xsl:for-each>

							</ul>
						</li>

					</xsl:for-each>
				</ul>

			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>

							  