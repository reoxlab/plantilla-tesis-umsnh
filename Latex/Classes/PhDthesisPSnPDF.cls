
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2007/09/06 v2 PhD thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, letterpaper]{book}
\else
   \LoadClass[pdftex, letterpaper]{book}
\fi

%:------------------------- PAQUETES  -----------------------
\usepackage{amssymb, amsmath, amsbsy, amsfonts}
\usepackage[utf8]{inputenc}
\usepackage{listings}
%\usepackage{emptypage}
\usepackage{wrapfig}
\usepackage[margin=10pt,font=small,labelfont=bf]{caption}
\usepackage[bf,SL,BF]{subfigure}
%\usepackage{makeidx}
%\usepackage[style=list,toc,number=none]{glossary}
\usepackage{mathdots}
\usepackage{mathrsfs}

\raggedbottom%Evita que LaTeX distribuya los espacios en blanco sobre la página, en lugar de eso los envía al fondo

\usepackage{fancyhdr}
\usepackage{eucal}
\usepackage[spanish,mexico]{babel}
\usepackage{float}
\usepackage{color}
\usepackage[perpage]{footmisc}
\usepackage{ifthen}
\usepackage{multicol}
\setlength{\columnsep}{20pt}
\usepackage{multirow}

\usepackage[nottoc]{tocbibind}
%\usepackage{nextpage}
\usepackage{titlesec}
%sirve para insertar un epigrafe en capitulo
\usepackage{epigraph}
\setlength\epigraphwidth{8cm}
\setlength\epigraphrule{0pt}

\usepackage{caption}
\captionsetup[figure]{font=small,labelfont=small}
% agrega espacio entre pagrafos
\usepackage{parskip}
%\setlength{\parskip}{4mm}

%\usepackage{cleveref}           %COMO UNA FORMA DE REFERENCIAR TABLAS, ECUACIONES, ETC.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            REDEFINIENDO EL FORMATO DE LOS CAPITULOS             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\bigrule}{\titlerule[0.5mm]}
\titleformat{\chapter}[display] % CAMBIAMOS EL FORMATO DE LOS CAPÍTULOS
%{\bfseries\Huge} % por defecto se usarán caracteres de tamaño \Huge en negrita
{\Huge} % por defecto se usarán caracteres de tamaño \Huge en negrita
{% contenido de la etiqueta
\titlerule % línea horizontal
\filleft % texto alineado a la derecha
\Large\chaptertitlename\ % "Capítulo" o "Apéndice" en tamaño \Large en lugar de \Huge
\Large\thechapter} % número de capítulo en tamaño \Large
{0mm} % espacio mínimo entre etiqueta y cuerpo
{\filleft} % texto del cuerpo alineado a la derecha
[\vspace{0.5mm} \bigrule] % después del cuerpo, dejar espacio vertical y trazar línea horizontal gruesa


%:-------------------------- Glossary/Abbrev./Symbols -----------------------
%\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
%\nomrefpage % to include page numbers after abbrevations
%\renewcommand{\nomname}{Glossary} % rename nomenclature
%\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
%\makenomenclature % used to be \makeglossary
%\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary

