% A class for producing syllabi. 
% Alejandro Pérez Carballo <aperezca@usc.edu>
%
% ----------------------------------------------------
% Requirements
% ----------------------------------------------------
% 
% xelatex
% memoir.cls
% memhfixc.sty
% fontspec.sty
% etoolbox.sty
% xunicode.sty
% advdate.sty, datetime.sty, seqsplit.sty, amsmath.sty, amsthm.sty,
% xspace.sty, xcolor.sty, linguex.sty, textcase.sty, xstring.sty
% 
% ----------------------------------------------------------------------------
% Optional
% ----------------------------------------------------------------------------
% 
% Fonts: Adobe Minion Pro, Adobe Myriad Pro, and Pragmata Pro. 
% biblatex.sty
% ----------------------------------------------------------------------------
% It should be possible to use with bibtex only. 
% Some of the custom bibliography settings may need to be commented out.
% ----------------------------------------------------------------------------


\ProvidesClass{syllabus}

\LoadClass[11pt,article]{memoir}

%Load standard packages, fontspec, etc.
\usepackage{fontspec}
\usepackage{etoolbox}
\usepackage{advdate}
\usepackage{datetime}
% \usepackage{datenumber}
\usepackage{amsmath,amsthm}
\usepackage{xunicode}
\usepackage{xspace}
% \usepackage{lineno}
\usepackage{seqsplit}
\usepackage[dvipsnames]{xcolor}
% \usepackage{colornames}   
\usepackage{linguex}
\usepackage{hyperref}
\urlstyle{rm}
\usepackage{memhfixc}
\usepackage{textcase}
\usepackage{xstring}



% \settypeblocksize{*}{28pc}{1.62}
% \setlrmargins{*}{*}{1}
% \setlrmargins{*}{*}{2.5}
% \setulmargins{*}{*}{1}
% \setmarginnotes{2pc}{12pc}{\baselineskip}
% \checkandfixthelayout


