@echo off
mode con lines=20 cols=60
color 0a
title �ļ�����      �յ���------20101109
md D:\mp3 2>nul
:o
echo.
echo   �������д����б�:
echo -----------------------
echo �̷�  ��������
echo.
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1,2 delims=\" %%a in ('fsutil fsinfo drives^|find /v ""') do (
    set aa=%%a
    set aa=!aa:~-2!
    for %%i in (!aa!) do fsutil fsinfo drivetype %%i
)
echo ------------------------
set/p cpan= ��������̷�: 
set/p wowo=�����ļ�����:
if "%cpan:~3,1%"=="\" set cpan=%cpan:~1,-1%
if not exist %cpan:~0,1%: echo ������̷�������^^^!  ����������...&pause>nul&goto o
set/p neirong=�����ļ���׺��
echo ����ȫ������[ %neirong% ]�����Ƶ�[%cpan%:\%wowo%],�ų�[%cpan%:\ %wowo%]���[ %neirong% ]
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find /v ""') do (
set "var=%%i"
set "drive=!var:~-2!"
fsutil fsinfo drivetype !drive!|find "�̶�">nul &&call:slz "!drive!"
)
echo ���������&pause

:slz
if "%~1"=="" goto:eof
for /f "delims=" %%a in ('dir/s/b/a-d "%~1\*.%neirong%" 2^>nul') do (
set "var=%%a"
set "var=!var:~0,6!"
if /i not "!var!"=="%cpan%:\%wowo%\" xcopy /y/h/r "%%a" "%cpan%:\%wowo%\"
)
goto:eof 