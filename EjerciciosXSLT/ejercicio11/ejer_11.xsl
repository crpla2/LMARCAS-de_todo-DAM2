<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:output method="xml" encoding="UTF-8" /> 
<xsl:template match="/">
  <xsl:element name="libros">
    <xsl:for-each select="libreria/libros/producto">
      <xsl:element name="libro">
        <xsl:element name="nombre">
          <xsl:value-of select="titulo"></xsl:value-of>
        </xsl:element>
        <xsl:element name="categoria">
          <xsl:variable name="cod_cat" select="@cat"></xsl:variable>
          <xsl:value-of select="../../categorias/categoria[@codigo=$cod_cat]/@Descripcion">
          </xsl:value-of>
        </xsl:element>
        <xsl:variable name="unidades">
          <xsl:choose>
            <xsl:when test="cantidad &lt; 4">
              <xsl:text>Últimas unidades</xsl:text>
            </xsl:when> 
            <xsl:otherwise>
              <xsl:text>Unidades disponibles</xsl:text>
            </xsl:otherwise>           
          </xsl:choose>          
        </xsl:variable> 
        <xsl:element name="stock">
          <xsl:value-of select="$unidades"></xsl:value-of>       
        </xsl:element>
        <xsl:variable name="euros">
          <xsl:choose>
            <xsl:when test="precio='NC'">
              <xsl:text>No consta</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="format-number(precio*1.21,'##.##')">
              </xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:element name="precio_iva">
          <xsl:value-of select="$euros"></xsl:value-of>
        </xsl:element>
        <xsl:element name="autor">
          <xsl:value-of select="autor"></xsl:value-of>        
        </xsl:element>
      </xsl:element>  
    </xsl:for-each>
  </xsl:element>
</xsl:template>
</xsl:stylesheet> 