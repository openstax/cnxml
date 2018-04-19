<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>CNXML 0.8 ID validation</title>

  <ns prefix="c" uri="http://cnx.rice.edu/cnxml"/>
  <ns prefix="m" uri="http://www.w3.org/1998/Math/MathML"/>

  <pattern>
    <rule context="*[@id]">
      <assert test="count(//*[@id=current()/@id]) = 1">
        The id attribute shall have a unique value.
      </assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="c:link[@target-id and not(@document)]">
      <assert test="//c:*[@id=current()/@target-id]">
        The target-id attribute shall reference an existing ID.
      </assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="*[@xref]">
      <assert test="current()//ancestor::m:math//m:*[@id=current()/@xref]">
        The xref attribute shall reference an existing ID in current MathML document.
      </assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="m:*[@indenttarget]">
      <assert test="current()//ancestor::m:math//m:*[@id=current()/@indenttarget]">
        The indenttarget attribute shall reference an existing ID in current MathML document.
      </assert>
    </rule>
  </pattern>
</schema>
