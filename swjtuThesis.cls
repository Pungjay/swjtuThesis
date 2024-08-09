%% swjtuThesis.cls文件
%% Copyright 2015 
%% Original Author Limin HUANG.
%% 2015/01/30		v0.0, Begin of the projet, 		@Chengdu China
%% 2015/12/08		v1.0, Release of the projet, 	@Grenoble, France
%% 2020/06/01		v2.0, Revision by Hao WANG, 	@Chengdu, China
%% 2024/08/10		v3.0, Revision by Pungjay, 	    @Chengdu, China

%---------------------------------------------------------------%
%                             标识
%---------------------------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuThesis}[2015/12/07 v1.0 Southwest Jiaotong University Thesis document class]

%---------------------------------------------------------------%
%                             宏包
%---------------------------------------------------------------%

% swjtuThesis类基于ctexbook文档类制作
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 论文使用A4大小纸张，默认小四号字体
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook} 

% 装载样式文件中使用的宏包
\RequirePackage[bookmarksnumbered,pdfstartview=XYZ]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{ifthen}
\RequirePackage{xeCJKfntef}
\RequirePackage{fancyhdr}

%---------------------------------------------------------------%
%                         标题及版面格式
%---------------------------------------------------------------%

% 页边距
\RequirePackage[a4paper]{geometry}
\geometry{top=30mm,bottom=30mm,left=30mm,right=30mm}

% 段间距
\setlength{\parskip}{0pt}

% 中英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setCJKmainfont{simsun.ttc}[AutoFakeBold=2.80,AutoFakeSlant=0.30]
\setCJKsansfont{simhei.ttf}[AutoFakeBold=2.80]

% 各级标题
\ctexset{
    chapter={% 一级标题
        format={\centering \zihao{3} \sffamily},
        nameformat={}, 
        number={\arabic {chapter}}, 
        titleformat={},
        aftername={\quad},
        beforeskip={-8pt},
        afterskip={18pt}
    },
    section={% 二级标题
        format={\raggedright \zihao{4} \sffamily},
        aftername={\quad},
        beforeskip={18pt},
        afterskip={6pt}
    }, 
    subsection={% 三级标题
        format={\raggedright \zihao{4} \sffamily},
        aftername={\quad},
        beforeskip={12pt},
        afterskip={6pt}
    }, 
    subsubsection={% 四级标题
        format={\raggedright \zihao{-4} \sffamily},
        indent={2em},
        beforeskip={12pt},
        afterskip={6pt}
    }
}

%---------------------------------------------------------------%
%                题目、作者、导师、专业、图书信息等
%---------------------------------------------------------------%

