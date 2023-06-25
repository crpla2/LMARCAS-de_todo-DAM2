<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="xml" version="1.0"/>
  <xsl:template match="/">
    <xsl:element name="datos_ventas">
      <xsl:for-each select="ventas/datos/provincia">
        <xsl:element name="T1">
          <xsl:attribute name="provincia">
            <xsl:value-of select="substring(nombre,1,3)"/>
          </xsl:attribute>
          <xsl:value-of select="trimestre[1]/@cantidad"></xsl:value-of>
        </xsl:element>
        <xsl:element name="T2">
          <xsl:attribute name="provincia">
            <xsl:value-of select="substring(nombre,1,3)"/>
          </xsl:attribute>
          <xsl:value-of select="trimestre[2]/@cantidad"></xsl:value-of>
        </xsl:element>
        <xsl:element name="T3">
          <xsl:attribute name="provincia">
            <xsl:value-of select="substring(nombre,1,3)"/>
          </xsl:attribute>
          <xsl:value-of select="trimestre[3]/@cantidad"></xsl:value-of>
        </xsl:element>
        <xsl:element name="T4">
          <xsl:attribute name="provincia">
            <xsl:value-of select="substring(nombre,1,3)"/>
          </xsl:attribute>
          <xsl:value-of select="trimestre[4]/@cantidad"></xsl:value-of>
        </xsl:element>
      </xsl:for-each>
      <xsl:element name="Total_T1">
        <xsl:value-of select="sum(ventas/datos/provincia/trimestre[1]/@cantidad)">
        </xsl:value-of>
      </xsl:element>
      <xsl:element name="Total_T2">
       <xsl:value-of select="sum(ventas/datos/provincia/trimestre[2]/@cantidad)">
       </xsl:value-of></xsl:element>
      <xsl:element name="Total_T3"> 
        <xsl:value-of select="sum(ventas/datos/provincia/trimestre[3]/@cantidad)">
        </xsl:value-of>
      </xsl:element>
      <xsl:element name="Total_T4">
        <xsl:value-of select="sum(ventas/datos/provincia/trimestre[4]/@cantidad)">
        </xsl:value-of>  
      </xsl:element>
      <xsl:element name="comentarios">
        <xsl:choose>
          <xsl:when test="string-length(ventas/resumen/descripcion)&gt;17">
            <xsl:value-of select="normalize-space(substring(ventas/resumen/descripcion,1,17))"></xsl:value-of>          
          </xsl:when>   
          <xsl:otherwise>
            <xsl:value-of select="ventas/resumen/descripcion"></xsl:value-of>          
          </xsl:otherwise>
        </xsl:choose> 
      </xsl:element>
         
    </xsl:element>
  </xsl:template>
  
  
</xsl:stylesheet>
