<xsl:stylesheet
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:h="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:r="http://relaxng.org/ns/structure/1.0"
  xmlns:p="http://openstax.org/docs-rng-parity"
  exclude-result-prefixes="r h"
  version="1.0">

<!-- This XSLT file contains 2 modes:
  - (default) : this handles the p:arity="?|*|+" attribute and then passes the element to "concrete" mode (wrapping it in () or adding a `?` character)
  - "concrete": this handles rendering the element

  The p:arity attribute is added by _doc-arity.xsl to make it easier to select things when generating the docs.
-->

<!-- Handle the arity and then render the element -->
<xsl:template match="r:*">
  <xsl:choose>
    <xsl:when test="@p:arity">
      <xsl:variable name="character" select="@p:arity"/>
      <xsl:choose>
        <xsl:when test="self::r:attribute or self::r:ref or self::r:choice or self::r:text">
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

<!-- Copy documentation as-is -->
<xsl:template match="h:*|h:*/@*">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template mode="concrete" match="h:*">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>



<xsl:template match="/r:grammar">
  <html>
    <body>
      <xsl:if test="r:include">
        <h1>Included files</h1>
        <ul>
          <xsl:apply-templates select="r:include"/>
        </ul>
      </xsl:if>
      <xsl:apply-templates select="*[not(self::r:include)]"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="r:include">
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

<xsl:template match="r:define">
  <h2>
    <xsl:value-of select="@name"/>
  </h2>
  <xsl:choose>
    <xsl:when test="@combine='choice'">
      <p>This extends the set of elements that are allowed in a <code><xsl:value-of select="@name"/></code></p>
    </xsl:when>
    <xsl:when test="@combine='interleave'">
      <p>This interleaves additional requirements which restricts the definition of <code><xsl:value-of select="@name"/></code></p>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates select="*"/>
</xsl:template>


<xsl:template match="r:define[r:attribute]">
  <h2>
    <xsl:value-of select="@name"/>
  </h2>
  <p>This defines a set of attributes:</p>
  <ul>
    <xsl:for-each select="r:attribute">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ul>

  <xsl:if test="*[not(self::r:attribute)]">
    <p>And other things:</p>
    <ol>
      <xsl:for-each select="*[not(self::r:attribute)]">
        <li>
          <xsl:apply-templates select="."/>
        </li>
      </xsl:for-each>
    </ol>
  </xsl:if>
</xsl:template>


<xsl:template mode="concrete" match="r:ref">
  <xsl:variable name="name" select="@name"/>
  <xsl:choose>
    <xsl:when test="/r:grammar/r:define[@name=$name]">
      <!-- When defined in this doc then make a link to it -->
      <xsl:variable name="href">
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="$name" />
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
    </xsl:when>
    <xsl:otherwise>
      <strong>
        <xsl:value-of select="$name"/>
      </strong>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>




<xsl:template mode="concrete" match="r:element">
  <xsl:choose>
    <xsl:when test="count(r:*[not(self::r:attribute)]) > 1">
      <p>
        <code>
          <xsl:text>&lt;</xsl:text>
          <xsl:value-of select="@name"/>
        </code>
        <xsl:apply-templates select="r:attribute"/>
        <code>
          <xsl:text>&gt;</xsl:text>
        </code>
      </p>

      <ol>
        <xsl:for-each select="r:*[not(self::r:attribute)]">
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
    <xsl:when test="count(r:*[not(self::r:attribute)]) = 1">
      <code>
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="@name"/>
      </code>
      <xsl:apply-templates select="r:attribute"/>
      <code>
        <xsl:text>&gt;</xsl:text>
      </code>
      <xsl:apply-templates select="r:*[not(self::r:attribute)]"/>
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
        <xsl:apply-templates select="r:attribute"/>
        <xsl:text>/&gt;</xsl:text>
      </code>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template mode="concrete" match="r:attribute">
  <code>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>=</xsl:text>
  </code>
  <xsl:apply-templates select="*"/>
</xsl:template>


<xsl:template mode="concrete" match="r:attribute/r:value | r:attribute/r:choice/r:value | r:define/r:choice/r:value | r:define/r:value">
  <code>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="text()"/>
    <xsl:text>"</xsl:text>
  </code>
</xsl:template>

<xsl:template mode="concrete" match="r:element/r:value">
  <code>
    <xsl:value-of select="text()"/>
  </code>
</xsl:template>

<xsl:template mode="concrete" match="r:text">
  <xsl:text>(text...)</xsl:text>
</xsl:template>

<xsl:template mode="concrete" match="r:attribute/r:ref">
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


<xsl:template mode="concrete" match="r:group">
  <ol>
    <xsl:for-each select="*">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ol>
</xsl:template>


<xsl:template mode="concrete" match="r:choice">
  <p>One of the following:</p>
  <ul>
    <xsl:for-each select="*">
      <li>
        <xsl:apply-templates select="."/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template mode="concrete" match="r:choice[count(*) = count(r:ref)]">
  <code>
    <xsl:text>[</xsl:text>
  </code>
  <xsl:for-each select="*">
    <xsl:if test="position() != 1">
      <code>
        <xsl:text> | </xsl:text>
      </code>
    </xsl:if>
    <xsl:apply-templates select="."/>
  </xsl:for-each>
  <code>
    <xsl:text>]</xsl:text>
  </code>
</xsl:template>


<xsl:template mode="concrete" match="r:attribute/r:choice">
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
