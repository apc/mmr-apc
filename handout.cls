%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode
\ProvidesClass{handout}

\LoadClass[a4paper,11pt,oneside,article]{memoir}
\usepackage{apc-basic}
\usepackage{xstring}

\def\@location{}
\newcommand*{\location}[1]{%
  \gdef\@location{#1}%
}

\def\@email{}
\newcommand*{\myemail}[1]{%
  \gdef\@email{#1}%
}

\def\@term{\textsc{term}}
\newcommand*{\term}[1]{%
  \gdef\@term{#1}%
}

\def\@course{\textsc{course}}
\newcommand*{\course}[1]{%
    \gdef\@course{#1}%
}

\def\@affiliation{}
\newcommand*{\myaffiliation}[1]{%
  \gdef\@affiliation{#1}%
}

% The definitions below are adapted from:
% http://tex.stackexchange.com/questions/44919/proper-way-to-detect-empty-blank-text
\newcommand{\DoIfNoText}[1]{%
  \begingroup
  \sbox0{#1}%
  \ifdim\wd0=\z@
    \endgroup
    \expandafter\@gobble
  \else
    \endgroup
    \expandafter\@firstofone
  \fi}

\def\@mysubtitle{}
\newcommand*{\subtitle}[1]{%
 \DoIfNoText{#1}{%
    \gdef\@mysubtitle{\ignorespaces#1}%
    }
}


% \setlrmarginsandblock{.5in}{.5in}{*}
% \setulmarginsandblock{.75in}{.98in}{*}
% % \setheadfoot{\onelineskip}{.75in} 
% \setheaderspaces{\onelineskip}{*}{*}
% \settrims{0pt}{0pt}
% \setbinding{0pt}
% \checkandfixthelayout

\setlrmarginsandblock{1.25in}{*}{1.2}
\setulmarginsandblock{1in}{*}{1}
% \setheadfoot{\onelineskip}{.75in} 
\setheaderspaces{\onelineskip}{*}{*}
\settrims{0pt}{0pt}
\setbinding{0pt}
\checkandfixthelayout

\setlength{\parindent}{0pt}

\abnormalparskip{0.5em}
\nonzeroparskip

\AtBeginDocument{
\setlength{\Extopsep}{0pt}
\setlength{\Exlabelsep}{.66em}
\setlength{\SubExleftmargin}{1.2em}
}

\makechapterstyle{handout}{
    \renewcommand\thesection{\scshape\arabic{section}} 
  \setsecnumformat{\large\scshape\MakeLowercase{\csname the##1\endcsname}. \;}
    \setsecheadstyle{\large\scshape\MakeLowercase} 
    \setsubsecheadstyle{\normalsize\itshape} 
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
    \setsecnumdepth{section}
  
    % reduce skip after section heading
    \setaftersecskip{1.7ex}

    % set name of bibliography to 'references'
    \renewcommand{\bibname}{\normalsize\scshape\MakeLowercase References}

    % Title flush left
    \pretitle{\vskip 6em\flushleft\Large\scshape\MakeLowercase}
    \posttitle{\par\vspace{0.65em}}
    \preauthor{\flushleft\small}
    \postauthor{\par\vspace*{0.6em}}
    \predate{\flushleft\scriptsize}
    \postdate{\par\vskip 2em}

    % 'abstract' bigger skip from title
    \renewcommand{\abstractname}{\normalfont\scriptsize}
  \renewcommand{\abstracttextfont}{\normalfont\scriptsize}
    %\abstractrunin

   }

\newif\if@talk\@talktrue
\newif\if@quiz\@quiztrue

\DeclareOption{talk}{\@quizfalse \@talktrue}
\DeclareOption{quiz}{\@quiztrue \@talkfalse}

\ExecuteOptions{talk}

\ProcessOptions\relax

\let\oldmaketitle\maketitle

\if@talk
\renewcommand*{\maketitle}{
\begin{center}
{\LARGE\textsc{\MakeLowercase\@title}}  \\[.35\baselineskip]
\DoIfNoText{\@mysubtitle}{%
\large\emph{\@mysubtitle} \par%
}
%\DoIfNoText{\subtitle}{\large\emph{\@mysubtitle} \par\vskip{.35\baselineskip}}
{\footnotesize \@author{} \ \textbullet  \ \ \texttt{\@email{}} \ $\divides$ \ \smallcaps{\@location{}} \ \textbullet \ \ \smallcaps{\@date} }
\end{center}
\vspace{.1\baselineskip}
}
\else\relax
\fi
\if@quiz
\renewcommand*{\maketitle}{
{\large\textsc{\MakeLowercase\@course \ $\divides$ \MakeLowercase\@term}} \hfill {\large\textsc{\MakeLowercase\@title}} \\[.5\baselineskip]
{\footnotesize\textsf{NetID:}~ \rule[-.5mm]{21.5mm}{.05pt}}  \hfill {\footnotesize\textsc{\MakeLowercase{\@date}}}\par
%\vspace{.15\baselineskip}
%\noindent
%{\scriptsize\textsf{NetID:}~ \rule[-.5mm]{33.5mm}{.05pt}}\par
%{\hspace{-.75cm}\scriptsize\textsf{NetID:}~ \rule[-1mm]{50mm}{.1pt}} \par
%{\hspace*{-.7cm}\scriptsize\textsf{NetID:}~ \rule[-1mm]{20mm}{.1pt} }\par
%\hrule
\bigskip

\bigskip

\bigskip
}
\else\relax
\fi

