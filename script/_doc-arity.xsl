<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:p="http://openstax.org/docs-rng-parity"
  exclude-result-prefixes="rng h"
  version="1.0">

<!-- This converts a .rng file to be a little bit more amenable to documentation-generation.
   It converts the <rng:optional>, <rng:zeroOrMore>, and <rng:oneOrMore> elements
   into an attribute.

   This is done so the XPAth expressions in the _doc-generation.xsl file can be more sane
   and consistent.
-->


<xsl:template match="rng:optional">
  <xsl:apply-templates select="@*|node()">
    <xsl:with-param name="arity">?</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="rng:zeroOrMore">
  <xsl:apply-templates select="@*|node()">
    <xsl:with-param name="arity">*</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="rng:oneOrMore">
  <xsl:apply-templates select="@*|node()">
    <xsl:with-param name="arity">+</xsl:with-param>
  </xsl:apply-templates>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*">
  <xsl:param name="arity"/>
  <xsl:copy>
    <xsl:if test="$arity">
      <xsl:attribute name="p:arity">
        <xsl:value-of select="$arity"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
