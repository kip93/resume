%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A class defining useful commands for Résumés.                                %
%                                                                              %
% Author:   Kip (https://github.com/kip93/).                                   %
% Source:   https://github.com/kip93/resume/                                   %
% License:  BSD 3-Clause                                                       %
% Created:  2020-09-27                                                         %
% Updated:  2020-12-19                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialise the Résumé class                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2020-12-19 My own Résumé/CV class.]
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

% These are redefined per section to have the correct colours available for use
% from the .tex file.
\definecolor{text}          {HTML} {000000}  % More contrasting text colour.
\definecolor{dimtext}       {HTML} {000000}  % Less contrasting text colour.
\definecolor{background}    {HTML} {000000}  % Main background colour.
\definecolor{altbackground} {HTML} {000000}  % Alternate background colour.
\definecolor{highlight}     {HTML} {000000}  % Highlight text colour.

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

% String manipulation
% ---------------------------------------------------------------------------- %

% Add tools for string manipulation.
% https://ctan.org/pkg/xstring
\usepackage{xstring}

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

% Define the GitLab username (optional).
%
% Arguments:
%     * A GitLab username
%
\newcommand{\gitlab}[1]{\def\@gitlab{#1}}
\def\@gitlab{}

% Define the BitBucket username (optional).
%
% Arguments:
%     * A BitBucket username
%
\newcommand{\bitbucket}[1]{\def\@bitbucket{#1}}
\def\@bitbucket{}

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
    \validate        % Run some checks to show nicer error messages.
    \setmetadata     % Sets the PDF metadata.
    \makebackground  % Sets the coloured background for the document.
    \makeheader      % Create the top header part of the document.
    \makeleft        % Create the left column of the document.
    \makeright       % Create the right main column of the document.
    \enddocument     % Equivalent to `\end{document}`.
}

% Utility methods
% ---------------------------------------------------------------------------- %

% Output text with specific colour.
%
% Arguments:
%     * Colour
%     * Text
%
\newcommand{\coloured}[2]{%
    \textcolor{#1}{#2}%
}

% Output text with specific style.
%
% Arguments:
%     * Style
%     * Text
%
\newcommand{\stylised}[2]{%
    \begin{stringswitch}{#1}%
        \case{bold}{\textbf{#2}}%
        \case{emphasised}{\emph{#2}}%
        \case{italic}{\textit{#2}}%
        \case{lowercase}{\lowercase{#2}}%
        \case{medium}{\textmd{#2}}%
        \case{mono}{\texttt{#2}}%
        \case{normal}{\textnormal{#2}}%
        \case{regular}{\textnormal{#2}}%
        \case{slanted}{\textsl{#2}}%
        \case{smallcase}{\textsc{#2}}%
        \case{underlined}{\underline{#2}}%
        \case{uppercase}{\uppercase{#2}}%
        \default{%
            \ClassError{Résumé}{Unknown style '#1'}%
            {
                Valid styles are {
                    'bold', 'emphasised', 'italic', 'lowercase', 'medium',
                    'mono', 'normal', 'regular' (alias for normal), 'slanted',
                    'smallcase', 'underlined', 'uppercase'.
                }.\MessageBreak
            }%
        }%
    \end{stringswitch}%
}

% Output text with specific size.
%
% Arguments:
%     * Size
%     * Text
%
\newcommand{\sized}[2]{%
    \IfInteger{#1}{}{%
        \ClassError{Résumé}{Sized with non integer '#1'}%
        {Sized can only handle integers.\MessageBreak}%
    }%
    \begin{numswitch}{#1}%
        \case{<}{-4}{\tiny#2\ClassWarning{Résumé}{Size #1 is too small, casting to -4}}%
        \case{=}{-4}{\tiny#2}%
        \case{=}{-3}{\scriptsize#2}%
        \case{=}{-2}{\footnotesize#2}%
        \case{=}{-1}{\small#2}%
        \case{=}{+0}{\normalsize#2}%
        \case{=}{+1}{\large#2}%
        \case{=}{+2}{\Large#2}%
        \case{=}{+3}{\LARGE#2}%
        \case{=}{+4}{\huge#2}%
        \case{=}{+5}{\Huge#2}%
        \case{>}{+5}{\Huge#2\ClassWarning{Résumé}{Size #1 is too big, casting to +5}}%
    \end{numswitch}%
}

% Output text with specific colour, style, and size.
%
% Arguments:
%     * Colour
%     * Style
%     * Size
%     * Text
%
\newcommand{\formatted}[4]{%
    \coloured{#1}{\stylised{#2}{\sized{#3}{#4}}}%
}

% Output a link.
%
% Arguments:
%     * URL
%     * Display text (optional)
%
\newcommand{\link}[2]{%
    \def\@displaytext{#2}\ifdefempty{\@displaytext}{\url{#1}}{\href{#1}{#2}}%
}

% Output a coloured link.
%
% Arguments:
%     * Colour
%     * URL
%     * Display text (optional)
%
\newcommand{\colouredlink}[3]{%
    \coloured{#1}{\link{#2}{#3}}%
}

% Output a stylised link.
%
% Arguments:
%     * Style
%     * URL
%     * Display text (optional)
%
\newcommand{\stylisedlink}[3]{%
    \stylised{#1}{\link{#2}{#3}}%
}

% Output a link with specific colour, style, and size.
%
% Arguments:
%     * Colour
%     * Style
%     * Size
%     * URL
%     * Display text (optional)
%
\newcommand{\formattedlink}[5]{%
    \formatted{#1}{#2}{#3}{\link{#4}{#5}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Internal commands                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Validation
% ---------------------------------------------------------------------------- %

% Validate the user configuration. Throws warnings and errors depending on
% input.
%
\newcommand{\validate}[0]{%
    \validateheader%
    \validateleft%
    \validateright%
}

% Validate the user configuration correspondong to the header.
%
\newcommand{\validateheader}[0]{%
    \ifdefempty{\@birthday}{  % Birthday is mandatory.
        \ClassError{Résumé}{Birthday is missing}%
        {Check the "birthday" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@email}{  % e-Mail is mandatory.
        \ClassError{Résumé}{e-Mail is missing}%
        {Check the "email" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@github}{  % GitHub username is optional.
        \ClassWarning{Résumé}{GitHub username is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@gitlab}{  % GitLab username is optional.
        \ClassWarning{Résumé}{GitLab username is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@bitbucket}{  % BitBucket username is optional.
        \ClassWarning{Résumé}{BitBucket username is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@jobtitle}{  % Job title is mandatory.
        \ClassError{Résumé}{Job title is missing}%
        {Check the "jobtitle" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@linkedin}{  % Linkedin username is optional.
        \ClassWarning{Résumé}{Linkedin username is missing (URL will be skipped)}%
    }{}%
    \ifdefempty{\@firstname}{\ifdefempty{\@lastname}{  % Name is mandatory.
        \ClassError{Résumé}{Name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}}{}%
    \ifdefempty{\@firstname}{  % Name is mandatory.
        \ClassError{Résumé}{First name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@lastname}{  % Name is mandatory.
        \ClassError{Résumé}{Last name is missing}%
        {Check the "name" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@phone}{  % Phone number is mandatory.
        \ClassError{Résumé}{Phone number is missing}%
        {Check the "phone" command.\MessageBreak}%
    }{}%
    \ifdefempty{\@profilepicture}{  % Profile picture is mandatory.
        \ClassError{Résumé}{Profile picture is missing}%
        {Check the "profilepicture" command.\MessageBreak}%
    }{}%
}

% Validate the user configuration correspondong to left column.
%
\newcommand{\validateleft}[0]{{%
    \ifdefempty{\@summary}{  % Summary is optional.
        \ClassWarning{Résumé}{Summary text is not present (section will be skipped)}%
    }{}%
    \measure{skillsetslist}\ifnumequal{\thelength}{0}{  % Skillsets are mandatory.
        \ClassError{Résumé}{No skillset present}%
        {Check the "skillset" environment.\MessageBreak}%
    }{}%
    \renewcommand{\do}[1]{  % Skillsets cannot be empty.
        \measure{skillset{##1}}\ifnumequal{\thelength}{0}{%
            \ClassError{Résumé}{Skillset "##1" is empty}%
            {Check the "skill" command.\MessageBreak}%
        }{}%
    }\dolistcsloop{skillsetslist}%
}}

% Validate the user configuration correspondong to the right column.
%
\newcommand{\validateright}[0]{%
    \measure{experiencelist}\ifnumequal{\thelength}{0}{  % Experience is optional.
        \ClassWarning{Résumé}{No experience given (section will be skipped)}%
    }{}%
    \measure{educationlist}\ifnumequal{\thelength}{0}{  % Education is optional.
        \ClassWarning{Résumé}{No education given (section will be skipped)}%
    }{}%
    \measure{publicationslist}\ifnumequal{\thelength}{0}{  % Publications are optional.
        \ClassWarning{Résumé}{No publications given (section will be skipped)}%
    }{}%
}

% Metadata
% ---------------------------------------------------------------------------- %

% Set the PDF metadata.
%
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

% Draw the coloured background.
%
\newcommand{\makebackground}[0]{%
    % Left column.
    \makerectangleoverlay{white}{north west}{70mm}{\paperheight + 10mm}{0mm, 5mm}%
    % Header.
    \makerectangleoverlay{darkgray}{north}{\paperwidth + 10mm}{60mm}{\paperwidth / 2, 5mm}%
}

% Header
% ---------------------------------------------------------------------------- %

% Make the résumé header.
%
\newcommand{\makeheader}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {white}%
    \colorlet{dimtext}       {lightgray}%
    \colorlet{background}    {darkgray}%
    \colorlet{altbackground} {black}%
    \colorlet{highlight}     {lighthighlight}%
    %
    % Populate the header.
    \makepersonalinfo%
    \makeprofilepicture%
}

% Make the résumé header's text.
%
\newcommand{\makepersonalinfo}[0]{%
    \begin{textblock*}{0.69\paperwidth}(10mm, 4mm)\begin{flushright}{%
            % Name.
            \formatted{text}{bold}{+3}{\stylised{smallcase}{\@lastname}, \@firstname}%
        }\par\vspace{2mm}{%
            % Job title.
            \formatted{text}{italic}{+2}{\@jobtitle}%
        }\par\vspace{3mm}{%
            % Birthday.
            \formatted{dimtext}{regular}{+1}{\@birthday}%
        }\par\vspace{3mm}{%
            % e-Mail & phone.
            \formattedlink{dimtext}{regular}{+1}{mailto:\@email}{\@email}%
            \formatted{dimtext}{regular}{+1}{\hspace{2mm}/\hspace{2mm}{\@phone}}%
        }\par\vspace{2mm}\ifdefempty{\@linkedin}{}{{%
            % Linkedin.
            \formattedlink{highlight}{regular}{+1}{https://linkedin.com/in/\@linkedin/}{}%
        }\par\vspace{2mm}}\ifdefempty{\@github}{}{{%
            % GitHub.
            \formattedlink{highlight}{regular}{+1}{https://github.com/\@github/}{}%
        }\par\vspace{2mm}}\ifdefempty{\@gitlab}{}{{%
            % GitLab.
            \formattedlink{highlight}{regular}{+1}{https://gitlab.com/\@gitlab/}{}%
        }\par\vspace{2mm}}\ifdefempty{\@bitbucket}{}{{%
            % BitBucket.
            \formattedlink{highlight}{regular}{+1}{https://bitbucket.com/\@bitbucket/}{}%
        }\par\vspace{2mm}}%
    \end{flushright}\end{textblock*}%
}

% Make the résumé header's profile picture.
%
\newcommand{\makeprofilepicture}[0]{%
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            draw=dimtext,
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

% Make the résumé left column.
%
\newcommand{\makeleft}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {black}%
    \colorlet{dimtext}       {darkgray}%
    \colorlet{background}    {white}%
    \colorlet{altbackground} {lightgray}%
    \colorlet{highlight}     {darkhighlight}%
    % Commands for section titles coloured according to background.
    \newcommand\leftsection[1]{\newsection{text}{##1}}%
    \newcommand\leftsubsection[1]{\newsubsection{highlight}{##1}}%
    %
    % Create the left column.
    \begin{textblock*}{62mm}(4mm, 52mm)\begin{flushleft}%
        \makesummary%
        \makeskills%
    \end{flushleft}\end{textblock*}%
}

% Make the résumé left column's about me section.
%
\newcommand{\makesummary}[0]{%
    \ifdefempty{\@summary}{}{%
        \leftsection{About me}{\vspace{-3mm}\setlength{\parskip}{3mm}%
            \formatted{dimtext}{regular}{+0}{\@summary}%
        }\par\vspace{4mm}%
    }%
}

% Make the résumé left column's skills section.
%
\newcommand{\makeskills}[0]{{%
    \leftsection{Skills}{%
        \renewcommand{\do}[1]{%
            \makeskillset{##1}%
        }\dolistcsloop{skillsetslist}%
    }%
}}

% Make a single résumé left column's skillset.
%
\newcommand{\makeskillset}[1]{{%
    \leftsubsection{#1}{%
        \renewcommand{\do}[1]{%
            \makeskill{##1}%
        }\dolistcsloop{skillset{#1}}%
    }\vspace{2mm}%
}}

% Make a single résumé left column's skillset's skill.
%
\newcommand{\makeskill}[1]{{%
    \def\@name{}   % Skill name.
    \def\@score{}  % Skill score.
    \renewcommand{\do}[1]{  % Iterate over the entry to recover values.
        \ifdefempty{\@name}{\def\@name{{##1}}}{\def\@score{##1}}%
    }\docsvlist{#1}%
    %
    \coloured{dimtext}{\@name}\hfill  % Set the skill name.
    \foreach \x in {1, ..., 5}{% Draw the circles.
        \hspace{1mm}\makecircle{\ifnumgreater{\x}{\@score}{altbackground}{highlight}}%
    }\par%
}}

% Right column
% ---------------------------------------------------------------------------- %

% Make the résumé right column.
%
\newcommand{\makeright}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {black}%
    \colorlet{dimtext}       {darkgray}%
    \definecolor{background} {HTML} {FFFFFF}%
    \colorlet{altbackground} {lightgray}%
    \colorlet{highlight}     {darkhighlight}%
    % Commands for section titles coloured according to background.
    \newcommand{\rightsection}[1]{\newsection{text}{##1}}%
    %
    % Create the right column.
    \begin{textblock*}{132mm}(74mm, 52mm)\begin{flushleft}%
        \makeexperience%
        \makeeducation%
        \makepublications%
    \end{flushleft}\end{textblock*}%
}

% Make the résumé right column's experience.
%
\newcommand{\makeexperience}[0]{{%
    \measure{experiencelist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Experience}{%
            \renewcommand{\do}[1]{%
                \makejob{##1}%
            }\dolistcsloop{experiencelist}%
        }\vspace{1mm}%
    }{}%
}}

% Make the résumé right column's single experience entry.
%
\newcommand{\makejob}[1]{{%
    \def\@start{}           % Job start.
    \def\@end{}             % Job end.
    \def\@employer{}        % Employer.
    \def\@jobtitle{}        % Job title.
    \def\@jobdescription{}  % Job description.
    \renewcommand{\do}[1]{  % Iterate over the entry to recover values.
        \ifdefempty{\@start}{\def\@start{{##1}}}{%
        \ifdefempty{\@end}{\def\@end{{##1}}}{%
        \ifdefempty{\@employer}{\def\@employer{{##1}}}{%
        \ifdefempty{\@jobtitle}{\def\@jobtitle{{##1}}}{%
        \def\@jobdescription{##1}}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\@employer}\par\vspace{1mm}%
    \formatted{dimtext}{smallcase}{+0}{\@jobtitle}\hfill%
    \formatted{dimtext}{regular}{+0}{\@start{ -- }\@end}\ifdefempty{\@jobdescription}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\setlength{\parskip}{3mm}\@jobdescription}}\par\vspace{3mm}%
}}

% Make the résumé right column's education.
%
\newcommand{\makeeducation}[0]{{%
    \measure{educationlist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Education}{%
            \renewcommand{\do}[1]{%
                \makestudy{##1}%
            }\dolistcsloop{educationlist}%
        }\vspace{1mm}%
    }{}%
}}

% Make the résumé right column's single education entry.
%
\newcommand{\makestudy}[1]{{%
    \def\@start{}        % Study start.
    \def\@end{}          % Study end.
    \def\@university{}   % University / institution.
    \def\@title{}        % Title obtained.
    \def\@description{}  % Description.
    \renewcommand{\do}[1]{  % Iterate over the entry to recover values.
        \ifdefempty{\@start}{\def\@start{{##1}}}{%
        \ifdefempty{\@end}{\def\@end{{##1}}}{%
        \ifdefempty{\@university}{\def\@university{{##1}}}{%
        \ifdefempty{\@title}{\def\@title{{##1}}}{%
        \def\@description{##1}}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\@title}\par\vspace{1mm}%
    \formatted{dimtext}{smallcase}{+0}{\@university}\hfill%
    \formatted{dimtext}{regular}{+0}{\@start{ -- }\@end}\ifdefempty{\@description}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\setlength{\parskip}{3mm}\@description}}\par\vspace{3mm}%
}}

% Make the résumé right column's publications.
%
\newcommand{\makepublications}[0]{{%
    \measure{publicationslist}\ifnumgreater{\thelength}{0}{%
        \rightsection{Publications}{%
            \renewcommand{\do}[1]{%
                \makepublication{##1}%
            }\dolistcsloop{publicationslist}%
        }\vspace{1mm}%
    }{}%
}}

% Make the résumé right column's single publication entry.
%
\newcommand{\makepublication}[1]{{%
    \def\@date{}         % Publication date.
    \def\@title{}        % Publication title.
    \def\@link{}         % Link to publication.
    \def\@description{}  % Description.
    \renewcommand{\do}[1]{  % Iterate over the entry to recover values.
        \ifdefempty{\@date}{\def\@date{{##1}}}{%
        \ifdefempty{\@title}{\def\@title{{##1}}}{%
        \ifdefempty{\@link}{\def\@link{##1}}{%
        \def\@description{##1}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\@title}\par\vspace{1mm}%
    \formattedlink{highlight}{regular}{+0}{\@link}{}\hfill%
    \formatted{dimtext}{regular}{+0}{\@date}\ifdefempty{\@description}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\setlength{\parskip}{3mm}\@description}}\par\vspace{3mm}%
}}

% Utility methods
% ---------------------------------------------------------------------------- %

% A command used internally to create sections.
\newcommand{\newsection}[2]{%
    \raisebox{0mm}{\makebox[\linewidth]{\raisebox{-1mm}{\formatted{#1}{regular}{+3}{#2}}\hspace{2mm}\hlinefill{1pt}}}\par\vspace{2mm}%
}

% A command used internally to create subsections.
\newcommand{\newsubsection}[2]{%
    \formatted{#1}{regular}{+1}{#2}\par\vspace{0.5mm}%
}

% A command used internally to make a resizable hrulefill.
\newcommand{\hlinefill}[1]{%
    \def\hrulefill{\leavevmode\leaders\hrule height #1\hfill\kern\z@}\hrulefill%
}

% A command used internally to create circles inline.
\newcommand{\makecircle}[1]{%
    \begin{tikzpicture}[scale=0.15]%
        \node[
            circle,
            fill={#1},
        ] at (0, 0) {};
    \end{tikzpicture}%
}

% A command used internally to create rectangles as an overlay.
\newcommand{\makerectangleoverlay}[5]{%
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            fill=#1,
            anchor=#2,
            minimum width=#3,
            minimum height=#4,
        ] (box) at (#5){};
    \end{tikzpicture}%
}

% Commands used internally for switch cases.
\newcommand{\case}[0]{}
\newcommand{\default}[0]{}

% A command used internally as a switch case for strings.
\newenvironment{stringswitch}[1]{%
    \def\@switched{}%
    \renewcommand{\case}[2]{\ifdefempty{\@switched}{\ifstrequal{#1}{##1}{##2\def\@switched{true}}{}}{}}%
    \renewcommand{\default}[1]{\ifdefempty{\@switched}{##1\def\@switched{true}}{}}%
}{%
}

% A command used internally as a switch case for decimal numbers.
\newenvironment{numswitch}[1]{%
    \IfDecimal{#1}{}{%
        \ClassError{Résumé}{Num switch with non number '#1'}%
        {Num switch can only handle numbers.\MessageBreak}%
    }%
    \def\@switched{}%
    \renewcommand{\case}[3]{%
        \IfDecimal{##2}{}{%
            \ClassError{Résumé}{Num switch case with non number '##2'}%
            {Num switch can only handle numbers.\MessageBreak}%
        }%
        \ifdefempty{\@switched}{\ifdimcomp{#1 pt}{##1}{##2 pt}{##3\def\@switched{true}}{}}{}%
    }%
    \renewcommand{\default}[1]{\ifdefempty{\@switched}{##1\def\@switched{true}}{}}%
}{%
}

% A value used to contain the result of the following command.
\newcounter{length}%

% A command used internally to measure an etoolbox list.
\newcommand{\measure}[1]{{%
    \setcounter{length}{0}%
    \renewcommand{\do}[1]{\stepcounter{length}}%
    \dolistcsloop{#1}%
}}