\let\oldmarginpar\marginpar
\renewcommand\marginpar[1]{\-\oldmarginpar[\raggedleft\scriptsize\itshape #1]%
{\raggedright\scriptsize\itshape #1}}
\setmarginnotes{2pc}{7pc}{\baselineskip}


%% Bibliography options
\usepackage[style=authortitle-comp,sorting=nyt,firstinits,natbib,url=false,doi=false,isbn=false,backend=bibtex]{biblatex}
\renewcommand{\nameyeardelim}{ }
\renewcommand*\bibnamedash{\rule[0.5ex]{23pt}{0.3pt} }
%Clear day and month fields. 
\AtEveryBibitem{
  \clearfield{day}
  \clearfield{month}
  \clearfield{endday}
  \clearfield{endmonth}
}

%Make references font smaller.
\renewcommand{\bibfont}{\normalfont\small}

% Remove comma between author and year in citations. 
\renewcommand{\nameyeardelim}{ }

% Redefine dash for recurring author to make it longer than an em dash.
\renewcommand*\bibnamedash{\rule[0.5ex]{23pt}{0.3pt} }

% Turn titles into hyperlinks using data from the url field and removes quotation mark around titles in article, incollection, inproceedings, and unpublished. Also, treat thesis title as book title.
% NOTE: To put the quotation marks back on, simply wrap the argument in DeclareFieldFormat within \mkbibquote.  
\newbibmacro{string+url}[1]{% 
 \iffieldundef{url}{#1}{\href{\thefield{url}}{#1}}} 
\DeclareFieldFormat{title}{\usebibmacro{string+url}{\mkbibemph{#1}}}
\DeclareFieldFormat[thesis]{title}{\usebibmacro{string+url}{\mkbibemph{#1}}} 
\DeclareFieldFormat[article,incollection,inproceedings,unpublished]{title}{\usebibmacro{string+url}{#1}}

% Suppress "In:" for article citations.
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{%
  \printtext{\bibstring{in}\intitlepunct}}}


%Removes parentheses around year in the bibliography.
\def\act@on@bibmacro#1#2{%
  \expandafter#1\csname abx@macro@\detokenize{#2}\endcsname
}
\def\patchbibmacro{\act@on@bibmacro\patchcmd}
\def\pretobibmacro{\act@on@bibmacro\pretocmd}
\def\apptobibmacro{\act@on@bibmacro\apptocmd}
\def\showbibmacro{\act@on@bibmacro\show}

\patchbibmacro{date+extrayear}{%
  \printtext[parens]%
}{%
  \addperiod\space%
  \printtext%
}{}{}

% Turn name+year in citations into hyperlinks (rather than just the year)
\let\abx@macro@citeOrig\abx@macro@cite
\renewbibmacro{cite}{%
   \bibhyperref{%
   \let\bibhyperref\relax\relax%
   \abx@macro@citeOrig%
   }%
}
\let\abx@macro@textciteOrig\abx@macro@textcite
\renewbibmacro{textcite}{%
   \bibhyperref{%
   \let\bibhyperref\relax\relax%
   \abx@macro@textciteOrig%
   }%
}%

%% A bit more flexibility to avoid overfull boxes
\tolerance=200
\setlength{\emergencystretch}{2em}

% -------------------------------------------------------------------------
% Typography: Specify your fonts of choice here.
% -------------------------------------------------------------------------
% 
%(fold)
\setmainfont[Mapping=tex-text]{Minion Pro}
\setromanfont[Mapping=tex-text,Numbers=OldStyle,Ligatures={Common},SmallCapsFeatures = {LetterSpace=4.0}]{Minion Pro}
\setsansfont[Mapping=tex-text,Scale=MatchLowercase]{Myriad Pro}
\setmonofont[Mapping=tex-text,Scale=MatchLowercase]{PragmataPro}
% \setmathsfont(Digits,Latin,Greek){Minion Pro}
% \setmathsf[Scale=MatchLowercase]{Myriad Pro}
% \setmathtt[Scale=MatchLowercase]{Inconsolata}
% \setmathbb[Scale=MatchUppercase]{msbm10}
%(end)

\providecommand{\doi}[1]{\href{http://dx.doi.org/#1}{\nolinkurl{doi:#1}}}

\setlength{\droptitle}{-.75in}
% \renewcommand{\refdash}{}



   	\makechapterstyle{default}{
     \renewcommand\thesection{\arabic{section}} 
    \setsecheadstyle{\normalsize\scshape\MakeLowercase} 
    \setsubsecheadstyle{\small\bfseries\sffamily} 
    \setsubsubsecheadstyle{\small\itshape}
    \renewcommand{\printchaptername}{} 
    \renewcommand{\chapternamenum}{} 
    \renewcommand{\chapnumfont}{\chaptitlefont} 
    \renewcommand{\printchapternum}{\chapnumfont \thechapter\space} 
    \renewcommand{\afterchapternum}{} 
    \renewcommand{\printchaptername}{\secheadstyle}
    \renewcommand{\cftchapterfont}{\normalfont} 
    \renewcommand{\cftchapterpagefont}{\normalfont\scshape} 
    \renewcommand{\cftchapterpresnum}{\scshape} 
    %\renewcommand{\cftchapterleader}{} 
    %\renewcommand{\cftchapterafterpnum}{\cftparfillskip}
    \captiontitlefont{\small}
    %\settocdepth{chapter}
    % \maxsecnumdepth{chapter} 
    % \setsecnumdepth{subsection}
	\setcounter{secnumdepth}{-1}
	
	\newcommand{\marginbox}[1]{%
	\parbox[t][0pt]{3em}{\bfseries\raggedright\mbox{} \textsf{##1}}}
	\newcommand{\marginhead}[1]{%
	{\llap{\marginbox{##1}\kern0.5em}}}
	\setparaindent{0em} 
	\setbeforeparaskip{0.5em}
	\setafterparaskip{0em} 
	\setparaheadstyle{\marginhead} 
	%\setparahook{\setsecnumformat{\csname \cmd1 \endcsname\ }} 

	
    % reduce skip after section heading
    \setaftersecskip{1.5ex}

	% reduce skip around subsection heading
	\setaftersubsubsecskip{1.5ex}
	\setbeforesubsecskip{3ex}

    % set name of bibliography to 'bibliography'
    \renewcommand{\bibname}{\mdseries\Large\scshape\MakeLowercase Bibliography}

    % Title flush left
    \pretitle{\vskip 3.25em\flushleft\Large\scshape\MakeLowercase}
    \posttitle{\par\vspace{0.75em}}
    \preauthor{\flushleft\small \lineskip 1em}
    \postauthor{\par\vspace{0em}}
    \predate{\vskip 1.75em\flushleft\scriptsize}
    \postdate{\par\vskip 1em}

    % 'abstract' bigger skip from title
    \renewcommand{\abstractname}{\normalfont\scriptsize}
	\renewcommand{\abstracttextfont}{\normalfont\scriptsize}
    %\abstractrunin
	

   }
  %(end)


%(fold)
\makechapterstyle{nodates}{
  \renewcommand\thesection{\arabic{section}} 
   \setsecheadstyle{\large\scshape\MakeLowercase} 
   \setsubsecheadstyle{\normalsize\bfseries\sffamily} 
	\setaftersubsubsecskip{-1em}
   \setsubsubsecheadstyle{\small\itshape}
   \renewcommand{\printchaptername}{} 
   \renewcommand{\chapternamenum}{} 
   \renewcommand{\chapnumfont}{\chaptitlefont} 
   \renewcommand{\printchapternum}{\chapnumfont \thechapter\space} 
   \renewcommand{\afterchapternum}{} 
   \renewcommand{\printchaptername}{\secheadstyle}
   \renewcommand{\cftchapterfont}{\normalfont} 
   \renewcommand{\cftchapterpagefont}{\normalfont\scshape} 
   \renewcommand{\cftchapterpresnum}{\scshape} 
   %\renewcommand{\cftchapterleader}{} 
   %\renewcommand{\cftchapterafterpnum}{\cftparfillskip}
   \captiontitlefont{\small}
   %\settocdepth{chapter}
   % \maxsecnumdepth{chapter} 
   % \setsecnumdepth{subsection}
	\setcounter{secnumdepth}{-1}
	
	\newcommand{\marginbox}[1]{%
	 \parbox[t][0pt]{4em}{\bfseries\raggedright\mbox{} \textsf{##1}}}
	\newcommand{\marginhead}[1]{%
	{\llap{\marginbox{##1}\kern0.5em}}}
	\setparaindent{0em} 
	\setbeforeparaskip{0em}
	\setafterparaskip{0em} 
	\setparaheadstyle{\marginhead} 
	%\setparahook{\setsecnumformat{\csname \cmd1 \endcsname\ }} 

	
   % reduce skip after section heading
   \setaftersecskip{1.7ex}

   % set name of bibliography to 'references'
   \renewcommand{\bibname}{\mdseries\Large\scshape\MakeLowercase References}

   % Title flush left
   \pretitle{\vskip 5em\flushleft\Large \bfseries}
   \posttitle{\par\vspace{0.5em}}
   \preauthor{\flushleft\small \lineskip 1em}
   \postauthor{\par\vspace{0em}}
   \predate{\vskip 0.75em\flushleft\scriptsize}
   \postdate{\par\vskip 1.5em}

   % 'abstract' bigger skip from title
   \renewcommand{\abstractname}{\normalfont\scriptsize}
	\renewcommand{\abstracttextfont}{\normalfont\scriptsize}
   %\abstractrunin
	

  }
%(end)

\makepagestyle{default}
\newcommand{\@defaultmarks}{%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markboth{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \thechapter. \ %
        \fi
      \fi
      ##1}{}}
  \def\sectionmark##1{%
    \markright{##1}}
}
\makepsmarks{default}{\@defaultmarks}
\makepsmarks{default}{}
\makeoddhead{default}{\scshape\thepage}{}{}
\makeevenhead{default}{}{}{\scshape\thepage}
\makeevenfoot{default}{}{}{\vspace*{-0.5in}{\scriptsize\textsf{\color{Gray} \courseshort \ // \puBa \ -- Last updated: \shorttoday}}}
\makeoddfoot{default}{\vspace*{-0.5in}{\scriptsize\textsf{\color{Gray} \courseshort \ // \puBa \ -- Last updated: \shorttoday}}}{}{}


%%(end)

%% Define timestamp using current time and date.
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}
% \newcommand{\shorttoday}{\twodigits\month.\twodigits\day.\hspace{.1em}\number\year}


\newcommand{\frstdy}{}

\newcommand{\firstday}[1]{\renewcommand{\frstdy}{#1}}
% Use for specifying the first day of class.
\renewcommand{\dateseparator}{.}
\AtBeginDocument{
\SaveDate[\hoy]
\SetDate[\frstdy]
}
\newcommand{\shorttoday}{\StrBetween[1,2]{\hoy}{/}{/}.\StrBefore{\hoy}{/}.\StrBehind[2]{\hoy}{/}}

\dmyyyydate
\newcommand{\timestamp}{\shorttoday; \xxivtime}



% ---------------------------------------------------------------------
% Personal information. Redefine accordingly.
% ---------------------------------------------------------------------

\newcommand{\myoffice}{STO-132}
\newcommand{\myhomepage}{\href{http://perezcarballo.org}{perezcarballo.org}}
\newcommand{\coursename}{Course name}
\newcommand{\courseshort}{}
\newcommand{\courseroom}{Room}
\newcommand{\courseweb}{course website}
\newcommand{\myaff}{}
\newcommand{\coursemeets}{}
\newcommand{\myem}{aperezca@usc.edu}
\date{{\scriptsize\href{mailto:\myem}{\textsf\myem}}\\[.01em] {\scriptsize\textsc{\MakeTextLowercase\myoffice}}}
\title{\coursename}



\newcommand{\myaffiliation}[1]{\renewcommand{\myaff}{#1}}
\newcommand{\myemail}[1]{\renewcommand{\myem}{#1}}
\newcommand{\website}[1]{\renewcommand{\courseweb}{\href{#1}{#1}}}
\newcommand{\course}[1]{\renewcommand{\coursename}{{#1}\xspace}}
\newcommand{\courseno}[1]{\renewcommand{\courseshort}{{#1}\xspace}}
\newcommand{\blurb}[1]{\renewcommand{\courseblurb}{#1}}
\newcommand{\meets}[1]{\renewcommand{\coursemeets}{#1}}
\newcommand{\room}[1]{\renewcommand{\courseroom}{#1}}
\newcommand{\term}[1]{% 
   \gdef\puBa{#1}
\renewcommand{\maketitlehooka}{% 
       \par\noindent{\scriptsize\textsf\puBa \ {\color{BrickRed} //} \textsf\coursemeets} \\[-.3\baselineskip] \textsf{\color{Gray}\scriptsize\textsf Last updated: \shorttoday}}} 
\newcommand{\puBa}{} 

\newcommand{\headernote}[1]{% 
   \gdef\puB{#1}
\renewcommand{\maketitlehooka}{% 
       \par\noindent{\scriptsize\textsf\puB}}} 
\newcommand{\puB}{}

\newcommand{\meetings}{Meetings: \textsc{\MakeTextLowercase\coursemeets}}
\newcommand{\coursewebsite}{Course website: \textsf\courseweb}

\newcommand{\summary}[1]{
\vspace{.1\baselineskip}
\noindent
\hangpara{.25in}{0}{\footnotesize #1}
}

\newcommand{\toread}[1]{
\vspace{.2\baselineskip}
\noindent
{\small #1}
}


\newcounter{meeting}
\setcounter{meeting}{0}

\newcounter{week}
\setcounter{week}{0}

\newbool{tues}
\setbool{tues}{true}

\newcommand{\saveddate}{}
\newcommand{\sessionalt}{\paragraph{\color{BrickRed}\scriptsize\noindent Session \themeeting} \stepcounter{meeting}}
\newcommand{\week}{\paragraph{\color{BrickRed}\scriptsize\noindent Week \theweek} \stepcounter{week}}

% \newcommand{\noclass}{
% \ifbool{tues}{\addtocounter{datenumber}{2} \setbool{tues}{false}}{\addtocounter{datenumber}{5}\setbool{tues}{true}} \setdatebynumber{\thedatenumber}}



% {\paragraph{\color{BrickRed}\scriptsize Session \themeeting \stepcounter{meeting}}}
\newcommand{\stamp}[1]{\renewcommand{\timestamp}{#1}}

\newif\if@screen\@screentrue
\newif\if@print\@printtrue

\newif\if@once\@oncetrue
\newif\if@twice\@twicetrue

\DeclareOption{once}{\@oncetrue \@twicefalse}
\DeclareOption{twice}{\@oncefalse \@twicetrue}

\ExecuteOptions{twice}


\DeclareOption{screen}{\@screentrue \@printfalse}
\DeclareOption{print}{\@screenfalse \@printtrue}

\ExecuteOptions{screen}

\DeclareOption*{ 
\PackageWarning{syllabus}{Unknown option ‘\CurrentOption’}% 
} 

\ProcessOptions\relax

% ------------------------------------------------------------------------
% Screen option: use colored links. 
% Print option: do not use colored links. Best suited for printing in b&w.
% ------------------------------------------------------------------------

\if@screen
	\hypersetup{breaklinks=true,
	colorlinks=true,
	linkcolor=BrickRed,
	urlcolor=BrickRed,
	citecolor=BlueViolet,
	plainpages=false,
  	pdfpagelabels,
  	bookmarksnumbered,
	backref=page}
	\else\relax
	\fi
\if@print
	\hypersetup{breaklinks=true,
	colorlinks=false,
	linkbordercolor={.8 .1 0},
	urlbordercolor={.8 .1 0},
	citebordercolor={0 .5 .5}, 	
	plainpages=false,
  	pdfpagelabels,
  	bookmarksnumbered
	}
	\else\relax
	\fi

% ------------------------------------------------------------------------
% Twice option: For courses meeting twice a week.
% Once option: For courses meeting once a week.
% ------------------------------------------------------------------------


\if@twice
  \newcommand{\session}[1]{\paragraph{\color{BrickRed}\scriptsize\twodigits\month.\twodigits\day} {#1} 
  \ifbool{tues}{\AdvanceDate[2] \setbool{tues}{false}}{\AdvanceDate[5]\setbool{tues}{true}}}
  \else\relax
  \fi
\if@once
  \newcommand{\session}[1]{\paragraph{\color{BrickRed}\scriptsize\twodigits\month.\twodigits\day} {#1} 
  \AdvanceDate[7]}
  \else\relax
  \fi


\endinput

