%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A class defining useful commands for Résumés.                                %
%                                                                              %
% Author:   Kip (https://github.com/kip93/).                                   %
% Source:   https://github.com/kip93/resume/                                   %
% License:  BSD 3-Clause                                                       %
% Created:  2020-09-27                                                         %
% Updated:  2021-08-26                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialise the Résumé class                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021-08-26 My own Résumé/CV class.]
\LoadClass{article}[]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package declaration & configuration                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Font
% ---------------------------------------------------------------------------- %

% Set up font (Iwona Light Condensed).
% https://tug.org/FontCatalogue/iwonalightcondensed/
\RequirePackage{iwona}[light, condensed, ]
\RequirePackage{fontenc}[T1, ]
\setlength{\emergencystretch}{10pt}

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
\definecolor{@black}          {HTML} {1A1A1A}
\definecolor{@darkgray}       {HTML} {4D4D4D}
\definecolor{@lightgray}      {HTML} {BFBFBF}
\definecolor{@white}          {HTML} {E6E6E6}

% Accent colours
\definecolor{@darkhighlight}  {HTML} {4D6699}
\definecolor{@lighthighlight} {HTML} {AAC2F2}

% NOTE: This pallete was created taking accessibility into consideration.
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
% The crosses represent bad colour combinations, while the Os are for accessible
% ones.

% These are redefined per section to have the correct accessible colours
% available for use from the `.tex` file.
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
\RequirePackage{hyperref}[]

\hypersetup{
    hidelinks,  % Disable link auto format, allowing to customise links look
}
\urlstyle{same}  % Use the same font for URLs

% String manipulation
% ---------------------------------------------------------------------------- %

% Add tools for string manipulation.
% https://ctan.org/pkg/xstring
\usepackage{xstring}[]

% PDF annotation
% ---------------------------------------------------------------------------- %

% Adds support for tooltips and comments.
% https://ctan.org/pkg/pdfcomment
\RequirePackage{pdfcomment}[]

% Text alignment
% ---------------------------------------------------------------------------- %

% Adds better support for text alignment.
% https://ctan.org/pkg/ragged2e
\RequirePackage{ragged2e}[]

% Extra tools
% ---------------------------------------------------------------------------- %

