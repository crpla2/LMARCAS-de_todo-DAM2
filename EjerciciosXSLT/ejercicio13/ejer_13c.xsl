<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:variable name="separador" select="';'"/>
  <xsl:variable name="linea" select="'&#xa;'"/>

  <xsl:decimal-format name="european" grouping-separator="." decimal-separator="," />
  <xsl:template match="/">
   <xsl:text>COD_MUEBLE</xsl:text><xsl:value-of select="$separador"/>
   <xsl:text>NOMBRE</xsl:text><xsl:value-of select="$separador"/>
   <xsl:text>CLASIFICACION</xsl:text><xsl:value-of select="$separador"/>
   <xsl:text>PRECIO</xsl:text><xsl:value-of select="$separador"/>
   <xsl:text>REFERENCIA</xsl:text><xsl:value-of select="$linea"/>
   <xsl:for-each select="muebles/mueble">
     <xsl:call-template name="Tcod">
      <xsl:with-param name="cod" select="@cod"/>
     </xsl:call-template>
     <xsl:call-template name="Tnom">
      <xsl:with-param name="nom" select="tipo"/>
     </xsl:call-template>
     <xsl:call-template name="Tclas">
      <xsl:with-param name="clas" select="@cod"/>
     </xsl:call-template>
      <xsl:call-template name="Tprec">
        <xsl:with-param name="prec" select="precio"/>
      </xsl:call-template>
      <xsl:call-template name="Tref">
        <xsl:with-param name="ref_cod" select="substring(@cod,1,2)"/>
        <xsl:with-param name="ref_tipo" select="substring(tipo,4,3)"/>
      </xsl:call-template>
   </xsl:for-each>
  </xsl:template>
  <xsl:template name="Tcod">
    <xsl:param name="cod"/>
    <xsl:value-of select="$cod"/>
    <xsl:value-of select="$separador"/>
  </xsl:template>
   <xsl:template name="Tnom">
    <xsl:param name="nom"/>
    <xsl:value-of select="$nom"/>
    <xsl:value-of select="$separador"/>
  </xsl:template>
  <xsl:template name="Tclas">
    <xsl:param name="clas"/>
    <xsl:choose>
      <xsl:when test="starts-with($clas,'MB')">
        <xsl:text>Mueble de baño</xsl:text> 
      </xsl:when>
      <xsl:when test="starts-with($clas,'MC')">
        <xsl:text>Mueble de cocina</xsl:text>
      </xsl:when>
      <xsl:when test="starts-with($clas,'MS')">
        <xsl:text>Mueble de salón</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Sin clasificar</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$separador"/>
  </xsl:template>
   <xsl:template name="Tprec">
    <xsl:param name="prec"/>
    <xsl:value-of select="format-number($prec,'###.###,##','european')"/>
    <xsl:value-of select="$separador"/>
  </xsl:template>
   <xsl:template name="Tref">
    <xsl:param name="ref_cod"/>
    <xsl:param name="ref_tipo"/>
    <xsl:value-of select="concat($ref_cod,'-',$ref_tipo)"/>
    <xsl:value-of select="$linea"/>
  </xsl:template>
 
</xsl:stylesheet>
