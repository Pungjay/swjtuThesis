@echo off
setlocal

:: 删除当前目录下的指定文件类型
del /q *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb *.synctex(busy) *.fls *.xdv *.fdb_latexmk

:: 递归删除子目录中的指定文件类型
for /r %%d in (.) do (
    if exist "%%d" (
        del /q "%%d\*.aux" "%%d\*.bbl" "%%d\*.blg" "%%d\*.log" "%%d\*.out" "%%d\*.toc" "%%d\*.bcf" "%%d\*.xml" "%%d\*.synctex" "%%d\*.nlo" "%%d\*.nls" "%%d\*.bak" "%%d\*.ind" "%%d\*.idx" "%%d\*.ilg" "%%d\*.lof" "%%d\*.lot" "%%d\*.ent-x" "%%d\*.tmp" "%%d\*.ltx" "%%d\*.los" "%%d\*.lol" "%%d\*.loc" "%%d\*.listing" "%%d\*.gz" "%%d\*.userbak" "%%d\*.nav" "%%d\*.snm" "%%d\*.vrb" "%%d\*.synctex(busy)" "%%d\*.fls" "%%d\*.xdv" "%%d\*.fdb_latexmk"
    )
)

endlocal