%% econ-aea.bst: BibTeX style file for journals of American Economic Association (AEA).
%
% Author: Shiro Takeda
% Maintainer: Shiro Takeda
% Copyright (C) 2001-2025 Shiro Takeda
% First-written:       <2007/07/28>
% Version: 3.3
% Keywords: TeX, BibTeX, bst 
% URL: https://github.com/ShiroTakeda/econ-bst

% It may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%    https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status "maintained".
% 
% The Current Maintainer of this work is Shiro Takeda.

%% Main features of econ-aea.bst

% "econ-aea.bst" is a BibTeX style file for journals of American Economic
% Association such as
% - The American Economic Review
% - Papers and Proceedins
% - Journal of Economic Literature
% - American Economics Journals
% 
% AEA Style Guide is found at the following site:
% https://www.aeaweb.org/journals/aer/submissions/accepted-articles/styleguide

% "econ-aea.bst" is created from "econ.bst" which is distributed from
% https://github.com/ShiroTakeda/econ-bst

% version number
FUNCTION {econ.version} { "3.3" }

% File name
FUNCTION {econ.file} { "econ-aea.bst" }

% Debug mode. Non-zero makes debug mode on.
FUNCTION {econ.debug}
{ #0 }    % Debug mode off (default).
% { #1 }    % Debug mode on.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Explanation of terms used in this program

%% [Entry]
%% An entry is a single document in the reference. The "entry type" refers to
%% the type of document, such as an article or a book.

%% [Field]
%% Field is the title, author, year, etc. specified in an entry.

%% [Citation keyword]
%% The "citation keyword" is a set of characters specified in each entry. This
%% is the argument of the "\cite" command.


ENTRY
  %%% Declaration of field
  { access address author booktitle chapter doi edition editor howpublished
    institution journal key month note number organization pages publisher
    school series title type url volume year
  % Fields specific to econ.bst
    order absorder nameorder sortname
  }

  % Definition of entry variable.  The entry variable is a variable which has
  % different values according to different entries.
  %% Integer entry variable:
  { order.cited }

  %% String entry variable
  { label cyear flabel alabel extra.label sort.label sort.label.abb
    extra.label.bysame nameorder.temp jname }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%      Functions for customization:
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use \bysame or not.
%
% If set to #0, \bysame is not used.
% If set to #1, \bysame is used 
% If set to #2, \bysame is used (alternative abbreviation style).
%
% Note that integer number is expressed as # + integer in bst file.
% \bysame is the function that abbreviates succession of the same authors' name by ---.
%
% See econ-sample.pdf for details.
% 
FUNCTION {bst.use.bysame}
{ #0 }    % Not use \bysame
% { #1 }    % -> Use \bysame (default)
% { #2 }    % -> Use \bysame of alternative style.

% The definition of \bysame command.
%
FUNCTION {bst.bysame.definition}
{ "\hskip.3em \leavevmode\rule[.5ex]{3em}{.3pt}\hskip0.5em" } % (default)
% { "\leavevmode\hbox to\leftmargin{\hrulefill\,\,}" } % If you set #2 to bst.use.bysame, use this.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The order of fist and last name.
%
FUNCTION {bst.author.name}
{ #0 }    % (default)
% { #1 }
% { #2 }

% Case of #0: First author -> last-first, other authors -> first-last. 
% Fujita, Masahisa, Paul R. Krugman, and Anthony J. Venables. 

% Case of #1: All authors -> last-first
% Fujita, Masahisa, Krugman, Paul R., and Venables, Anthony J.

% Case of #2: All authors -> first-last
% Masahisa Fujita, Paul R. Krugman, and Anthony J. Venables.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abbreviate first name of authors (editors):
%
FUNCTION {bst.first.name.initial}
{ #0 }    % #0 -> full letters (default).
% { #1 }    % Non-zero -> initial letter only.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Decapitalize of strings in title field.
%
FUNCTION {bst.title.lower.case}
{ #0 }    % If #0, not decapitalize title (default).
% { #1 }    % If non-#0, decapitalize title

% Hide title filed.
%
FUNCTION {bst.hide.title}
{ #0 }    % #0 -> Title field is displayed (default)
% { #1 }    % Non-zer -> Title field is hidden 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hide month.
%
FUNCTION {bst.hide.month}
{ #0 }    % #0 -> show month field (default).
% { #1 }    % non-#0 -> hide month field.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Attach number index like plain.bst.
%
FUNCTION {bst.use.number.index}
{ #0 }    % Not use number index (default).
% { #1 }    % Non-#0 -> Use number index

% The string before number index:
%
FUNCTION {bst.number.index.pre}
{ "[" }    % (default)

% The string after number index.  Adjustment is recommended.
%
FUNCTION {bst.number.index.post}
{ "]\hskip1.0em " }    % (default)

% Maximum digit of number index:
% If the number of reference items >= 100, set 3 to this function.
% If the number of reference items < 100, set 2 to this function.
% If the number of reference items < 10, set 1 to this function.
%
FUNCTION {bst.number.index.digit}
{ "2" }    % (default)
% { "3" }

% The functions below are used to adjust space and postion.  If you use fonts
% other than computer modern fonts, you had better make adjustments.
%
% Setting for bst.number.index.digit = 1:
FUNCTION {bst.number.index.bibhang.one}
{ "2.05em" }    % (default)
% Setting for bst.number.index.digit = 2:
FUNCTION {bst.number.index.bibhang.ten}
{ "2.55em" }    % (default)
% Setting for bst.number.index.digit = 3:
FUNCTION {bst.number.index.bibhang.hund}
{ "3.05em" }    % (default).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Position of "year":
%
% You can choose the position of year by this function.
%
% If set to #0, year is placed right after "author".
% If set to non-zero, year is placed at the end (before note field) except for
% aritcle type entry. 
%
% In article type entry, the position of year changes according to the
% following rule:
% 
% #1 -> year is placed at the end.
% #2 -> year is placed after journal name in aritcle type entry.
% #3 -> year is placed after volume in aritcle type entry.
%
FUNCTION {bst.year.position}
{ #0 }    % (default).
% { #1 }    % Last place before note.
% { #2 }    % After journal name for aticle type entry.
% { #3 }    % After volume for aticle type entry.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% If 0, references are sorted by old documents -> recent documents.  If
% non-zero, reverse order.
FUNCTION {bst.reverse.year}
{ #0 }    % Normal order (old -> recent) (default).
% { #1 }    % inverse order (recent -> old)

% If non-zero, sort references by using year field as the primary key
% (chronological sorting).
FUNCTION {bst.sort.year}
{ #0 }    % Normal case: year is used as the sorting key next to author (default).
% { #1 }    % year is used as the primary sorting key.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% If non-zero, references are listed in citation order.
%
FUNCTION {bst.no.sort}
{ #0 }    % (default)
% { #1 }    % listed in citation order.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Non-zero -> sort references by entry type (article, book, incollection etc.)
%
FUNCTION {bst.sort.entry.type}
{ #0 }    % #0 -> Normal (not sort references by entry type) (default).
% { #1 }    % Non-zero -> sort references by entry type.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 0 -> use absorder field to sort items.  Otherwise, ignore absorder field.
%
FUNCTION {bst.notuse.absorder.field}
{ #0 }    % #0 -> Use absorder (default).
% { #1 }    % Non-#0 -> Not use absorder.
%
% Order of priority to sort items
% 
% absorder -> author -> year -> order -> month -> title
%
% wehre absorder and order fields are specific to econ.bst.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 0 -> use order field to sort items.  Otherwise, ignore order field.
% Note: order field is specific to econ.bst.
FUNCTION {bst.notuse.order.field}
{ #0 }    % #0 -> Use order field (default).
% { #1 }    % Non-#0 -> not use order field.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     and

%%% String used to separate author names in references.
%
% String replaced with _ in "Mr. A _ Mr. B "
%
FUNCTION {bst.and}
{ ", and " }
% { " and " }    % (default)

%%% String used to separate author names in references (more than two authors).
%
% String replaced with _ in "Mr. A, Mr. B _ Mr. C"
%
FUNCTION {bst.ands}
{ ", and " }    % (default)

%%% String used to separate author names in citation part.
%
% String replaced with _ in "Mr. A _ Mr. B "
%
FUNCTION {bst.cite.and}
{ " and " }    % (default)

%%% String used to separate author names in citation part (more than two authors).
%
% String replaced with _ in "Mr. A, Mr. B _ Mr. C"
%
FUNCTION {bst.cite.ands}
{ ", and " }
% { " and " }    % (default)

%%% If you want to use random author order for some bibliography entries, set
% non-zero to this function.
% 
FUNCTION {bst.use.nameorder}
{ #1 }	% Use random order (default)
% { #0 }	% Not use random order

%%% String used to separate author names in references for the entry of random
% author order.
%
FUNCTION {bst.and.nameorder}
{ " \textcircled{r} " }    % (default)

%%% String used to separate author names in citation part for the entry of
% random author order
%
FUNCTION {bst.cite.and.nameorder}
{ " \textcircled{r} " }    % (default)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Author names in the citation part are abbreviated by et al. if the number of
% authors is greater or equal to bst.and.others.num.
FUNCTION {bst.and.others.num}
{ #3 }    % If the number of authors is greater or equal to three (default).

% If the number of authors is greater than N1, only the first N2 authors are
% displayed in the reference part (and other authors' names are omitted by "et
% al".
% 
% The following function determines the value of N1.
FUNCTION {bst.max.author.num}
{ #8 }   % (default).

% The following function determines the value of N2.
FUNCTION {bst.max.author.num.display}
{ #3 }    % (default).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Strings used when abbreviating multiple-authors in citation part.
FUNCTION {bst.and.others}
{ " et~al." }    % (default)

% Strings used when abbreviating multiple-authors in citation part for entries
% with random author order.
FUNCTION {bst.and.others.nameorder}
{ " \textcircled{r}~al." }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       author 

% The string before author:
%
FUNCTION {bst.author.pre}
{ "\textbf{" }
% { "" }    % (default)

% The string after author:
%
FUNCTION {bst.author.post}
{ ".}" }
% { "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       year

% The string before year only for aritcle type entry.
%
FUNCTION {bst.year.pre}
{ ", " }
% { " (" }    % (default)

% The string after year only for aritcle type entry.
%
FUNCTION {bst.year.post}
{ ". " }
% { ") " }    % (default)

% The string after year for non-article type entry (book, incollection etc)
%
FUNCTION {bst.year.na.pre}
{ ", " }
% { " (" }    % (default)

% The string after year for non-article type entry (book, incollection etc)
%
FUNCTION {bst.year.na.post}
{ ". " }
% { ") " }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       title (except for title in book)

% The string before title:
%
FUNCTION {bst.title.pre}
{ "``" }    % (default)

% The string after title:
%
FUNCTION {bst.title.post}
{ ".''" }
% { ",''" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       tile for book:

% The string before book title:
%
FUNCTION {bst.book.pre}
{ " \textit{" }    % (default)

% The string after book title:
%
FUNCTION {bst.book.post}
{ "}." }
% { "}," }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       booktitle

% The string before booktitle:
%
FUNCTION {bst.btitle.pre}
{ " \textit{" }    % (default)

% The string after booktitle:
%
FUNCTION {bst.btitle.post}
{ "}," }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       journal name

% The string before journal name:
%
FUNCTION {bst.journal.pre}
{ " \textit{" }    % (default)

% The string after journal name:
%
FUNCTION {bst.journal.post}
{ "}" }    % (default)

% Use the abbreviated journal name
%
% If set to #0, do not use abbreviated journal name.
% If set to non-#0, use abbreviated journal name.
%
FUNCTION {bst.journal.name.abb}
{ #0 }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       editor notation:

% The string that indicates multiple editors:
%
FUNCTION {bst.editors}
{ " \textbf{eds.}" }
% { " eds. " }    % (default)

% The string that indicates single editor:
%
FUNCTION {bst.editor}
{ " \textbf{ed.}" }
% { " ed. " }    % (default)

% Order of editor and booktitle in incollection and inproceedings entries.
%
% If set to #0: 	editors -> booktitle order
% If set to non-zero:	booktitle -> editors order
%
FUNCTION {bst.editor.btitle.order}
{ #1 }
% { #0 }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       edition

% The string before edition:
%
FUNCTION {bst.edition.pre}
{ ", " }    % (default)

% The string after edition:
%
FUNCTION {bst.edition.post}
{ " edition" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       volume

% The string before volume:
%
FUNCTION {bst.volume.pre}
{ " " }
% { ", " }    % (default)

% The string after volume:
%
FUNCTION {bst.volume.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       volume for book

% The string before volume in book:
%
FUNCTION {bst.bvolume.pre}
{ ", Vol.~" }    % (default)

% The string after volume in book
%
FUNCTION {bst.bvolume.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       number

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hide number.  If non-zero, number is suppressed. 
FUNCTION {bst.hide.number}
{ #0 }    % #0 -> show number field (default)
% { #1 }    % non-#0 -> Hide number field.

% The string before number:
%
FUNCTION {bst.number.pre}
{ " (" }    % (default)

% The string after number:
%
FUNCTION {bst.number.post}
{ "): " }
% { ")" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       in 

% In
%
FUNCTION {bst.in}
{ " In " }
% { " in " }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       page

% The string before page (multiple pages):
%
FUNCTION {bst.pages.pre}
{ " " }
% { ", " }    % (default)

% The string before page:
%
FUNCTION {bst.page.pre}
{ "" }
% { ", " }    % (default)

% The string after page (multiple pages):
%
FUNCTION {bst.pages.post}
{ "" }    % (default)

% The string after page:
%
FUNCTION {bst.page.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       chapter

% The string before chapter:
%
FUNCTION {bst.chapter.pre}
{ ", Chap." }    % (default)

% The string after chapter:
%
FUNCTION {bst.chapter.post}
{ ", " }
% { "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       month

% The string before month:
%
FUNCTION {bst.month.pre}
{ ", " }    % (default)

% The string after month:
%
FUNCTION {bst.month.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       address
% The string before address:
%
FUNCTION {bst.address.pre}
{ ", " }    % (default)

% The string after address:
%
FUNCTION {bst.address.post}
{ "" }    % (default)

% You can choose the order of address and publisher by this function.
%
% If #0,	address -> publisher order (the default value).
% If non-zero,	publisher -> address order.

FUNCTION {bst.address.position}
{ #0 }    % Address is placed before publisher (default)
% { #1 }    % Address is placed after publisher 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       publisher

% The string before publisher:
%
FUNCTION {bst.publisher.pre}
{ ": " }    % (default)

% The string after publisher:
%
FUNCTION {bst.publisher.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       series

% The string before series:
%
FUNCTION {bst.series.pre}
{ ", " }    % (default)

% The string after series:
%
FUNCTION {bst.series.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       organization

% The string before organization:
%
FUNCTION {bst.organization.pre}
{ ", " }    % (default)

% The string after organization:
%
FUNCTION {bst.organization.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       school

% The string before school:
%
FUNCTION {bst.school.pre}
{ ", " }    % (default)

% The string after school:
%
FUNCTION {bst.school.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       institution

% The string before institution:
%
FUNCTION {bst.institution.pre}
{ ", " }    % (default)

% The string after institution:
%
FUNCTION {bst.institution.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       howpublished

% The string before howpublished:
%
FUNCTION {bst.howpublished.pre}
{ " " }    % (default)

% The string after howpublished:
%
FUNCTION {bst.howpublished.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       url

% Show or Hide url.  If non-zero, url is displayed. Otherwise, url is suppressed. 
FUNCTION {bst.show.url}
{ #1 }    % non-#0 -> Show url field (default)
% { #0 }    % #0 -> Not show url field.

% The string before url:
%
FUNCTION {bst.url.pre}
{ ", \urlstyle{tt}\url{" }	% (default)

% The string after url:
%
FUNCTION {bst.url.post}
{ "}" }    % (default)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Access

% This setting is valid only if there are "access" field in bib
% files. The value of access field indicates accessed date for URL.

% The string before access.
FUNCTION {bst.access.pre}
{ ", accessed on " } % (default)

% The string after access.
FUNCTION {bst.access.post}
{ "" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       DOI (digital object identifier)

% This setting is valid only if there are "doi" field in bib files.

% Show or Hide DOI.  If non-zero, DOI is displayed. Otherwise, DOI is suppressed. 
FUNCTION {bst.show.doi}
{ #1 }    % non-#0 -> Show DOI field (default)
% { #0 }    % #0 -> Not show DOI field.

% The string before DOI:
%
FUNCTION {bst.doi.pre}
{ ". \href{https://doi.org/" doi * "}{\urlstyle{tt}\nolinkurl{" * }
% { ", \href{https://doi.org/" doi * "}{\urlstyle{tt}\nolinkurl{" * } % (default)

% The string after DOI:
%
FUNCTION {bst.doi.post}
{ "}}" }	   % (default)

% How to show URL and DOI fields when both fields exist.
%
% #0 -> Both fields are displayed
% #1 -> Only URL field is displayed
% #2 -> Only DOI field is displayed
%
FUNCTION {bst.url.doi}
% { #0 }    % -> Both fields are displayed
% { #1 }    % -> Only URL field is displayed
{ #2 }    % (default) --> Only DOI field is displayed 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Other functions:

% The string before note.
FUNCTION {bst.note.pre}
{ ", " }    % (default)

% The string after note.
FUNCTION {bst.note.post}
{ "" }    % (default)

% The string that represents Technical report:
%
FUNCTION {bst.techrep}
{ ", Technical Report" }    % (default)

% The string that represents master thesis:
%
FUNCTION {bst.mthesis}
{ ", Master's thesis" }    % (default)

% The string that represents phd thesis:
%
FUNCTION {bst.phdthesis}
{ ", Ph.D. dissertation" }    % (default)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%      Functions for customization end here:
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {bst.first}
{ "1st" }

FUNCTION {bst.second}
{ "2nd" }

FUNCTION {bst.third}
{ "3rd" }

FUNCTION {bst.fourth}
{ "4th" }

FUNCTION {bst.fifth}
{ "5th" }

FUNCTION {bst.st}
{ "st" }

FUNCTION {bst.nd}
{ "nd" }

FUNCTION {bst.rd}
{ "rd" }

FUNCTION {bst.th}
{ "th" }

%%%%% memo by Takeda

% "a" 'b := indicates substituting string "a" for variable b.

% Integer number #0, #1,...

%%% Function definition:
%
% FUNCTION {name}
% { 's :=
%
% }
%
% This is the definition of a function named "name".   The function "name" is
% used in the following way 
%
% "foo" name
% "foo" is an argument for the function "name".
%
% About the definition of a function with more than two arguments, see the
% definition of "chop.word".

%%% Declaration of variables:

%% String global variables:
STRINGS { s t tt }
STRINGS { year.num }
STRINGS { preone preten }
STRINGS { last.sort.label next.extra prev.author prev.author.aer this.author }
STRINGS { hang }
STRINGS { item.type }
STRINGS { tempa tempb }

%% Integer global variables:
INTEGERS { nameptr namesleft numnames name.num numtrunc }
INTEGERS { multiresult }
INTEGERS { index }
INTEGERS { len }
INTEGERS { last.extra.num }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
INTEGERS { last.period.comma }
INTEGERS { len1.aer len2.aer i.aer }

% output.state
% -> This is a variable that holds which location in a single bibliography entry.
% -> before.all or mid.sentence

%%% Definition of functions:
FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

%%% Initialize variables:
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

%%% Remove comma and add period:
%
FUNCTION {add.period.x}
{ duplicate$ 't :=
  t #-1 #1 substring$ "," =
    { #-2 global.max$ substring$ "." * }
    { t #-1 #2 substring$ ". " =
        { #-3 global.max$ substring$ "." * }
        { t #-1 #2 substring$ ", " =
            { #-3 global.max$ substring$ "." * }
            { t #-1 #2 substring$ ",'" =
                { #-3 global.max$ substring$ ".'" * }
                { t #-1 #2 substring$ ".'" =
                    { #-3 global.max$ substring$ ".'" * }
                    { t #-1 #2 substring$ ".~" =
                        { #-3 global.max$ substring$ ".~" * }
                        { t #-1 #2 substring$ ",~" =
                            { #-3 global.max$ substring$ ".~" * }
                            { t #-1 #3 substring$ ",''" =
                                { #-4 global.max$ substring$ ".''" * }
                                { t #-1 #3 substring$ ".''" =
                                    { #-4 global.max$ substring$ ".''" * }
                                    { t #-1 #2 substring$ ": " =
                                        { #-3 global.max$ substring$ "." * }
                                        { add.period$ }
                                      if$
                                    }
                                  if$
                                }
                              if$
                            }
                          if$
                        }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

%%% If the last character is period or comma, set non-zero to
%%% last.period.comma.
FUNCTION {last.period.comma.p}
{ duplicate$ 't :=
  t #-1 #1 substring$ "." = 
  t #-1 #1 substring$ "," = or
  t #-1 #2 substring$ ". " = or
  t #-1 #2 substring$ ", " = or
  t #-1 #2 substring$ ".'" = or
  t #-1 #2 substring$ ",'" = or
  t #-1 #3 substring$ ".''" = or
  t #-1 #3 substring$ ",''" = or
  t #-1 #2 substring$ ".~" = or
  t #-1 #2 substring$ ",~" = or
  t #-1 #1 substring$ ":" = or 
  t #-1 #2 substring$ ": " = or
  t #-1 #2 substring$ ".}" = or
  t #-1 #2 substring$ ",}" = or
    { #1 'last.period.comma := }
    { #0 'last.period.comma := }
  if$
}

%%% remove comma
% A function that removes the period or comma at the beginning of a field.
FUNCTION {remove.pre.comma}
{ 's :=
   s #1 #1 substring$ "," = 
       { s #2 global.max$ substring$ }
       { s #1 #1 substring$ "." = 
          { s #2 global.max$ substring$ }
         { s #1 #1 substring$ ":" = 
             { s #2 global.max$ substring$ }
          's
         if$
       }
      if$
    }
  if$
}

FUNCTION {output.field}
{ 's :=
  output.state mid.sentence =
    % mid.sentence
    { last.period.comma.p % Check whether the last of the previous field is
			  % period or comma -> Assign to the variable
			  % last.period.comma.
      write$ }		  % Write the contents of the previous field.
    % not mid.sentence
    { output.state before.all =
        % before.all
        'write$ % Write the contents of the previous field.
	% not before.all
        'skip$ % This line is never executed.
      if$
      mid.sentence 'output.state :=
    }
  if$
  last.period.comma #0 =
    % The last character in the field before the one is not a period or comma.
    { s }
    % The last character in the field before the one is a period or comma.
    { s remove.pre.comma }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Format in bbl file:

% \harvarditem[Brezis et~al.]{Brezis, Krugman and
%   Tsiddon}{1993}{brezis93:_leapf_inter_compet}
% Brezis, Elise~S., Paul~R. Krugman, and Daniel Tsiddon  (1993) ``Leapfrogging in
%   International Competition: A Theory of Cycles in National Technological
%   Leadership.'', {\em American Economic Review.}, Vol.~83. No.~5. pp.
%   1211--1219.

% \harvarditem[abbreviated citation]{full citation}{year}{keyword} ...

%%% Add period and newline.
FUNCTION {fin.entry}
{ add.period.x
  write$
  newline$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

%%% booktitle
FUNCTION {format.btitle}
{ booktitle empty$
    { "" }
    { bst.btitle.pre booktitle * bst.btitle.post * }
  if$
}

FUNCTION {journal.name.sub}
{ 't :=
  t #1 #4 substring$ "The " =
    % Use #30 to handle with the long journal name.
    { t #5 #30 substring$ 't := }
    'skip$
  if$
  t
}

FUNCTION {format.journal.name.abb}
{ journal 's :=
  journal 'jname :=
  s journal.name.sub 's :=
  bst.journal.name.abb #0 =
    'skip$
    { 
       s "Academic Management Review" =
        { "Acad. Manage. J." 'jname := }
        'skip$
      if$
    }
  if$
  jname
}

%%% Remove commas in the cases like "?." and "?,".
FUNCTION {remove.irrelevant.period.comma}
{ 's :=
  s empty$
    { "" }
    { s #-1 #3 substring$ "?,'" =
      s #-1 #3 substring$ "?.'" = or
        { s #-3 global.max$ substring$ "'" * }
        { s #-1 #4 substring$ "?,''" =
          s #-1 #4 substring$ "?.''" = or
            { s #-4 global.max$ substring$ "''" * }
            { s #-1 #2 substring$ "?," =
              s #-1 #2 substring$ "?." = or
                { s #-2 global.max$ substring$ "" * }
                { s #-1 #3 substring$ "?,~" =
                  s #-1 #3 substring$ "?.~" = or
                    { s #-4 global.max$ substring$ "?~" * }
                    { s #-1 #3 substring$ ".}." =
		        { s #-3 global.max$ substring$ "}" * }
                        's
		      if$
		    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

%%% journal
FUNCTION {format.output.journal}
{ journal empty$
    'skip$
    { bst.journal.pre format.journal.name.abb * bst.journal.post * 'jname :=
      jname remove.irrelevant.period.comma output.field }
  if$
}

FUNCTION {format.output.book}
{ title empty$
    { "there's no title in " cite$ * warning$ }
    { bst.hide.title #0 = not
        'skip$
        { bst.book.pre title * bst.book.post * output.field }
      if$
    }
  if$
}

FUNCTION {format.output.url}
    { type$ "online" = bst.show.url or
        { bst.url.pre url * bst.url.post *
          access empty$
         { "" * output.field }
         { bst.access.pre * access * bst.access.post * output.field }
          if$
        }
    'skip$
      if$
    }

FUNCTION {format.output.doi}
{ bst.show.doi
    { bst.doi.pre doi * bst.doi.post * output.field }
    'skip$
  if$
}

FUNCTION {format.output.url.doi}
{ url empty$
    { doi empty$
        'skip$
        { format.output.doi }
      if$
    }
    { doi empty$
        { format.output.url }
        { bst.url.doi #0 =
            { format.output.url 
	      format.output.doi  }
            { bst.url.doi #1 =
                { format.output.url } 
                { format.output.doi }
              if$
            }
          if$
        }
      if$
    }
  if$
}

%%% and others
FUNCTION {bst.and.others.output}
{ nameorder.temp "random" =
  bst.use.nameorder #0 = not and
    { bst.and.others.nameorder }
    { bst.and.others }
  if$
}

%%% author and editor

% nameptr: author number
% numnames: the total number of authors
% namesleft: the number of authors which have not been processed.
% numtrunc: bst.max.author.num.display

%%% name
FUNCTION {format.names}
{ 's :=
  % insert 1 to nameptr.
  #1 'nameptr :=
  % Set the number of authors to numnames.
  s num.names$ 'numnames :=
  numnames 'namesleft :=

  numnames bst.max.author.num >
    % If numnames > bst.max.author.num
    { bst.max.author.num.display 'numtrunc := }
    { #0 'numtrunc := }
  if$
  % Repeat if namesleft > 0 ---- Repeat from here
  { namesleft #0 > }
  {
    % Block A starts
    nameptr #1 =
      % A-1: If the author is the 1st author 
      { bst.author.name #0 =
        bst.author.name #1 = or
           { bst.first.name.initial #0 = 
              { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
              { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
           if$
           }
           { bst.first.name.initial #0 = 
              { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
              { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
             if$
           }
        if$
      }
      % A-2: If the author is the second or later authors (not the 1st author).
      { bst.author.name #0 =
        bst.author.name #2 =
        or
           { bst.first.name.initial #0 = 
              { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
              { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
             if$
           }
           { bst.first.name.initial #0 = 
                { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
                { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
             if$
           }
        if$
      }
    if$
    % Block A ends
    
    % Block B starts
    nameptr #1 >
      % B-1: If the author is the second or later authors
      { nameptr #1 - numtrunc =
          % If nameptr - 1 = numtrunc
	  { #1 'namesleft := 
	    "others" 't := }
	  'skip$
	if$
        % If numnames <= bst.max.author.num
        nameorder.temp "random" =
        bst.use.nameorder #0 = not and
          % If random ordering is used
          { bst.and.nameorder * t * }
          % If random ordering is not used
          { namesleft #1 >
              % If more than one authors are left
              { ", " * t * }
              % If the author is the last author.
              { t "others" =
                  % If the name is "others"
                  { bst.and.others.output * }
                  % If the name is not "others"
                  { numnames #2 =
                      % If the entry have two authors
                      { bst.and * t * }
                      % If the entry have more than two authors
                      { bst.ands * t * }
                    if$
                  }
                if$
              }
            if$
          }
        if$
      }
      % When the author is the first author.
      't
    if$
    % Block B ends
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
  }
  while$                        % ---- Repeat until here
}

%%% name
FUNCTION {format.names.editors}
{ 's :=
  % insert 1 to nameptr.
  #1 'nameptr :=
  % Set the number of authors to numnames.
  s num.names$ 'numnames :=
  numnames 'namesleft :=

  numnames bst.max.author.num >
    % If numnames > bst.max.author.num
    { bst.max.author.num.display 'numtrunc := }
    { #0 'numtrunc := }
  if$
  % Repeat if namesleft > 0 ---- Repeat from here
  { namesleft #0 > }
  {
    % Block A starts
    bst.first.name.initial #0 = 
      { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
      { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
    if$
    % Block A ends
    % Block B starts
    nameptr #1 >
      % B-1: If the author is the second or later authors
      {	nameptr #1 - numtrunc =
          % If nameptr - 1 = numtrunc
	  { #1 'namesleft := 
	    "others" 't := }
	  'skip$
	if$
        namesleft #1 >
          % If more than one authors are left
          { ", " * t * }
          % If the author is the last author.
          { t "others" =
              % If the name is "others"
              { bst.and.others.output * }
              % If the name is not "others"
              { numnames #2 =
                  % If the entry have two authors
                  { bst.and * t * }
                  % If the entry have more than two authors
                  { bst.ands * t * }
                if$
              }
            if$
          }
        if$
      }
      % When the author is the first author.
      't
    if$
    % Block B ends
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
  }
  while$                        % ---- Repeat until here
}

% remove successive periods (commas) from author
FUNCTION {remove.ss.period.auth}
{ 's :=
  s format.names 'tempa :=
  bst.author.post 'tempb :=
  tempb #1 #1 substring$ "}" =
    { tempa tempb * }
    { tempa #-1 #1 substring$ tempb #1 #1 substring$ = 
        { tempa tempb #2 global.max$ substring$ * }
        { tempa tempb * }
      if$
    }
  if$
}

% <prev name list> <new name list> compare.names <modified name list>
FUNCTION {compare.names.aer}
{ 's :=
  'tempa :=

%   "current.author = " s * "\\" * write$ newline$
%   "prev.author = " tempa * "\\" * write$ newline$

  tempa num.names$ 'len1.aer :=  % len1 = the number of previous authors
  s num.names$ 'len2.aer :=         % len2 = the number of current authors

% len1.aer := min(len1.aer,len2.aer)
% len1 -> min{ the number of previous authors, the number of current authors }
  len1.aer len2.aer >
    { len2.aer 'len1.aer := }
    { }
  if$

% start with an empty string, then while the components are the same
% add "\bysame"
  ""
  #1 'i.aer :=

  { i.aer len1.aer > not }
    { tempa i.aer "{ff }{vv }{ll}{ jj}" format.name$
      s i.aer "{ff }{vv }{ll}{ jj}" format.name$
      =
        { #1 i.aer <
            { " and " * }
            { }
          if$
          "\bysame{}" *
          i.aer #1 + 'i.aer := } 
        { #-1 'len1.aer := }
      if$
    }
  while$

% add the rest of the second string
  { i.aer len2.aer > not }
    { #1 i.aer <
        { " and " * }
        { }
      if$
      s i.aer "{ff }{vv }{ll}{ jj}" format.name$ *
      i.aer #1 + 'i.aer :=
    }
  while$
}

%%% author
FUNCTION {format.output.authors}
{ author empty$
    'skip$
    { bst.use.bysame #2 =
        { prev.author.aer author compare.names.aer 's :=
          author 'prev.author.aer := }
        { author 's := }
      if$
      extra.label.bysame "bysame" =
        { "\bysame " }
        { bst.author.pre s remove.ss.period.auth * }
      if$
      output.field
    }
  if$
}

%%% editor
FUNCTION {format.output.editors}
{ editor empty$
    'skip$
    { bst.use.bysame #2 =
        { prev.author.aer editor compare.names.aer 's :=
          editor 'prev.author.aer := }
        { editor 's := }
      if$
      extra.label.bysame "bysame" =
        { "\bysame " }
        { bst.author.pre s remove.ss.period.auth * }
      if$
      s num.names$ #1 >
       { bst.editors * output.field }
       { bst.editor * output.field }
      if$
    }
  if$
}

FUNCTION {format.authors.alt}
{ author empty$
    { "" }
    { extra.label.bysame "bysame" =
        {"\bysame "}
        { bst.author.pre author remove.ss.period.auth * }
      if$
    }
  if$
}

%%% editor
FUNCTION {format.editors.alt}
{ editor empty$
    { "" }
    { extra.label.bysame "bysame" =
        { "\bysame " }
        { bst.author.pre editor remove.ss.period.auth * }
      if$
    }
  if$
}

FUNCTION {format.editors.x}
{ bst.editor.btitle.order #0 =
    { "" }
    { editor num.names$ #1 >
       { " edited by " }    % For econ-aea.bst
       { " edited by " }    % For econ-aea.bst
%            { bst.editors " by " * }
%            { bst.editor  " by " * }
      if$
    }
  if$
  editor format.names.editors *
      bst.editor.btitle.order #0 =
        { editor num.names$ #1 >
           { bst.editors * }
           { bst.editor * }
          if$
        }
    { ", " * }
  if$
}

%%% title
FUNCTION {format.title}
{ bst.title.lower.case #0 =
     { bst.title.pre title * bst.title.post * }
     { bst.title.pre title "t" change.case$ * bst.title.post * }
  if$
}

%%% title
FUNCTION {format.output.title}
{ title empty$
    { "there's no title in " cite$ * warning$ }
    { bst.hide.title #0 = not
        'skip$
        { format.title remove.irrelevant.period.comma output.field }
  if$
}
  if$
}

% Convert "-" to "--" (for pages field)
FUNCTION {n.dashify}
{ 't :=
  ""
  %% while$
  { t empty$ not }
  { t #1 #1 substring$ "-" =
      { t #1 #2 substring$ "--" = not
          { "--" *
            t #2 global.max$ substring$ 't :=
          }
          { { t #1 #1 substring$ "-" = }
            { "-" *
              t #2 global.max$ substring$ 't :=
            }
            while$
          }
        if$
      }
      { t #1 #1 substring$ *
       t #2 global.max$ substring$ 't :=
      }
    if$
  }
  while$
}

%%% year
FUNCTION {format.output.year}
{ year empty$
    { "there's no year in " cite$ * warning$ }
    { type$ "article" =
        { bst.year.pre year * extra.label * bst.year.post * }
        { bst.year.na.pre year * extra.label * bst.year.na.post * }
      if$
      output.field
    }
  if$
}

%%% Attach tie for the string with two or less characters.
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { "" }
  if$
  swap$ * *
}

FUNCTION {tie.or.space.connect.alt}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

%%% page for book
FUNCTION {format.output.book.pages}
{ pages empty$
    'skip$
    { bst.pages.pre pages n.dashify tie.or.space.connect.alt * bst.pages.post *
      output.field }
  if$
}

%%% volume for book
FUNCTION {format.output.bvolume}
{ volume empty$
    'skip$
%     { bst.bvolume.pre volume * bst.bvolume.post *
    { " Volume " volume * "." * % For econ-aea.bst
      series empty$
        'skip$
        %% If there is series field
        { " of " * series * bst.series.post * }
      if$
      output.field
    }
  if$
}

%%% series
FUNCTION {format.output.series}
{ series empty$
    'skip$
    { bst.series.pre series * bst.series.post * output.field }
 if$
}

%%% number and series
FUNCTION {format.output.number.series}
    { number empty$
      bst.hide.number #0 = not or
        % number is empty
        { series empty$
        'skip$
            % series is not empty.
        { format.output.series }
          if$
        }
        % number is not empty$
        { series empty$
        { bst.number.pre number * bst.number.post * output.field }
            % series is not empty.
            { bst.in bst.series.pre * series * bst.series.post *
          bst.number.pre * number * bst.number.post * output.field }
      if$
    }
  if$
}

%%% Number or not.
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      edition

% Convert edition to 1st, 2nd, 3rd, 4th etc
FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bst.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bst.st * }
         { duplicate$ "2" =
             { pop$ bst.nd * }
             { "3" =
                 { bst.rd * }
                 { bst.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

% Convert first, second etc in edition field to 1st, 2nd (from jfm.bst)
FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bst.first }
    { s "second" = s "2" = or
        { bst.second }
        { s "third" = s "3" = or
            { bst.third }
            { s "fourth" = s "4" = or
                { bst.fourth }
                { s "fifth" = s "5" = or
                    { bst.fifth }
                    { s #1 #1 substring$ is.num
                        { s eng.ord }
                        { edition }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

%%% edition
FUNCTION {format.output.edition}
{ edition empty$
    'skip$
    { bst.edition.pre convert.edition "l" change.case$ * bst.edition.post * output.field }
  if$
}

%%% month
FUNCTION {format.output.month}
{ month empty$
  bst.hide.month #0 = not or
    'skip$
    { bst.month.pre month * bst.month.post * output.field }
  if$
}

FUNCTION {format.output.date}
{ month empty$
    { year empty$
        'skip$
        { format.output.year }
      if$
    }
    { year empty$
        { format.output.month }
        { format.output.month
 	 format.output.year }
      if$
    }
  if$ 
}

%%% Is multiple pages like 1-100?
FUNCTION { multi.page.check }
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

%%% pages
FUNCTION {format.pages}
{ pages multi.page.check
    { bst.pages.pre pages n.dashify tie.or.space.connect.alt * bst.pages.post * }
    { bst.page.pre pages tie.or.space.connect.alt * bst.page.post * }
  if$
}

FUNCTION {format.output.pages}
{ pages empty$
    'skip$
    { format.pages output.field }
 if$
}

%%% number
FUNCTION {format.output.number}
{ number empty$
  bst.hide.number #0 = not or
    'skip$
    { bst.number.pre number * bst.number.post * output.field }
  if$
}

%%% volume
FUNCTION {format.output.volume}
{ volume empty$
    'skip$
    { bst.volume.pre volume * bst.volume.post * output.field }
  if$
}

%%% chapter
FUNCTION {format.output.chapter}
{ chapter empty$
    'skip$
    { bst.chapter.pre chapter tie.or.space.connect.alt * bst.chapter.post * output.field }
  if$
}

%%% editor and booktitle
FUNCTION {format.output.in.ed.booktitle}
{ booktitle empty$
    'skip$
    { editor empty$
        { bst.in format.btitle * }
        { bst.editor.btitle.order #0 =
            { bst.in format.editors.x * " " * format.btitle * }
            { bst.in format.btitle * " " * format.editors.x * }
          if$
        }
      if$
      output.field
    }
  if$
}

%%% howpublished
FUNCTION {format.output.howpublished}
{ howpublished empty$
    'skip$
    { bst.howpublished.pre howpublished * bst.howpublished.post * output.field }
  if$
}

%%% address
FUNCTION {format.output.address}
{ address empty$
    'skip$
    { bst.address.pre address * bst.address.post * output.field }
  if$
}

%%% publisher
FUNCTION {format.output.publisher}
{ publisher empty$
    'skip$
    { address empty$ % For econ-aea.bst
	{ ", " publisher * bst.publisher.post * output.field }
	{ bst.publisher.pre publisher * bst.publisher.post * output.field }
      if$
    }
  if$
}

%%% organization
FUNCTION {format.output.organization}
{ organization empty$
    'skip$
    { bst.organization.pre organization * bst.organization.post * output.field }
  if$
}

%% publisher and address
FUNCTION {format.output.publisher.address}
    { bst.address.position #0 = 
    { format.output.address
      format.output.publisher }
    { format.output.publisher
      format.output.address }
  if$
}

%% address, organization, publisher
FUNCTION {format.output.address.organization.publisher}
{ format.output.organization
  bst.address.position #0 = 
    { format.output.address
      format.output.publisher }
    { format.output.publisher
      format.output.address }
  if$
}

%%% misc
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "All relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$ ", " type * }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bst.techrep }
    { ", " type * }
  if$
  number empty$
  bst.hide.number #0 = not or
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

%%% phdthesis
FUNCTION {format.output.phd}
{ bst.phdthesis format.thesis.type output.field }

%%% mastersthesis
FUNCTION {format.output.mthesis}
{ bst.mthesis format.thesis.type output.field }

%%% school
FUNCTION {format.output.school}
{ school empty$
    'skip$
    { bst.school.pre school * bst.school.post * output.field }
  if$
}

%%% institution
FUNCTION {format.output.institution}
{ institution empty$
    'skip$
    { bst.institution.pre institution * bst.institution.post * output.field }
  if$
}

FUNCTION {format.output.note}
{ note empty$
    'skip$
    { bst.note.pre note * bst.note.post * output.field }
  if$
}

%%% remove first ? characters.
% example
%
% "abc" #3" x1 chop.word
%
% If the first three characters of x1 are equal to abc, the function returns
% the string with abc removed. Otherwise, it returns x1 as is.
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        \havarditem

FUNCTION {output.bibitem}
{ newline$
  "\harvarditem[" write$
  alabel write$                 % alabel <- abbreviated citation
  "]{" write$
  flabel write$                 % flabel <- full citation
  "}{" write$
  cyear write$
  % cyear = year
  "}{" write$
  cite$ write$                  % cite$ -> pusch keyword
  "}" write$
  % If number index is on
  bst.use.number.index #0 =
     'skip$
     { index #1 + 'index :=
       "" 'preone :=
       "" 'preten :=
       bst.number.index.digit "1" =
         'skip$
         { bst.number.index.digit "2" =
           { "\hskip0.5em" 'preone := }
           { bst.number.index.digit "3" =
              { "\hskip1em" 'preone :=
                "\hskip0.5em" 'preten := }
              'skip$
             if$
           }
         if$
         }
       if$  
     }
  if$
  newline$
  before.all 'output.state :=
  ""
  % number index
  bst.use.number.index #0 =
     'skip$
     { index #10 <
         % Insert spaces according to digit of number index.
         { preone }
         { index #100 <
             { preten }
             { "" }
           if$
         }
       if$
       bst.number.index.pre * index int.to.str$ * bst.number.index.post * write$
     }
 if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        article

FUNCTION {article}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.journal
  bst.year.position #2 =
    { format.output.year }
    'skip$
  if$
  format.output.volume
  bst.year.position #3 =
    { format.output.year }
    'skip$
  if$
  format.output.number
  format.output.pages
  bst.year.position #1 =
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        book

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.output.editors }
    { format.output.authors
      "author and editor" editor either.or.check 
    }
  if$
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.book
  format.output.bvolume
  format.output.number.series
  format.output.edition
  format.output.publisher.address
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        booklet

FUNCTION {booklet}
{ output.bibitem
%	Only the author field can be used? The editor field cannot be used?
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.howpublished
  format.output.address
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       inbook

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.output.editors }
    { format.output.authors 
      "author and editor" editor either.or.check
    }
  if$
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.book
  format.output.edition
  format.output.bvolume
  format.output.chapter
  format.output.pages
  format.output.number.series
  format.output.publisher.address
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       incollection

FUNCTION {incollection}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.in.ed.booktitle
  format.output.bvolume
  format.output.edition
  format.output.chapter
  format.output.pages
  format.output.address.organization.publisher
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       inproceedings

FUNCTION {inproceedings}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.in.ed.booktitle
  format.output.bvolume
  format.output.number.series
  format.output.pages
  format.output.address.organization.publisher
  bst.year.position #0 = not
    { format.output.date }
    { format.output.month }
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       conference

FUNCTION {conference}
{ inproceedings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       manual

FUNCTION {manual}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
        'skip$
      if$
  format.output.book
  format.output.address.organization.publisher
  format.output.edition
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       mastersthesis

FUNCTION {masterthesis}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.mthesis
  format.output.school
  format.output.address 
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       phdthesis

FUNCTION {phdthesis}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.book
  format.output.phd
  format.output.school
  format.output.address
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       proceedings

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output.field }
    { format.output.editors }
  if$
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.book
  format.output.bvolume
  format.output.number.series
  format.output.address.organization.publisher
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       techreport

FUNCTION {techreport}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.tr.number output.field
  format.output.institution
  format.output.address
  bst.year.position #0 = not
    { format.output.year }
    'skip$
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       unpublished

FUNCTION {unpublished}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  bst.year.position #0 = not
    { format.output.date }
    { format.output.month }
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       online

FUNCTION {online}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.howpublished
  bst.year.position #0 = not
    { format.output.date }
    { format.output.month }
  if$
  format.output.url.doi
  format.output.note
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       misc

FUNCTION {misc}
{ output.bibitem
  format.output.authors
  bst.year.position #0 =
    { format.output.year }
    'skip$
  if$
  format.output.title
  format.output.howpublished
  bst.year.position #0 = not
    { format.output.date }
    { format.output.month }
  if$
  format.output.url.doi
  format.output.note
  fin.entry
  empty.misc.check
}

FUNCTION {default.type}
{ misc }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Alias for month names:

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

%%% Read entries:
READ

%%% Variable for remembering the order of citation.
INTEGERS { order.num }
FUNCTION {initialize.order.num}
{
  #1 'order.num :=
}
%%% Initialize a variables
EXECUTE {initialize.order.num}

%%% Variable for remembering the order of citation.
FUNCTION {set.order.cited}
{
  order.num 'order.cited :=
  #1 order.num + 'order.num :=
}
%%% Iterate for all entries:
ITERATE {set.order.cited}

%%% check the value of nameorder field.
FUNCTION {set.nameorder}
{ nameorder empty$
    { "" 'nameorder.temp := }
    { nameorder 'nameorder.temp := }
  if$
}
%%% Iterate for all entries:
ITERATE {set.nameorder}

%%% Remove symbols and convert to lowercase.
FUNCTION {sortify}
{ purify$ "l" change.case$ }

%%% names for sorting
FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { ", " * }
        'skip$
      if$
      s nameptr "{ll}{ f}{ j}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { bst.and.others.output *}
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.names.abb}
{ 's :=
  s num.names$ 'numnames :=
  numnames bst.and.others.num <
     { s sort.format.names }
     { s #1 "{ll}{ f}{ j}" format.name$ " zz " * }
  if$
}

%%% Label for full author name.
FUNCTION {format.lab.names.full}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
      { s nameptr "{vv~}{ll}" format.name$ 't :=
        nameptr #1 >
          { namesleft #1 >
              { nameorder.temp "random" = bst.use.nameorder #0 = not and
                  { bst.and.nameorder * t * }
                  { ", " * t * }
                if$
              }
              { t "others" =
                  { bst.and.others.output * }
                  { numnames #2 > 
                      { nameorder.temp "random" = bst.use.nameorder #0 = not and
                          { bst.cite.and.nameorder * t * }
                          { bst.cite.ands * t * }
                        if$
                      }
                      { nameorder.temp "random" = bst.use.nameorder #0 = not and
                          { bst.cite.and.nameorder * t * }
                          { bst.cite.and * t * }
                        if$
                      }
                    if$
                  }
                if$
              }   
            if$
          }
          't
        if$
        nameptr #1 + 'nameptr :=
        namesleft #1 - 'namesleft :=
      }
  while$
  numnames #1 > #1 #2 = and {", eds" *} {} if$
  numnames #1 = #1 #2 = and {", ed" *} {} if$
}

%%% laberl for abbreviated author name.
FUNCTION {format.lab.names.abb}
{ 's :=
   s num.names$ 'numnames :=
   numnames bst.and.others.num <
     % if the number of authors is less than bst.and.others.num, full name.
     { s format.lab.names.full }
     % if the number of authors is equal or more than bst.and.others.num, abbreviated name.
     { s #1 "{vv~}{ll}" format.name$ bst.and.others.output * }
   if$
}

%%% abbreviated author
FUNCTION {author.key.label.abb}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.abb }
  if$
}

%%% full author
FUNCTION {author.key.label.full}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {format.names.full.wo.and}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
      { s nameptr "{ll}{, ff}{, jj}" format.name$ 't :=
        nameptr #1 >
          { namesleft #1 >
              { " " * t * }
              { t "others" =
                  { " " * }
                  { numnames #2 > 
                      { " " * t * }
                      { " " * t * }
                    if$
                  }
                if$
              }   
            if$
          }
          't
        if$
        nameptr #1 + 'nameptr :=
        namesleft #1 - 'namesleft :=
      }
  while$
}

FUNCTION {author.key.full.wo.and}
{ sortname empty$ not
    { sortname format.names.full.wo.and }
    { author empty$ not
        { author format.names.full.wo.and }
        { key empty$ not
            { key #3 text.prefix$ }
            { cite$ #1 #3 substring$ }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.editor.key.full.wo.and}
{ sortname empty$ not
    { sortname format.names.full.wo.and }
    { author empty$ not
        { author format.names.full.wo.and }
        { editor empty$ not
            { editor format.names.full.wo.and }
            { key empty$
                { cite$ #1 #3 substring$ }
                { key #3 text.prefix$ }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {editor.key.organization.key.full.wo.and}
{ sortname empty$ not
    { sortname format.names.full.wo.and }
    { editor empty$ not
        { editor format.names.full.wo.and }
        { key empty$ not
            { key #3 text.prefix$ }
            { organization empty$ not
                { "The " #4 organization chop.word #3 text.prefix$ }
                { cite$ #1 #3 substring$ }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.organization.key.full.wo.and}
{ sortname empty$ not
    { sortname format.names.full.wo.and }
    { author empty$ not
        { author format.names.full.wo.and }
        { key empty$ not
            { key #3 text.prefix$ }
            { organization empty$ not         
                { "The " #4 organization chop.word #3 text.prefix$ }
                { cite$ #1 #3 substring$ }
              if$
            }
          if$
        }
      if$
    }
  if$
}

%%% abbreviated author
FUNCTION {author.editor.key.label.abb}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            { key #3 text.prefix$ }
          if$
        }
        { editor format.lab.names.abb }
      if$
    }
    { author format.lab.names.abb }
  if$
}

%%% full author
FUNCTION {author.editor.key.label.full}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            { key #3 text.prefix$ }
          if$
        }
        { editor format.lab.names.full }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label.full}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label.abb}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.abb }
  if$
}

FUNCTION {editor.key.organization.label.full}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        { key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names.full }
  if$
}

FUNCTION {editor.key.organization.label.abb}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        { key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names.abb }
  if$
}

%%% Convert numbers: 0->9, 1->8, 2->7,..., 9->0
FUNCTION {reverse.num}
{ 's :=
  s "1" =
    { "8" 'year.num := }
    { s "2" =
        { "7" 'year.num := }
        { s "3" =
            { "6" 'year.num := }
            { s "4" =
                { "5" 'year.num := }
                { s "5" =
                    { "4" 'year.num := }
                    { s "6" =
                        { "3" 'year.num := }
                        { s "7" =
                            { "2" 'year.num := }
                            { s "8" =
                                { "1" 'year.num := }
                                { s "9" =
                                    { "0" 'year.num := }
                                    { s "0" =
                                        { "9" 'year.num := }
                                        { "9" 'year.num := }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
  year.num
}

%%% Convert year (large number -> small number)
FUNCTION {convert.year}
{ 't := 
  bst.reverse.year #0 =
    { t 'tt := }
    { t #1 #1 substring$ reverse.num 
      t #2 #1 substring$ reverse.num *
      t #3 #1 substring$ reverse.num *
      t #4 #1 substring$ reverse.num * 'tt := }
  if$
  tt
}

%%% cyear
FUNCTION {calc.cyear}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.full.wo.and
    { type$ "proceedings" =
        'editor.key.organization.key.full.wo.and
        { type$ "manual" =
            'author.key.organization.key.full.wo.and
            'author.key.full.wo.and
          if$
        }
      if$
    }
  if$
  duplicate$
  year empty$
    { "2199" 'cyear := }
    { year 'cyear := }
  if$
  year empty$
    { " " "2199" convert.year * field.or.null * }
    { " " year convert.year * field.or.null * }
  if$
  sortify 'sort.label :=
  % For debug
  econ.debug #0 = not
    { "sort.label = ``\texttt{" write$
      sort.label write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
 pop$
}

FUNCTION {calc.sort.label.abb}
{ sortname empty$ not
    { sortname 's := }
    { author empty$ not
        { author 's := }
        { editor empty$ not
           { editor 's := }
           { "" }
          if$
        }
      if$
    }
  if$
  s sort.format.names.abb 't :=
  year empty$
    { t sortify " " * "2199" convert.year * 'sort.label.abb := }
    { t sortify " " * year convert.year * 'sort.label.abb := }
  if$
  econ.debug #0 = not
    { "sort.label.abb = ``\texttt{" write$
      sort.label.abb write$
      "}''\\" write$
      newline$
    }
    'skip$
  if$
}

%%% flabel
FUNCTION {calc.flabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.full
    { type$ "proceedings" =
        'editor.key.organization.label.full
        { type$ "manual" =
            'author.key.organization.label.full
            'author.key.label.full
          if$
        }
      if$
    }
  if$
  'flabel :=
  author empty$
    'skip$
    { author num.names$ 'numnames :=
      numnames bst.max.author.num >
        { alabel 'flabel := }
        'skip$
      if$
    }
  if$
  % For debug
  econ.debug #0 = not
    { "flabel = ``\texttt{" write$
      flabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% alabel
FUNCTION {calc.alabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.abb
    { type$ "proceedings" =
        'editor.key.organization.label.abb
        { type$ "manual" =
            'author.key.organization.label.abb
            'author.key.label.abb
          if$
        }
      if$
    }
  if$
  'alabel :=
  % For debug
  econ.debug #0 = not
    { "alabel = ``\texttt{" write$
      alabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% title for sorting
FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

%%% author for sorting
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

%%% editor for sorting
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%%% 1,...,9 -> 001,...,009
%%% 10,...,99 -> 010,...,099
FUNCTION {add.zero.to.number}
{ 's :=
    s text.length$ #1 =
      { "00" s * }
      { s text.length$ #2 =
          { "0" s * }
          { s }
        if$
      }
   if$
}

%% entry type
FUNCTION {bst.sort.entry.type.order}
{ 'item.type :=
  item.type "article" =
    { "01" }
    { item.type "book" =
        { "02" }
        { item.type "booklet" =
            { "03" }
            { item.type "comment" =
                { "04" }
                { item.type "conference" =
                    { "05" }
                    { item.type "inbook" =
                        { "06" }
                        { item.type "incollection" =
                            { "07" }
                            { item.type "inproceedings" =
                                { "08" }
                                { item.type "manual" =
                                    { "09" }
                                    { item.type "masterthesis" =
                                        { "10" }
                                        { item.type "misc" =
                                            { "11" }
                                            { item.type "phdthesis" =
                                                { "12" }
                                                { item.type "proceedings" =
                                                    { "13" }
                                                    { item.type "techreport" =
                                                        { "14" }
                                                        { item.type "unpublished" =
                                                            { "15" }
                                                            { "16" }
                                                          if$
                                                        }
                                                      if$
                                                    }
                                                  if$
                                                }
                                              if$
                                            }
                                          if$
                                        }
                                      if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% Create sort.key$: absorder -> author -> year -> order -> month -> title.
FUNCTION {presort.one}
{
  bst.no.sort #0 = not
    { order.cited int.to.str$ add.zero.to.number " " * }
    { "" }
  if$
  bst.sort.year #0 = not
    %% Use year field as the primary sorting key.
    { year convert.year * }
    'skip$
  if$
  bst.sort.entry.type #0 = not
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          { "zzz " * }
          { absorder add.zero.to.number "000" =
             { "/// " * }
             { absorder add.zero.to.number * " " * }
            if$
          }
         if$
       }
       { "/// " * }
      if$
    }
  if$
  " " *
  sort.label.abb *
  " " *  
  type$ "book" = type$ "inbook" = or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  * " "
  order empty$
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          { "zzz " * }
          { order add.zero.to.number "000" =
             { "/// " * }
             { order add.zero.to.number * " " * }
            if$
          }
         if$
       }
       { "/// " * }
      if$
    }
  if$
  month empty$
    { * "/// " * }
       { month "999" =
          { * month add.zero.to.number * "zzz " * }
          { month add.zero.to.number "000" =
             { * month add.zero.to.number * "/// " * }
             { * month add.zero.to.number * " " * }
            if$
          }
         if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug
  econ.debug #0 = not
    { "``\texttt{" write$
      sort.key$ write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

FUNCTION {presort.two}
{
  bst.no.sort #0 = not
    { order.cited int.to.str$ add.zero.to.number " " * }
    { "" }
  if$
  bst.sort.year #0 = not
    %% Use year field as the primary sorting key.
    { year convert.year * }
    'skip$
  if$
  bst.sort.entry.type #0 = not
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          { "zzz " * }
          { absorder add.zero.to.number "000" =
             { "/// " * }
             { absorder add.zero.to.number * " " * }
            if$
          }
         if$
       }
       { "/// " * }
      if$
    }
  if$
  " " * sort.label * " "
  order empty$
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          { "zzz " * }
          { order add.zero.to.number "000" =
             { "/// " * }
             { order add.zero.to.number * " " * }
            if$
          }
         if$
       }
       { "/// " * }
      if$
    }
  if$
  month empty$
    { * "/// " * }
       { month "999" =
          { * month add.zero.to.number * "zzz " * }
          { month add.zero.to.number "000" =
             { * month add.zero.to.number * "/// " * }
             { * month add.zero.to.number * " " * }
            if$
          }
         if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug
  econ.debug #0 = not
    { "``\texttt{" write$
      sort.key$ write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% Codes for debugging
FUNCTION {calc.alabel.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of calc.alabel: alabel = }\\" write$
      newline$ }
    'skip$
 if$
}
FUNCTION {calc.flabel.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of calc.flabel: flabel = }\\" write$
      newline$ }
    'skip$
 if$
}
FUNCTION {presort.one.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of presort (1st time): \$sort.key = }\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {presort.two.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of presort (2nd time): \$sort.key = }\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {calc.cyear.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of calc.cyear: sort.label = }\\" write$
      newline$ }
    'skip$
 if$
}

FUNCTION {calc.sort.label.abb.mess}
{ econ.debug #0 = not
    { "\textbf{Iteration of calc.sort.label.abb: sort.label.abb = }\\" write$
      newline$ }
    'skip$
 if$
}

%%% alabel
EXECUTE {calc.alabel.mess}
ITERATE {calc.alabel}

%%% flabel
EXECUTE {calc.flabel.mess}
ITERATE {calc.flabel}

%%% cyear and sort.label
EXECUTE {calc.cyear.mess}
ITERATE {calc.cyear}

%%%
EXECUTE {calc.sort.label.abb.mess}
ITERATE {calc.sort.label.abb}

%%% Sorting by $sort.key (first time)
%
% Sorting is done in two times. This is the first time.
%
EXECUTE {presort.one.mess}
ITERATE {presort.one}
SORT

FUNCTION {forward.pass}
{ bst.use.bysame #0 = bst.use.bysame #2 = or
    % Not use \bysame
    { last.sort.label sort.label.abb =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label.abb 'last.sort.label :=
        }
      if$
    }
    % Use \bysame
    { last.sort.label sort.label.abb =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label.abb 'last.sort.label :=
        }
      if$
      author empty$
        { editor empty$
          { "" }
          'format.editors.alt
          if$
        }
        'format.authors.alt
      if$
      'this.author :=
      % format.names 'this.author :=
      this.author prev.author =
        { "bysame" 'extra.label.bysame := }
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
      if$
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label empty$ not
    { cyear extra.label * }
    { cyear "" * }
  if$
  "" field.or.null *
  'cyear :=
  extra.label 'next.extra :=
}

%%% \bysame
ITERATE {forward.pass}

REVERSE {reverse.pass}

%%% Sorting by sort.key$ (second time)
EXECUTE {presort.two.mess}
ITERATE {presort.two}
SORT

FUNCTION {reset.prev.author}
{ "xxyyzz" 'prev.author := }

EXECUTE {reset.prev.author}

FUNCTION {forward.pass.two}
{ bst.use.bysame #1 = 
    { author empty$
        { editor empty$
          { "" }
          'format.editors.alt
          if$
        }
        'format.authors.alt
     if$
     'this.author :=
     this.author prev.author =
        { "bysame" 'extra.label.bysame := }
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
     if$
    }
   'skip$
  if$
}

ITERATE {forward.pass.two}

FUNCTION{punctuation}
{
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" write$ newline$
  "%  This bbl file is created by " econ.file * " ver." * econ.version *          write$ newline$
  "%  The latest " econ.file * " is available at " *			write$ newline$
  "%  <https://github.com/ShiroTakeda/econ-bst>"                        write$ newline$ newline$
}

EXECUTE {punctuation}

FUNCTION {begin.bib}
{
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  bst.use.bysame #0 =
     % Not use \bysame.
     'skip$
     % Use \bysame.
     { "%%% Definition of \bysame" write$ newline$
       "\ifx\undefined\bysame" write$ newline$
       "\newcommand{\bysame}{" bst.bysame.definition * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$ }
  if$
  %% When number index is attached to the beginning of each item.
  bst.use.number.index #0 =
     'skip$
     { bst.number.index.digit "1" =
         % one digit.
         { bst.number.index.bibhang.one }
         { bst.number.index.digit "2" =
            % two digits.
            { bst.number.index.bibhang.ten }
            % three or more digits.
            { bst.number.index.bibhang.hund }
           if$
         }
       if$
       'hang :=
       "%%% Redefinition of \bibhang" write$ newline$
       "\ifx\undefined\bibhang" write$ newline$
       "\relax" write$ newline$
       "\else" write$ newline$
       "\setlength{\bibhang}{"
       hang * "}" * write$ newline$ 
       "\fi" write$ newline$ newline$
       }
  if$
  "\begin{thebibliography}{xxx}" write$ newline$

  %% Initialize the variable `index'.
  #0 'index :=
}

FUNCTION {end.bib}
{ newline$ "\end{thebibliography}" write$ newline$ }

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

EXECUTE {end.bib}

%  --------------------
%  Local Variables:
%  fill-column: 78
%  coding: utf-8
%  mode: bibtex-style
%  End:
