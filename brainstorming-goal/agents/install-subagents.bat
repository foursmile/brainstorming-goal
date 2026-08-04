@echo off
REM Install brainstorming-goal subagent configs into the user's Codex agents directory.
REM Double-click to run. Source toml files sit next to this script.

setlocal enabledelayedexpansion

set "SRC=%~dp0"
set "DST=%USERPROFILE%\.codex\agents"

echo ================================================
echo  brainstorming-goal - install subagents
echo ================================================
echo Source: %SRC%
echo Target: %USERPROFILE%\.codex\agents
echo.

if not exist "%SRC%luna_worker.toml" (
  echo [FAIL] Source file not found: %SRC%luna_worker.toml
  echo        Run this script from the skill's agents folder.
  echo.
  pause
  exit /b 1
)

if not exist "%DST%" (
  echo Target dir does not exist, creating: "%DST%"
  mkdir "%DST%" || (
    echo [FAIL] Cannot create target dir: "%DST%"
    pause
    exit /b 1
  )
)

set /a OK=0
set /a FAIL=0

for %%F in (luna_worker.toml terra_worker.toml sol_worker.toml luna_reviewer.toml sol_advisor.toml) do (
  if exist "%SRC%%%F" (
    copy /y "%SRC%%%F" "%DST%\%%F" >nul 2>&1
    if !errorlevel! equ 0 (
      echo [OK]   %%F  -^>  %DST%\%%F
      set /a OK+=1
    ) else (
      echo [FAIL] %%F  - copy failed
      set /a FAIL+=1
    )
  ) else (
    echo [FAIL] %%F  - source not found in %SRC%
    set /a FAIL+=1
  )
)

echo.
echo --------------------------------
echo  Done. OK: %OK%  Failed: %FAIL%
echo --------------------------------
if %FAIL% gtr 0 exit /b 1
exit /b 0
