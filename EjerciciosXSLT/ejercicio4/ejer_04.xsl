<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
      <html>
        <head>
            <title>Movies</title>
        </head>
            <body>
                <table border="1">
				    <tr>
					    <th>Title</th>
					    <th>Genre</th>
                        <th>Year</th>
                        <th>Apto para</th>
                        <th>Director</th>
                    </tr>
                    <xsl:for-each select="Movies/Movie">
                        <tr>
                            <td><xsl:value-of select="Title"/></td>
                            <td><xsl:value-of select="Genre"/></td>
                            <td><xsl:value-of select="Year"/></td>
                            
                            <xsl:choose>
                                    <xsl:when test="@rating = 'G'">
                                        <td bgcolor="Green">Todos los públicos</td>
                                    </xsl:when>
                                    <xsl:when test="@rating = 'R'">
                                        <td bgcolor="Red">Restringido para menores de edad</td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td bgcolor="Orange">Otras restricciones</td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            <td><xsl:value-of select="concat(Director/Name/First,'_',Director/Name/Last)"/></td> 
                                
                        </tr>
                    </xsl:for-each>
                </table>             
            </body>
      </html>
    </xsl:template>
</xsl:stylesheet>