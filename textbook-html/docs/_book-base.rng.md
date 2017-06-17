# Structure.Book.Head.attlist

This defines a set of attributes:

* ` itemscope="itemscope"`
* ` itemtype="http://schema.org/Book"`

# Structure.Book.Body

`<body itemscope="itemscope" itemtype="http://schema.org/Book">`

1.  [body.attlist](#bodyattlist)
2.  [Structure.Book.Metadata](#structurebookmetadata)
3.  [Structure.Book.ToC](#structurebooktoc)
4.  `(`
    One of the following:
    
    * [Structure.Chapter](#structurechapter)
    * [Structure.Page](#structurepage)
    
    `)+`

`</body>`

# Structure.Page

`<div data-type="page">`

1.  [class.attrib](#classattrib)
2.  [id.attrib.required](#idattribrequired)
3.  [Structure.PageMetadata](#structurepagemetadata)
4.  [Structure.Page.Title](#structurepagetitle)
5.  [Structure.Page.Abstract](#structurepageabstract)`?`
6.  [Flow.model](#flowmodel)`*`
7.  [Content.Glossary](#contentglossary)`?`
8.  [Content.FootnoteRefs](#contentfootnoterefs)`?`

`</div>`

# Structure.Chapter

`<div data-type="chapter">`

1.  [Structure.ChapterMetadata](#structurechaptermetadata)
2.  `<h1 data-type="document-title">`[Inline.model](#inlinemodel)`</h1>`
3.  [Structure.Page](#structurepage)`+`

`</div>`

# Structure.Page.Title

`<div data-type="document-title">`

1.  [id.attrib](#idattrib)
2.  [Inline.model](#inlinemodel)

`</div>`

# Structure.Page.Abstract

`<div data-type="abstract">`

1.  [id.attrib](#idattrib)
2.  [Flow.model](#flowmodel)

`</div>`

# Structure.PageMetadata

`<div data-type="metadata">`

1.  [Structure.Metadata.Title](#structuremetadatatitle)
2.  [Structure.Metadata.Uri](#structuremetadatauri)
3.  [Structure.Metadata.ShortId](#structuremetadatashortid)
4.  [Structure.Metadata.Authors](#structuremetadataauthors)
5.  [Structure.Metadata.Publishers](#structuremetadatapublishers)
6.  [Structure.Metadata.Permissions](#structuremetadatapermissions)
7.  [Structure.Metadata.Description](#structuremetadatadescription)
8.  [Structure.Metadata.Keywords](#structuremetadatakeywords)
9.  [Structure.Metadata.Subjects](#structuremetadatasubjects)`?`
10. [Structure.Metadata.Resources](#structuremetadataresources)`?`

`</div>`

# Structure.Metadata.Title

`<h1 data-type="document-title"
itemprop="name">`[Inline.model](#inlinemodel)`</h1>`
# Structure.Metadata.Uri

`<span data-type="cnx-archive-uri"
data-value=UUID-and-version.datatype/>`
# Structure.Metadata.ShortId

`<span data-type="cnx-archive-shortid" data-value=ShortId.datatype/>`
# Structure.Metadata.Authors

`<div class="authors">`

1.  `(`
    1.  (text...)`?`
    2.  [Structure.Metadata.Authors.Item](#structuremetadataauthorsitem)
    
    `)+`
2.  (text...)`?`

`</div>`

# Structure.Metadata.Authors.Item

`<span data-type="author" itemprop="author" itemscope="itemscope"
itemtype="http://schema.org/Person">`

1.  [id.attrib.required](#idattribrequired)
2.  `<a data-type="cnx-id" href=`[Text.datatype](#textdatatype)`
    itemprop="url">`*Text.datatype*`</a>`

`</span>`

# Structure.Metadata.Publishers

`<div class="publishers">`

1.  `(`
    1.  (text...)`?`
    2.  [Structure.Metadata.Publishers.Item](#structuremetadatapublishersitem)
    
    `)+`
2.  (text...)`?`

`</div>`

# Structure.Metadata.Publishers.Item

`<span data-type="publisher" itemprop="publisher" itemscope="itemscope"
itemtype="http://schema.org/Person">`

1.  [id.attrib.required](#idattribrequired)
2.  `<a data-type="cnx-id" href=`[Text.datatype](#textdatatype)`
    itemprop="url">`*Text.datatype*`</a>`

`</span>`

# Structure.Metadata.Permissions

`<div class="permissions">`

1.  [Structure.Metadata.Copyrights](#structuremetadatacopyrights)`?`
2.  [Structure.Metadata.License](#structuremetadatalicense)

`</div>`

# Structure.Metadata.License

`<p class="license">`(text...)`<a data-type="license" href=URI.datatype
itemprop="dc:license,lrmi:useRightsURL"/></p>`
# Structure.Metadata.Copyrights

`<p
class="copyright">`(text...)[Structure.Metadata.Copyrights.Item](#structuremetadatacopyrightsitem)`+</p>`
# Structure.Metadata.Copyrights.Item

`<span data-type="copyright-holder" itemprop="copyright-holder"
itemscope="itemscope" itemtype="http://schema.org/Person"><a
data-type="cnx-id" href=`[UserLogin.datatype](#userlogindatatype)`
itemprop="url">`*UserName.datatype*`</a></span>`
# Structure.Book.Metadata

`<div data-type="metadata">`

1.  [Structure.Metadata.Title](#structuremetadatatitle)
2.  [Structure.Metadata.Uri](#structuremetadatauri)
3.  [Structure.Metadata.ShortId](#structuremetadatashortid)
4.  [Structure.Metadata.Authors](#structuremetadataauthors)
5.  [Structure.Metadata.Publishers](#structuremetadatapublishers)
6.  [Structure.Metadata.PrintStyle](#structuremetadataprintstyle)
7.  [Structure.Metadata.TranslucentBinding](#structuremetadatatranslucentbinding)`?`
8.  [Structure.Metadata.Permissions](#structuremetadatapermissions)
9.  [Structure.Metadata.Description](#structuremetadatadescription)
10. [Structure.Metadata.Subjects](#structuremetadatasubjects)

`</div>`

# Structure.Metadata.PrintStyle

`<div class="print-style">`(text...)`<span
data-type="print-style">`*TODO.enum.datatype*`</span></div>`
# Structure.ChapterMetadata

`<div data-type="metadata">`

1.  [Structure.Metadata.Title](#structuremetadatatitle)
2.  [Structure.Metadata.TranslucentBinding](#structuremetadatatranslucentbinding)
3.  [Structure.Metadata.Permissions](#structuremetadatapermissions)

`</div>`

# Structure.Metadata.TranslucentBinding

`<span data-type="binding" data-value="translucent"/>`
# Structure.Metadata.Description

`<div class="description" data-type="description"
itemprop="description">`[Flow.model](#flowmodel)`+</div>`
# Structure.Metadata.Keywords

`(<div data-type="keyword" itemprop="keywords"/>)*`
# Structure.Metadata.Subjects

`(<div data-type="subject"
itemprop="about">`*Subject.datatype*`</div>)*`
# Structure.Metadata.Resources

`<div data-type="resources" style="display:
none">(<ul>`[Structure.Metadata.Resources.Item](#structuremetadataresourcesitem)`+</ul>)?</div>`
# Structure.Metadata.Resources.Item

`<li><a href=`[Sha.datatype](#shadatatype)`>`*Sha.datatype*`</a></li>`
# Structure.Book.ToC

`<nav id="toc">`
`<ol>`

1.  [Structure.Book.ToC.LeafItem](#structurebooktocleafitem)`*`
2.  [Structure.Book.ToC.InternalItem](#structurebooktocinternalitem)`+`
3.  [Structure.Book.ToC.LeafItem](#structurebooktocleafitem)`*`

`</ol>`

`</nav>`
# Structure.Book.ToC.LeafItem

`<li cnx-archive-shortid=`[ShortId.datatype](#shortiddatatype)`
cnx-archive-uri=`[UUID-and-version.datatype](#uuid-and-versiondatatype)`><a
href=URI.datatype/></li>`
# Structure.Book.ToC.InternalItem

`<li>`

1.  `<span/>`
2.  `<ol>(`
    One of the following:
    
    * [Structure.Book.ToC.InternalItem](#structurebooktocinternalitem)
    * [Structure.Book.ToC.LeafItem](#structurebooktocleafitem)
    
    `)+</ol>`

`</li>`

# enum.attr.meta.itemprop

One of the following:

* `"inLanguage"`
* `"accessibilityFeature"`
* `"dateCreated"`
* `"dateModified"`

# enum.attr.meta.data-type

`"language"`
# meta.attlist

This element extends an existing defition

One of the following:

* 1.  ` itemprop="inLanguage"`
  2.  ` data-type="language"`

* ` itemprop=`[`"accessibilityFeature"` | `"dateCreated"` |
  `"dateModified"`]

