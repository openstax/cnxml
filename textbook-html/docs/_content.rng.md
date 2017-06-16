# Block.class

This element extends an existing defition

One of the following:

* [section](#section)
* [figure](#figure)
* [Content.Note](#contentnote)
* [Content.Equation](#contentequation)
* [Content.Exercise](#contentexercise)
* [Content.Example](#contentexample)
* [Content.DivList](#contentdivlist)
* [Content.ListWithTitle](#contentlistwithtitle)
* [Content.ParaWithTitle](#contentparawithtitle)
* `<div>Content.Media.class</div>`
* `<div>Content.Alternates.class</div>`
* `<div>Content.Newline.class</div>`
* [Content.FootnoteRefs](#contentfootnoterefs)

# Block.class

This element extends an existing defition

[cnx-pi](#cnx-pi)
# Inline.class

This element extends an existing defition

[math](#math)
# Inline.class

This element extends an existing defition

One of the following:

* [u](#u)
* [Content.SpanList](#contentspanlist)
* [Content.Space](#contentspace)
* [Content.FootnoteNumber](#contentfootnotenumber)
* [Content.Term](#contentterm)
* [Content.Foreign](#contentforeign)
* `<span>Content.Media.class</span>`
* `<span>Content.Alternates.class</span>`
* `<span>Content.Newline.class</span>`

# Content.Space

`<span data-type="space"
data-count=Number.datatype>Text.datatype</span>`
# Content.Term

`<span data-type="term">`

1.  [id.attrib](#idattrib)
2.  [class.attrib](#classattrib)
3.  [Inline.model](#inlinemodel)

`</span>`

# Content.Foreign

`<span data-type="foreign">Inline.model</span>`
# Content.FootnoteNumber

`<sup data-type="footnote-number">`

1.  [id.attrib.required](#idattribrequired)
2.  `<a data-type="footnote-link" href=URI.datatype>Number.datatype</a>`

`</sup>`

# Content.ImageWithThumbnail

`<a data-type="image-with-thumbnail" href=URI.datatype>img</a>`
# Content.FootnoteRefs

`<div data-type="footnote-refs">`

1.  `<h3 data-type="footnote-refs-title"/>`
2.  `<ul data-list-type="bulleted" data-bullet-style="none"/>`

`</div>`

# Content.Title.optional

`<div data-type="title">`

1.  [Common.attrib](#commonattrib)
2.  [Flow.model](#flowmodel)

`</div>`

?
# Content.Note.attrs

[Common.attrib](#commonattrib)
data-label=[Text.datatype](#textdatatype)? data-has-label="true"?
data-element-type=[Text.datatype](#textdatatype)?[Content.Title.optional](#contenttitleoptional)
# Content.Note

`<div data-type="note">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Equation

`<div data-type="equation">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Problem

`<div data-type="problem">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Solution

`<div data-type="solution" data-print-placement=["here" | "end"]>`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Commentary

`<div data-type="commentary">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Exercise

`<div data-type="exercise" data-print-placement=["here" | "end"]>`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Content.Problem](#contentproblem)
3.  [Content.Solution](#contentsolution)*
4.  [Content.Commentary](#contentcommentary)*

`</div>`

# Content.Example

`<div data-type="example">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.Newline.class

data-type="newline"[Content.Note.attrs](#contentnoteattrs)
data-count=[Number.datatype](#numberdatatype)?[br](#br)*
# Content.DivList

`<div>div-span-list.attrsContent.DivListItem*</div>`
# Content.DivListItem

`<div data-type="item">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

# Content.SpanList

`<span>div-span-list.attrsContent.SpanListItem*</span>`
# Content.SpanListItem

`<span data-type="item">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Inline.model](#inlinemodel)

`</span>`

# Content.ListWithTitle

`<div data-type="list-with-title">`

1.  [id.attrib.required](#idattribrequired)
2.  `<div data-type="title">`
    
    1.  [id.attrib](#idattrib)
    2.  [Inline.model](#inlinemodel)
    
    `</div>`

3.  One of the following:
    
    * [ul](#ul)
    * [ol](#ol)
    * [Content.DivList](#contentdivlist)

`</div>`

# Content.ParaWithTitle

`<p>`

1.  [p.attlist](#pattlist)
2.  [Content.InlineTitle](#contentinlinetitle)
3.  [Inline.model](#inlinemodel)

`</p>`

# Content.Alternates.class

data-type="alternates"[id.attrib.required](#idattribrequired)
data-alt=[Text.datatype](#textdatatype)?
One of the following:

* [img](#img)
* [Content.ImageWithThumbnail](#contentimagewiththumbnail)

*
# Content.Media.class

data-type="media"[id.attrib.required](#idattribrequired)
data-alt=[Text.datatype](#textdatatype)
data-longdesc=[Text.datatype](#textdatatype)?
One of the following:

* [img](#img)
* [iframe](#iframe)

# Content.Glossary

`<div data-type="glossary"><h3 data-type="glossary-title"/>dl*</div>`
# Content.InlineTitle

`<span data-type="title">Inline.model</span>`
# id.attrib.required

id=[ID.datatype](#iddatatype)
# table.attlist

This element extends an existing defition

data-label=[Text.datatype](#textdatatype)?
data-frame=[Text.datatype](#textdatatype)?
data-colsep=[Number.datatype](#numberdatatype)?
data-rowsep=[Number.datatype](#numberdatatype)?
# caption

This element extends an existing defition

`<caption>`

1.  [caption.attlist](#captionattlist)
2.  [Content.InlineTitle](#contentinlinetitle)
3.  [Inline.model](#inlinemodel)

`</caption>`

# enum.attr.td.data-valign

One of the following:

* "top"
* "middle"
* "bottom"

# enum.attr.td.data-align

One of the following:

* "left"
* "center"
* "right"
* "justify"
* "char"

# td.attlist

This element extends an existing defition

data-valign=[enum.attr.td.data-valign](#enumattrtddata-valign)?
data-align=[enum.attr.td.data-align](#enumattrtddata-align)?
# th.attlist

This element extends an existing defition

data-valign=[enum.attr.td.data-valign](#enumattrtddata-valign)?
data-align=[enum.attr.td.data-align](#enumattrtddata-align)?
# enum.attr.ol.data-number-style

One of the following:

* "arabic"
* "lower-alpha"
* "upper-alpha"
* "lower-roman"
* "upper-roman"

# enum.attr.ol.data-mark-suffix

# ol.attlist

This element extends an existing defition

data-number-style=[enum.attr.ol.data-number-style](#enumattroldata-number-style)?
data-mark-suffix=[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)?
data-mark-prefix=[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)?
# enum.attr.ul.data-bullet-style

One of the following:

* "bullet"
* "open-circle"
* "pilcrow"
* "rpilcrow"
* "asterisk"
* "dash"
* "section"
* "none"

# ul.attlist

This element extends an existing defition

data-bullet-style=[enum.attr.ul.data-bullet-style](#enumattruldata-bullet-style)?
data-mark-suffix=[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)?
data-labeled-item="true"?
# li.attlist

This element extends an existing defition

cnx-archive-shortid=[Text.datatype](#textdatatype)
cnx-archive-uri=[Text.datatype](#textdatatype)?
data-label=[Text.datatype](#textdatatype)?
# enum.attr.img.data-media-type

One of the following:

* "image/png"
* "image/jpeg"
* "application/postscript"
* "image/jpg"

# img.attlist

This element extends an existing defition

data-media-type=[enum.attr.img.data-media-type](#enumattrimgdata-media-type)?
data-longdesc=[URI.datatype](#uridatatype)?
data-print-width=[Length.datatype](#lengthdatatype)?
data-print=[Boolean.datatype](#booleandatatype)?
# enum.attr.strong.data-effect

"bold"
# strong.attlist

This element extends an existing defition

data-effect=[enum.attr.strong.data-effect](#enumattrstrongdata-effect)?
# enum.attr.em.data-effect

One of the following:

* "italics"
* "smallcaps"

# em.attlist

This element extends an existing defition

data-effect=[enum.attr.em.data-effect](#enumattremdata-effect)?
# enum.attr.span.data-type

One of the following:

* "cite-title"

# span.attlist

This element extends an existing defition

data-type=[enum.attr.span.data-type](#enumattrspandata-type)?
data-alt=[Text.datatype](#textdatatype)?
# enum.attr.Heading.data-type

"title"
# Heading.attrib

This element extends an existing defition

data-type=[enum.attr.Heading.data-type](#enumattrheadingdata-type)
# div.attlist

This element extends an existing defition

data-label=[Text.datatype](#textdatatype)? data-has-label="true"?
data-element-type=[Text.datatype](#textdatatype)?
# div-span-list.attrs

data-type="list" data-mark-suffix=[Text.datatype](#textdatatype)?
data-item-sep=[Text.datatype](#textdatatype)?
One of the following:

* 
* 

[Content.Note.attrs](#contentnoteattrs)
# u

`<u>`

1.  [u.attlist](#uattlist)
2.  [Inline.model](#inlinemodel)

`</u>`

# u.attlist

[Common.attrib](#commonattrib)
# ol.attlist

This element extends an existing defition

type=? compact="compact"? start=?
# section

`<section>`

1.  [section.attlist](#sectionattlist)
2.  [Heading.class](#headingclass)?
3.  [Flow.model](#flowmodel)

`</section>`

# section.attlist

[Common.attrib](#commonattrib)
data-depth=[Number.datatype](#numberdatatype)
data-label=[Text.datatype](#textdatatype)?
data-element-type=[Text.datatype](#textdatatype)?
# figure

`<figure>`

1.  [figure.attlist](#figureattlist)
2.  [Content.Title.optional](#contenttitleoptional)
3.  [figcaption](#figcaption)?
4.  [Flow.model](#flowmodel)

`</figure>`

# figure.attlist

[Common.attrib](#commonattrib)
data-label=[Text.datatype](#textdatatype)? data-orient=["vertical" |
"horizontal"]?
# figcaption

`<figcaption>`

1.  [figcaption.attlist](#figcaptionattlist)
2.  [Content.InlineTitle](#contentinlinetitle)?
3.  [Flow.model](#flowmodel)

`</figcaption>`

# figcaption.attlist

[id.attrib](#idattrib)
# cnx-pi

`<cnx-pi>`

1.  [cnx-pi.attlist](#cnx-piattlist)
2.  *cnx-pi.datatype*

`</cnx-pi>`

# cnx-pi.attlist

data-type=["cnx.eoc" | *Text.datatype*]
