% author: Nawat Ngerncham, MUIC
% based on ICT-Mahidol/MahidolThesis commit #4feb2c2
% i.e. version 0.142 from 2021/10/14
%
% second author: Ekasit Kijsipongse, Faculty of ICT, Mahidol University
% based on the original class file version 2006/12/20 v0.48 from Allen.
%
% original author: Michael A. Allen, Physics Department, Mahidol University
% email:  maa_software@yahoo.co.uk / frmaa"at"mahidol.ac.th
% webpage: einstein.sc.mahidol.ac.th/~scmal/LaTeX/
% adapted from: /usr/share/texmf/tex/latex/base/report.cls and Thai Latex
% also /usr/share/texmf/tex/latex/natbib/natbib.sty

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muthesis2024}[2024/04/01 Mahidol University International College]
\LoadClass[12pt]{report}

% loading packages
\RequirePackage{times} % Times New Roman
\RequirePackage{ifthen}
\usepackage[bookmarks]{hyperref}
\newboolean{@natbibmode}\setboolean{@natbibmode}{false}
\DeclareOption{natbib}{ \setboolean{@natbibmode}{true} }
\ProcessOptions\relax
\if@natbibmode
  \RequirePackage{natbib}
  \bibpunct{(}{)}{;}{a}{}{,}
\else
\fi

