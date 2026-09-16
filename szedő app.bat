@echo off
setlocal enabledelayedexpansion
title N3X0N :: BLACKGATE TERMINAL v13.37
color 0a
mode con: cols=110 lines=40

goto INTRO

:BAR
set "title=%~1"
echo.
echo   %title%
set "bar="
for /l %%i in (1,1,20) do (
    set "bar=!bar!#"
    set "pct=%%i"
    set /a pct=pct*5
    cls
    call :HEADER
    echo.
    echo   %title%
    <nul set /p ="  [!bar!"
    for /l %%j in (%%i,1,19) do <nul set /p =" "
    echo ] !pct!%%
    ping -n 1 -w 70 127.0.0.1 >nul
)
echo   [OK] COMPLETE.
ping -n 1 -w 300 127.0.0.1 >nul
goto :eof

:HEADER
echo ===============================================================
echo   N3X0N :: BLACKGATE TERMINAL
echo ===============================================================
goto :eof

:MATRIXLINE
set "chars=01#$%%@!ZXQJKV"
set "out="
for /l %%i in (1,1,60) do (
    set /a "r=!random! %% 12"
    for %%c in (!r!) do set "out=!out!!chars:~%%c,1!"
)
echo !out!
goto :eof

:INTRO
cls
color 0a
call :HEADER
echo.
echo   Initializing kernel...
ping -n 2 -w 200 127.0.0.1 >nul
for /l %%i in (1,1,10) do call :MATRIXLINE
ping -n 2 -w 300 127.0.0.1 >nul
cls

call :HEADER
echo.
call :BAR "Loading KERNEL_CORE.SYS"
call :BAR "Establishing STEALTH_PROXY_CHAIN"
call :BAR "Spoofing GHOST_DNS resolver"
call :BAR "Starting PACKET_SNIFF_ENGINE"
cls

call :HEADER
echo.
echo    _   _ ____  __   _____  _   _
echo   ^| \ ^| ^|___ \ \ \ / / _ \^| \ ^| ^|
echo   ^|  \^| ^| __) ^| \ V / ^| ^| ^|  \^| ^|
echo   ^| ^|\  ^|/ __/   ^| ^| ^|_^| ^| ^|\  ^|
echo   ^|_^| \_^|_____^|  ^|_^|\___/^|_^| \_^|
echo.
echo              [ TACTICAL NETWORK INTRUSION SUITE ]
echo.
ping -n 3 -w 300 127.0.0.1 >nul
goto MENU

:MENU
cls
call :HEADER
echo.
echo   OPERATOR: GHOST_0x7F         SESSION: ACTIVE        LINK: ENCRYPTED
echo.
echo   -----------------------------------------------------------
echo    [1] Target reconnaissance
echo    [2] Protocol analyzer / packet capture
echo    [3] Firewall breach sequence
echo    [4] Credential brute-force module
echo    [5] Matrix screensaver mode
echo    [0] Terminate session
echo   -----------------------------------------------------------
echo.
set /p choice="   >> COMMAND: "

if "%choice%"=="1" goto RECON
if "%choice%"=="2" goto PROTOCOL
if "%choice%"=="3" goto FIREWALL
if "%choice%"=="4" goto BRUTEFORCE
if "%choice%"=="5" goto MATRIXMODE
if "%choice%"=="0" goto END
goto MENU

:RECON
cls
call :HEADER
echo.
echo   [*] Initiating target reconnaissance...
echo.
call :BAR "Querying GEO-IP database"
call :BAR "Mapping network topology"
call :BAR "Scanning open ports"
echo.
echo   --- RESULT ---
echo   TARGET-ID      : 0x8F3A-BLACKGATE
echo   COUNTRY        : [REDACTED]
echo   OPEN PORTS     : 21 22 80 443
echo   RISK LEVEL     : MEDIUM
echo   -----------------------------------------------
echo.
pause
goto MENU

:PROTOCOL
cls
call :HEADER
echo.
echo   [*] Capturing live traffic...
echo.
for /l %%i in (1,1,14) do (
    set /a "p=!random! %% 4"
    if "!p!"=="0" echo   TCP  !random!.!random!.!random!.!random! -^> !random!.!random!.!random!.!random!  [SYN]
    if "!p!"=="1" echo   UDP  !random!.!random!.!random!.!random! -^> !random!.!random!.!random!.!random!  [DATA]
    if "!p!"=="2" echo   ICMP ECHO REQUEST
    if "!p!"=="3" echo   TLS  HANDSHAKE IN PROGRESS...
    ping -n 1 -w 150 127.0.0.1 >nul
)
echo.
echo   [OK] Capture complete.
echo.
pause
goto MENU

:FIREWALL
cls
call :HEADER
echo.
echo   [*] Breaching perimeter firewall...
echo.
call :BAR "Establishing encrypted tunnel"
call :BAR "Bypassing application layer filters"
call :BAR "Forging session token"
echo.
echo   #############################################
echo   #        ACCESS GRANTED                    #
echo   #############################################
echo.
pause
goto MENU

:BRUTEFORCE
cls
call :HEADER
echo.
echo   [*] Running credential brute-force...
echo.
set "target=admin"
set "result=Xk9#mQ2vLp!7"
set "chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#"
set /a len=13

for /l %%r in (1,1,18) do (
    set "guess="
    for /l %%i in (1,1,%len%) do (
        set /a "idx=!random! %% 65"
        for %%c in (!idx!) do set "guess=!guess!!chars:~%%c,1!"
    )
    echo   Attempt: !guess!
    ping -n 1 -w 90 127.0.0.1 >nul
)
echo.
echo   [OK] MATCH FOUND: %target% : %result%
echo.
pause
goto MENU

:MATRIXMODE
cls
color 0a
echo   Press any key to exit...
echo.
for /l %%z in (1,1,60) do (
    call :MATRIXLINE
)
pause >nul
goto MENU

:END
cls
color 0a
call :HEADER
echo.
call :BAR "Wiping session logs"
echo.
echo   Connection terminated.
echo.
ping -n 2 -w 400 127.0.0.1 >nul
color 07
exit /b 0
