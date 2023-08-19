@echo off
title Hashcat Menu!
color a
goto setup

:loop
cls
echo:
echo [-]----------------------------------------[-]
echo [-]             what you need ?            [-]
echo [-]----------------------------------------[-]
echo: 
echo [*] Current Selected Hash Number : %hash%
echo:
echo [1] Auto Detect Hashes
echo [2] Search for Hash
echo [3] Cracking
echo [4] Delete potfile
echo [5] Open hash file
echo [6] Display Last Cracked Hash
echo:
set /p "choice=Choose > "
setlocal enabledelayedexpansion
for %%i in (1 2 3 4 5 6) do (
    set "valid_choice=%%i"
    if "!choice!"=="!valid_choice!" (
        endlocal
        if /i "%choice%"=="1" goto autodetect
        if /i "%choice%"=="2" goto search_for_hash
        if /i "%choice%"=="3" goto cracking
        if /i "%choice%"=="4" goto delete_potfile
        if /i "%choice%"=="5" goto open_hash_file
		if /i "%choice%"=="6" goto pot_file
    )
)
endlocal
echo Invalid choice. Please enter a valid number.
pause
cls
goto loop

:setup
set hash=
set hash_name=
if not exist .\hashcat.exe (
	echo [-] Hashcat.exe not Found  
	echo [1] Download from here : https://hashcat.net/files/hashcat-6.2.6.7z 
	echo [2] put the bat file inside the hashcat folder!
	echo: 
	echo:
	pause 
)
	if not exist .\rockyou.txt (
	echo:
	echo:  	
	echo [-] rockyou.txt not Found
	echo [1] Download from here : https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt 
	echo [2] put it inside the hashcat folder!
	echo: 
	echo:
	pause
)
	if not exist .\hashes.txt (
	type nul > hashes.txt
)
cls
goto loop

:autodetect

set "empty=hashes.txt"
for %%A in (%empty%) do (
	if %%~zA==0 (
	
	echo: [-] %%A is empty
	echo: [-] add hashes inside %%A
	echo: 
	pause
	goto loop
	)
)
.\hashcat.exe hashes.txt rockyou.txt
echo:
pause 
goto cracking


:search_for_hash
set hash_name=
set /p "hash_name=Hash name >"

if not defined hash_name goto search_for_hash

echo.
echo Searching for hash...
echo.

hashcat --help | findstr /i "%hash_name%"

if %errorlevel% neq 0 (
    echo.
    echo Invalid hash name. Please enter a valid hash name.
    pause
    goto search_for_hash
)
goto cracking

:cracking

set /p "hash=Hash Number > "

if not defined hash goto search_for_hash

setlocal enabledelayedexpansion
set "validNumber=true"
for /F "delims=0123456789" %%i in ("!hash!") do (
    set "validNumber=false"
)
if "!validNumber!"=="false" (
    echo.
    echo Invalid hash number. Please enter a valid number.
    pause
    goto cracking
)
endlocal

if not exist hashes.txt (
    echo hashes.txt file not found. Please make sure the file exists.
    pause
    goto loop
)

if not exist rockyou.txt (
    echo rockyou.txt file not found. Please make sure the file exists.
    pause
    goto loop
)

echo.
echo Selected Hash Number: %hash%
echo.

set "empty=hashes.txt"
for %%A in (%empty%) do (
	if %%~zA==0 (
	
	echo: [-] %%A is empty
	echo: [-] add hashes inside %%A
	echo: 
	pause
	goto loop
	)
)

.\hashcat.exe -a 0 -m %hash% hashes.txt rockyou.txt
pause
goto loop
:delete_potfile
del /p .\hashcat.potfile
cls
goto loop

:open_hash_file
notepad hashes.txt
cls
goto loop
:pot_file
if exist .\hashcat.potfile (

cls
(
echo: - - - - - - - - - - - - - - - 
echo:
      	 type .\hashcat.potfile
echo:
echo: - - - - - - - - - - - - - - - 
)	
pause
cls
goto loop

) else (
    echo [-] pot file does not exist!
    pause
    goto loop
)