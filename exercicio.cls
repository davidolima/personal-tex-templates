% ------------------------------------------ %
% David de Oliveira Lima, 04 de Maio de 2023 %
% ------------------------------------------ %

% Identificação -----------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercicio}[2023/05/04]

\RequirePackage{fancyhdr}

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\PassOptionsToClass{a4paper}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{titlesec}
\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
{1mm}{}[.\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{\thesubsubsection.}
{1mm}{}[.\quad]

\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

% Imports -----------------------------------

% Template
\usepackage[portuguese]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[bookmarksopen=true]{hyperref}
\usepackage{bookmark}
\usepackage{fancyhdr, geometry, titlesec}

% Uso frequente
\usepackage{hyphenat, amsmath, amssymb}


% Redefinições de comandos ------------------

\renewcommand{\phi}[0]{\varphi}

% Comandos personalizados -------------------
\newcommand{\cl}[0]{\Vdash}
\newcommand{\resposta}[0]{\\\indent\textbf{$\rotatebox[origin=c]{180}{$\Lsh$}$\hspace{1mm}Resposta:}\hspace{2.5mm}}

\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
\newcommand{\curso}[1]{ \newcommand{\cursolocal}{#1} }
\newcommand{\instituto}[1]{ \newcommand{\institutoloc}{#1} }

\newcommand{\CursoLang}{}
\newcommand{\DataLang}{Data}
\newcommand{\EstudanteLang}{Aluno}
\newcommand{\ProfessorLang}{\itshape Prof.}


% Comando para Exercício e Questão (mesma implementação).
% TODO: exercícios nomeados não devem incrementar o contador.
% Ex.: \execicio{abc} \exerciocio[3.3]{def} \exercicio{ghi} -> ghi deve ser exercicio 2 não 3.
\newcounter{exerciciocntr}
\newcommand{\exercicio}[2][\arabic{exerciciocntr}]{%
  \stepcounter{exerciciocntr}%
  \hypertarget{exercicio-{#1}}{}%
  \bookmark[dest=exercicio-{#1}]{Exercício {#1}}%
  \noindent\\\textbf{$\circ$ Exercício {#1}} \textit{#2}\\\indent}

\newcounter{questaocntr}
\newcommand{\questao}[2][\arabic{questaocntr}]{%
  \stepcounter{questaocntr}%
  \hypertarget{questao-{#1}}{}%
  \bookmark[dest=questao-{#1}]{Questão {#1}}%
  \noindent\\\textbf{$\circ$ Questão {#1}} \textit{#2}\\\indent}

% Cabeçalho e rodapé --------------------
\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO] {\footnotesize{\ifx\classlocal\undefined{}\else\itshape\classlocal{} --{} \fi}\makeatletter\@title\makeatother }
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}

% Formato do título --------------------
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
      \ifx\institutoloc\undefined{}\else{\scshape \institutoloc} \\\fi
      \ifx\@date\undefined{}\else{\scshape\@date}\\[10pt]\
        \hrule
        \vspace{10pt}
        {\LARGE \bfseries \@title} \\[5pt]
        \ifx\cursolocal\undefined{}\else\CursoLang{\cursolocal{} \ifx\professorloc\undefined{}\else{-- }\fi  }\fi
        \ifx\professorloc\undefined{}\else{\ProfessorLang \ {\itshape\professorloc}}\fi\\
        \EstudanteLang: {\itshape \@author}\hspace{8pt}
        \vspace{8pt}
        %\DataLang: {\itshape\@date}
        \hrule
        \vspace{20pt}
    \end{center}
}

% \newsavebox{\questaobox}
% \newenvironment{questao}
% {\begin{center} \begin{lrbox}{\questaobox}\begin{minipage}{.98\textwidth}}
%       % Adicionar contador de questão
%     {\end{minipage}\end{lrbox}\fbox{\usebox{\questaobox}} \end{center} }

\endinput
