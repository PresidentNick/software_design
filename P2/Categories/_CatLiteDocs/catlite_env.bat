@echo off
REM ----------------- Catalina Lite ---------------------
REM  FILL IN BOTH LINES BELOW AND DON'T TOUCH THE REST
REM  You should have already set CLASSPATH to include your files
REM  and PATH should have Java and swipl directories on it
REM -----------------------------------------------------

set SWIPROLOG=C:\Program Files\pl\bin
set CATALINA_DIR=C:\Java\Categories

REM ----------------------------------------------------------------------
REM --- DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING ---
REM ----------------------------------------------------------------------

REM CatalinaLite settings

set CATLIB=%CATALINA_DIR%
set GVIM_EXE=xxx.exe
set JAVA_EXE=java.exe
set SWIPL_EXE=swipl.exe
set SWIPL_WIN_EXE=swipl-win.exe
set BROWSER_EXE=yyy.exe

REM all relevant jar files under CATLIB

set CLASSPATH=%CLASSPATH%;%CATLIB%\_Core\lib\velocity.jar
set CLASSPATH=%CLASSPATH%;%CATLIB%\_Core\Core.jar
set CLASSPATH=%CLASSPATH%;%CATLIB%\violet.jar
set PATH=%PATH%;%SWIPROLOG%

prompt $N$G
C:\Windows\system32\cmd.exe
