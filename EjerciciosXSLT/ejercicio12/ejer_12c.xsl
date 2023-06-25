<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="UTF-8" />
  <xsl:template match="/">
  <xsl:variable name="separador" select="'|'"/>
  <xsl:variable name="linea" select="'&#xa;'"/>
  <xsl:text>COMMON PLANT</xsl:text><xsl:value-of select="$separador"/>
  <xsl:text>BOTANICAL PLANT</xsl:text><xsl:value-of select="$separador"/>
  <xsl:text>ZONE PLANT</xsl:text><xsl:value-of select="$separador"/>
  <xsl:text>LIGHT</xsl:text><xsl:value-of select="$separador"/>
  <xsl:text>PRICE</xsl:text><xsl:value-of select="$linea"/>
  <xsl:for-each select="CATALOG/PLANT[ZONE=3 or ZONE=4]">
    <xsl:value-of select="COMMON"/><xsl:value-of select="$separador"/>
    <xsl:value-of select="BOTANICAL"/><xsl:value-of select="$separador"/>  
    <xsl:value-of select="ZONE"/><xsl:value-of select="$separador"/>  
    <xsl:value-of select="LIGHT"/><xsl:value-of select="$separador"/>  
    <xsl:value-of select="substring-after(PRICE,'$')"/><xsl:value-of select="$linea"/>    
  </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
