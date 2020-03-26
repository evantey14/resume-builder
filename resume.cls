\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClassWithOptions{article}

% Import libraries for environ/macro definition/processing
\usepackage{environ} % use instead of default for ltablex integration and code readability
\usepackage{xparse}
\usepackage{etoolbox}

% Set up page format
\usepackage[left=0.4in, right=0.4in, top=0.6in, bottom=0.6in]{geometry}
\pagestyle{empty} % remove page numbers
\usepackage{enumitem} \setlist{nolistsep} % remove list spacing

% Import table libraries for document structure
\usepackage{ltablex} \keepXColumns
\usepackage{multirow}

% Import font
\usepackage{fontawesome} % font for special icons
%\usepackage{gentium} % interesting "medieval" serif font
%\usepackage{newtxtext} % good professional serif font
%\usepackage[sfdefault,light]{roboto} % solid sans serif font

% Define resume header environment and helper functions
\NewEnviron{resumeheader}{
    \centering
    \begin{tabularx}{\textwidth}{l >{\centering}X r}
        \BODY
    \end{tabularx}
}
\newcommand{\name}[1]{\multirow{2}{*}{\Huge \textsc{#1}}}
\newcommand{\centerheaderinfo}[1]{& #1}
\newcommand{\rightheaderinfo}[1]{& #1 \\}
\newcommand{\email}[1]{\centerheaderinfo{#1}}
\newcommand{\phonenumber}[1]{\centerheaderinfo{#1}}
\newcommand{\profiles}[1]{\rightheaderinfo{#1}}
\newcommand{\website}[1]{\rightheaderinfo{#1}}

% Define resume body environment and helper functions
\NewEnviron{resumebody}{
    \centering
    \begin{tabularx}{\textwidth}{l >{\small}X >{\small}r}
        \BODY
    \end{tabularx}
}

\newcommand{\sectiontitle}[1]{\textsc{#1}}
\newcommand{\centercolumn}[1]{& #1} % write content to center column
\newcommand{\rightcolumn}[1]{& #1 \\} % write content to right column
\newcommand{\bigcolumn}[1]{& \multicolumn{2}{X}{\small #1} \\} % write to center and right columns

\newcommand{\school}[1]{
    % Args: school name
    \bigcolumn{\textbf{#1}}
}
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
\newcommand{\skills}[2]{
    % Args: skill type, skills
    \bigcolumn{\textbf{#1}: #2}
}

% List handling is tricky -- the following xparse & etoolbox code writes details to a bulleted list
\NewDocumentCommand{\listdetails}{> {\SplitList {;}} m}{ % split input into tokens by ;'s
    \begin{itemize}
        \ProcessList{#1}{\writedetail} % apply \writedetail to each token
    \end{itemize}
}
\newcommand{\writedetail}[1]{
    \ifblank{#1}{}{\item #1} % only add \item if argument isn't blank
}
