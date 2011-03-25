<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:datetime="http://exslt.org/dates-and-times">
	
	<xsl:output method='xml' 
		version='1.0' 
		encoding='UTF-8' 
		indent='yes' />
	
	<xsl:template match="/T3locallang">
		<xliff xmlns="urn:oasis:names:tc:xliff:document:1.2" version="1.2">
			<file source-language="EN" target-language="{$lang}" datatype="plaintext" original="messages" date="{$date}" product-name="{$extension}">
				<header>
					<description><xsl:value-of select="meta/description" /></description>
					<type><xsl:value-of select="meta/type" /></type>
				</header>
				<body>
					<xsl:apply-templates select="data[@type='array']/languageKey[@index='default']/label" />
				</body>
			</file>
		</xliff>
	</xsl:template>
	
	<xsl:template match="label">
		<xsl:variable name="index" select="@index"/>
		<trans-unit id="{@index}">
			<source><xsl:value-of select="." /></source>
			<xsl:if test="string-length($source)!=0">
				<target><xsl:value-of select="document($source)/T3locallangExt/data[@type='array']/languageKey/label[@index=$index]" /></target>
			</xsl:if>
			<xsl:if test="string-length($source)=0">
				<target><xsl:value-of select="." /></target>
			</xsl:if>
		</trans-unit>
	</xsl:template>
	
</xsl:stylesheet>
