<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: xslt.xsl 2055 2011-09-24 07:25:11Z maloneyc $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match='/'>
    <xsl:apply-templates select='splits'/>
  </xsl:template>

  <xsl:template match='splits'>
    The Banana Splits:
    <ul>
      <xsl:apply-templates/>
    </ul>
    <p>
      In the following list, if we're running an XSLT2 processor,
      you should see all four of the banana splits.  But if we're only
      running an XSLT1 processor, you will see only the first one:
    </p>
    <blockquote>
      <xsl:value-of select="split"/>
    </blockquote>
  </xsl:template>

  <xsl:template match='split'>
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
</xsl:stylesheet>
