<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
  <xsl:template match="/">
    <html>
      <head><title>Movies</title></head>
      <body>
        <table border="1">
          <tr>
            <th>Title</th><th>Genre</th><th>Year</th>          
          </tr>
          
           <xsl:for-each select="Movies/Movie"><tr>
            <td><xsl:value-of select="Title"></xsl:value-of></td>
            <td><xsl:value-of select="Genre"></xsl:value-of></td>
            <td><xsl:value-of select="Year"></xsl:value-of></td>
             </tr></xsl:for-each>
         
        </table>      
      </body>    
     </html>
  </xsl:template>
</xsl:stylesheet>
