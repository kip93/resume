%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A class defining useful commands for Résumés.                                %
%                                                                              %
% Author:   Kip (https://github.com/kip93/).                                   %
% Source:   https://github.com/kip93/resume/                                   %
% License:  BSD 3-Clause                                                       %
% Created:  2020-09-27                                                         %
% Updated:  2020-12-17                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialise the Résumé class                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2020-12-17 My own Résumé/CV class.]
\LoadClass{article}[]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package declaration & configuration                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Font
% ---------------------------------------------------------------------------- %

% Set up font (Iwona Light Condensed).
% https://tug.org/FontCatalogue/iwonalightcondensed/
\RequirePackage{iwona}[light, condensed, math, ]
\RequirePackage{fontenc}[T1, ]

% Geometry
% ---------------------------------------------------------------------------- %

% Page configuration.
% http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/geometry/geometry.pdf
\RequirePackage{geometry}[]

\geometry{
    a4paper,
    % Geometry? Where we are going we do not need geometry.
    left=0cm,
    right=0cm,
    top=0cm,
    bottom=0cm,
    headheight=0cm,
    headsep=0cm,
    footnotesep=0cm,
    footskip=0cm,
    marginpar=0cm,
}
\setlength{\parindent}{0cm}

% Graphics
% ---------------------------------------------------------------------------- %

% Add custom graphics support.
% https://www.ctan.org/pkg/tikz
\RequirePackage{tikz}[]

% Colour palette
% ---------------------------------------------------------------------------- %

% Add custom colours support.
% https://ctan.org/pkg/xcolor
\RequirePackage{xcolor}[]

