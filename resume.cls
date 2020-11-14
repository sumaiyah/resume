%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Single Page Technical CV 
% Resume Class File. This class file defines the structure and design of the template. 
% Adapted by @sumaiyah, original work from Trey Hunner (www.LaTeXTemplates.com)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[14/11/2020 v1 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{tabularx}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	SPACING COMMANDS: Commands for define the whitespace after certain things in the document
%----------------------------------------------------------------------------------------

%  can be \smallskip, \medskip, \bigskip, manually defined spaces \vspace{<size>}
\def\namesize{\Huge} % Size of the name at the top of the document 
\def\nameskip{\vspace{0.05em}} % The space after your name at the top
\def\sectionskip{\vspace{0.05em}} % The space after the heading section

\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def \sectionendskip{\vspace{-3pt}} % The space after each section

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \otherNames#1{\def\@otherNames{#1}} % Defines the \otherNames command to set first (and middle) names
\def \@otherNames {} % Sets \@otherNames to empty by default

\def \lastname#1{\def\@lastname{#1}} % Defines the \lastname command to surname
\def \@lastname {} % Sets \@otherNames to empty by default

\def \addressSep {$|$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \begin{center}
        \namesize \@otherNames \bf{ \@lastname}
        \nameskip
    \end{center}
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip

  {\scshape\raggedright\large{#1}} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
  \sectionendskip
}

%----------------------------------------------------------------------------------------
%	Technical Project Formatting
%----------------------------------------------------------------------------------------

\newcommand{\rProject}[2]{
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \small#1 & #2 \\
    \end{tabular*}\vspace{-7pt}
}

