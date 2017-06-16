<xsl:stylesheet
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  exclude-result-prefixes="rng"
  version="1.0">


<xsl:template match="/rng:grammar">
  <html>
    <body>
      <xsl:apply-templates select="rng:define[starts-with(@name, 'Block')]"/>
      <xsl:apply-templates select="rng:define[starts-with(@name, 'Inline')]"/>
      <xsl:apply-templates select="rng:define[starts-with(@name, 'Content')]"/>
      <xsl:apply-templates select="rng:define
        [not(starts-with(@name, 'Block'))]
        [not(starts-with(@name, 'Inline'))]
        [not(starts-with(@name, 'Content'))]
      "/>
    </body>
  </html>
</xsl:template>

<xsl:template match="rng:define[not(contains(@name, '.datatype'))]">
  <h1>
    <xsl:value-of select="@name"/>
  </h1>
  <xsl:if test="@combine">
    <p>This element extends an existing defition</p>
  </xsl:if>

  <xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="rng:ref[not(contains(@name, '.datatype'))]">
  <xsl:variable name="href">
    <xsl:call-template name="string-replace-all">
      <xsl:with-param name="text" select="@name" />
      <xsl:with-param name="replace" select="'.'" />
      <xsl:with-param name="by" select="''" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="hrefLowerCase" select="translate($href,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
  <a>
    <xsl:attribute name="href">
      <xsl:text>#</xsl:text>
      <xsl:value-of select="$hrefLowerCase"/>
    </xsl:attribute>
    <xsl:value-of select="@name"/>
  </a>
</xsl:template>

<xsl:template match="rng:ref[contains(@name, '.datatype')]">
  <em>
    <xsl:value-of select="@name"/>
  </em>
</xsl:template>



<xsl:template match="rng:element">
  <xsl:choose>
    <xsl:when test="count(rng:ref) + count(rng:element) > 1">
      <p>
        <code>
          <xsl:text>&lt;</xsl:text>
          <xsl:value-of select="@name"/>
          <xsl:apply-templates select="rng:attribute"/>
          <xsl:apply-templates select="rng:optional/rng:attribute"/>
          <xsl:text>&gt;</xsl:text>
        </code>
      </p>

      <ol>
        <xsl:for-each select="rng:*[not(self::rng:attribute)][not(self::rng:optional[rng:attribute])]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ol>

      <p>
        <code>
          <xsl:text>&lt;/</xsl:text>
          <xsl:value-of select="@name"/>
          <xsl:text>&gt;</xsl:text>
        </code>
      </p>
    </xsl:when>
    <xsl:when test="count(rng:ref) + count(rng:element) = 1">
      <code>
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:apply-templates select="rng:attribute"/>
        <xsl:apply-templates select="rng:optional/rng:attribute"/>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates select="rng:*[not(self::rng:attribute)][not(self::rng:optional[rng:attribute])]"/>
        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>&gt;</xsl:text>
      </code>
    </xsl:when>
    <xsl:otherwise>
      <code>
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:apply-templates select="rng:attribute"/>
        <xsl:apply-templates select="rng:optional/rng:attribute"/>
        <xsl:text>/&gt;</xsl:text>
      </code>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="rng:attribute">
  <xsl:text> </xsl:text>
  <xsl:value-of select="@name"/>
  <xsl:text>=</xsl:text>
  <xsl:apply-templates select="*"/>
</xsl:template>


<xsl:template match="rng:value">
  <xsl:text>"</xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text>"</xsl:text>
</xsl:template>

<xsl:template match="rng:attribute/rng:ref">
  <xsl:variable name="href">
    <xsl:call-template name="string-replace-all">
      <xsl:with-param name="text" select="@name" />
      <xsl:with-param name="replace" select="'.'" />
      <xsl:with-param name="by" select="''" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="hrefLowerCase" select="translate($href,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
  <a>
    <xsl:attribute name="href">
      <xsl:text>#</xsl:text>
      <xsl:value-of select="$hrefLowerCase"/>
    </xsl:attribute>
    <xsl:value-of select="@name"/>
  </a>
</xsl:template>


<xsl:template match="rng:optional">
  <xsl:apply-templates select="*"/>
  <xsl:text>?</xsl:text>
</xsl:template>

<xsl:template match="rng:zeroOrMore">
  <xsl:apply-templates select="*"/>
  <xsl:text>*</xsl:text>
</xsl:template>

<xsl:template match="rng:oneOrMore">
  <xsl:apply-templates select="*"/>
  <xsl:text>*</xsl:text>
</xsl:template>

<xsl:template match="rng:choice">
  <p>One of the following:</p>
  <ul>
    <xsl:for-each select="*">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>


<xsl:template match="rng:attribute/rng:choice">
  <xsl:text>[</xsl:text>
  <xsl:for-each select="*">
    <xsl:if test="position() != 1">
      <xsl:text> | </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="."/>
  </xsl:for-each>
  <xsl:text>]</xsl:text>
</xsl:template>


<!--  Catch-all for TODOs -->
<xsl:template match="*">
  <xsl:variable name="parentName">
    <xsl:for-each select="ancestor::*">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="local-name()"/>
      <xsl:if test="@name">[@name="<xsl:value-of select="@name"/>"]</xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="localName">
    <xsl:value-of select="local-name()"/>
    <xsl:if test="@name">[@name="<xsl:value-of select="@name"/>"]</xsl:if>
  </xsl:variable>
  <xsl:message>TODO: Unsupported element: <xsl:value-of select="$parentName"/>/<xsl:value-of select="$localName"/></xsl:message>
</xsl:template>

<xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
        <xsl:when test="$text = '' or $replace = ''or not($replace)" >
            <!-- Prevent this routine from hanging -->
            <xsl:value-of select="$text" />
        </xsl:when>
        <xsl:when test="contains($text, $replace)">
            <xsl:value-of select="substring-before($text,$replace)" />
            <xsl:value-of select="$by" />
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="substring-after($text,$replace)" />
                <xsl:with-param name="replace" select="$replace" />
                <xsl:with-param name="by" select="$by" />
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


</xsl:stylesheet>
