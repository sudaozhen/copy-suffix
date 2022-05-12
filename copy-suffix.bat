@echo off
mode con lines=20 cols=60
color 0a
title 文件复制      苏道桢------20101109
md D:\mp3 2>nul
:o
echo.
echo   本机所有磁盘列表:
echo -----------------------
echo 盘符  磁盘类型
echo.
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1,2 delims=\" %%a in ('fsutil fsinfo drives^|find /v ""') do (
    set aa=%%a
    set aa=!aa:~-2!
    for %%i in (!aa!) do fsutil fsinfo drivetype %%i
)
echo ------------------------
set/p cpan= 输入输出盘符: 
set/p wowo=输入文件夹名:
if "%cpan:~3,1%"=="\" set cpan=%cpan:~1,-1%
if not exist %cpan:~0,1%: echo 输入的盘符不存在^^^!  请重新输入...&pause>nul&goto o
set/p neirong=输入文件后缀：
echo 正在全盘搜索[ %neirong% ]并复制到[%cpan%:\%wowo%],排除[%cpan%:\ %wowo%]里的[ %neirong% ]
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
set "var=%%i"
set "drive=!var:~-2!"
fsutil fsinfo drivetype !drive!|find "固定">nul &&call:slz "!drive!"
)
echo 任务已完成&pause

:slz
if "%~1"=="" goto:eof
for /f "delims=" %%a in ('dir/s/b/a-d "%~1\*.%neirong%" 2^>nul') do (
set "var=%%a"
set "var=!var:~0,6!"
if /i not "!var!"=="%cpan%:\%wowo%\" xcopy /y/h/r "%%a" "%cpan%:\%wowo%\"
)
goto:eof 