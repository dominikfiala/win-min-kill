@echo off

title Windows Autoshutdown
echo Set minutes (event. followed by space and hours) until computer shutdown.
echo Set "0" to abort scheduled shutdown.

set /a seconds = 0
set /a minutes = 0
set /a hours = 0
set /p input=

for /f "tokens=1,2 delims=/ " %%a in ("%input%") do set minutes=%%a&set hours=%%b

set /a seconds = minutes * 60 + hours * 3600

echo.

if %seconds% == 0 goto abort
if not %seconds% == 0 goto shutdown

:shutdown
  set /a hours = %hours% + 0
	set /a hours = %hours% + 0

	shutdown.exe -s -f -t %seconds%
	echo Computer will shut down automatically in %hours%hrs and %minutes%min.
	pause
	exit
:abort
	shutdown.exe -a
	echo Scheduled shutdown aborted.
	pause
	exit