% Add tools to allow more complex LaTeX structures.
% https://ctan.org/pkg/etoolbox
\RequirePackage{etoolbox}[]

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
\newcommand{\birthday}[3]{%
    \IfInteger{#1}{}{%
        \ClassError{Résumé}{Year '#1' is not an integer}%
        {The format for the command is {YYYY}{MM}{DD}.\MessageBreak}%
    }%
    \IfInteger{#2}{}{%
        \ClassError{Résumé}{Month '#2' is not an integer}%
        {The format for the command is {YYYY}{MM}{DD}.\MessageBreak}%
    }%
    \IfInteger{#3}{}{%
        \ClassError{Résumé}{Day '#3' is not an integer}%
        {The format for the command is {YYYY}{MM}{DD}.\MessageBreak}%
    }%
    \def\@birthday{{#1} / {#2} / {#3}}%
}

% Define the contact e-mail.
%
% Arguments:
%     * e-mail address
%
\newcommand{\email}[1]{%
    \def\@email{#1}\ifdefempty{\@email}{%
        \ClassError{Résumé}{e-Mail '#1' is empty}%
        {The format for the command is {e-mail}.\MessageBreak}%
    }{}%
}

% Define the GitHub username (optional).
%
% Arguments:
%     * A GitHub username
%
\newcommand{\github}[1]{%
    \def\@github{#1}\ifdefempty{\@github}{%
        \ClassError{Résumé}{GitHub username '#1' is empty}%
        {The format for the command is {username}.\MessageBreak}%
    }{}%
}

% Define the GitLab username (optional).
%
% Arguments:
%     * A GitLab username
%
\newcommand{\gitlab}[1]{%
    \def\@gitlab{#1}\ifdefempty{\@gitlab}{%
        \ClassError{Résumé}{GitLab username '#1' is empty}%
        {The format for the command is {username}.\MessageBreak}%
    }{}%
}

% Define the BitBucket username (optional).
%
% Arguments:
%     * A BitBucket username
%
\newcommand{\bitbucket}[1]{%
    \def\@bitbucket{#1}\ifdefempty{\@bitbucket}{%
        \ClassError{Résumé}{BitBucket username '#1' is empty}%
        {The format for the command is {username}.\MessageBreak}%
    }{}%
}

% Define the Job title.
%
% Arguments:
%     * A job title
%
\newcommand{\jobtitle}[1]{%
    \def\@jobtitle{#1}\ifdefempty{\@jobtitle}{%
        \ClassError{Résumé}{Job title '#1' is empty}%
        {The format for the command is {job title}.\MessageBreak}%
    }{}%
}

% Define the LinkedIn username (optional).
%
% Arguments:
%     * A LinkedIn username
%
\newcommand{\linkedin}[1]{%
    \def\@linkedin{#1}\ifdefempty{\@linkedin}{%
        \ClassError{Résumé}{LinkedIn username '#1' is empty}%
        {The format for the command is {username}.\MessageBreak}%
    }{}%
}

% Define the name.
%
% Arguments:
%     * Last name(s)
%     * Fist name(s)
%
\newcommand{\name}[2]{%
    \def\@lastname{#1}\def\@firstname{#2}%
    \ifdefempty{\@lastname}{%
        \ClassError{Résumé}{Last name '#1' is empty}%
        {The format for the command is {last name}{first name}.\MessageBreak}%
    }{}%
    \ifdefempty{\@firstname}{%
        \ClassError{Résumé}{First name '#2' is empty}%
        {The format for the command is {last name}{first name}.\MessageBreak}%
    }{}%
}

% Define the contact phone number.
%
% Arguments:
%     * The phone number to be displayed
%     * The same number but without any spaces, dashes, and the like (except '+'
%       for the country code), to be used to create a clickable link
%
\newcommand{\phone}[2]{%
    \def\@phonedisplay{#1}\ifdefempty{\@phonedisplay}{%
        \ClassError{Résumé}{Display phone number '#1' is empty}%
        {The format for the command is {phone number}.\MessageBreak}%
    }{}%
    \def\@phonenumber{#2}\ifdefempty{\@phonenumber}{%
        \ClassError{Résumé}{Phone number '#2' is empty}%
        {The format for the command is {phone number}.\MessageBreak}%
    }{}%
}

% Define a path to a profile picture.
%
% Arguments:
%     * A path to an image
%
\newcommand{\profilepicture}[1]{%
    \def\@profilepicture{#1}\ifdefempty{\@profilepicture}{%
        \ClassError{Résumé}{Profile picture path '#1' is empty}%
        {The format for the command is {profile picture path}.\MessageBreak}%
    }{}%
}

% Left column
% ---------------------------------------------------------------------------- %

% Create a skillset.
%
% Arguments:
%     * The name of the skillset
%
\newenvironment{skillset}[1]{%
    \def\@temp{#1}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Skillset name '#1' is empty}%
        {The format for the environment is {skillset name}.\MessageBreak}%
    }{}%
    % Add the skill set name to a list of all skill sets.
    \listcsgadd{@skillsetslist}{#1}%
    % Add a skill to the current skillset.
    %
    % Arguments:
    %     * The name of the skill
    %     * The ability score for the skill
    %     * A tooltip for the score (optional, has a default depending on value)
    %
    \newcommand{\skill}[3]{%
        \def\@temp{##1}\ifdefempty{\@temp}{%
            \ClassError{Résumé}{Skill name '##1' is empty}%
            {%
                The format for the command is {skill name}{skill score}{score
                tooltip (optional)}.\MessageBreak
            }%
        }{}%
        \IfInteger{##2}{}{%
            \ClassError{Résumé}{Skill score '##2' is not an integer}%
            {%
                The format for the command is {skill name}{skill score}{score
                tooltip (optional)}.\MessageBreak
            }%
        }%
        \listcsgadd{@skillset{#1}}{{{##1}, {##2}, {##3}}}%
    }%
    % Makes sure that the list is created (the "nicer"
    % `\expandafter\newcommand\csname{@skillset{#1}}\endcsname{}` was not
    % working for some reason).
    \listcsgadd{@skillset{#1}}{foo}\listcsgremove{@skillset{#1}}{foo}  % Start with an empty list
}{}
\newcommand{\@skillsetslist}{}  % Start with an empty list

% Set a summary text (optional).
%
% Arguments:
%     * An introductory text
%
\newcommand{\summary}[1]{%
    \def\@summary{#1}\ifdefempty{\@summary}{%
        \ClassError{Résumé}{Summary '#1' is empty}%
        {The format for the command is {summary text}.\MessageBreak}%
    }{}%
}

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
\newcommand{\experience}[5]{%
    \def\@temp{#1}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Experience start date '#1' is empty}%
        {%
            The format for the command is {start}{end}{employer}{job title}
            {description (optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#2}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Experience end date '#2' is empty}%
        {%
            The format for the command is {start}{end}{employer}{job title}
            {description (optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#3}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Employer '#3' is empty}%
        {%
            The format for the command is {start}{end}{employer}{job title}
            {description (optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#4}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Job title '#4' is empty}%
        {%
            The format for the command is {start}{end}{employer}{job title}
            {description (optional)}.\MessageBreak
        }%
    }{}%
    \listcsgadd{@experiencelist}{{{#1}, {#2}, {#3}, {#4}, {#5}}}%
}
\newcommand{\@experiencelist}{}  % Start with an empty list

% Add an education entry (optional).
%
% Arguments:
%     * Start date
%     * End date
%     * University
%     * Degree
%     * Notes (optional)
%
\newcommand{\education}[5]{%
    \def\@temp{#1}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Education start date '#1' is empty}%
        {%
            The format for the command is {start}{end}{university}{degree}{notes
            optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#2}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Education end date '#2' is empty}%
        {%
            The format for the command is {start}{end}{university}{degree}{notes
            optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#3}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{University '#3' is empty}%
        {%
            The format for the command is {start}{end}{university}{degree}{notes
            optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#4}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Degree '#4' is empty}%
        {%
            The format for the command is {start}{end}{university}{degree}{notes
            optional)}.\MessageBreak
        }%
    }{}%
    \listcsgadd{@educationlist}{{{#1}, {#2}, {#3}, {#4}, {#5}}}%
}
\newcommand{\@educationlist}{}  % Start with an empty list

% Add a publication entry (optional).
%
% Arguments:
%     * Date
%     * Title
%     * URL
%     * Description (optional)
%
\newcommand{\publication}[4]{%
    \def\@temp{#1}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Publication date '#1' is empty}%
        {%
            The format for the command is {date}{title}{url}{description
            (optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#2}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Title '#2' is empty}%
        {%
            The format for the command is {date}{title}{url}{description
            (optional)}.\MessageBreak
        }%
    }{}%
    \def\@temp{#3}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{URL '#3' is empty}%
        {%
            The format for the command is {date}{title}{url}{description
            (optional)}.\MessageBreak
        }%
    }{}%
    \listcsgadd{@publicationslist}{{{#1}, {#2}, {#3}, {#4}}}%
}
\newcommand{\@publicationslist}{}  % Start with an empty list

% Wrapper
% ---------------------------------------------------------------------------- %

% Create the Résumé.
%
\newenvironment{resume}{}{%
    \@setmetadata     % Sets the PDF metadata.
    \@makebackground  % Sets the coloured background for the document.
    \@makeheader      % Create the top header part of the document.
    \@makeleft        % Create the left column of the document.
    \@makeright       % Create the right main column of the document.
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
    \begin{@stringswitch}{#1}%
        \@case{bold}{\textbf{#2}}%
        \@case{emphasised}{\emph{#2}}%
        \@case{italic}{\textit{#2}}%
        \@case{lowercase}{\lowercase{#2}}%
        \@case{medium}{\textmd{#2}}%
        \@case{mono}{\texttt{#2}}%
        \@case{normal}{\textnormal{#2}}%
        \@case{regular}{\textnormal{#2}}%
        \@case{slanted}{\textsl{#2}}%
        \@case{smallcase}{\textsc{#2}}%
        \@case{underlined}{\underline{#2}}%
        \@case{uppercase}{\uppercase{#2}}%
        \@default{%
            \ClassError{Résumé}{Unknown style '#1'}%
            {
                Valid styles are {
                    'bold', 'emphasised', 'italic', 'lowercase', 'medium',
                    'mono', 'normal', 'regular' (alias for normal), 'slanted',
                    'smallcase', 'underlined', 'uppercase'.
                }.\MessageBreak
            }%
        }%
    \end{@stringswitch}%
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
    \begin{@numswitch}{#1}%
        \@case{<}{-4}{\tiny#2\ClassWarning{Résumé}{%
            Size #1 is too small, casting to -4
        }}%
        \@case{=}{-4}{\tiny#2}%
        \@case{=}{-3}{\scriptsize#2}%
        \@case{=}{-2}{\footnotesize#2}%
        \@case{=}{-1}{\small#2}%
        \@case{=}{+0}{\normalsize#2}%
        \@case{=}{+1}{\large#2}%
        \@case{=}{+2}{\Large#2}%
        \@case{=}{+3}{\LARGE#2}%
        \@case{=}{+4}{\huge#2}%
        \@case{=}{+5}{\Huge#2}%
        \@case{>}{+5}{\Huge#2\ClassWarning{Résumé}{%
            Size #1 is too big, casting to +5
        }}%
    \end{@numswitch}%
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
    \def\@temp{#1}\ifdefempty{\@temp}{%
        \ClassError{Résumé}{Link URL '#1' is empty}%
        {%
            The format for the command is {url}{display text (optional)}.
            \MessageBreak
        }%
    }{}%
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

% Add a tooltip to an object.
%
% Arguments:
%     * Object
%     * Tooltip
%
\newcommand{\tooltip}[2]{%
    \pdftooltip{#1}{#2}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Internal commands                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Metadata
% ---------------------------------------------------------------------------- %

% Set the PDF metadata.
%
\newcommand{\@setmetadata}[0]{%
    \ifdefvoid{\@lastname}{%
        \ClassError{Résumé}{Name is missing}%
        {Check the 'name' command.\MessageBreak}%
    }{%
    \ifdefvoid{\@firstname}{%
        \ClassError{Résumé}{Name is missing}%
        {Check the 'name' command.\MessageBreak}%
    }{}}%
    \hypersetup{
        pdftitle={Résumé},% PDF file title.
        pdfauthor={\@lastname, \@firstname},% The name of the PDF author.
        pdfsubject={% PDF's description.
            Résumé for \@firstname{ }\@lastname.
            Based on a LaTeX Résumé template, which is made freely available @
            https://github.com/kip93/resume/ through the BSD-3 license.
        },
        pdfkeywords={Résumé, Resume, CV},% A set of keywords categorising the PDF's content.
        pdfcreator={LaTeX},
    }%
}

% Background
% ---------------------------------------------------------------------------- %

% Draw the coloured background.
%
\newcommand{\@makebackground}[0]{%
    % Left column.
    \@makerectangleoverlay{@white}{north west}{74mm}{\paperheight + 10mm}{0mm, 5mm}%
    % Header.
    \@makerectangleoverlay{@darkgray}{north}{\paperwidth + 10mm}{52mm}{\paperwidth / 2, 5mm}%
}

% Header
% ---------------------------------------------------------------------------- %

% Make the résumé header.
%
\newcommand{\@makeheader}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {@white}%
    \colorlet{dimtext}       {@lightgray}%
    \colorlet{background}    {@darkgray}%
    \colorlet{altbackground} {@black}%
    \colorlet{highlight}     {@lighthighlight}%
    %
    % Populate the header.
    \@makepersonalinfo%
    \@makeprofilepicture%
}

% Make the résumé header's text.
%
\newcommand{\@makepersonalinfo}[0]{%

    \begin{textblock*}{0.65\paperwidth}(10mm, 0mm)\begin{flushright}
        % Name.
        {%
            \ifdefvoid{\@lastname}{%
                \ClassError{Résumé}{Name is missing}%
                {Check the 'name' command.\MessageBreak}%
            }{%
            \ifdefvoid{\@firstname}{%
                \ClassError{Résumé}{Name is missing}%
                {Check the 'name' command.\MessageBreak}%
            }{}}%
            \formatted{text}{bold}{+3}{\stylised{smallcase}{\@lastname}, \@firstname}%
        % Job title.
        }\par\vspace{2mm}{%
            \ifdefvoid{\@jobtitle}{
                \ClassError{Résumé}{Job title is missing}%
                {Check the 'jobtitle' command.\MessageBreak}%
            }{}%
            \formatted{text}{italic}{+2}{\@jobtitle}%
        % Birthday.
        }\par\vspace{3mm}{%
            \ifdefvoid{\@birthday}{%
                \ClassError{Résumé}{Birthday is missing}%
                {Check the 'birthday' command.\MessageBreak}%
            }{}%
            \formatted{dimtext}{regular}{+1}{\@birthday}%
        % e-Mail & phone.
        }\par\vspace{3mm}{%
            \ifdefvoid{\@email}{%
                \ClassError{Résumé}{e-Mail is missing}%
                {Check the 'email' command.\MessageBreak}%
            }{}%
            \formattedlink{dimtext}{regular}{+1}{mailto:\@email}{\@email}%
            \formatted{dimtext}{regular}{+1}{\hspace{2mm}/\hspace{2mm}}%
            \ifdefvoid{\@phonenumber}{%
                \ClassError{Résumé}{Phone number is missing}%
                {Check the 'phone' command.\MessageBreak}%
            }{}%
            \formattedlink{dimtext}{regular}{+1}{tel:\@phonenumber}{\@phonedisplay}%
        % Linkedin.
        }\par\vspace{2mm}\ifdefvoid{\@linkedin}{%
            \ClassInfo{Résumé}{Linkedin username is missing (URL will be skipped)}%
        }{%
            \formattedlink{highlight}{regular}{+1}{https://linkedin.com/in/\@linkedin/}{}%
        % GitHub.
        \par\vspace{2mm}}\ifdefvoid{\@github}{%
            \ClassInfo{Résumé}{GitHub username is missing (URL will be skipped)}%
        }{%
            \formattedlink{highlight}{regular}{+1}{https://github.com/\@github/}{}%
        % GitLab.
        \par\vspace{2mm}}\ifdefvoid{\@gitlab}{%
            \ClassInfo{Résumé}{GitLab username is missing (URL will be skipped)}%
        }{%
            \formattedlink{highlight}{regular}{+1}{https://gitlab.com/\@gitlab/}{}%
        % BitBucket.
        \par\vspace{2mm}}\ifdefvoid{\@bitbucket}{%
            \ClassInfo{Résumé}{BitBucket username is missing (URL will be skipped)}%
        }{%
            \formattedlink{highlight}{regular}{+1}{https://bitbucket.com/\@bitbucket/}{}%
        \par\vspace{2mm}}%
    \end{flushright}\end{textblock*}%
}

% Make the résumé header's profile picture.
%
\newcommand{\@makeprofilepicture}[0]{%
    \ifdefvoid{\@profilepicture}{%
        \ClassError{Résumé}{Profile picture is missing}%
        {Check the 'profilepicture' command.\MessageBreak}%
    }{}%
    \begin{tikzpicture}[overlay]
        \node[
            rectangle,
            draw=dimtext,
            line width=3mm,
            inner sep=0mm,
            anchor=north east,
        ] at (\paperwidth - 10mm, 1mm){%
            \includegraphics[
                width=45mm,
            ]{\@profilepicture}%
        };
    \end{tikzpicture}%
}

% Left column
% ---------------------------------------------------------------------------- %

% Make the résumé left column.
%
\newcommand{\@makeleft}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {@black}%
    \colorlet{dimtext}       {@darkgray}%
    \colorlet{background}    {@white}%
    \colorlet{altbackground} {@lightgray}%
    \colorlet{highlight}     {@darkhighlight}%
    % Commands for section titles coloured according to background.
    \newcommand{\@leftsection}[1]{\@newsection{text}{##1}}%
    \newcommand{\@leftsubsection}[1]{\@newsubsection{highlight}{##1}}%

    %
    % Create the left column.
    \begin{textblock*}{62mm}(8mm, 44mm)\begin{flushleft}%
        \@makesummary%
        \@makeskills%
    \end{flushleft}\end{textblock*}%
}

% Make the résumé left column's about me section.
%
\newcommand{\@makesummary}[0]{%
    \ifdefvoid{\@summary}{%
        \ClassInfo{Résumé}{Summary text is not present (section will be skipped)}%
    }{%
        \@leftsection{About me}{\vspace{-6mm}\setlength{\parskip}{3mm}%
            \begin{justify}\formatted{dimtext}{regular}{+0}{\@summary}\end{justify}%
        }\par%
    }%
}

% Make the résumé left column's skills section.
%
\newcommand{\@makeskills}[0]{{%
    \@measure{@skillsetslist}\ifnumequal{\the@length}{0}{%
        \ClassError{Résumé}{No skillset present}%
        {Check the 'skillset' environment.\MessageBreak}%
    }{}%
    \@leftsection{Skills}{%
        \renewcommand{\do}[1]{%
            \@makeskillset{##1}%
        }\dolistcsloop{@skillsetslist}%
    }%
}}

% Make a single résumé left column's skillset.
%
% Arguments:
%     * The name of the skillset
%
\newcommand{\@makeskillset}[1]{{%
    \renewcommand{\do}[1]{%
        \@measure{@skillset{##1}}\ifnumequal{\the@length}{0}{%
            \ClassError{Résumé}{Skillset '##1' is empty}%
            {Check the 'skill' command.\MessageBreak}%
        }{}%
    }\dolistcsloop{@skillsetslist}%
    \@leftsubsection{#1}{%
        \renewcommand{\do}[1]{%
            \@makeskill{##1}%
        }\dolistcsloop{@skillset{#1}}%
    }\vspace{2mm}%
}}

% Make a single résumé left column's skillset's skill.
%
% Arguments:
%     * The name, score, and tooltip of the skill
%
\newcommand{\@makeskill}[1]{{%
    \renewcommand{\do}[1]{% Iterate over the entry to recover values.
        \ifdefvoid{\local@skillname}{\def\local@skillname{##1}}{%
        \ifdefvoid{\local@skillscore}{\def\local@skillscore{##1}}{%
                                      \def\local@skilltooltip{##1}}}%
    }\docsvlist{#1}%
    %
    \coloured{dimtext}{\local@skillname}\hfill% Set the skill name.
    \tooltip{\foreach \@x in {1, ..., 5}{% Draw the circles.
        \hspace{1mm}\@makecircle{\ifnumgreater{\@x}{\local@skillscore}{altbackground}{highlight}}%
    }}{%
        \ifdefempty{\local@skilltooltip}{%
        \ifnumless{\local@skillscore}{1} {0: I utterly stumble my way copying from Google.}{%
        \ifnumequal{\local@skillscore}{1}{1: I know some keywords that help me Google.}{%
        \ifnumequal{\local@skillscore}{2}{2: I understand what I am copying from Google.}{%
        \ifnumequal{\local@skillscore}{3}{3: I know exactly what to Google.}{%
        \ifnumequal{\local@skillscore}{4}{4: I can do some stuff without Google.}{%
                                          5: I only use Google because it is easier.}}}}}}{%
                                          \local@skilltooltip}%
    }\par%
}}

% Right column
% ---------------------------------------------------------------------------- %

% Make the résumé right column.
%
\newcommand{\@makeright}[0]{%
    % Colours based on background, to simplify usage.
    \colorlet{text}          {@black}%
    \colorlet{dimtext}       {@darkgray}%
    \definecolor{background} {HTML} {FFFFFF}%
    \colorlet{altbackground} {@lightgray}%
    \colorlet{highlight}     {@darkhighlight}%
    % Commands for section titles coloured according to background.
    \newcommand{\@rightsection}[1]{\@newsection{text}{##1}}%

    %
    % Create the right column.
    \begin{textblock*}{124mm}(78mm, 44mm)\begin{flushleft}%
        \@makeexperience%
        \@makeeducation%
        \@makepublications%
    \end{flushleft}\end{textblock*}%
}

% Make the résumé right column's experience.
%
\newcommand{\@makeexperience}[0]{{%
    \@measure{@experiencelist}\ifnumgreater{\the@length}{0}{%
        \@rightsection{Experience}{%
            \renewcommand{\do}[1]{%
                \@makeexperienceentry{##1}%
            }\dolistcsloop{@experiencelist}%
        }\vspace{1mm}%
    }{\ClassInfo{Résumé}{No experience given (section will be skipped)}}%
}}

% Make the résumé right column's single experience entry.
%
% Arguments:
%     * The start, end, employer, job title, and description
%
\newcommand{\@makeexperienceentry}[1]{{%
    \renewcommand{\do}[1]{% Iterate over the entry to recover values.
        \ifdefvoid{\local@jobstart}{\def\local@jobstart{##1}}{%
        \ifdefvoid{\local@jobend}{\def\local@jobend{##1}}{%
        \ifdefvoid{\local@jobemployer}{\def\local@jobemployer{##1}}{%
        \ifdefvoid{\local@jobtitle}{\def\local@jobtitle{##1}}{%
                                    \def\local@jobdescription{##1}}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\local@jobemployer}\par\vspace{1mm}%
    \formatted{dimtext}{smallcase}{+0}{\local@jobtitle}\hfill%
    \formatted{dimtext}{regular}{+0}{\local@jobstart{ -- }\local@jobend}\ifdefempty{\local@jobdescription}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\vspace{-11mm}\setlength{\parskip}{3mm}\begin{justify}\local@jobdescription\end{justify}\vspace{-3mm}}}\par\vspace{3mm}%
}}

% Make the résumé right column's education.
%
\newcommand{\@makeeducation}[0]{{%
    \@measure{@educationlist}\ifnumgreater{\the@length}{0}{%
        \@rightsection{Education}{%
            \renewcommand{\do}[1]{%
                \@makeeducationentry{##1}%
            }\dolistcsloop{@educationlist}%
        }\vspace{1mm}%
    }{\ClassInfo{Résumé}{No education given (section will be skipped)}}%
}}

% Make the résumé right column's single education entry.
%
% Arguments:
%     * The start, end, university, degree, and description
%
\newcommand{\@makeeducationentry}[1]{{%
    \renewcommand{\do}[1]{% Iterate over the entry to recover values.
        \ifdefvoid{\local@educationstart}{\def\local@educationstart{##1}}{%
        \ifdefvoid{\local@educationend}{\def\local@educationend{##1}}{%
        \ifdefvoid{\local@educationuniversity}{\def\local@educationuniversity{##1}}{%
        \ifdefvoid{\local@educationdegree}{\def\local@educationdegree{##1}}{%
                                           \def\local@educationdescription{##1}}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\local@educationdegree}\par\vspace{1mm}%
    \formatted{dimtext}{smallcase}{+0}{\local@educationuniversity}\hfill%
    \formatted{dimtext}{regular}{+0}{\local@educationstart{ -- }\local@educationend}\ifdefempty{\local@educationdescription}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\vspace{-11mm}\setlength{\parskip}{3mm}\begin{justify}\local@educationdescription\end{justify}\vspace{-3mm}}}\par\vspace{3mm}%
}}

% Make the résumé right column's publications.
%
\newcommand{\@makepublications}[0]{{%
    \@measure{@publicationslist}\ifnumgreater{\the@length}{0}{%
        \@rightsection{Publications}{%
            \renewcommand{\do}[1]{%
                \@makepublicationentry{##1}%
            }\dolistcsloop{@publicationslist}%
        }\vspace{1mm}%
    }{\ClassInfo{Résumé}{No publications given (section will be skipped)}}%
}}

% Make the résumé right column's single publication entry.
%
% Arguments:
%     * The date, title, url, and description
%
\newcommand{\@makepublicationentry}[1]{{%
    \renewcommand{\do}[1]{% Iterate over the entry to recover values.
        \ifdefvoid{\local@publicationdate}{\def\local@publicationdate{##1}}{%
        \ifdefvoid{\local@publicationtitle}{\def\local@publicationtitle{##1}}{%
        \ifdefvoid{\local@publicationlink}{\def\local@publicationlink{##1}}{%
                                           \def\local@publicationdescription{##1}}}}%
    }\docsvlist{#1}%
    %
    \formatted{dimtext}{bold}{+0}{\local@publicationtitle}\par\vspace{1mm}%
    \formattedlink{highlight}{regular}{+0}{\local@publicationlink}{}\hfill%
    \formatted{dimtext}{regular}{+0}{\local@publicationdate}\ifdefempty{\local@publicationdescription}{}{\par\vspace{2mm}%
    \formatted{dimtext}{italic}{+0}{\vspace{-11mm}\setlength{\parskip}{3mm}\begin{justify}\local@publicationdescription\end{justify}\vspace{-3mm}}}\par\vspace{3mm}%
}}

% Utility methods
% ---------------------------------------------------------------------------- %

% A command used internally to create sections.
%
% Arguments:
%     * Colour
%     * Text
%
\newcommand{\@newsection}[2]{%
    \raisebox{0mm}{%
        \makebox[\linewidth]{\raisebox{-1mm}{\formatted{#1}{regular}{+3}{#2}}\hspace{2mm}\@hlinefill{1pt}}%
    }\par\vspace{2mm}%
}

% A command used internally to create subsections.
%
% Arguments:
%     * Colour
%     * Text
%
\newcommand{\@newsubsection}[2]{%
    \formatted{#1}{regular}{+1}{#2}\par\vspace{0.5mm}%
}

% A command used internally to make a resizable hrulefill.
%
% Arguments:
%     * Line width
%
\newcommand{\@hlinefill}[1]{%
    \def\local@foo{\leavevmode\leaders\hrule height #1\hfill\kern\z@}\local@foo%
}

% A command used internally to create circles inline.
%
% Arguments:
%     * Fill colour
%
\newcommand{\@makecircle}[1]{%
    \begin{tikzpicture}[scale=0.15]%
        \node[
            circle,
            fill={#1},
        ] at (0, 0) {};
    \end{tikzpicture}%
}

% A command used internally to create rectangles as an overlay.
%
% Arguments:
%     * Fill colour
%     * Anchor point
%     * Width
%     * Height
%     * Position
%
\newcommand{\@makerectangleoverlay}[5]{%
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
\newcommand{\@case}[0]{}
\newcommand{\@default}[0]{}

% A command used internally as a switch case for strings.
%
% Arguments:
%     * A string to compare against some cases
%
\newenvironment{@stringswitch}[1]{%
    \def\local@switched{}%
    % A case to be matched.
    %
    % Arguments:
    %     * A string to compare
    %     * The result to use if comparison is true
    %
    \renewcommand{\@case}[2]{\ifdefempty{\local@switched}{\ifstrequal{#1}{##1}{##2\def\local@switched{true}}{}}{}}%
    % A case to use if no matches are found.
    %
    % Arguments:
    %     * The result to use if no other case matches the given value
    %
    \renewcommand{\@default}[1]{\ifdefempty{\local@switched}{##1\def\local@switched{true}}{}}%
}{%
}

% A command used internally as a switch case for decimal numbers.
%
% Arguments:
%     * A number to compare against some cases
%
\newenvironment{@numswitch}[1]{%
    \IfDecimal{#1}{}{%
        \ClassError{Résumé}{Num switch with non number '#1'}%
        {Num switch can only handle numbers.\MessageBreak}%
    }%
    \def\local@switched{}%
    % A case to be matched.
    %
    % Arguments:
    %     * A comparison (<, =, or >)
    %     * A number to compare
    %     * The result to use if comparison is true
    %
    \renewcommand{\@case}[3]{%
        \IfDecimal{##2}{}{%
            \ClassError{Résumé}{Num switch case with non number '##2'}%
            {Num switch can only handle numbers.\MessageBreak}%
        }%
        \ifdefempty{\local@switched}{\ifdimcomp{#1 pt}{##1}{##2 pt}{##3\def\local@switched{true}}{}}{}%
    }%
    % A case to use if no matches are found.
    %
    % Arguments:
    %     * The result to use if no other case matches the given value
    %
    \renewcommand{\@default}[1]{\ifdefempty{\local@switched}{##1\def\local@switched{true}}{}}%
}{%
}

% A value used to contain the result of the following command.
\newcounter{@length}%

% A command used internally to measure an etoolbox list.
%
% Arguments:
%     * The name of the etoolbox list
%
\newcommand{\@measure}[1]{{%
    \setcounter{@length}{0}%
    \renewcommand{\do}[1]{\stepcounter{@length}}%
    \dolistcsloop{#1}%
}}
