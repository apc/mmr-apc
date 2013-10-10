%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode
\ProvidesClass{pset}

\LoadClass[12pt,oneside,article]{memoir}

%Load standard packages, fontspec, etc.
%Load standard packages, fontspec, etc.
\usepackage{amsmath,amsthm}
\usepackage[MnSymbol]{mathspec}
\usepackage{xunicode}
\usepackage{xltxtra}
\usepackage{xspace}
\usepackage{lineno}
\usepackage{datetime}
\usepackage{seqsplit}
\usepackage{linguex}
\usepackage{hyperref}
\urlstyle{rm}
\usepackage{color}  
\usepackage{colornames}     
\usepackage{memhfixc}

% Bibliography options for biblatex (fold)
%
%
\usepackage[style=authoryear-comp,sorting=nyt,firstinits,natbib,url=false,doi=false,isbn=false]{biblatex}
\renewcommand{\nameyeardelim}{ }
\renewcommand*\bibnamedash{\rule[0.5ex]{23pt}{0.3pt} }
% Turn titles into hyperlinks using data from the url field
\newbibmacro{string+url}[1]{% 
 \iffieldundef{url}{#1}{\href{\thefield{url}}{#1}}} 
\DeclareFieldFormat{title}{\usebibmacro{string+url}{\mkbibemph{#1}}} 
\DeclareFieldFormat[article]{title}{\usebibmacro{string+url}{\mkbibquote{#1}}}

% Suppress "In:" for article citations.
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{%
  \printtext{\bibstring{in}\intitlepunct}}}

% Replace periods with commas in citations.
\renewcommand*{\newunitpunct}{\addcomma\space}

% Turn name+year in citations into hyperlinks (rather than just the year)
% \let\abx@macro@citeOrig\abx@macro@cite
% \renewrobustcmd*\abx@macro@cite[1]{%
%      \printtext[bibhyperref]{%
%         \let\bibhyperref\relax\relax%
%         \abx@macro@citeOrig{#1}%
%      }%
%   }
% \let\abx@macro@textciteOrig\abx@macro@textcite
% \renewrobustcmd*\abx@macro@textcite[1]{%
%      \printtext[bibhyperref]{%
%         \let\bibhyperref\relax\relax%
%         \abx@macro@citeOrig{#1}%
%      }%
%   }

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


% \newtoggle{cbx:hyperref}
% \toggletrue{cbx:hyperref}
% 
% \DeclareFieldFormat{bibhyperref}{% Adapted from bibhyperref format in biblatex.def
%   \iftoggle{cbx:hyperref}
%     {\bibhyperref{#1}}
%     {#1}}
% 
% \renewbibmacro*{cite}{% Adapted from cite macro in authoryear.cbx
%   \printtext[bibhyperref]{% Enclose cite macro output in hyperlink
%     \global\togglefalse{cbx:hyperref}% Prevent nested hyperlinks
%     \iffieldundef{shorthand}
%       {\ifthenelse{\ifnameundef{labelname}\OR\iffieldundef{labelyear}}
%          {\usebibmacro{cite:label}%
%           \setunit{\addspace}}
%          {\printnames{labelname}%
%           \setunit{\nameyeardelim}}%
%        \usebibmacro{cite:labelyear+extrayear}}
%       {\usebibmacro{cite:shorthand}}%
%     \global\toggletrue{cbx:hyperref}}}
% 
% \DeclareCiteCommand{\textcite}% Adapted from \textcite command in authoryear.cbx
%   {\boolfalse{cbx:parens}}
%   {\usebibmacro{citeindex}%
%    \printtext[bibhyperref]{% Enclose textcite macro output in hyperlink
%      \global\togglefalse{cbx:hyperref}% Prevent nested hyperlinks
%      \usebibmacro{textcite}%
%      \iffieldundef{postnote}% Include closing parenthesis if no postnote
%        {\ifbool{cbx:parens}
%           {\bibcloseparen\global\boolfalse{cbx:parens}}
%           {}}
%        {}}%
%      \global\toggletrue{cbx:hyperref}}
%   {\ifbool{cbx:parens}
%      {\bibcloseparen\global\boolfalse{cbx:parens}}
%      {}%
%    \multicitedelim}
%   {\iffieldundef{postnote}
%     {}
%     {\usebibmacro{textcite:postnote}}}
% 
% % Hack? I copied this from authoryear.cbx verbatim and it now seems to work as i wanted. Bizarre. 
% 	\DeclareCiteCommand{\parencite}[\mkbibparens]
% 	  {\usebibmacro{prenote}}
% 	  {\usebibmacro{citeindex}%
% 	   \usebibmacro{cite}}
% 	  {\multicitedelim}
% 	  {\usebibmacro{postnote}}
% 
% 	\DeclareCiteCommand*{\parencite}[\mkbibparens]
% 	  {\usebibmacro{prenote}}
% 	  {\usebibmacro{citeindex}%
% 	   \usebibmacro{citeyear}}
% 	  {\multicitedelim}
% 	  {\usebibmacro{postnote}}


%(end)

%% A bit more flexibility to avoid overfull boxes
\tolerance=200
\setlength{\emergencystretch}{2em}

%Typography
%(fold)
\setmainfont[Mapping=tex-text]{Minion Pro}
\setromanfont[Mapping=tex-text,Numbers=OldStyle,Ligatures={Common}]{Minion Pro}
\setsansfont[Mapping=tex-text,Scale=MatchLowercase]{Myriad Pro}
\setmonofont[Mapping=tex-text,Scale=MatchLowercase]{Inconsolata}
\setmathsfont(Digits,Latin,Greek){Minion Pro}
\setmathsf[Scale=MatchLowercase]{Myriad Pro}
\setmathtt[Scale=MatchLowercase]{Inconsolata}
\setmathbb[Scale=MatchUppercase]{msbm10}
%(end)

\providecommand{\doi}[1]{\href{http://dx.doi.org/#1}{\nolinkurl{doi:#1}}}

\setlength{\droptitle}{-1in}
% \renewcommand{\refdash}{}



%% Make the style for Chapters and sections: handout
  %(fold)
  	 \makechapterstyle{default}{
     \renewcommand\thesection{\arabic{section}} 
    \setsecheadstyle{\large\scshape\MakeLowercase} 
    \setsubsecheadstyle{\normalsize\bfseries} 
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
    \maxsecnumdepth{chapter} 
    \setsecnumdepth{subsection}

    % reduce skip after section heading
    \setaftersecskip{1.7ex}
\setbeforesecskip{0.5\onelineskip}

    % set name of bibliography to 'references'
    \renewcommand{\bibname}{\mdseries\large\scshape\MakeLowercase References}

    % Title flush left
    \pretitle{\flushleft\large\scshape\vspace{.5\baselineskip}\MakeLowercase}
    \posttitle{}% \par\vspace{-0.5em}\rule[3pt]{\columnwidth}{.5pt}\vspace{0em}}
    \preauthor{\vspace{2pt}\flushleft\textsf\normalsize}
    \postauthor{}
    \predate{}
    \postdate{\vskip1.25em}

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
\makeoddhead{default}{}{}{\scshape\thepage}
\makeevenhead{default}{}{}{\scshape\thepage}
\makeevenfoot{default}{}{}{\vspace{.5in}{\scriptsize\textsf{\color{Gray} \courseshort \ // Problem set \psetnumber}}}
\makeoddfoot{default}{}{}{\vspace{.5in}{\scriptsize\textsf{\color{Gray} \courseshort \ // Problem set \psetnumber}}}

\makepagestyle{nopset}
\newcommand{\@nopsetmarks}{%
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
\makepsmarks{nopset}{\@nopsetmarks}
\makepsmarks{nopset}{}
\makeoddhead{nopset}{}{}{\scshape\thepage}
\makeevenhead{nopset}{}{}{\scshape\thepage}
\makeevenfoot{nopset}{}{}{\vskip 3em{\scriptsize\textsf{\color{Gray} \courseshort }}}
\makeoddfoot{nopset}{}{}{\vskip 3em{\scriptsize\textsf{\color{Gray} \courseshort }}}

\makepagestyle{exam}
\newcommand{\@exammarks}{%
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
\makepsmarks{exam}{\@exammarks}
\makepsmarks{exam}{}
\makeoddhead{exam}{}{}{\scshape\thepage}
\makeevenhead{exam}{}{}{\scshape\thepage}
\makeevenfoot{exam}{}{}{\vskip 3em{\scriptsize\textsf{\color{Gray} \courseshort \ // \examname }}}
\makeoddfoot{exam}{}{}{\vskip 3em{\scriptsize\textsf{\color{Gray} \courseshort \ // \examname }}}


%%(end)

%% Define timestamp using current time and date.
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}
\newcommand{\shorttoday}{\twodigits\month.\twodigits\day.\hspace{.1em}\number\year}
\dmyyyydate
\newcommand{\timestamp}{\shorttoday; \xxivtime}



\newcommand{\myoffice}{32-D834}
\newcommand{\myhomepage}{\href{http://web.mit.edu/apca/}{web.mit.edu/apca}}
\newcommand{\coursename}{Course name}
\newcommand{\courseshort}{}
\newcommand{\courseroom}{Room}
\newcommand{\courseweb}{course website}
\newcommand{\myaff}{}
\newcommand{\coursemeets}{}
\newcommand{\myem}{apca@mit.edu}
\date{}
\author{}
% \date{{\scriptsize\href{mailto:\myem}{\textsf\myem}}\\[.01em] {\scriptsize\textsc{\MakeTextLowercase\myoffice}}}
% \title{\coursename}



\newcommand{\myaffiliation}[1]{\renewcommand{\myaff}{#1}}
\newcommand{\myemail}[1]{\renewcommand{\myem}{#1}}
\newcommand{\website}[1]{\renewcommand{\courseweb}{\href{#1}{#1}}}
\newcommand{\course}[1]{\renewcommand{\coursename}{{#1}\xspace}}
\newcommand{\courseno}[1]{\renewcommand{\courseshort}{{#1}\xspace}}
\newcommand{\blurb}[1]{\renewcommand{\courseblurb}{#1}}
\newcommand{\meets}[1]{\renewcommand{\coursemeets}{#1}}
\newcommand{\room}[1]{\renewcommand{\courseroom}{#1}}
\newcommand{\term}[1]{% 
   \gdef\puBa{#1}}
\renewcommand{\maketitlehooka}{% 
       \par\noindent{\footnotesize\textsf\courseshort \ \also \footnotesize\textsf\puBa }} 
\newcommand{\puBa}{}
% \author{\thisterm}

\newcommand{\headernote}[1]{% 
   \gdef\puB{#1}
\renewcommand{\maketitlehooka}{% 
       \par\noindent{\scriptsize\textsf\puB}}} 
\newcommand{\puB}{}

\newcommand{\meetings}{Meetings: \textsc{\MakeTextLowercase\coursemeets}}
\newcommand{\coursewebsite}{Course website: \textsf\courseweb}
\newcommand{\pset}[1]{\renewcommand{\psetnumber}{#1}}
\newcommand{\psetnumber}{1}
\newcommand{\exam}[1]{\renewcommand{\examname}{#1}}
\newcommand{\examname}{Exam}


% Enumeratable list
\newcounter{probs}
\setcounter{probs}{1}
\newenvironment{problems}{%
  \begin{list}{\arabic{probs}.}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{.5em}
    \setlength{\itemsep}{.25em}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
    \usecounter{probs}
  }
}{\end{list}}

% Itemized list
\newenvironment{items}{%
  \begin{list}{\textbullet}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
  }
}{\end{list}}

\newcommand{\also}{{\color{BrickRed} // }}

\setlength{\marginparsep}{20pt}
\newcommand{\worth}[1]{\sidepar{\color{BrickRed}\textsf{{\scriptsize\vspace{-3.25em}\flushleft (#1)}}}}


\newcommand{\summary}[1]{
\vspace{.1\baselineskip}
\noindent
\hangpara{.25in}{0}{\footnotesize #1}
}

\newcommand{\toread}[1]{
\vspace{.2\baselineskip}
\noindent
\emph{Readings}: {#1}
}

\newcounter{meeting}
\setcounter{meeting}{1}

\newcommand{\session}{\paragraph{\color{BrickRed}\scriptsize Session \themeeting \stepcounter{meeting}}}
\newcommand{\stamp}[1]{\renewcommand{\timestamp}{#1}}

\newif\if@screen\@screentrue
\newif\if@print\@printtrue

\DeclareOption{screen}{\@screentrue \@printfalse}
\DeclareOption{print}{\@screenfalse \@printtrue}

\ExecuteOptions{screen}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax


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


\endinput

