# Included files

* [../xhtml/modules/datatypes.rng](../textbook-html/../xhtml/modules/datatypes.rng)
* [../xhtml/modules/attribs.rng](../textbook-html/../xhtml/modules/attribs.rng)
* [../xhtml/modules/struct.rng](../textbook-html/../xhtml/modules/struct.rng)
* [../xhtml/modules/text.rng](../textbook-html/../xhtml/modules/text.rng)
* [../xhtml/modules/hypertext.rng](../textbook-html/../xhtml/modules/hypertext.rng)
* [../xhtml/modules/list.rng](../textbook-html/../xhtml/modules/list.rng)
* [../xhtml/modules/image.rng](../textbook-html/../xhtml/modules/image.rng)
* [../xhtml/modules/param.rng](../textbook-html/../xhtml/modules/param.rng)
* [../xhtml/modules/meta.rng](../textbook-html/../xhtml/modules/meta.rng)
* [../xhtml/modules/link.rng](../textbook-html/../xhtml/modules/link.rng)
* [../xhtml/modules/base.rng](../textbook-html/../xhtml/modules/base.rng)
* [../xhtml/modules/iframe.rng](../textbook-html/../xhtml/modules/iframe.rng)
* [../xhtml/modules/table.rng](../textbook-html/../xhtml/modules/table.rng)
* [../xhtml/modules/pres.rng](../textbook-html/../xhtml/modules/pres.rng)
* [../xhtml/modules/target.rng](../textbook-html/../xhtml/modules/target.rng)
* [../mathml2.rng](../textbook-html/../mathml2.rng)

# File Overview

This file is organized into the following sections:

1.  Textbook-specific Blockish pseudo-elements: This contains things
    like Note, Exercise
2.  Textbook-specific Inline pseudoelements: things like "term", inline
    list, media
3.  Enum attributes: things like `bullet-style` or `lower-roman`
4.  HTML5 elements: things like `<section>` or `<figure>`
5.  Additional attributes to existing xhtml elements: things like table
    valign and `<caption>` element
6.  Additional datatype values: things like UUID, UUID-and-version

## Block.class

This extends the set of elements that are allowed in a `Block.class`

One of the following:

