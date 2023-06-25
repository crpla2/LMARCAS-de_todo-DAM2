<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8"  method="text" ></xsl:output>
  <xsl:template match="/"> 
    <xsl:variable select="' | '" name="separador"></xsl:variable>
    <xsl:variable select="'&#xa;'" name="linea_nueva"></xsl:variable>
    <xsl:text>COMON PLANT</xsl:text>
    <xsl:value-of select="$separador"></xsl:value-of>
    <xsl:text>BOTANICAL PLANT</xsl:text>
    <xsl:value-of select="$separador"></xsl:value-of>
    <xsl:text>ZONE PLANT</xsl:text>
    <xsl:value-of select="$separador"></xsl:value-of>
    <xsl:text>LIGHT</xsl:text>
    <xsl:value-of select="$separador"></xsl:value-of>
    <xsl:text>PRICE</xsl:text>
    <xsl:value-of select="$linea_nueva"></xsl:value-of> 
    <xsl:for-each select="CATALOG/PLANT[ZONE=3 or ZONE=4]">
      <xsl:value-of select="COMMON"></xsl:value-of>
      <xsl:value-of select="$separador"></xsl:value-of>
      <xsl:value-of select="BOTANICAL"></xsl:value-of>
      <xsl:value-of select="$separador"></xsl:value-of>
      <xsl:value-of select="ZONE"></xsl:value-of>
      <xsl:value-of select="$separador"></xsl:value-of>
      <xsl:value-of select="LIGHT"></xsl:value-of>
      <xsl:value-of select="$separador"></xsl:value-of>
      <xsl:value-of select="substring-after(PRICE,'$')"></xsl:value-of> 
      <xsl:value-of select="$linea_nueva"></xsl:value-of>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