% 论文类型
\newcommand{\cDegree}[1]{\def\@cDegree{#1}}
\newcommand{\eDegree}[1]{\def\@eDegree{#1}}
\newcommand{\eThesis}[1]{\def\@eThesis{#1}}

% 论文中英题目
\newcommand{\cTitle}[1]{\def\@cTitle{#1}}
\newcommand{\eTitle}[1]{\def\@eTitle{#1}}

% 论文作者信息
\newcommand{\cDiscipline}[1]{\def\@cDiscipline{#1}}
\newcommand{\eDiscipline}[1]{\def\@eDiscipline{#1}}
\newcommand{\cStudentID}[1]{\def\@cStudentID{#1}}
\newcommand{\eStudentID}[1]{\def\@eStudentID{#1}}
\newcommand{\cAuthor}[1]{\def\@cAuthor{#1}}
\newcommand{\eAuthor}[1]{\def\@eAuthor{#1}}
\newcommand{\cSchool}[1]{\def\@cSchool{#1}}
\newcommand{\eSchool}[1]{\def\@eSchool{#1}}

% 论文导师信息
\newcommand{\cSupervisor}[1]{\def\@cSupervisor{#1}}
\newcommand{\eSupervisor}[1]{\def\@eSupervisor{#1}}

% 论文分类及时间
\newcommand{\CI}[1]{\def\@CI{#1}}
\newcommand{\UDC}[1]{\def\@UDC{#1}}
\newcommand{\secLevel}[1]{\def\@secLevel{#1}}
\newcommand{\UCode}[1]{\def\@UCode{#1}}
\newcommand{\cDate}[3]{\def\@cDate{\dateprintC{#1}{#2}{#3}}}
\newcommand{\eDate}[3]{\def\@eDate{\dateprintE{#1}{#2}{#3}}}

%---------------------------------------------------------------%
%                          页眉及页脚
%---------------------------------------------------------------%

\renewcommand{\headrulewidth}{0.75pt} % 页眉的横线设置为0.75磅

% 中文摘要的页眉页脚
\newcommand{\cabstractpagestyle}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\zihao{5} 摘\quad 要}
    \fancyfoot[C]{\zihao{-5} \thepage}
    \fancypagestyle{plain}{\pagestyle{fancy}}
}

% 英文摘要的页眉页脚
\newcommand{\eabstractpagestyle}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\zihao{5} ABSTRACT}
    \fancyfoot[C]{\zihao{-5} \thepage}
    \fancypagestyle{plain}{\pagestyle{fancy}}
}

% 目录、图目录、表目录的页眉页脚
\newcommand{\listpagestyle}{
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[C]{\zihao{5} \leftmark}
	\fancyfoot[C]{\zihao{-5} \thepage}
	\fancypagestyle{plain}{\pagestyle{fancy}}
}

% 主要符号表的页眉页脚
\newcommand{\symbolpagestyle}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\zihao{5} 主要符号表}
    \fancyfoot[C]{\zihao{-5} \thepage}
    \fancypagestyle{plain}{\pagestyle{fancy}}
}

% 缩略词表的页眉页脚
\newcommand{\acronympagestyle}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\zihao{5} 缩略词表}
    \fancyfoot[C]{\zihao{-5} \thepage}
    \fancypagestyle{plain}{\pagestyle{fancy}}
}

% 从第1章第1页及之后的部分的页眉页脚
\newcommand{\mainpagestyle}{
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[C]{\zihao{5} 西南交通大学\@cDegree 士学位论文}
	\fancyfoot[C]{\zihao{-5} \thepage}
	\fancypagestyle{plain}{\pagestyle{fancy}}
}

%---------------------------------------------------------------%
%                           封面设计
%---------------------------------------------------------------%
	
\newcommand{\clearpagebyprint}{\if@twoside\cleardoublepage\else\clearpage\fi} 
\newcommand{\CJKunderlinecolor}{\color{black}} % 颜色默认blue, 改为black
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
\newcommand{\maketitlepage}{
	\clearpagebyprint
	\pagestyle{empty}
	\begin{titlepage}
		
		% 中文封面
		\linespread{1}
		\begin{flushleft}
		      {
			\zihao{-4}
                {\cover@CI}\fillinblank{8em}{\@CI}\hfill{\cover@secLevel}\fillinblank{8em}{\@secLevel}
			\\[10pt]
	        {\cover@UDC}\fillinblank{8em} 
                {\@UDC}\hfill{\cover@UCode}\fillinblank{6em}{\@UCode}
			\\
			}	
		\end{flushleft}
		\linespread{1.5}
		\vspace{20mm}
		\begin{center}
			{
				\zihao{1}
				{\sffamily \textbf{\cover@cUniversity}}
			}
                \\[6mm]
                {
				\zihao{2}
				{\textbf{\cover@cThesis}}
			}
			\vfill
			{
				\zihao{-2}
				\linespread{1.3}\selectfont
				\makebox[0pt]{
					\begin{minipage}{18em}
						\centering\sffamily\@cTitle
					\end{minipage}
				}
			}
			
			\vfill
			{
				\zihao{3}
                \linespread{1.75}\selectfont
                \makebox[6em][s]{学科专业}~\ful[5.8cm]{\@cDiscipline}\\
	 	  \makebox[6em][s]{学号}~\ful[5.8cm]{\@cStudentID}\\
	 	  \makebox[6em][s]{作者姓名}~\ful[5.8cm]{\@cAuthor}\\
	 	  \makebox[6em][s]{指导老师}~\ful[5.8cm]{\@cSupervisor}\\
	 	  \makebox[6em][s]{学院}~\ful[5.8cm]{\@cSchool}\\
			}
			\vfill
			{
				\zihao{3}
				{\@cDate}
			}
		\end{center}
		
		% 英文封面
		\clearpagebyprint
		\linespread{1.5}
		\vspace{25mm}
		\begin{center}
			{
				\zihao{4}
				\textbf{A~\@eThesis~Submitted~to}\\
				\vspace{3mm}
				\textbf{\cover@eUniversity~for~\@eDegree~Degree}
			}
			\vfill
			{
				\zihao{2}
				\linespread{1.3}\selectfont
				\makebox[0pt][c]{
					\begin{minipage}[c]{23em}
						\centering\textbf{\@eTitle}
					\end{minipage}
				}
			}
			\vfill
			{
				\zihao{3}
				\linespread{1.75}\selectfont
                \makebox[6em][r]{Discipline}~\ful[9cm]{\@eDiscipline}\\
	 	  \makebox[6em][r]{Student ID}~\ful[9cm]{\@eStudentID}\\
	 	  \makebox[6em][r]{Author}~\ful[9cm]{\@eAuthor}\\
	 	  \makebox[6em][r]{Supervisor}~\ful[9cm]{\@eSupervisor}\\
	 	  \makebox[6em][r]{School}~\ful[9cm]{\@eSchool}\\
			}
			\vfill
			{
				\zihao{3}
				{\@eDate}
			}
			\end{center}
	\end{titlepage}
}

%---------------------------------------------------------------%
%                        字符串配置
%---------------------------------------------------------------%

% \AtEndOfClass{\input{swjtuThesis.cfg}}

\def\cover@CI{中国图书分类号~}
\def\cover@UDC{国际图书分类号~}
\def\cover@secLevel{密级~}
\def\cover@UCode{单位代码~}

\def\cover@cUniversity{西\hspace{0.5em}南\hspace{0.5em}交\hspace{0.5em}通\hspace{0.5em}大\hspace{0.5em}学}
\def\cover@eUniversity{Southwest Jiaotong University}
\def\cover@cThesis{\hspace{0.2em}\@cDegree\hspace{0.5em}士\hspace{0.5em}学\hspace{0.5em}位\hspace{0.5em}论\hspace{0.5em}文}

\def\cover@eDegreeM{Master Degree}

\def\cover@eThesisM{Master Degree Thesis}

\newcommand{\dateprintC}[3]{
	{#1}年{#2}月{#3}日
}
\newcommand{\dateprintE}[3]{
	{#2}~{#3},~{#1}
}

\newcommand\ful[2][4cm]{\underline{\makebox[#1][c]{#2}}} % 固定长度下划线，用于中英文扉页

\endinput
