\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClassWithOptions{article}

\usepackage[left=0.4in, right=0.4in, top=0.6in, bottom=0.6in]{geometry}
\usepackage{ltablex}
\keepXColumns
\usepackage{multirow}

\usepackage{xparse}
\usepackage{etoolbox}

\usepackage{environ}

\usepackage{fontawesome} % font for special icons
\thispagestyle{empty} % no page number

%\usepackage{gentium} % interesting "medieval" serif font
%\usepackage{newtxtext} % good professional serif font
%\usepackage[sfdefault,light]{roboto} % solid sans serif font

% Uncomment to make more compact
%\usepackage{enumitem}
%\setlist{nolistsep}

\NewEnviron{resumeheader} {
    \centering
    \begin{tabularx}{\textwidth}{ X r }
        \BODY
    \end{tabularx}
}
\newcommand{\name}[1]{\multirow{3}{*}{\textmd{\Huge \textsc{#1}}}}
\newcommand{\headerinfo}[1]{& {\small #1} \\}
\newcommand{\email}[1]{\headerinfo{#1}}
\newcommand{\profiles}[1]{\headerinfo{#1}}
\newcommand{\phonenumber}[1]{\headerinfo{#1}}

\NewEnviron{resumebody} {
    \centering
    \begin{tabularx}{\textwidth}{ l >{\small}X >{\small}r }
        \BODY
    \end{tabularx}
}

\newcommand{\centercolumn}[1]{& #1} % write content to center column
\newcommand{\rightcolumn}[1]{& #1 \\} % write content to right column
\newcommand{\bigcolumn}[1]{& \multicolumn{2}{X}{\small #1} \\} % write to center and right columns

\newcommand{\sectiontitle}[1]{\textmd{\textsc{#1}}}
\newcommand{\school}[1]{\bigcolumn{\textbf{#1}}}
\newcommand{\degree}[4]{
    % Args: degree, subject, gpa, date
    \centercolumn{#1 in #2 -- #3} \rightcolumn{#4}
}
\newcommand{\experience}[4]{
    % Args: experience title, experience position, date, semicolon-separated list of details
    \centercolumn{
        \textbf{#1} -- \textit{#2}
        \listdetails{#4}
    }
    \rightcolumn{#3}
}
\newcommand{\project}[3]{
    % Args: project title, date, semicolon-separated list of details
    \centercolumn{
        \textbf{#1}
        \listdetails{#3}
    }
    \rightcolumn{#2}
}
% List handling is tricky -- the following xparse & etoolbox code writes details to a bulleted list
\NewDocumentCommand{\listdetails}{> {\SplitList {;}} m}{
    \begin{itemize}
        \ProcessList {#1} {\writedetail}
    \end{itemize}
}
\newcommand{\writedetail}[1]{
    \ifblank{#1}{}{\item #1}
}
