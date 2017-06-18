<xsl:stylesheet
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:p="http://openstax.org/docs-rng-parity"
  exclude-result-prefixes="rng"
  version="1.0">

<!-- This XSLT file contains 2 modes:
  - (default) : this handles the p:arity="?|*|+" attribute and then passes the element to "concrete" mode (wrapping it in () or adding a `?` character)
  - "concrete": this handles rendering the element

  The p:arity attribute is added by _doc-arity.xsl to make it easier to select things when generating the docs.
-->

<!-- Handle the arity and then render the element -->
<xsl:template match="*">
  <xsl:choose>
    <xsl:when test="@p:arity">
      <xsl:variable name="character" select="@p:arity"/>
      <xsl:choose>
        <xsl:when test="self::rng:attribute or self::rng:ref or self::rng:text">
          <!-- Just add a simple "?" or "*" or "+" at the end of the line -->
          <xsl:apply-templates mode="concrete" select="."/>
          <code>
            <xsl:value-of select="$character"/>
          </code>
        </xsl:when>
        <xsl:otherwise>
          <!-- This is complex so we need a "(" followed by the actual element, followed by ")?" -->
          <code>
            <xsl:text>(</xsl:text>
          </code>
          <xsl:apply-templates mode="concrete" select="."/>
          <code>
            <xsl:text>)</xsl:text>
            <xsl:value-of select="$character"/>
          </code>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates mode="concrete" select="."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="/rng:grammar">
  <html>
    <body>
      <xsl:if test="rng:include">
        <h1>Included files</h1>
        <ul>
          <xsl:apply-templates select="rng:include"/>
        </ul>
      </xsl:if>
      <xsl:apply-templates select="*[not(self::rng:include)]"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="rng:include">
  <xsl:variable name="href">
    <xsl:text>../textbook-html/</xsl:text>
    <xsl:value-of select="@href"/>
  </xsl:variable>
  <li>
    <a href="{$href}">
      <xsl:value-of select="@href"/>
    </a>
  </li>
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


<xsl:template match="rng:define[rng:attribute]">
  <h1>
    <xsl:value-of select="@name"/>
  </h1>
  <p>This defines a set of attributes:</p>
  <ul>
    <xsl:for-each select="rng:attribute">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ul>

  <xsl:if test="*[not(self::rng:attribute)]">
    <p>And other things:</p>
    <ol>
      <xsl:for-each select="*[not(self::rng:attribute)]">
        <li>
          <xsl:apply-templates select="."/>
        </li>
      </xsl:for-each>
    </ol>
  </xsl:if>
</xsl:template>


<xsl:template mode="concrete" match="rng:ref[not(contains(@name, '.datatype'))]">
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

<xsl:template mode="concrete" match="rng:ref[contains(@name, '.datatype')]">
  <em>
    <xsl:value-of select="@name"/>
  </em>
</xsl:template>



<xsl:template mode="concrete" match="rng:element">
  <xsl:choose>
    <xsl:when test="count(rng:*[not(self::rng:attribute)]) > 1">
      <p>
        <code>
          <xsl:text>&lt;</xsl:text>
          <xsl:value-of select="@name"/>
        </code>
        <xsl:apply-templates select="rng:attribute"/>
        <code>
          <xsl:text>&gt;</xsl:text>
        </code>
      </p>

      <ol>
        <xsl:for-each select="rng:*[not(self::rng:attribute)]">
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
    <xsl:when test="count(rng:*[not(self::rng:attribute)]) = 1">
      <code>
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="@name"/>
      </code>
      <xsl:apply-templates select="rng:attribute"/>
      <code>
        <xsl:text>&gt;</xsl:text>
      </code>
      <xsl:apply-templates select="rng:*[not(self::rng:attribute)]"/>
      <code>
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
        <xsl:text>/&gt;</xsl:text>
      </code>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template mode="concrete" match="rng:attribute">
  <code>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>=</xsl:text>
  </code>
  <xsl:apply-templates select="*"/>
</xsl:template>


<xsl:template mode="concrete" match="rng:attribute/rng:value | rng:attribute/rng:choice/rng:value | rng:define/rng:choice/rng:value | rng:define/rng:value">
  <code>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="text()"/>
    <xsl:text>"</xsl:text>
  </code>
</xsl:template>

<xsl:template mode="concrete" match="rng:element/rng:value">
  <code>
    <xsl:value-of select="text()"/>
  </code>
</xsl:template>

<xsl:template mode="concrete" match="rng:text">
  <xsl:text>(text...)</xsl:text>
</xsl:template>

<xsl:template mode="concrete" match="rng:attribute/rng:ref">
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


<xsl:template mode="concrete" match="rng:group">
  <ol>
    <xsl:for-each select="*">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ol>
</xsl:template>


<xsl:template mode="concrete" match="rng:choice">
  <p>One of the following:</p>
  <ul>
    <xsl:for-each select="*">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>


<xsl:template mode="concrete" match="rng:attribute/rng:choice">
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
<xsl:template mode="concrete" match="*">
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
