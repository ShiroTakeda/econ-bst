<!--
Author:			Shiro Takeda
First-written:  <2008/11/18>
-->

Changelogs for econ.bst
==============================

## Ver. 3.3

* 2025-04-26: Added functions `bst.bvolume.pre` and `bst.bvolume.post` to set
  strings related to the volume of a book.
  
* 2025-05-01: Made revisions that completely rewrote the program.



## Ver. 3.2

* 2023-10-27: Added the new style `econ-te.bst`, which is the style for
  "Theoretical Economics".
  
* 2023-10-27: In econ-sample.tex, I added `pagebackref` option to hyperref
  package which realizes page back reference.
  
* 2023-10-28: Changed the default value of `bst.mthesis` and `bst.phdthesis`.


## Ver. 3.1.1 

* 2021-12-29: Changed the license (lppl 1.3 -> lppl 1.3c).

* 2021-12-28: Fixed minor bugs.

* 2021-05-25: Changed line ending of all text files to LF only.


## Ver. 3.1

* 2021-05-23: Fixed a bug in label for sorting.

* 2021-05-23: Added sample bibliography items with sortname field.

* 2021-05-23: Suported sortname field. If you add sortname field to a
  bibliography entry, the value of sortname field is used for sorting instead of
  author or editor. For the details, see ``sorting'' section in
  econ-example.pdf.


## Ver. 3.0

* 2020-12-29: bst files in the customization folder are updated.

* 2020-06-23: In the new econ.bst, if the number of authors is greater than N1,
  only the first N2 authors' names are displayed in the reference part (and
  other authors' names are omitted by "et el.").
  
  N1 is determined by `bst.max.author.num` (the default value = 8).
  N2 is determined by `bst.max.author.num.displayed` (the default value = 3).
  
  See econ-example.pdf or econ-many-authors.pdf in the customization folder.


## Ver. 2.9

* 2020-03-26: Fixed the bug related to book editors.


## Ver. 2.8

* 2020-03-03: Changed the directory structure.


## Ver 2.7

* 2020-02-27: Modified the document files.

* 2019-10-16: Modified the default style of econ.bst. The new default style is
  simpler than the old one.

* 2019-10-16: Set the roman font to font for URL (the default font for URL is
  type writer font).  This is the change made to TeX file (not to bst file).

* 2019-10-15: Removed "Time-Stamp" lines from all bst files.

* 2019-10-14: In the previous version of econ.bst, econ.bst cannot handle DOI
  field with TeX control sequences such as underscore. The new econ.bst can
  handle DOI field with TeX control sequences.

* 2019-10-01: Modified `customization/README.md`.

* 2019-09-26: Supported the abbreviated journal names for `econ-jpe.bst` because
  JPE (Journal of Political Economy) uses abbreviated journal names.

* 2019-09-21: Changed the default value for `bst.techrep`.


## Ver 2.6.1

* Changed `format.tr.number`.

* Added the new style `econ-abbr.bst`. In this style, we use abbreviated names
  for journal name such as "Am. Econ. Rev." for "American Economics Review".
  The list of abbreviated names is provided in "journal_name.xlsx".

  To use abbreviated journal name, we have to hardcode the list of all
  abbreviated journal names in the bst file. It makes the bst file quite
  long. So this feature is not provided in the standard `econ.bst` and provided
  only in `econ-abbr.bst` (and `econ-jet.bst`).


## Ver 2.6

* Added the new style `econ-aea.bst` and removed `econ-aer.bst`. `econ-aea.bst`
  is the style for journals of AEA (American Economic Association) such as AER,
  JEL, and AEJ.

* Added the new function `bst.max.author.num`. If the number of authors exceeds
  12, the authors after the 2nd author are abbriviated by "et al.".


## Ver 2.5.1

* Added URL and DOI to techreport.

* Changed the default setting of `bst.url.doi` to `#2` (this means that only DOI
  is displayed if both DOI and URL fields have the values).


## Ver. 2.5

* Changed the license of `econ.bst` to the LaTeX Project Public License.


## Ver. 2.4