* [Content.Note](#contentnote)
* [Content.Equation](#contentequation)
* [Content.Exercise](#contentexercise)
* [Content.Example](#contentexample)
* [Content.DivList](#contentdivlist)
* [Content.ListWithTitle](#contentlistwithtitle)
* [Content.ParaWithTitle](#contentparawithtitle)
* `<div>`[Content.Media.class](#contentmediaclass)`</div>`
* `<div>`[Content.Alternates.class](#contentalternatesclass)`</div>`
* `<div>`[Content.Newline.class](#contentnewlineclass)`</div>`
* [Content.FootnoteRefs](#contentfootnoterefs)
* [section](#section)
* [figure](#figure)
* [cnx-pi](#cnx-pi)

## Inline.class

This extends the set of elements that are allowed in a `Inline.class`

One of the following:

* [math](#math)
* [u](#u)
* [Content.SpanList](#contentspanlist)
* [Content.Space](#contentspace)
* [Content.FootnoteNumber](#contentfootnotenumber)
* [Content.Term](#contentterm)
* [Content.Foreign](#contentforeign)
* `<span>`[Content.Media.class](#contentmediaclass)`</span>`
* `<span>`[Content.Alternates.class](#contentalternatesclass)`</span>`
* `<span>`[Content.Newline.class](#contentnewlineclass)`</span>`

## Content.Space

This provides horizontal space

`<span data-type="space"
data-count=`[Number.datatype](#numberdatatype)`>`*Text.datatype*`</span>`
## Content.Term

This defines a Term that will be bold and show up in the Book Index

`<span data-type="term">`

1.  [id.attrib](#idattrib)
2.  [class.attrib](#classattrib)
3.  [Inline.model](#inlinemodel)

`</span>`

## Content.Foreign

This defines a piece of Foreign text

`<span data-type="foreign">`[Inline.model](#inlinemodel)`</span>`
## Content.FootnoteNumber

This defines Footnote number that appears in the content. It is matched
with an item in Content.FootnoteRefs

`<sup data-type="footnote-number">`

1.  [id.attrib.required](#idattribrequired)
2.  `<a data-type="footnote-link"
    href=`[URI.datatype](#uridatatype)`>`*Number.datatype*`</a>`

`</sup>`

## Content.ImageWithThumbnail

This is an Image with a clickable thumbnail

`<a data-type="image-with-thumbnail"
href=`[URI.datatype](#uridatatype)`>`[img](#img)`</a>`
## Content.FootnoteRefs

`<div data-type="footnote-refs">`

1.  `<h3 data-type="footnote-refs-title">Footnotes</h3>`
2.  `<ul data-list-type="bulleted" data-bullet-style="none">(`
    `<li data-type="footnote-ref">`
    
    1.  [id.attrib.required](#idattribrequired)
    2.  `<a data-type="footnote-ref-link"
        href=`[URI.datatype](#uridatatype)`>`*Number.datatype*`</a>`
    3.  `<span
        data-type="footnote-ref-content">`[Inline.model](#inlinemodel)`</span>`
    
    `</li>`
    
    `)+</ul>`

`</div>`

## Content.Title.optional

`(`
`<div data-type="title">`

1.  [Common.attrib](#commonattrib)
2.  [Flow.model](#flowmodel)

`</div>`

`)?`
## Content.Note.attrs

This defines a set of attributes:

* ` data-label=`[Text.datatype](#textdatatype)`?`
* ` data-has-label="true"?`
* ` data-element-type=`[Text.datatype](#textdatatype)`?`

And other things:

1.  [Common.attrib](#commonattrib)
2.  [Content.Title.optional](#contenttitleoptional)

## Content.Note

`<div data-type="note">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Equation

`<div data-type="equation">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Problem

`<div data-type="problem">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Solution

`<div data-type="solution" data-print-placement=`[`"here"` |
`"end"`]`?>`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Commentary

`<div data-type="commentary">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Exercise

`<div data-type="exercise" data-print-placement=`[`"here"` |
`"end"`]`?>`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Content.Problem](#contentproblem)
3.  [Content.Solution](#contentsolution)`*`
4.  [Content.Commentary](#contentcommentary)`*`

`</div>`

## Content.Example

`<div data-type="example">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.Newline.class

This defines a set of attributes:

* ` data-type="newline"`
* ` data-count=`[Number.datatype](#numberdatatype)`?`

And other things:

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [br](#br)`*`

## Content.DivList

`<div>`

1.  [div-span-list.attrs](#div-span-listattrs)
2.  [Content.DivListItem](#contentdivlistitem)`+`

`</div>`

## Content.DivListItem

`<div data-type="item">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Flow.model](#flowmodel)

`</div>`

## Content.SpanList

`<span>`

1.  [div-span-list.attrs](#div-span-listattrs)
2.  [Content.SpanListItem](#contentspanlistitem)`+`

`</span>`

## Content.SpanListItem

`<span data-type="item">`

1.  [Content.Note.attrs](#contentnoteattrs)
2.  [Inline.model](#inlinemodel)

`</span>`

## Content.ListWithTitle

`<div data-type="list-with-title">`

1.  [id.attrib.required](#idattribrequired)
2.  `<div data-type="title">`
    
    1.  [id.attrib](#idattrib)
    2.  [Inline.model](#inlinemodel)
    
    `</div>`

3.  `[`[ul](#ul)` | `[ol](#ol)` | `[Content.DivList](#contentdivlist)`]`

`</div>`

## Content.ParaWithTitle

`<p>`

1.  [p.attlist](#pattlist)
2.  [Content.InlineTitle](#contentinlinetitle)
3.  [Inline.model](#inlinemodel)

`</p>`

## Content.Alternates.class

This defines a set of attributes:

* ` data-type="alternates"`
* ` data-alt=`[Text.datatype](#textdatatype)`?`

And other things:

1.  [id.attrib.required](#idattribrequired)
2.  `[`[img](#img)` |
    `[Content.ImageWithThumbnail](#contentimagewiththumbnail)`]+`

## Content.Media.class

This defines a set of attributes:

* ` data-type="media"`
* ` data-alt=`[Text.datatype](#textdatatype)
* ` data-longdesc=`[Text.datatype](#textdatatype)`?`

And other things:

1.  [id.attrib.required](#idattribrequired)
2.  `[`[img](#img)` | `[iframe](#iframe)`]`

## Content.InlineTitle

`<span data-type="title">`[Inline.model](#inlinemodel)`</span>`
## Content.Glossary

`<div data-type="glossary">`

1.  `<h3 data-type="glossary-title">Glossary</h3>`
2.  [dl](#dl)`+`

`</div>`

## id.attrib.required

This defines a set of attributes:

* ` id=`[ID.datatype](#iddatatype)

## table.attlist

This defines a set of attributes:

* ` data-label=`[Text.datatype](#textdatatype)`?`
* ` data-frame=`[Text.datatype](#textdatatype)`?`
* ` data-colsep=`[Number.datatype](#numberdatatype)`?`
* ` data-rowsep=`[Number.datatype](#numberdatatype)`?`

## caption

This extends the set of elements that are allowed in a `caption`

`<caption>`

1.  [caption.attlist](#captionattlist)
2.  [Content.InlineTitle](#contentinlinetitle)
3.  [Inline.model](#inlinemodel)

`</caption>`

## enum.attr.td.data-valign

One of the following:

* `"top"`
* `"middle"`
* `"bottom"`

## enum.attr.td.data-align

One of the following:

* `"left"`
* `"center"`
* `"right"`
* `"justify"`
* `"char"`

## td.attlist

This defines a set of attributes:

* ` data-valign=`[enum.attr.td.data-valign](#enumattrtddata-valign)`?`
* ` data-align=`[enum.attr.td.data-align](#enumattrtddata-align)`?`

## th.attlist

This defines a set of attributes:

* ` data-valign=`[enum.attr.td.data-valign](#enumattrtddata-valign)`?`
* ` data-align=`[enum.attr.td.data-align](#enumattrtddata-align)`?`

## enum.attr.ol.data-number-style

One of the following:

* `"arabic"`
* `"lower-alpha"`
* `"upper-alpha"`
* `"lower-roman"`
* `"upper-roman"`

## enum.attr.ol.data-mark-suffix

(text...)
## ol.attlist

This defines a set of attributes:

* `
  data-number-style=`[enum.attr.ol.data-number-style](#enumattroldata-number-style)`?`
* `
  data-mark-suffix=`[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)`?`
* `
  data-mark-prefix=`[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)`?`

## enum.attr.ul.data-bullet-style

One of the following:

* `"bullet"`
* `"open-circle"`
* `"pilcrow"`
* `"rpilcrow"`
* `"asterisk"`
* `"dash"`
* `"section"`
* `"none"`

## ul.attlist

This defines a set of attributes:

* `
  data-bullet-style=`[enum.attr.ul.data-bullet-style](#enumattruldata-bullet-style)`?`
* `
  data-mark-suffix=`[enum.attr.ol.data-mark-suffix](#enumattroldata-mark-suffix)`?`
* ` data-labeled-item="true"?`

## li.attlist

This defines a set of attributes:

* ` cnx-archive-shortid=`[Text.datatype](#textdatatype)`?`
* ` cnx-archive-uri=`[Text.datatype](#textdatatype)`?`
* ` data-label=`[Text.datatype](#textdatatype)`?`

## enum.attr.img.data-media-type

One of the following:

* `"image/png"`
* `"image/jpeg"`
* `"application/postscript"`
* `"image/jpg"`

## img.attlist

This defines a set of attributes:

* `
  data-media-type=`[enum.attr.img.data-media-type](#enumattrimgdata-media-type)`?`
* ` data-longdesc=`[URI.datatype](#uridatatype)`?`
* ` data-print-width=`[Length.datatype](#lengthdatatype)`?`
* ` data-print=`[Boolean.datatype](#booleandatatype)`?`

## enum.attr.strong.data-effect

`"bold"`
## strong.attlist

This defines a set of attributes:

* `
  data-effect=`[enum.attr.strong.data-effect](#enumattrstrongdata-effect)`?`

## enum.attr.em.data-effect

One of the following:

* `"italics"`
* `"smallcaps"`

## em.attlist

This defines a set of attributes:

* ` data-effect=`[enum.attr.em.data-effect](#enumattremdata-effect)`?`

## enum.attr.span.data-type

One of the following:

* `"cite-title"`

## span.attlist

This defines a set of attributes:

* ` data-type=`[enum.attr.span.data-type](#enumattrspandata-type)`?`
* ` data-alt=`[Text.datatype](#textdatatype)`?`

## enum.attr.Heading.data-type

`"title"`
## Heading.attrib

This defines a set of attributes:

* ` data-type=`[enum.attr.Heading.data-type](#enumattrheadingdata-type)

## div.attlist

This defines a set of attributes:

* ` data-label=`[Text.datatype](#textdatatype)`?`
* ` data-has-label="true"?`
* ` data-element-type=`[Text.datatype](#textdatatype)`?`

## div-span-list.attrs

This defines a set of attributes:

* ` data-type="list"`
* ` data-mark-suffix=`[Text.datatype](#textdatatype)`?`
* ` data-item-sep=`[Text.datatype](#textdatatype)`?`

And other things:

1.  One of the following:
    
    * 1.  ` data-list-type=`[`"bulleted"` | `"labeled-item"`]
      2.  `
          data-bullet-style=`[enum.attr.ul.data-bullet-style](#enumattruldata-bullet-style)`?`
    
    * 1.  ` data-list-type="enumerated"`
      2.  `
          data-number-style=`[enum.attr.ol.data-number-style](#enumattroldata-number-style)`?`

2.  [Content.Note.attrs](#contentnoteattrs)

## u

`<u>`

1.  [u.attlist](#uattlist)
2.  [Inline.model](#inlinemodel)

`</u>`

## u.attlist

[Common.attrib](#commonattrib)
## ol.attlist

This defines a set of attributes:

* ` type=?`
* ` compact="compact"?`
* ` start=?`

## section

`<section>`

1.  [section.attlist](#sectionattlist)
2.  [Heading.class](#headingclass)`?`
3.  [Flow.model](#flowmodel)

`</section>`

## section.attlist

This defines a set of attributes:

* ` data-depth=`[Number.datatype](#numberdatatype)
* ` data-label=`[Text.datatype](#textdatatype)`?`
* ` data-element-type=`[Text.datatype](#textdatatype)`?`

And other things:

1.  [Common.attrib](#commonattrib)

## figure

`<figure>`

1.  [figure.attlist](#figureattlist)
2.  [Content.Title.optional](#contenttitleoptional)
3.  [figcaption](#figcaption)`?`
4.  [Flow.model](#flowmodel)

`</figure>`

## figure.attlist

This defines a set of attributes:

* ` data-label=`[Text.datatype](#textdatatype)`?`
* ` data-orient=`[`"vertical"` | `"horizontal"`]`?`

And other things:

1.  [Common.attrib](#commonattrib)

## figcaption

`<figcaption>`

1.  [figcaption.attlist](#figcaptionattlist)
2.  [Content.InlineTitle](#contentinlinetitle)`?`
3.  [Flow.model](#flowmodel)

`</figcaption>`

## figcaption.attlist

[id.attrib](#idattrib)
## cnx-pi

`<cnx-pi>`

1.  [cnx-pi.attlist](#cnx-piattlist)
2.  *cnx-pi.datatype*

`</cnx-pi>`

## cnx-pi.attlist

This defines a set of attributes:

* ` data-type=`[`"cnx.eoc"` | *Text.datatype*]

