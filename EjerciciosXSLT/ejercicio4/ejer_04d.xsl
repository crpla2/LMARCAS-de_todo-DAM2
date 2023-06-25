<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
  <xsl:template match="/">
    <html>
      <head><title>Movies</title>
     <style>
      .G{background-color:green;}
      .R{background-color:red;}
      .O{background-color:orange;}
      </style>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Title</th><th>Genre</th><th>Year</th><th>Apto para</th><th>Director</th>          
          </tr>
          
           <xsl:for-each select="Movies/Movie">
          
           <tr>
           
            <td><xsl:value-of select="Title"></xsl:value-of></td>
            <td><xsl:value-of select="Genre"></xsl:value-of></td>
            <td><xsl:value-of select="Year"></xsl:value-of></td>
           <!-- <xsl:choose>
             <xsl:when test="@rating='G'">
             <td class="G">Todos los públicos</td>
             </xsl:when>
            <xsl:when test="@rating='R">
             <td class="R">Restringido para menores de edad</td>
             </xsl:when>
           <xsl:otherwise>  
           <td class="O">Otras restricciones</td>
           </xsl:otherwise>
            </xsl:choose>-->
                <td><xsl:value-of select="concat(Director/Name/First,' ',Director/Name/Last)
"></xsl:value-of></td>
             </tr>
             </xsl:for-each>
         
        </table>      
      </body>    
     </html>
  </xsl:template>
</xsl:stylesheet>