* Added the function to implement certificated random author ordering propsed by
  the following article.

  Ray, Debraj ⓡ Arthur Robson (2018) "Certiﬁed Random: A New Order for
  Coauthorship," American Economic Review, Vol. 108, No. 2, pp. 489–520, URL:
  http://www.aeaweb.org/articles?id=10.1257/aer.20161492, DOI:
  http://dx.doi.org/10.1257/aer.20161492.
  
  For this, the following functions are added: `bst.use.nameorder`,
  `bst.and.nameorder`, `bst.cite.and.nameorder`, `bst.and.others.nameorder`.
  
  For the details, see the section "Certified random order" in econ-example.pdf.
  
* Changed the default value of `bst.doi.pre`.
    

## Ver. 2.3

* Changed the default setting of `bst.hide.number`.

* Modified the style for Ph.D. thesis (the title of Ph.D. thesis is treated as
  book title).
  
* Modified the style for editors to be similar to the style for authors. Now,
  the setting of `bst.author.name` is applied to editors.


## Ver. 2.2 (2017-08-19)

* Slightly changed the definition of `format.url`, `bst.url.pre` and
  `bst.url.post`.

* Changed `\it` command to `\textit` command.

* Added the function `bst.url.doi` which determines the way for displaying URL
  and DOI fields when both fields exist. You can choose three values for
  `bst.url.doi`.
  
  + `#0` -> Both fields are displayed
  + `#1` -> Only URL field is displayed
  + `#2` -> Only DOI field is displayed


## Ver. 2.1 (2013-07-09)

* URL field: In the new econ.bst, URL field can be displayed. If you set
  non-zero to `bst.show.url`, url field is displayed before note field (this is
  the default behavior). If you set zero to `bst.show.url`, url field is
  suppressed.

* Added the new function `bst.url.pre` and `bst.url.post`. These functions
  specify the strings before and after url field.

* access field: Added the new function `bst.access.pre` and
  `bst.access.post`. These functions specify the strings before and after access
  field. Note that access field is specific to econ.bst and not inherent in the
  standard bib file. The value of access field is used for accessed date for
  URL. For example, suppose that there are the following two settings in the bib
  file

        url          = {http://shirotakeda.org/en/tex/econ-bst.html},
        access       = {4th July, 2013}

  In the default econ.bst, these settings generate the reference like

        URL: http://shirotakeda.org/en/tex/econ-bst.html, accessed on 4th July, 2013.
  
* Added the new function `bst.show.doi`. If you set non-zero to `bst.show.doi`,
  DOI field is displayed before note field. If you set zero to `bst.show.doi`,
  DOI field is suppressed (this is the default behavior). Note that DOI field is
  not inherent in the standard bib file. See econ-sample.pdf for an example.

* Added the new function `bst.doi.pre` and `bst.doi.post`. These functions
  specify the strings before and after DOI field.

* Added the new function `bst.post.note`. This function specifies the strings
  after note field.

* Added new type "online". This is the document type for web page. Note that
  this is not inherent in the standard bib file and it does not work for other
  bst files.


## Ver. 2.0.1 (2011-12-05)

* Fixed bugs for sorting entries. In version 2.0, entries of book and
  incollection type are not sometimes sorted in alphabetical order.

* The previous econ.bst always puts `period' before the content of note
  field. The new econ.bst uses `comma' by default (but this depends on user
  customization).

* Added new function `bst.hide.title`. If you set non-zero to bst.hide.title,
  title is not displayed. 


## Ver. 2.0 (2011-11-10)

* Added \bysame abbreviation of alternative style.

  Suppose that there are the following three entries:

  Mazda, A., Subaru, B., and Honda, C., (2011) "ABC"
  Mazda, A., Subaru, B., and Honda, C., (2011) "DEF"
  Mazda, A., Subaru, B., and Toyota, D., (2011) "GHI"

  When you set non-zero to `bst.use.bysame` in the previous econ.bst,
  these entries are listed like

  [List 1]
  Mazda, A., Subaru, B., and Honda, C., (2011) "ABC"
  ----, (2011) "DEF"
  Mazda, A., Subaru, B., and Toyota, D., (2011) "GHI"

  That is, the abbreviation of authors by \bysame is only applied to entries
  with exactly the same name.

  In the new econ.bst, you can choose an alternative abbreviation style like

  [List 2]
  Mazda, A., Subaru, B., Honda, C., (2011) "ABC"
  ----, ----, and ----, (2011) "DEF"
  ----, ----, and Toyota, D., (2011) "GHI"

  In the new econ.bst, you can choose three values for `bst.use.bysame`.

  + `#0`: Not use bysame command.
  + `#1`: Use bysame command like List 1 (this is the default value).
  + `#2`: Use bysame command like List 2.

  For the details, see econ-sample.pdf.


