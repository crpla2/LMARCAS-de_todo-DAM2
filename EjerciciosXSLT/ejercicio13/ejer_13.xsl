<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:variable name="separador" select="';'"/>
  <xsl:variable name="linea_nueva" select="'&#xa;'"/>
  <xsl:decimal-format grouping-separator="." decimal-separator="," name="european"></xsl:decimal-format>
  <xsl:template match="/">
    <xsl:text>COD_MUEBLE</xsl:text>
    <xsl:value-of select="$separador"/>
    <xsl:text>NOMBRE</xsl:text>
    <xsl:value-of select="$separador"/>
    <xsl:text>CLASIFICACION</xsl:text>
    <xsl:value-of select="$separador"/>
    <xsl:text>PRECIO</xsl:text>
    <xsl:value-of select="$separador"/>
    <xsl:text>REFERENCIA</xsl:text>
    <xsl:value-of select="$linea_nueva"/>
    <xsl:for-each select="muebles/mueble">
    <xsl:call-template name="cod_mueble_template">
      <xsl:with-param name="codigo" select="@cod"></xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="cod_nombre">
      <xsl:with-param name="nombre" select="tipo"></xsl:with-param>    
    </xsl:call-template>
    <xsl:call-template name="cod_clas">
      <xsl:with-param name="clas" select="@cod"></xsl:with-param>    
    </xsl:call-template>
    <xsl:call-template name="cod_precio">
      <xsl:with-param name="precio_" select="precio"></xsl:with-param>    
    </xsl:call-template>
    <xsl:call-template name="cod_ref">
      <xsl:with-param name="ref_cod" select="substring(@cod,1,2)"></xsl:with-param>
      <xsl:with-param name="ref_tipo" select="substring(tipo,4,3)"></xsl:with-param>  
    </xsl:call-template>
    </xsl:for-each>
</xsl:template>
<xsl:template name="cod_mueble_template">
  <xsl:param name="codigo"></xsl:param>
  <xsl:value-of select="$codigo"></xsl:value-of>
  <xsl:value-of select="$separador"></xsl:value-of>  
</xsl:template>
<xsl:template name="cod_nombre">
  <xsl:param name="nombre"></xsl:param>
  <xsl:value-of select="$nombre"></xsl:value-of>
  <xsl:value-of select="$separador"></xsl:value-of> 
</xsl:template>
<xsl:template name="cod_clas">
  <xsl:param name="clas"></xsl:param>
  <xsl:choose>
    <xsl:when test="substring($clas,1,2)='MB'">
      <xsl:text>Mueble de baño</xsl:text>
       <xsl:value-of select="$separador"></xsl:value-of>   
    </xsl:when> 
     <xsl:when test="substring($clas,1,2)='MC'">
      <xsl:text>Mueble de cocina</xsl:text>
       <xsl:value-of select="$separador"></xsl:value-of>   
    </xsl:when>
    <xsl:when test="substring($clas,1,2)='MS'">
      <xsl:text>Mueble de salon</xsl:text>
       <xsl:value-of select="$separador">
       </xsl:value-of>   
    </xsl:when>
    <xsl:otherwise>
    <xsl:text>Sin clasificar</xsl:text>
    <xsl:value-of select="$separador"></xsl:value-of>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template name="cod_precio">
  <xsl:param name="precio_"></xsl:param>
  <xsl:value-of select="format-number($precio_,'#.###,##','european')"></xsl:value-of>
   <xsl:value-of select="$separador"/>
</xsl:template>
<xsl:template name="cod_ref">
  <xsl:param name="ref_cod"></xsl:param>
  <xsl:param name="ref_tipo"></xsl:param>
  <xsl:value-of select="concat($ref_cod,'-',$ref_tipo)"></xsl:value-of>
  <xsl:value-of select="$linea_nueva"/>
</xsl:template>
</xsl:stylesheet>