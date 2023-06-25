<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="UTF-8"/>
  <xsl:variable name="separador" select="';'"/>
  <xsl:variable name="linea" select="'&#xa;'"/>
 <xsl:decimal-format grouping-separator="." decimal-separator="," name="european"/>
  <xsl:template match="/">
    <xsl:text>COD_MUEBLE</xsl:text><xsl:value-of select="$separador"/>
    <xsl:text>NOMBRE</xsl:text><xsl:value-of select="$separador"/>
    <xsl:text>CLASIFICACION</xsl:text><xsl:value-of select="$separador"/>
    <xsl:text>PRECIO</xsl:text><xsl:value-of select="$separador"/>
    <xsl:text>REFERENCIA</xsl:text><xsl:value-of select="$linea"/>
    <xsl:for-each select="muebles/mueble">
      <xsl:call-template name="tcod">
        <xsl:with-param name="codigo" select="@cod"/>  
      </xsl:call-template>
      <xsl:call-template name="tmue">
        <xsl:with-param name="mueble" select="tipo"/>  
      </xsl:call-template>
      <xsl:call-template name="tclas">
        <xsl:with-param name="clasif" select="@cod"/>  
      </xsl:call-template>
      <xsl:call-template name="tprec">
        <xsl:with-param name="precio" select="precio"/>  
      </xsl:call-template>
      <xsl:call-template name="tref">
        <xsl:with-param name="cod" select="@cod"/>  
        <xsl:with-param name="tipo" select="tipo"/>  
      </xsl:call-template>
    </xsl:for-each>
    </xsl:template>
    <xsl:template name="tcod">
      <xsl:param name="codigo" />
      <xsl:value-of select="$codigo"/>
      <xsl:value-of select="$separador"/>
  </xsl:template>
  <xsl:template name="tmue">
      <xsl:param name="mueble" />
      <xsl:value-of select="$mueble"/>
      <xsl:value-of select="$separador"/>
  </xsl:template>
  <xsl:template name="tclas">
      <xsl:param name="clasif" />
      <xsl:choose>
        <xsl:when test="starts-with($clasif,'MB')">
          <xsl:text>Mueble de baño</xsl:text>        
        </xsl:when>
        <xsl:when test="starts-with($clasif,'MC')">
         <xsl:text>Mueble de cocina</xsl:text> 
        </xsl:when>
        <xsl:when test="starts-with($clasif,'MS')">
         <xsl:text>Mueble de salon</xsl:text> 
        </xsl:when>
        <xsl:otherwise><xsl:text>Sin clasificar</xsl:text></xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="$separador"/>
  </xsl:template>
  <xsl:template name="tprec">
      <xsl:param name="precio" />
      <xsl:value-of select="format-number($precio,'#.###,##','european')"/>
      <xsl:value-of select="$separador"/>
  </xsl:template>
   <xsl:template name="tref">
      <xsl:param name="cod" />
       <xsl:param name="tipo" />
      <xsl:value-of select="concat(substring($cod,1,2),'-',substring($tipo,4,3))"/>
      <xsl:value-of select="$linea"/>
  </xsl:template>
</xsl:stylesheet>
