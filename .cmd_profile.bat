@echo off

@REM General Purpose
doskey home=cd %USERPROFILE%
doskey ~=%USERPROFILE%
doskey profile=code %USERPROFILE%\.cmd_profile.bat
doskey ls=dir
doskey here=explorer .
DOSKEY work=cd "C:\work"

@REM Bare Repo Configuration Tracking
doskey cfg=git --git-dir=%USERPROFILE%\\.cfg\\ --work-tree=%USERPROFILE% $*
doskey gitconfig=git config --edit --global

@REM PRIVATE WORK ALIASES
IF %USERNAME% EQU muhatomo (
    call "%USERPROFILE%\work.cmd"
)