* Abolished `bst.year.backward` and added `bst.year.position`.
  Now you can choose the position of year.

  If set to #0, year is always placed right after "author".

  If non-zero, year is placed at the end (before note field) except for aritcle
  type entry.

  In article type entry, the position of year changes according to the following
  rule:
  
  + `#1` -> year is placed at the end.
  + `#2` -> year is placed after journal name in aritcle type entry.
  + `#3` -> year is placed after volume in aritcle type entry.

* Added `bst.year.na.pre` and `bst.year.na.post`.  These functions are
  `bst.year.pre` and `bst.year.post` for non-article type entry. In the new
  econ.bst, `bst.year.pre` and `bst.year.post` are only applied to aritcle type
  entry.

* Added `bst.editor.btitle.order`.

  This determines the order of editor and booktitle in incollection and
  inproceedings entry.

  If `#0`,	editors - booktitle order (the default value).
  If non-zero,	booktitle - editors order.

* Added `bst.address.position`.

  You can choose the order of address and publisher by this function.

  If `#0`,	address -> publisher order (the default value).
  If non-zero,	publisher -> address order.

  
## Ver. 1.3.2 (2011-04-05)

* Fixed a bug in `bst.hide.number`.


## Ver. 1.3.1 (2010-12-17)

* Added the new function `bst.hide.number`.  If you want to hide number filed,
  set non-zero to this function.


## Ver. 1.3 (2010-12-04)

* Fixed a bug in period-comma handling.

* Changed the rule for sorting entries.

  In the previous rule, econ.bst use full author name for primary sorting
  key. For example, suppose that there are references like

  Hatoyama, Fukuda, Abe (2009) "apple"
  Hatoyama, Aso, Fukuda, Abe (2007) "orange."
  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."

  In this case, econ.bst sorts references in the following order.

  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."
  Hatoyama, Aso, Fukuda, Abe (2007) "orange."
  Hatoyama, Fukuda, Abe (2009) "apple."

  In the new rule, econ.bst uses the abbreviated author name instead of the full
  author name. That is, the econ.bst uses 

  Hatoyama et al. (2009) "apple."
  Hatoyama et al. (2007) "orange."
  Hatoyama et al. (2009) "grape."

  for the sorting key. So three articles are sorted in the following order.

  Hatoyama, Aso, Fukuda, Abe (2007) "orange."
  Hatoyama, Fukuda, Abe (2009) "apple."
  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."

* Changed the rule for attaching alphabetical index to year.

  In the previous rule, econ.bst does not attach alphabetical index to year in
  the following two articles.

  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."
  Hatoyama, Fukuda, Abe (2009) "apple."

  This means that two articles have the exactly same abbreated citation form
  "Hatoyama et al.(2009)".

  In the new rule, econ.bst attaches alphabetical index to the above two
  articles like

  Hatoyama, Fukuda, Abe (2009a) "apple."
  Hatoyama, Abe, Fukuda, Koizumi (2009b) "grape."

  So the abbreated citation form for two articles are distinguished like
  Hatoyama et al.(2009a) and  Hatoyama et al.(2009b). 


## Ver. 1.2 (2008-12-22)

* When there are successive periods and commas (for example, ".,", "..", ",,"
  etc.), the second one is removed.  In the previous econ.bst, it is difficult
  to use period and comma as delimiters at the same time because it often causes
  problems such as successive commas and periods.  The new econ.bst removes the
  second period or comma if there are successive periods and commas.

* Added new function `bst.and.others.num`.  Author names in the citation part
  are abbreviated by et al. if the number of authors is greater or equal to
  bst.and.others.num.  


## Ver. 1.1 (2008-11-17)

* Added new functions: `bst.sort.year`, `bst.and.others`, `bst.cite.and` and
  `bst.cite.ands`.

* Corrected typos.

  
## Ver. 1.0 (2007-11-20)

* The initial release.


<!--
--------------------
Local Variables:
fill-column: 80
coding: utf-8
mode: markdown
End:
-->

