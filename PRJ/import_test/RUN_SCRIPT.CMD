:: THIS______FILE: <REPO_ROOT>/PRJ/import_test/RUN_SCRIPT.CMD
:: PASTEBIN_TITLE: WCC_IMPORT_TEST:RUN_SCRIPT.CMD
:: PASTEBIN___URL: https://pastebin.com/TCYsSYu7

:: Some Bash (.cmd) basics:
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo OFF  REM Echo is annoying, output is usually useless clutter.
          REM but might be good to do: "echo ON" when debugging script.
		  
		  REM The word "REM" starts a comment line in microsoft batch (.cmd)
		  REM "::" at the start of a line is a hackish comment.
		  REM      It is an empty label that can never be jumped to.
		  REM      People like to use it because REM is kind of cluttery.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: SET lib_folder=%CD%../../LIB   

:: make some variables so command calls are shorter.
:: lib_folder : Folder where my utility class is.
::  sp_folder : sourcepath folder
::  cp_folder : classpath folder (yes, same as lib_folder here)
::  TODO: fix lib_folder to be less hard coded and relative to script directory maybe?
::SET lib_folder=C:/Users/cis/Desktop/JM_WCC/LIB
SET lib_folder=%CD%/../../LIB
SET  sp_folder=%lib_folder%/*.java
SET  cp_folder=%lib_folder%
echo "%sp_folder%"
 
:: Compile Using Javac:
:: -cp      : classpath folder, to compile dependencies ( your imports )
:: -verbose : javac outputs more information so you can troubleshoot
:: -d       : where should the compiled dependencies's .class files go?
:: %CD%     : built in .CMD variable for current directory
javac -cp %cp_folder% -verbose  -d %CD% Main.java

:: After Main.java is compiled, it will produce "Main.class"
:: we run "Main.class" by typing "java Main"
:: The "java" command assumes "Main" means "Main.class"
:: In other words, the extension is assumed to be ".class"
::java Main.java  <<error: class found on application class path: Main
  java Main 

PAUSE

:: REM :: Also See:
:: REM :: javac -sourcepath %sp_folder% -verbose  -d %CD% Main.java
:: REM :: https://stackoverflow.com/questions/4764768/java-how-can-i-compile-an-entire-directory-structure-of-code