@echo off

@REM General Purpose
doskey home=cd %USERPROFILE%
doskey ~=%USERPROFILE%
doskey profile=code %USERPROFILE%\.cmd_profile.bat
doskey ls=dir
doskey here=explorer .
doskey work=cd "C:\work"

@REM Bare Repo Configuration Tracking
doskey gitconfig=git config --edit --global