% used to be for sorting into categories:
%\renewcommand\nomgroup[1]{%
%  \ifthenelse{\equal{#1}{A}}{%
%   \item[\textbf{Roman Symbols}] }{%             A - Roman
%    \ifthenelse{\equal{#1}{G}}{%
%     \item[\textbf{Greek Symbols}]}{%             G - Greek
%      \ifthenelse{\equal{#1}{R}}{%
%        \item[\textbf{Superscripts}]}{%              R - Superscripts
%          \ifthenelse{\equal{#1}{S}}{%
%           \item[\textbf{Subscripts}]}{{%             S - Subscripts
%	    \ifthenelse{\equal{#1}{X}}{%
%	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
%	    \ifthenelse{\equal{#1}{Z}}{%
%	     \item[\textbf{Acronyms}]}%              Z - Acronyms
%              			{{}}}}}}}}}}


%:-------------------------- PDF/PS setup -----------------------

%if you use a macTeX 2008 or later, use the ifpdf package
\usepackage{ifpdf}
\ifpdf

    \usepackage[ pdftex, plainpages = false, pdfpagelabels,
                 pdfpagelayout = OneColumn, % display single page, advancing flips the page - Sasa Tomic
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}

    \pdfcompresslevel=9
    %\graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = Azul,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
    %\graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi



%:-------------------------- page layout -----------------------

%letterpaper settings
\ifpdf
   \pdfpageheight=279.4mm
   \pdfpagewidth=215.9mm
\else
   \setlength{\paperheight}{279.4mm}
   \setlength{\paperwidth}{215.9mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

%: Uncomment this secion for two-sided printing
% ------------------------------
\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{0.5cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.5cm}
\setlength{\textwidth}{15.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{1.5cm}


%: Uncomment this secion for one-sided printing
% taken from the original file, but with the first two lanes modified
% ------------------------------
%\setlength{\evensidemargin}{1.9cm} % was 1.96cm in original
%\setlength{\oddsidemargin}{-0.001cm} % was -0.54cm in original file
%\setlength{\topmargin}{1mm}
%\setlength{\headheight}{1.36cm}
%\setlength{\headsep}{1.00cm}
%\setlength{\textheight}{20.84cm}
%\setlength{\textwidth}{14.5cm}
%\setlength{\marginparsep}{1mm}
%\setlength{\marginparwidth}{3cm}
%\setlength{\footskip}{2.36cm}


%: section below defines fancy page layout options
% ------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}

\titleformat{\section}[block]
{\fontsize{15}{15}\bfseries}
{\thesection}
{1em}
{}

\titleformat{\subsection}[block]
{\fontsize{12}{15}\bfseries}
{\thesubsection}
{1em}
{}


%\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
%\fancyhead[RO]{\bfseries\rightmark}
%\fancyhead[LE]{\bfseries\leftmark}
\fancyhead[RO]{\rightmark}
\fancyhead[LE]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.1pt}



\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}





%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii
\renewcommand{\thepage}{\roman{page}}

% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degree}{}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

% The name of your department(eg. Engineering, Maths, Physics)
\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

% The name of your college (eg. King's)
\newcommand{\@facultad}{}
\newcommand{\facultad}[1]{\renewcommand{\@facultad}{#1}}

% The name of your University
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}



\newcommand{\@escudofacultad}{}
\newcommand{\escudofacultad}[1]{\renewcommand{\@escudofacultad}{#1}}

%Definiendo al director de tesis:
\newcommand{\@director}{}
\newcommand{\director}[1]{\renewcommand{\@director}{#1}}
\newcommand{\@ctutoruno}{}
\newcommand{\ctutoruno}[1]{\renewcommand{\@ctutoruno}{#1}}
\newcommand{\@ctutordos}{}
\newcommand{\ctutordos}[1]{\renewcommand{\@ctutordos}{#1}}
\newcommand{\@presidente}{}
\newcommand{\presidente}[1]{\renewcommand{\@presidente}{#1}}
\newcommand{\@vocal}{}
\newcommand{\vocal}[1]{\renewcommand{\@vocal}{#1}}
\newcommand{\@supuno}{}
\newcommand{\supuno}[1]{\renewcommand{\@supuno}{#1}}
\newcommand{\@supdos}{}
\newcommand{\supdos}[1]{\renewcommand{\@supdos}{#1}}
\newcommand{\@secretario}{}
\newcommand{\secretario}[1]{\renewcommand{\@secretario}{#1}}
\newcommand{\@institucion}{}
\newcommand{\institucion}[1]{\renewcommand{\@institucion}{#1}}
\newcommand{\@programa}{}
\newcommand{\programa}[1]{\renewcommand{\@programa}{#1}}
\newcommand{\@campo}{}
\newcommand{\campo}[1]{\renewcommand{\@campo}{#1}}

%Definiendo el lugar
\newcommand{\@lugar}{}
\newcommand{\lugar}[1]{\renewcommand{\@lugar}{#1}}

% Matrícula y correo del autor (se fijan en el documento principal).
\newcommand{\@matricula}{[número de matrícula]}
\newcommand{\matricula}[1]{\renewcommand{\@matricula}{#1}}
\newcommand{\@correo}{[correo institucional]}
\newcommand{\correo}[1]{\renewcommand{\@correo}{#1}}

%Definiendo la portada
\newif\ifportada
\newif\ifposgrado
\newif\ifcomite




% Submission Text
\newcommand{\submissiontext}{This dissertation is submitted for the degree of }

% keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%Para tener underbrace en las ecuaciones
\newcommand{\xsub}[1]{%
	\mbox{\scriptsize\begin{tabular}{@{}c@{}}#1\end{tabular}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            PORTADA de la UMSNH-FISMAT              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{%
	\ifposgrado
	\begin{alwayssingle}
		\thispagestyle{empty}
		\begin{center}
			\includegraphics[height=3cm]{Latex/Classes/Escudos/UMSNH_BN}\\[8mm]
			{\bfseries UNIVERSIDAD~MICHOACANA~DE~SAN~NICOLÁS~DE~HIDALGO}\\
			{\MakeUppercase {\@programa}}\\
			{\MakeUppercase {\@campo}}\\[20mm]
			{\Large \scshape {\@title}} \\[20mm]
			TESIS\\
			QUE PARA OBTENER EL GRADO DE:\\
			{\Large \scshape {\@degree}}\\[20mm]
			PRESENTA:\\
			{\Large \scshape {\@author}}\\[18mm]
			ASESOR:\\
			{\Large \scshape {\@director}}\\
			\ifcomite
			COMITÉ TUTOR\\
			{\Large \scshape {\@ctutoruno}}\\
			{\Large \scshape {\@ctutordos}}\\[10mm]
			{\MakeUppercase {\@lugar}}{, }{\MakeUppercase {\@degreedate}}
			\else
			\vspace{20mm}
			{\MakeUppercase {\@lugar}}{, }{\MakeUppercase {\@degreedate}}
			\fi
		\end{center}
	\end{alwayssingle}

	\newpage
	\thispagestyle{empty}~


	\newpage
	\begin{alwayssingle}
		\thispagestyle{empty}
		\vspace{30mm}

		\noindent JURADO ASIGNADO:
		\vspace{8mm}

		\begin{tabbing}
			Presidente: \ \ \ \ \ \ \ \= {\@presidente}\\ [3mm]
			Secretario: \> {\@secretario}\\ [3mm]
			Vocal: \> {\@vocal}\\ [3mm]
			1er. Suplente: \> {\@supuno}\\ [3mm]
			2o. Suplente: \> {\@supdos}\\ [12mm]
		\end{tabbing}
		La tesis se realizó en {\@institucion}.
		\vspace{15mm}

		\begin{center}
			TUTOR DE TESIS:\\[4mm]
			{\@director}\\[20mm]
			---------------------------------------------------------\\
		\end{center}
		%\newpage
		\vfill
	\end{alwayssingle}


	\else
	\begin{alwayssingle}
		\begin{center}
			\thispagestyle{empty}
			%% Barra izquierda - Escudos
			\hskip -2cm
			\begin{minipage}[c][10cm][s]{3cm}
				\begin{center}
					\ifportada
					\includegraphics[height=2.6cm]{Latex/Classes/Escudos/UMSNH_BN}\\[10pt]
					\hskip2pt\colorvrule{Azul}{2.5pt}{13cm}
					\hskip -0.4mm
					\colorvrule{Oro}{1pt}{13cm}\\[10pt]
					\includegraphics[height=2.6cm]{\@escudofacultad}
					\else
					\includegraphics[height=2.6cm]{Latex/Classes/Escudos/UMSNH_BN}\\[10pt]
					\hskip2pt\vrule width2.5pt height13cm
					\hskip1mm
					\vrule width1pt height13cm\\[10pt]
					\includegraphics[height=2.6cm]{Latex/Classes/Escudos/logo_FISMAT}
					\fi

				\end{center}
			\end{minipage}\quad
			%% Barra derecha - Títulos
			\begin{minipage}[c][9.5cm][s]{11cm}
				\begin{center}
					% Barra superior
					{\Large \scshape Universidad Michoacana de San Nicolás de Hidalgo}
					\vspace{.3cm}
					\ifportada
					%\hrule height2.5pt
					\colorhrule{Azul}{2.5pt}
					\vspace{.1cm}
					%\hrule height1pt
					\colorhrule{Oro}{1pt}
					\else
					\hrule height2.5pt
					\vspace{.1cm}
					\hrule height1pt
					\fi
					\vspace{.3cm}
					{\scshape  \@facultad}
					\vspace{.3cm}

					{\scshape División de estudios de posgrado \\ Posgrado en ciencias en ingeniería física}

					\vspace{.3cm}
					% Título del trabajo
					%\vspace{3cm}
					\vspace{1cm}
					%\vspace{2.5cm}

					{\Large \scshape {\@title}}

					\vspace{2cm}

					% Tipo de trabajo
					\makebox[8cm][s]{\huge T E S I S}\\[40pt]
					QUE PARA OBTENER EL GRADO DE:\\[10pt]
%					\textbf{\@degree}\\[40pt]
					PRESENTA:\\[5pt]
					\textbf{{\@author}}
					{\small Matrícula: \@matricula \\}
					{\small \@correo}

					\vspace{0.5cm}

					{\small ASESOR:\\ {\@director}}
%					{\small ASESORES:\\ {\@director} \\ Dr. Nombre del Segundo Asesor \\ Institución}
					\vspace{0.5cm}
                    
                    {\small ASESOR:\\ {\@ctutoruno}}
                    
					%{\small CODIRECTOR DE TESIS:\\ en caso de que aplique}

					\vspace{1cm}

					{\@lugar}{, }{\@degreedate}

				\end{center}
			\end{minipage}

		\end{center}
		\null\vfill
	\end{alwayssingle}
	\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%:-------------------------- front matter layout -----------------------

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \vspace*{1.5cm}
  {\large{}}
  \vspace{0.5cm}
  \begin{flushright}\itshape}
{\end{flushright} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\vspace*{1.5cm}
{\chapter*{Agradecimientos}}
\vspace{0.5cm}}
{\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgement itself
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\vspace*{1.5cm}
{\chapter*{Agradecimientos}}
\vspace{0.5cm}}
{\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{resumen} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\chapter*{Resumen}}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\chapter*{Abstract}}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{UNAM} \par}
    {{Facultad de Ingeniería} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%Statement of originality if required

\newenvironment{declaration} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\chapter*{Declaración de autenticidad}}
  \end{center}
  \vspace{0.5cm}}
{\vspace{1.5cm}\flushright{\@author. \@lugar, \@degreedate}\end{alwayssingle}}


%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

%\newenvironment{romanpages}
%{
%	\setcounter{page}{1}
%	\renewcommand{\thepage}{\roman{page}}
%} % close romanpage env't

{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