% margins
\textwidth 147.5mm
\textheight 234.5mm
% \oddsidemargin 12mm
% \evensidemargin 12mm
% \setlength{\parindent}{1cm}
% \setlength{\parskip}{0.5em}
% \topmargin{-1.5mm}
\addtolength{\headsep}{1.5mm}
\newlength{\refbaselineskip}
\setlength{\refbaselineskip}{\baselineskip}
\newcommand{\linespacing}[1]{\baselineskip=#1\refbaselineskip}
\newlength{\@topskipsave}
\renewcommand{\@tocrmarg}{2.55em plus1fil}

% renew enumerate environment
\let\old@enumerate\enumerate
\let\old@endenumerate\endenumerate
\def\formatEnumerate{
  \leftskip=1.5cm
  \parskip=0em
}
\renewenvironment{enumerate}{\old@enumerate\formatEnumerate}{\old@endenumerate}

% renew itemize environment
\let\old@itemize\itemize
\let\old@enditemize\enditemize
\def\formatItemize{
  \leftskip=1.5cm
  \topsep=0pt
  \partopsep=0em
  \parskip=0em
  \itemsep=0cm
}
\renewenvironment{itemize}{\old@itemize\formatEnumerate}{\old@enditemize} 


% following taken from textcase.sty with extra `%' added to prevent
% extraneous space at start of output from \MakeTextUppercase
\def\@uclcnotmath#1#2#3#4{\begingroup
      #1%
      \def\({$}\let\)\(%$
      \def\NoCaseChange##1{\noexpand\NoCaseChange{\noexpand##1}}%
      \@nonchangecase\label%
      \@nonchangecase\ref%
      \@nonchangecase\ensuremath%
      \def\cite##1##{\toks@{\noexpand\cite##1}\@citex}%
      \def\@citex##1{\NoCaseChange{\the\toks@{##1}}}%
      \def\reserved@a##1##2{\let#2\reserved@a}%
      \expandafter\reserved@a\@uclclist\reserved@b{\reserved@b\@gobble}%
      \protected@edef\reserved@a{\endgroup%
          \noexpand\@skipmath#3#4$\valign$}%
      \reserved@a}%
\def\@nonchangecase#1{\def#1##1{\NoCaseChange{#1{##1}}}}%
\let\NoCaseChange\@firstofone%
\def\@skipmath#1#2$#3${%
  \@skip@nonchangecase#1#2\NoCaseChange\valign%
  \ifx\valign#3%
  \else%
    $#3$%
    \expandafter\@skipmath\expandafter#1%
  \fi}%
\def\@skip@nonchangecase#1#2\NoCaseChange#3{%
  #1{#2}%
  \ifx\valign#3%
  \else
    #3%
    \expandafter\@skip@nonchangecase\expandafter#1%
  \fi}
\DeclareRobustCommand\MakeTextUppercase{%
\@uclcnotmath{\def\i{I}\def\j{J}}{##1##2}\uppercase}
\protected@edef\MakeTextUppercase#1{\MakeTextUppercase{#1}}

\renewcommand\bibname{References}

% draft mode
\newboolean{@draftmode}\setboolean{@draftmode}{false}
\newcommand{\draft}{\setboolean{@draftmode}{true}}
\newboolean{@notitlepage}\setboolean{@notitlepage}{false}
\newcommand{\notitlepage}{\setboolean{@notitlepage}{true}}

% information for front page
\newcommand{\candidate}[1]{\def\@candidate{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}
  \ifthenelse{\equal{\@degree}{B.Sc.}}
	{\def\@degree{B.Sc.} \def\@fulldegree{Bachelor of Science}}
	{\def\@degree{Ph.D.} \def\@fulldegree{Doctor of Philosophy}}
  % you are either B.Sc. or Ph.D. --- no in-betweens :)
}
\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\submissionyear}[1]{\def\@submissionyear{#1}}
\newcommand{\isbn}[1]{\def\@isbn{#1}}
\newcommand{\@TITLE}{\MakeTextUppercase{\@title}}

% information for page i
\newcommand{\candidatetitle}[1]{\def\@candidatetitle{#1}}
\newcommand{\majoradvisor}[1]{\def\@majoradvisor{#1}}
\newcommand{\majoradvisortitle}[1]{\def\@majoradvisortitle{#1}}
\newcommand{\majoradvisorletters}[1]{\def\@majoradvisorletters{#1}}
\newcommand{\majoradvisorsubject}[1]{\def\@majoradvisorsubject{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}
\newcommand{\coadvisortitle}[1]{\def\@coadvisortitle{#1}}
\newcommand{\coadvisorletters}[1]{\def\@coadvisorletters{#1}}
\newcommand{\coadvisorsubject}[1]{\def\@coadvisorsubject{#1}}
\newcommand{\coadvisorstatus}[1]{\def\@coadvisorstatus{#1}}
\newcommand{\coadvisorII}[1]{\def\@coadvisorII{#1}}
\newcommand{\coadvisorIItitle}[1]{\def\@coadvisorIItitle{#1}}
\newcommand{\coadvisorIIletters}[1]{\def\@coadvisorIIletters{#1}}
\newcommand{\coadvisorIIsubject}[1]{\def\@coadvisorIIsubject{#1}}
\newcommand{\coadvisorIII}[1]{\def\@coadvisorIII{#1}}
\newcommand{\coadvisorIIItitle}[1]{\def\@coadvisorIIItitle{#1}}
\newcommand{\coadvisorIIIletters}[1]{\def\@coadvisorIIIletters{#1}}
\newcommand{\coadvisorIIIsubject}[1]{\def\@coadvisorIIIsubject{#1}}
\newcommand{\programchair}[1]{\def\@programchair{#1}}
\newcommand{\programchairqual}[1]{\def\@programchairqual{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\facultyI}[1]{\def\@facultyI{#1}}
\newcommand{\facultyII}[1]{\def\@facultyII{#1}}
\newcommand{\graduatestudiesdean}[1]{\def\@graduatestudiesdean{#1}}
\newcommand{\GSDqual}[1]{\def\@GSDqual{#1}}
\newcommand{\GSDstatus}[1]{\def\@GSDstatus{#1}}

% information for page ii
\newcommand{\submissiondate}[1]{\def\@submissiondate{#1}}
\newcommand{\chair}[1]{\def\@chair{#1}}
\newcommand{\chairqual}[1]{\def\@chairqual{#1}}
\newcommand{\memberI}[1]{\def\@memberI{#1}}
\newcommand{\memberIqual}[1]{\def\@memberIqual{#1}}
\newcommand{\memberII}[1]{\def\@memberII{#1}}
\newcommand{\memberIIqual}[1]{\def\@memberIIqual{#1}}
\newcommand{\memberIII}[1]{\def\@memberIII{#1}}
\newcommand{\memberIIIqual}[1]{\def\@memberIIIqual{#1}}
\newcommand{\memberIV}[1]{\def\@memberIV{#1}}
\newcommand{\memberIVqual}[1]{\def\@memberIVqual{#1}}
\newcommand{\memberV}[1]{\def\@memberV{#1}}
\newcommand{\memberVqual}[1]{\def\@memberVqual{#1}}
\newcommand{\facultydean}[1]{\def\@facultydean{#1}}
\newcommand{\FDqual}[1]{\def\@FDqual{#1}}
\newcommand{\FDstatus}[1]{\def\@FDstatus{#1}}

% information for page iv (ABSTRACT)
\newcommand{\candidatenumber}[1]{\def\@candidatenumber{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newboolean{@longsubject}\setboolean{@longsubject}{false}
\newcommand{\longsubject}{\setboolean{@longsubject}{true}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\keywordsII}[1]{\def\@keywordsII{#1}}
\newcommand{\keywordsIII}[1]{\def\@keywordsIII{#1}}

% information for Biography
\newcommand{\dateofbirth}[1]{\def\@dateofbirth{#1}}
\newcommand{\placeofbirth}[1]{\def\@placeofbirth{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}

\newcommand{\homeaddress}[1]{\def\@homeaddress{#1}}
\newcommand{\homeaddressLnII}[1]{\def\@homeaddressLnII{#1}}
\newcommand{\homeaddressLnIII}[1]{\def\@homeaddressLnIII{#1}}
\newcommand{\position}[1]{\def\@position{#1}}
\newcommand{\workplace}[1]{\def\@workplace{#1}}
\newcommand{\workplaceLnII}[1]{\def\@workplaceLnII{#1}}

\newcommand{\highschool}[1]{\def\@highschool{#1}}
\newcommand{\highschoolYears}[1]{\def\@highschoolYears{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\universityYears}[1]{\def\@universityYears{#1}}
\newcommand{\universityII}[1]{\def\@universityII{#1}}
\newcommand{\universityIIYears}[1]{\def\@universityIIYears{#1}}

% DEFAULTS
\degree{}
\submissionyear{\number\year}
\isbn{}
\coadvisor{}
\coadvisorstatus{Co-advisor}
\coadvisortitle{Dr.\ }
\coadvisorletters{}
\coadvisorsubject{}
\coadvisorII{}
\coadvisorIItitle{Dr.\ }
\coadvisorIIletters{}
\coadvisorIIsubject{}
\coadvisorIII{}
\coadvisorIIItitle{Dr.\ }
\coadvisorIIIletters{}
\coadvisorIIIsubject{}
\graduatestudiesdean{}
\GSDqual{}
\GSDstatus{}
\chair{}
\memberI{}
\memberIqual{}
\memberII{}
\memberIIqual{}
\memberIII{}
\memberIIIqual{}
\memberIV{}
\memberIVqual{}
\memberV{}
\memberVqual{}
\facultydean{Prof. Chulathida Chomchai}
\FDqual{M.D.}
\FDstatus{}
\major{}
\keywordsII{}
\keywordsIII{}
\position{}
\workplace{}
\workplaceLnII{}
\homeaddress{}
\homeaddressLnII{}
\homeaddressLnIII{}
\email{}
\phone{}

\highschool{}
\highschoolYears{}
\university{Mahidol University International College}
\universityYears{}
\universityII{}
\universityIIYears{}

% alternative heading used for CONTENTS (CONT.), etc
\newcommand{\@althead}{}
% heading used for Appendix section
\newcommand{\@appname}{}

\def\@facgradstud{Mahidol University International College}
\def\@sigdots{..........................................}
\newcommand{\@sbx}[1]{\parbox[t]{70mm}{\raggedright\@sigdots\\#1}}
\newlength{\@halftextwidth}
\@halftextwidth=0.53\textwidth
\def\@thesisentitled{Thesis \\ entitled \\
	\large \bfseries \@TITLE \\ 
	\normalsize\rm
}
\author{\@candidate}

\renewcommand\maketitle{
  \par
	\begingroup
	\renewcommand\thefootnote{\@fnsymbol\c@footnote}
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}
  \long\def\@makefntext##1{\parindent 1em\noindent
  \hb@xt@1.8em{
    \hss\@textsuperscript{\normalfont\@thefnmark}}##1
  }
	\if@twocolumn
	\ifnum \col@number=\@ne
        \@maketitle
      	\else
        \twocolumn[\@maketitle]%
	\fi
	\else
	\newpage
	\global\@topnum\z@   % Prevents figures from going at top of page.
      	\@maketitle
    	\fi
    	\thispagestyle{empty}\@thanks
  	\endgroup
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	% \global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}


\def\@maketitle{
  % ========== TITLE PAGE ==========
	\newpage
	\thispagestyle{empty}
	\begin{center}
    \large \bfseries \@TITLE \par
  	\null
  	\vskip 2em
    \if@draftmode\@author\vskip 2em\else
  	\let \footnote \thanks
    \vskip 11.5em
    {
      \large
      \lineskip .5em
      \begin{tabular}[t]{c}
        \MakeUppercase\@author
      \end{tabular}\par
    }
    \vfill
    {
      \large % US spelling is FULFILLMENT 
      A SENIOR PROJECT SUBMITTED IN PARTIAL \\ 
      FULFILLMENT OF THE REQUIREMENTS FOR THE \\ 
      DEGREE OF \MakeUppercase\@fulldegree \\ 
      (\MakeUppercase\@subject) \\
      MAHIDOL UNIVERSITY INTERNATIONAL COLLEGE \\
      MAHIDOL UNIVERSITY \\
      \@submissionyear \\ \mbox{}\\
      \ifthenelse{\equal{\@isbn}{}}{\mbox{} \\}{ISBN~\@isbn \\}
      COPYRIGHT OF MAHIDOL UNIVERSITY
    } 
  \end{center}

  % ======== THESIS COMMITTEE =========
	\newpage
	\thispagestyle{empty}
	\begin{center}
    \@thesisentitled \vskip 1em
    was submitted to the Mahidol University International College,
    Mahidol University \\ for the degree of \@fulldegree\  
    (\@subject) \\ on \\
    \@submissiondate \\ \vfill
    \begin{tabbing}
      \hspace{\@halftextwidth}
      \=\@sbx{ \@candidatetitle \@candidate \\ Candidate }
      \\ \\ \\ \\
      \>\@sbx{
        \@majoradvisortitle \@majoradvisor \\
        Advisor
      }
      \\ \\ \\ \\
      \@sbx{
        \@chair, \@chairqual \\
        Chair of Science Division \\ 
        Mahidol University International College \\ 
        Mahidol University
      }
      \>\@sbx{
        \@programchair, \@programchairqual \\
        Program Director \\
        Bachelor of Science in Computer Science \\
        Mahidol University International College \\
        Mahidol University
      }
    \end{tabbing}
  \end{center}
}

\newcommand{\acknowledgements}[1]{
  \chapter*{Acknowledgements}
	\thispagestyle{myheadings}
  \markright{\footnotesize\hfil\thepage}
	\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
  #1
  \vfill\hfill\@candidate
}

\def\@abstractbox{
	\thispagestyle{myheadings}
	\markright{
    \hspace*{-0.03\textwidth}
    \protect\raisebox{-10mm}{
      \fbox{
        \protect\rule[-0.99\textheight]{0pt}{0pt}
        \hspace*{1.0\textwidth}
      }
    }
	}
}

\renewcommand{\abstract}[1]{
	\newpage
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\@abstractbox
  \noindent\sloppy
  \@TITLE \\ \vspace{-1mm} \\%
  \MakeUppercase\@candidate~~\@candidatenumber \\ \vspace{-1mm} \\%
	\@degree\ (\MakeUppercase\@subject) 
	\ifthenelse{\equal{\@degree}{M.Sc.}}{
	\ifthenelse{\equal{\@degree}{B.Sc.}}
	{}{MAJOR IN \MakeUppercase\@major}}{} \\
  \vspace{-1em}
  \begin{flushleft}
    SENIOR PROJECT ADVISOR:
    \MakeUppercase{\@majoradvisortitle \@majoradvisor},
    \@majoradvisorletters
    \ifthenelse{\equal{\@coadvisor}{}}{}{
      , \MakeUppercase\@coadvisor, \@coadvisorletters
    }
    \ifthenelse{\equal{\@coadvisorII}{}}{}{
      , \MakeUppercase\@coadvisorII, \@coadvisorIIletters\
    } \\
  \end{flushleft}
  \vspace{-3ex}
	\begin{center} ABSTRACT \end{center}
	\vspace{-0.8em}
	\par #1
	\begin{center}
    \vspace{1em}
    \begin{tabbing}
      KEY WORDS~: \= \MakeTextUppercase\@keywords \\ 
      \ifthenelse{\equal{\@keywordsII}{}}{}{
        \> \MakeTextUppercase\@keywordsII\\ 
      }
      \ifthenelse{\equal{\@keywordsIII}{}}{}{
        \> \MakeTextUppercase\@keywordsIII\\
      }
      \\
      \vspace{-5mm}%
      \pageref{biography}\ pages %pp\@. ISBN~\@isbn                % pp. and ISBN in abstract page
    \end{tabbing}\fussy
  \end{center}
  \linespacing{1.5}
  \fi
}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
	\pagestyle{headings}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter
}


% used to make optional argument the heading only (not the toc entry)
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@      % extra vertical space between chapters in table of contents, ekasit
    \setlength\@tempdima{3.00cm}%   % left indent for chapter titles in table of contents, ekasit
    \begingroup
      \parindent \z@ \rightskip \@tocrmarg
      \parfillskip -\rightskip
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}

\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
	\refstepcounter{chapter}%
	\typeout{\@chapapp\space\thechapter.}%
	\ifthenelse{\equal{\@appname}{}}{%
		\addcontentsline{toc}{chapter}{%
			\protect\numberline{\MakeTextUppercase{\@chapapp}\ \@Roman\thechapter}%
			\texorpdfstring{\MakeTextUppercase{#1}}{#1}%
		}% CHAPTER I .....
	}{%
		\addcontentsline{toc}{chapter}{%
			\hspace{1.5em} \protect\numberline{\MakeTextUppercase{\@chapapp}\ \thechapter}%
			\texorpdfstring{\MakeTextUppercase{#1}}{#1}%
		}% APPENDIX A ....
	}
	\else
	\addcontentsline{toc}{chapter}{#1}% 
	\fi
	\chaptermark{\texorpdfstring{#1}{Title for PDF bookmarks}}%
    %\addtocontents{lof}{\protect\addvspace{10\p@}}%
    %\addtocontents{lot}{\protect\addvspace{10\p@}}%
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
      \@afterheading
    \fi
  }

\def\@makechapterhead#1{
	\ifthenelse{\equal{\thechapter }{1}}{\renewcommand{\@althead}{}
  \pagestyle{headings}
  \pagenumbering{arabic}}{}
  \ifthenelse{\equal{\thechapter}{A}}{\renewcommand{\@althead}{}}{}
  \vspace*{5\p@}
  {
    \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \begin{center}
      \large\bfseries
      \linespacing{1.6}
      \MakeTextUppercase\@chapapp\space \ifthenelse{\equal{\@appname}{}}{\@Roman}{}\thechapter \\
      \MakeTextUppercase{#1}\par\nobreak    % chapter title, ekasit
    \end{center}
    \vskip 1.3cm     % add up space to get about 2 cm after chapter title, ekasit
  }
}

\def\@schapter#1{
	\if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]
	\else
    \@makeschapterhead{#1}
    \@afterheading
	\fi
}

\def\@makeschapterhead#1{
	\vspace*{5\p@}
	{
    \parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \begin{center}
    \large \bfseries\MakeTextUppercase{#1}\par\nobreak
    \end{center}
    \vskip 1.3cm
  }
}

\renewcommand\section{%
	\@startsection {section}{1}{\z@}%
  {-8.5ex \@plus -1ex \@minus -.2ex}% space above heading
  %{0.1ex \@plus.1ex}% space below heading
  {1ex \@plus4.7ex}% space below heading
  {\normalfont\large\bfseries}%
}

\renewcommand\subsection{%
	\@startsection{subsection}{2}{\parindent}%
  {-4.7ex\@plus -.2ex \@minus -.2ex}%
	{0.1ex \@plus .1ex}%
	{\normalfont\normalsize\bfseries}%
}

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{4cm}%
  {-1.3ex\@plus -.1ex \@minus -.1ex}%
	{0.1ex \@plus .1ex}%
  {\normalfont\normalsize}%
}

\def\ps@headings{
	\topskip\@topskipsave
	\let\@oddfoot\@empty
	\def\@oddhead{\footnotesize\ifthenelse{\equal{\@althead}{}}{%
	\ifodd\value{page}{\@facgradstud}\else\@candidate \fi 
	\hfil 
        \ifthenelse{\equal{\@appname}{}}{%
     	\ifodd\value{page} \@degree\ (\@subject)\ \else \rightmark\
	    \fi}{\@appname} / \thepage}	
	{\@althead\thepage}}
	\let\@mkboth\markboth
	\def\chaptermark##1{%
	\markright { ##1}}
}

\def\ps@myheadings{
	\topskip\@topskipsave
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}
	\def\@oddhead{\rightmark}
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
}

% Special continued titles for table of contents, list of figures, and list of tables 
\def\ps@continued{%
  \let\@mkboth\@gobbletwo
  \@topskipsave\topskip
  \topskip 35mm
  \def\@oddhead{\parbox[t]{\textwidth}{\raisebox{-13.5mm}{\large \bfseries \@althead}%
  \footnotesize\hfill\thepage \\ 
  \normalsize \bfseries \mbox{ } \hfill  \raisebox{-24mm}{Page}}}
  \let\@evenhead\@oddhead
  \def\@evenfoot{}
  \def\@oddfoot{}
}
\def\ps@figurecontinued{%
  \let\@mkboth\@gobbletwo
  \@topskipsave\topskip
  \topskip 35mm
  \def\@oddhead{\parbox[t]{\textwidth}{\raisebox{-13.5mm}{\large \bfseries \@althead}%
  \footnotesize\hfill\thepage \\ 
  \normalsize \bfseries \raisebox{-24mm}{Figure} \hfill  \raisebox{-24mm}{Page}}}
  \let\@evenhead\@oddhead
  \def\@evenfoot{}
  \def\@oddfoot{}
}

\def\ps@tablecontinued{%
  \let\@mkboth\@gobbletwo
  \@topskipsave\topskip
  \topskip 35mm
  \def\@oddhead{\parbox[t]{\textwidth}{\raisebox{-13.5mm}{\large \bfseries \@althead}%
  \footnotesize\hfill\thepage \\ 
  \normalsize \bfseries \raisebox{-24mm}{Table} \hfill  \raisebox{-24mm}{Page}}}
  \let\@evenhead\@oddhead
  \def\@evenfoot{}
  \def\@oddfoot{}
}

\renewcommand\tableofcontents{
\if@draftmode\else
	\if@twocolumn
    \@restonecoltrue\onecolumn
	\else
    \@restonecolfalse
	\fi
 	\chapter*{\contentsname}
	\renewcommand{\@althead}{\hspace{0.35\textwidth}CONTENTS~(cont.)\hfil}
	\pagestyle{continued}
  \thispagestyle{myheadings}
  \markright{\footnotesize\hfil\thepage}
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
\fi
}

\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand\listoffigures{
	\if@draftmode\else
		\if@twocolumn
      \@restonecoltrue\onecolumn
		\else
      \@restonecolfalse
		\fi
		\chapter*{\listfigurename}
    \renewcommand{\@althead}{\hspace{0.3\textwidth}LIST OF FIGURES~(cont.)\hfil}
		\pagestyle{figurecontinued}
    \thispagestyle{myheadings}
    \markright{\footnotesize\hfil\thepage}
		\addcontentsline{toc}{chapter}{\listfigurename}
		\@starttoc{lof} % must go after addcontentsline
		\if@restonecol\twocolumn\fi
	\fi
}

\newcommand{\abbrlist}{%
	\singlespacing
	\chapter*{\uppercase{LIST OF ABBREVIATIONS}}
}

\newcommand{\symlist}{%
	\singlespacing
	\prelim@contents{List of Symbols}
	\chapter*{LIST OF SYMBOLS}
}

\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand\listoftables{
  \if@draftmode\else
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}
    \renewcommand{\@althead}{\hspace{0.3\textwidth}LIST OF TABLES~(cont.)\hfil}
    \pagestyle{tablecontinued}
    \thispagestyle{myheadings}
    \markright{\footnotesize\hfil\thepage}
    \addcontentsline{toc}{chapter}{\listtablename}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
  \fi
}

\newcommand\appendices{
  \if@draftmode\else\newpage\mbox{}\vskip 9cm
    \renewcommand{\@althead}{\@facgradstud\hfil\@degree\ (\@subject)\ / }
    \renewcommand{\@appname}{Appendices}
    \addcontentsline{toc}{chapter}{APPENDICES}   
    \begin{center}{\large\bf APPENDICES}\end{center}
    \par
  \fi
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}%
}

\renewcommand\appendix{
  \if@draftmode\else\newpage\mbox{}\vskip 9cm
    \renewcommand{\@althead}{\@facgradstud\hfil\@degree\ (\@subject)\ / }
    \renewcommand{\@appname}{Appendix}
    \addcontentsline{toc}{chapter}{APPENDIX}   
    \begin{center}{\large\bf APPENDIX}\end{center}
    \par
  \fi
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
}

\renewenvironment{thebibliography}[1]{
	\chapter*{\bibname}
	\addcontentsline{toc}{chapter}{\MakeUppercase{\bibname}}
	\markright{\bibname}
	\renewcommand{\@appname}{}
	\ifthenelse{\boolean{@natbibmode}}{%
		\list{\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
			\setcounter{NAT@ctr}{0}}%
		\ifNAT@openbib
      \renewcommand\newblock{\par}
		\else
      \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
		\fi
		\sloppy\clubpenalty4000\widowpenalty4000
		\sfcode`\.=1000\relax
		\let\citeN\cite \let\shortcite\cite
		\let\citeasnoun\cite
  }{
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {
      \settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin 2cm
      \addtolength{\itemindent}{\labelwidth}
      \addtolength{\itemindent}{-2cm}
      \advance\leftmargin\labelsep%
      \@openbib@code%
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}
    }%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
  }
}{
  \ifthenelse{\boolean{@natbibmode}}{%
    \def\@noitemerr{%
      \PackageWarning{natbib}
      {Empty `thebibliography' environment}
    }%
    \endlist\vskip-\lastskip
  }{
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
  }
}

% === BIOGRAPHY PAGE ===
\newcommand{\biography}{
  \chapter*{Biography}
  \markright{Biography}
	\label{biography}
	\addcontentsline{toc}{chapter}{BIOGRAPHY}
	\begin{tabbing}
    {\bf NAME} \hspace{5.5cm}\=\@candidatetitle \@candidate \\
    {\bf DATE OF BIRTH} \>\@dateofbirth \\
    {\bf PLACE OF BIRTH} \>\@placeofbirth \\
    {\bf INSTITUTIONS ATTENDED}
      % highschool
      \>\@highschool \\
      \>(\@highschoolYears) \\
      % MUIC
      \>\@university \\ 
      \>(\@universityYears) \\ 
      \ifthenelse{\equal{\@universityII}{}}{}{%
        \>\@universityII \\
        \>(\@universityIIYears) \\
      }
    {\bf HOME ADDRESS}
      \>\@homeaddress \\
      \ifthenelse{\equal{\@homeaddressLnII}{}}{}{%
        \>\@homeaddressLnII \\
      }
      \ifthenelse{\equal{\@homeaddressLnIII}{}}{}{%
        \>\@homeaddressLnIII \\
      }
      \>Tel. \@phone \\
      \>E-mail: \@email \\
	\end{tabbing}
}

\pagestyle{headings}
\AtBeginDocument{\pagenumbering{roman}}

% Let the first paragraph indent
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue

% Add field names after titles of TOC,LOF,LOT
\addtocontents{toc}{ \protect \contentsline{chapter}{}{\textbf{Page}}{}}
\addtocontents{lot}{ \protect \contentsline{chapter}{Table}{\textbf{Page}}{}}
\addtocontents{lof}{ \protect \contentsline{chapter}{Figure}{\textbf{Page}}{}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\renewcommand*\l@table{\@dottedtocline{1}{0em}{2.3em}}
%\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
%\renewcommand*\l@table{\@dottedtocline{1}{0em}{2.3em}}
%\renewcommand*\l@chapter{\@dottedtocline{0}{0em}{2.3em}}