% Gray-scale shades
\definecolor{black}{HTML}{1A1A1A}
\definecolor{darkgray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{BFBFBF}
\definecolor{white}{HTML}{E6E6E6}

% Accent colours
\definecolor{darkhighlight}{HTML}{4D6699}
\definecolor{lighthighlight}{HTML}{AAC2F2}

% NOTE: This pallete was created taking accesibility into consideration.
% The tool used to check the readability of the text was the website
% https://www.aremycoloursaccessible.com/.
%
% Taking that into consideration, not all colours are intended to be used
% together. Here is a table to show which background / foreground colour
% combinations are usable:
%
%  BG/FG 1A1A1A 4D4D4D BFBFBF E6E6E6 4D6699 AAC2F2
% 1A1A1A    X      X      O      O      X      O
% 4D4D4D    X      X      O      O      X      O
% BFBFBF    O      O      X      X      X      X
% E6E6E6    O      O      X      X      O      X
% 4D6699    X      X      X      O      X      X
% AAC2F2    O      O      X      X      X      X
%
% The crosses represent bad colour combinations, while the Os are for accesible
% ones.

% Text positioning
% ---------------------------------------------------------------------------- %

% Add precise text placement support.
% https://ctan.org/pkg/textpos
\RequirePackage{textpos}[absolute, overlay, ]

% Hyperlinks
% ---------------------------------------------------------------------------- %

% Make sure that hyperlink support is loaded.
% https://www.overleaf.com/learn/latex/hyperlinks
\RequirePackage{hyperref}

\hypersetup{
    hidelinks,  % Disable link auto format, allowing to customise links look
}
\urlstyle{same}  % Use the same font for URLs

% Extra tools
% ---------------------------------------------------------------------------- %

% Add tools to allow more complex LaTeX structures.
% https://ctan.org/pkg/etoolbox
\RequirePackage{etoolbox}[]

% Suppress warnings
% ---------------------------------------------------------------------------- %

\RequirePackage{silence}

% This is a false positive, already validated that alignment is correct.
\WarningFilter{textpos}{environment textblock* not in vertical mode.}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User facing commands                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Header
% ---------------------------------------------------------------------------- %

% Define the birthday in the format YYYY / MM / DD.
%
% Arguments:
%     * Year
%     * Month
%     * Day
%
\newcommand{\birthday}[3]{\def\@birthday{{#1} / {#2} / {#3}}}
\def\@birthday{}

% Define the contact e-mail.
%
% Arguments:
%     * e-mail address
%
\newcommand{\email}[1]{\def\@email{#1}}
\def\@email{}

% Define the GitHub username (optional).
%
% Arguments:
%     * A GitHub username
%
\newcommand{\github}[1]{\def\@github{#1}}
\def\@github{}

% Define the Job title.
%
% Arguments:
%     * A job title
%
\newcommand{\jobtitle}[1]{\def\@jobtitle{#1}}
\def\@jobtitle{}

% Define the Linkedin username (optional).
%
% Arguments:
%     * A Linkedin username
%
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}
\def\@linkedin{}

% Define the name.
%
% Arguments:
%     * Last name(s)
%     * Fist name(s)
%
\newcommand{\name}[2]{\def\@lastname{#1}\def\@firstname{#2}}
\def\@firstname{}
\def\@lastname{}

% Define the contact phone number.
%
% Arguments:
%     * A phone number
%
\newcommand{\phone}[1]{\def\@phone{#1}}
\def\@phone{}

% Define a path to a profile picture.
%
% Arguments:
%     * A path to an image
%
\newcommand{\profilepicture}[1]{\def\@profilepicture{#1}}
\def\@profilepicture{}

% Left column
% ---------------------------------------------------------------------------- %

% Create a skillset.
%
% Arguments:
%     * The name of the skillset
%
\newenvironment{skillset}[1]{%
    % Add the skill set name to a list of all skill sets.
    \listcsgadd{skillsetslist}{#1}%
    % Add a skill to the current skillset.
    %
    % Arguments:
    %     * The name of the skill
    %     * The ability score for the skill
    %
    \newcommand{\skill}[2]{\listcsgadd{skillset{#1}}{{{##1}, {##2}}}}%
    % Makes sure that the list is created (the "nicer"
    % `\expandafter\newcommand\csname{skillset{#1}}\endcsname{}` was not working
    % for some reason).
    \listcsgadd{skillset{#1}}{foo}\listcsgremove{skillset{#1}}{foo}%
}{}
\newcommand{\skillsetslist}{}

% Set a summary text (optional).
%
% Arguments:
%     * An introductory text
%
\newcommand{\summary}[1]{\def\@summary{#1}}
\def\@summary{}

% Right column
% ---------------------------------------------------------------------------- %

% Add an experience entry (optional).
%
% Arguments:
%     * Start date
%     * End date
%     * Employer
%     * Job title
%     * Job description (optional)
%
\newcommand{\experience}[5]{\listcsgadd{experiencelist}{{{#1}, {#2}, {#3}, {#4}, {#5}}}}
\newcommand{\experiencelist}{}

% Add an education entry (optional).
%
% Arguments:
%     * Start date
%     * End date
%     * University
%     * Title
%     * Notes (optional)
%
\newcommand{\education}[5]{\listcsgadd{educationlist}{{{#1}, {#2}, {#3}, {#4}, {#5}}}}
\newcommand{\educationlist}{}

% Add a publication entry (optional).
%
% Arguments:
%     * Date
%     * Title
%     * URL
%     * Description (optional)
%
\newcommand{\publication}[4]{\listcsgadd{publicationslist}{{{#1}, {#2}, {#3}, {#4}}}}
\newcommand{\publicationslist}{}

% Wrapper
% ---------------------------------------------------------------------------- %

% Create the Résumé.
%
\newenvironment{resume}{%
    \document        % Equivalent to `\begin{document}`.
}{%
    \validate        % Run some checks to show nicer error messages
    \setmetadata     % Sets the PDF metadata
    \makebackground  % Sets the coloured background for the document.
    \makeheader      % Create the top header part of the document.
    \makeleft        % Create the left column of the document.
    \makeright       % Create the right main column of the document.
    \enddocument     % Equivalent to `\end{document}`.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Internal commands                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Validation
% ---------------------------------------------------------------------------- %

\newcommand{\validate}[0]{%
    \validateheader%
    \validateleft%
    \validateright%
}

\newcommand{\validateheader}[0]{%
    \ifdefempty{\@birthday}{%
        \ClassError{Résumé}{Birthday is missing}%
        {Check the "birthday" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@email}{%
        \ClassError{Résumé}{e-Mail is missing}%
        {Check the "email" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@github}{%
        \ClassWarning{Résumé}{GitHub user name is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@jobtitle}{%
        \ClassError{Résumé}{Job title is missing}%
        {Check the "jobtitle" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@linkedin}{%
        \ClassWarning{Résumé}{Linkedin user name is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@firstname}{\ifdefempty{\@lastname}{%
        \ClassError{Résumé}{Name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}}{}%
    \ifdefempty{\@firstname}{%
        \ClassError{Résumé}{First name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@lastname}{%
        \ClassError{Résumé}{Last name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@phone}{%
        \ClassError{Résumé}{Phone number is missing}%
        {Check the "phone" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@profilepicture}{%
        \ClassError{Résumé}{Profile picture is missing}%
        {Check the "profilepicture" command.\MessageBreak}%
    }{}%
}

\newcommand{\validateleft}[0]{{%
    \ifdefempty{\@summary}{%
        \ClassWarning{Résumé}{Summary text is not present (section will be skipped)}%
    }{}%
    \measure{skillsetslist}\ifnumequal{\thelength}{0}{%
        \ClassError{Résumé}{No skillset present}%
        {Check the "skillset" environment.\MessageBreak}%
    }{}%
    \renewcommand{\do}[1]{%
        \measure{skillset{##1}}\ifnumequal{\thelength}{0}{%
            \ClassError{Résumé}{Skillset "##1" is empty}%
            {Check the "skill" command.\MessageBreak}%
        }{}%
    }\dolistcsloop{skillsetslist}%
}}

\newcommand{\validateright}[0]{%
    \measure{experiencelist}\ifnumequal{\thelength}{0}{%
        \ClassWarning{Résumé}{No experience given (section will be skipped)}%
    }{}%
    \measure{educationlist}\ifnumequal{\thelength}{0}{%
        \ClassWarning{Résumé}{No education given (section will be skipped)}%
    }{}%
    \measure{publicationslist}\ifnumequal{\thelength}{0}{%
        \ClassWarning{Résumé}{No publications given (section will be skipped)}%
    }{}%
}

% Metadata
% ---------------------------------------------------------------------------- %

\newcommand{\setmetadata}[0]{%
    \hypersetup{
        pdfauthor={\@lastname, \@firstname},
        pdftitle={\@lastname, \@firstname: Résumé},
        pdfsubject={Résumé for \@firstname{ }\@lastname},
        pdfkeywords={Résumé, Resume, CV},
        pdfcreator={https://github.com/kip93/resume/},
        pdfproducer={https://github.com/kip93/},
    }%
}

% Background
% ---------------------------------------------------------------------------- %

\newcommand{\makebackground}[0]{%
    % Left column
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            fill=white,
            anchor=north west,
            minimum width=70mm,
            minimum height=\paperheight + 10mm,
        ] (box) at (0mm, 5mm){};
    \end{tikzpicture}%
    % Header
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            fill=darkgray,
            anchor=north,
            minimum width=\paperwidth + 10mm,
            minimum height=60mm,
        ] (box) at (\paperwidth / 2, 5mm){};
    \end{tikzpicture}%
}

% Header
% ---------------------------------------------------------------------------- %

\newcommand{\makeheader}[0]{%
    \makepersonalinfo%
    \makeprofilepicture%
}

\newcommand{\makepersonalinfo}[0]{%
    \begin{textblock*}{0.69\paperwidth}(10mm, 4mm)\begin{flushright}{%
            \LARGE\bfseries\color{white}%
            \MakeUppercase{\@lastname}, {\@firstname}%
        }\par\vspace{2mm}{%
            \Large\color{white}%
            \it\@jobtitle%
        }\par\vspace{3mm}{%
            \large\color{lightgray}%
            {\@birthday}%
        }\par\vspace{3mm}{%
            \large\color{lightgray}%
            \href{mailto:\@email}{\@email}%
            \hspace{2mm}/\hspace{2mm}{\@phone}%
        }\par\vspace{2mm}\ifdefempty{\@linkedin}{}{{%
            \large\color{lighthighlight}\url%
            {https://www.linkedin.com/in/\@linkedin/}%
        }\par\vspace{2mm}}\ifdefempty{\@github}{}{{%
            \large\color{lighthighlight}\url%
            {https://github.com/\@github/}%
        }\par\vspace{2mm}}%
    \end{flushright}\end{textblock*}%
}

\newcommand{\makeprofilepicture}[0]{%
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            draw=lightgray,
            line width=3mm,
            inner sep=0mm,
            anchor=north east,
        ] at (\paperwidth - 10mm, -1mm){%
            \includegraphics[
                width=40mm,
            ]{\@profilepicture}%
        };
    \end{tikzpicture}%
}

% Left column
% ---------------------------------------------------------------------------- %

\newcommand{\makeleft}[0]{%
    \newcommand\leftsection[1]{\newsection{black}{##1}}%
    \newcommand\leftsubsection[1]{\newsubsection{darkhighlight}{##1}}%
    \begin{textblock*}{62mm}(4mm, 52mm)\begin{flushleft}%
        \makesummary%
        \makeskills%
    \end{flushleft}\end{textblock*}%
}

\newcommand{\makesummary}[0]{{%
    \ifdefempty{\@summary}{}{%
        \leftsection{About me}{\color{darkgray}\vspace{-3mm}\setlength{\parskip}{3mm}\@summary}\par\vspace{4mm}%
    }%
}}

\newcommand{\makeskills}[0]{{%
    \leftsection{Skills}{%
        \renewcommand{\do}[1]{%
            \makeskillset{##1}
        }\dolistcsloop{skillsetslist}%
    }%
}}

\newcommand{\makeskillset}[1]{{%
    \leftsubsection{#1}{%
        \renewcommand{\do}[1]{%
            \makeskill{##1}
        }\dolistcsloop{skillset{#1}}%
    }\vspace{2mm}%
}}

\newcommand{\makeskill}[1]{{%
    \def\@name{}%
    \def\@score{}%
    \renewcommand{\do}[1]{%
        \ifdefempty{\@name}{\def\@name{##1}}{\def\@score{##1}}%
    }\docsvlist{#1}%
    {\color{darkgray}\@name\hfill}%
    \foreach \x in {1, ..., 5}{%
        \hspace{1mm}\makecircle{\ifnumgreater{\x}{\@score}{lightgray}{darkhighlight}}%
    }\par%
}}

% Right column
% ---------------------------------------------------------------------------- %

\newcommand{\makeright}[0]{
    \newcommand{\rightsection}[1]{\newsection{black}{##1}}%
    \begin{textblock*}{132mm}(74mm, 52mm)\begin{flushleft}%
        \makeexperience%
        \makeeducation%
        \makepublications%
    \end{flushleft}\end{textblock*}%
}

\newcommand{\makeexperience}[0]{{%
    \measure{experiencelist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Experience}{%
            \renewcommand{\do}[1]{%
                \makejob{##1}%
            }\dolistcsloop{experiencelist}%
        }\vspace{1mm}%
    }{}%
}}

\newcommand{\makejob}[1]{{%
    \def\@start{}%
    \def\@end{}%
    \def\@employer{}%
    \def\@jobtitle{}%
    \def\@jobdescription{}%
    \renewcommand{\do}[1]{%
        \ifdefempty{\@start}{\def\@start{##1}}%
        {\ifdefempty{\@end}{\def\@end{##1}}%
        {\ifdefempty{\@employer}{\def\@employer{##1}}%
        {\ifdefempty{\@jobtitle}{\def\@jobtitle{##1}}%
        {\def\@jobdescription{##1}}}}}%
    }\docsvlist{#1}%
    {\color{darkgray}{\bfseries\@employer}}\par\vspace{1mm}%
    {\color{darkgray}\textsc{\@jobtitle}}\hfill%
    {\color{darkgray}\@start{ -- }\@end}\ifdefempty{\@jobdescription}{}{\par\vspace{2mm}%
    {\color{darkgray}\vspace{-3mm}\setlength{\parskip}{3mm}\it\@jobdescription}}\par\vspace{3mm}%
}}

\newcommand{\makeeducation}[0]{{%
    \measure{educationlist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Education}{%
            \renewcommand{\do}[1]{%
                \makestudy{##1}%
            }\dolistcsloop{educationlist}%
        }\vspace{1mm}%
    }{}%
}}

\newcommand{\makestudy}[1]{{%
    \def\@start{}%
    \def\@end{}%
    \def\@university{}%
    \def\@title{}%
    \def\@description{}%
    \renewcommand{\do}[1]{%
        \ifdefempty{\@start}{\def\@start{##1}}%
        {\ifdefempty{\@end}{\def\@end{##1}}%
        {\ifdefempty{\@university}{\def\@university{##1}}%
        {\ifdefempty{\@title}{\def\@title{##1}}%
        {\def\@description{##1}}}}}%
    }\docsvlist{#1}%
    {\color{darkgray}{\bfseries\@title}}\par\vspace{1mm}%
    {\color{darkgray}\textsc{\@university}}\hfill%
    {\color{darkgray}\@start{ -- }\@end}\ifdefempty{\@description}{}{\par\vspace{2mm}%
    {\color{darkgray}\vspace{-3mm}\setlength{\parskip}{3mm}\it\@description}}\par\vspace{3mm}%
}}

\newcommand{\makepublications}[0]{{%
    \measure{publicationslist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Publications}{%
            \renewcommand{\do}[1]{%
                \makepublication{##1}%
            }\dolistcsloop{publicationslist}%
        }\vspace{1mm}%
    }{}%
}}

\newcommand{\makepublication}[1]{{%
    \def\@date{}%
    \def\@title{}%
    \def\@link{}%
    \def\@description{}%
    \renewcommand{\do}[1]{%
        \ifdefempty{\@date}{\def\@date{##1}}%
        {\ifdefempty{\@title}{\def\@title{##1}}%
        {\ifdefempty{\@link}{\def\@link{##1}}%
        {\def\@description{##1}}}}%
    }\docsvlist{#1}%
    {\color{darkgray}{\bfseries\@title}}\par\vspace{1mm}%
    {\color{darkhighlight}\url{\@link}}\hfill%
    {\color{darkgray}\@date}\ifdefempty{\@description}{}{\par\vspace{2mm}%
    {\color{darkgray}\vspace{-3mm}\setlength{\parskip}{3mm}\it\@description}}\par\vspace{3mm}%
}}

% Utility methods
% ---------------------------------------------------------------------------- %

\newcommand{\newsection}[2]{%
    \raisebox{0mm}{\makebox[\linewidth]{\raisebox{-1mm}{\color{#1}\LARGE{#2}}\hspace{2mm}\hlinefill{1pt}}}\par\vspace{2mm}%
}

\newcommand{\newsubsection}[2]{%
    {\color{#1}\large{#2}}\par\vspace{0.5mm}%
}

\newcommand{\hlinefill}[1]{%
    \def\hrulefill{\leavevmode\leaders\hrule height #1\hfill\kern\z@}\hrulefill%
}

\newcommand{\makecircle}[1]{%
    \begin{tikzpicture}[scale=0.15]%
        \node[
            circle,
            fill={#1},
        ] at (0, 0) {};
    \end{tikzpicture}%
}

\newcounter{length}%
\newcommand{\measure}[1]{{%
    \setcounter{length}{0}%
    \renewcommand{\do}[1]{\stepcounter{length}}%
    \dolistcsloop{#1}%
}}
