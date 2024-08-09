# 西南交通大学硕/博学位论文 LaTeX 模板

## 模板简介

西南交通大学硕/博学位论文 LaTeX 模板 swjtuThesis，严格按照《[西南交通大学研究生学位论文撰写范式（2024年7月编写）](https://gsnews.swjtu.edu.cn/info/1063/8744.htm)》的要求编写，查阅参考了很多的教程和资料（**由于个人能力有限，不能保证百分之百完全符合规范，但已经高度吻合**）。 

LaTeX 使得论文的内容与格式相分离，用户只需要专注内容，而格式已由模板控制好，有关 LaTeX 的全面教程可查阅[Overleaf官方教程](https://cn.overleaf.com/learn/latex/Tutorials)与[CSDN相关教程](https://blog.csdn.net/weixin_66397563/article/details/125709511)。

下载地址以及更新渠道：[GitHub](https://github.com/Pungjay/swjtuThesis)

## 文件说明

- `main.tex`：主文件，编译即可产生论文PDF；
- `swjtuThesis.cls`：文章的类文件，控制了论文的中英文字体、页边距、各级标题、封面、页眉页脚等，不建议用户修改；
- `swjtuThesis.sty`：文章的样式文件，控制了论文的公式、图片、表格、文献、算法、代码、脚注、列表、目录、图/表目录等，不建议用户修改；
-  `swjtuThesis.bst`：参考文献列表的样式文件，控制了各种文献类型在文献列表的呈现样式，不建议用户修改；
-  `simsun.ttc、simhei.ttf`：字体文件，在 .cls 文件中控制了论文的中文主要字体（衬线字体）为宋体、次要字体（无衬线字体）为黑体，请用户不要更改、移动和删除；
- `01_frontPart/`：用户需要撰写的论文的前置部分（包括中英文扉页信息、独创性声明、论文使用授权、中英文摘要、主要符号表(如须)、缩略词表(如须)）。而目录、图/表目录(如须)是通过LaTeX命令自动生成的（见主文件`main.tex`），封面请打印纸质版论文后用户自己封装；
- `02_bodyPart/`：用户需要撰写的论文的正文部分（包括绪论、具体研究内容、结论、致谢），而参考文献列表是通过LaTeX命令自动生成的（见主文件`main.tex`）。
- `03_behindPart/`：用户需要撰写的论文的结尾部分（附录(如须)、攻读硕士期间取得的成果）；
- `figures/`：论文中的图片的文件夹，LaTeX 支持多种图片格式，如 .jpg、.png、.eps、.pdf 等，建议用户尽可能使用.pdf形式的矢量图；
- `references/`：论文中的参考文献数据库的文件夹，其中的`ref_01.bib`、`ref_02.bib`是参考文献数据库，将论文中需要引用的所有文献的 BibTeX 格式复制粘贴到这里（建议通过[Google Scholar](https://scholar.google.com)查找或者 Zotero 软件搭配 Better BibTeX 插件一键导出）。
- `delete-temp-files`：使用本地编译的编译方式时，双击运行即可一键删除每次编译后产生的临时缓存文件（使用在线编译的编译方式则不需要，因为缓存文件保存在云端）。

## 编译方式

swjtuThesis 模板有两种编译方式：在线编译，本地编译。不论是哪种编译方式，编译器均必须选择 XeLaTeX（中文文档），不能用 pdfLaTeX（英文文档）。

### 1. 在线编译（推荐）

推荐使用 [Overleaf](https://cn.overleaf.com/) 在线 LaTeX 编辑器。可以在不安装任何工具的情况下编写 LaTeX 文档且**自动保存**，也可以和其他人**共享文档**以共同编辑，还具备**记录版本**的功能，能记录项目自创建起所做过的所有修改并保存在云端。

 1. 在 Overleaf 中“创建项目”→“上传项目”→上传`swjtuThesis.zip`压缩包；
 2. 左侧的项目预览栏的左上角的 “菜单”：
 - “编译器”→下拉选择 “XeLaTeX” ；
 - “TeX Live版本”→下拉选择“2024”；
 3. 右侧的文件预览窗口的左上角点击“重新编译”。

### 2. 本地编译
[Texstudio](https://texstudio.sourceforge.net/) 本地编 LaTeX 译器。需要先进行本地部署 TeX Live 环境，再进行Texstudio的安装，可以在[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)进行下载安装。Texstudio 可以在无网络的情况下**离线编译**，有能力的用户可查阅相关教程使用 **VS Code 搭配 LaTeX workshop 插件**直接在 VS Code 中进行写作。

## 其他说明

1. 硕士、博士的学位论文的格式要求完全相同，只是中英文扉页、页眉、研究成果标题这三处有文字差异。本模板默认为硕士论文，切换成博士论文的方法：
  - 在`01_frontPart/thesisInformation.tex`文件中，按照注释内容修改以下代码：
```
\cDegree{硕}  % 硕士论文请填“硕”，博士论文请填“博”
\eDegree{Master} % 硕士论文请填“Master”，博士论文请填“Doctoral”
\eThesis{Thesis} % 硕士论文请填“Thesis”，博士论文请填“Dissertation”
```

2. 本模板目前在bodyPart内容设置了4章内容：`chapter_01.tex`、`chapter_02.tex`、`chapter_03.tex`、`chapter_04.tex`。用户如需增加章，请新建空白`chapter_0X.tex`文件后上传至文件夹`bodyPart/`，同时在`main.tex`主文件的相应位置添加以下代码：
```
\include{02_bodyPart/chapter_0X}
```
3. 为了方便用户按类型分类文献，本文目前设置了2个参考文献数据库：`ref_01.bib`、`ref_02.bib`。用户可以设置添加.bib文件，也可重命名.bib文件：通过记事本软件生成.txt文件后修改后缀为.bib后上传，同时在主文件中需要修改以下代码：
```
\bibliography{references/ref_01,references/ref_02}
```
4. 本模板未能设置文献在论文中的上标引用与水平引用的混合模式，只含有上标引用。因此，应避免“由文献[4, 7-10]可知”的水平引用的写法，可以用（作者）等加上标引用的写法代替。
5. 文集和会议论文同属于析出型文献，由于GBT7714-2015中对于该类文献在文献列表中显示的是[M]//和][C]//，但考虑到文集已很少用而会议论文却常用，因而本模板的参考文献列表样式将其改成显示为[M].和][C].改动前后的效果为：
```
白书农. 植物开花研究[M]//李承森. 植物科学进展. 北京: 高等教育出版社, 1998: 146-163.
白书农. 植物开花研究[M]. 李承森. 植物科学进展. 北京: 高等教育出版社, 1998: 146-163.
Rathgeb A, Ma L, Tran M, et al. Extended depth of field imaging for mosaic hyperspectral images
[C]//Conference on Medical Imaging-Digital and Computational Pathology. San Diego, USA,
2023: 283-291.
Rathgeb A, Ma L, Tran M, et al. Extended depth of field imaging for mosaic hyperspectral images
[C]. Conference on Medical Imaging-Digital and Computational Pathology. San Diego, USA,
2023: 283-291.
```
## 注意事项

> 电子版论文：
> 请用户对`main.tex`主文件进行最终的编译之前，通过将带有作者和导师的手写签名的《独创性声明》及《使用授权》纸质版扫描成PDF文件，上传到`01_frontPart/`中替换对应的现有PDF文件，再进行编译即可得到电子版论文。
> 
> 纸质版论文：
> 请用户对`main.tex`主文件进行最终的编译之前，注释掉以下代码。再根据《范式》3.3节的要求通过Acrobat等PDF编辑器在合理的位置插入空白页，再进行整体双面打印，最后将带有作者和导师的手写签名的《独创性声明》及《使用授权》的纸质版插入，装订，即可得到纸质版论文。
```
\includepdf{01_frontPart/statement.pdf}
\includepdf{01_frontPart/copyright.pdf}
```
