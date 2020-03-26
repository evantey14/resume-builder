This is a simple modular resume builder written in LaTeX. My goals are 1) transparency and 2)
modularity.

# Motivation
Almost every time I've needed a copy of my resume, I'd first have to carefully choose which
experiences to include and tailor each description to the situation at hand. Sometimes I'd want to
highlight my technical skills, but other times I'd be my leadership skills, teaching experience,
etc. This meant lots of comments, typos, messy LaTeX, and time spent fudging with formatting.

Taking inspiration from [a friend](https://github.com/patil215/resumod) and [this clean
template](https://github.com/jcolemang/LaTeX-Resume-Class), I made this LaTeX class so (hopefully)
*anyone* with basic LaTeX skills can make a clean resume without a nest of comments and commands.

# Usage
The main structure in the document is two tables, defined by `resumeheader` and `resumebody`. Both
tables use the package `ltablex` (a multi-page version of `tabularx`). They act like standard
`tabular` tables, but have `X` columns which expand until the table covers a specified width (here,
`\textwidth`).

Inside each table, I define several macros to help with filling table cells. In general, these
macros have the form `\newcommand{\NAME_OF_MACRO}[NUMBER_OF_ARGUMENTS]{LATEX_CODE}` where arguments
can be referenced inside `LATEX_CODE` by `#1`, `#2`, etc. For example, some defined macros are
`\school{NAME_OF_SCHOOL}`, `\degree{DEGREE}{SUBJECT}{GPA}{DATE}`, or
`\experience{PLACE/TITLE}{POSITION}{DATE}{DETAILS}`.

Finally, I've placed my various positions, experiences, awards, etc. in folders, loaded by
`\load[VERSION]{FILENAME}`, where the optional `VERSION` input loads specific versions of the item.
For example in `projects/2016-consensus.tex`, I have a `designfocused` version for design-oriented
applications and a general-purpose `default` version. Under the hood, this uses switch-case logic
from the `xstring` package and a self-defined `\version` variable. Altogether, this keeps
`resume.tex` clean and makes it easy to select which resume items to include.

Don't be afraid of reading/editing `resume.cls` to understand the existing macros, make additional
macros, adjust the table structure, or play with the formatting. Again, one of my goals is
transparency because LaTeX is so often opaque and hard for beginning users to change.

# Contributing
Feel free to open issues or pull requests, and I'll get back to you as soon as possible.
