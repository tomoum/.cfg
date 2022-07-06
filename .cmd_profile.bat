@echo off

@REM General Purpose
doskey home=cd %USERPROFILE%
doskey ~=%USERPROFILE%
doskey profile=code %USERPROFILE%\.cmd_profile.bat
doskey ls=dir
doskey here=explorer .

@REM Bare Repo Configuration Tracking
doskey cfg=git --git-dir=%USERPROFILE%\\.cfg\\ --work-tree=%USERPROFILE% $*
doskey gitconfig=git config --edit --global

@REM WORK
DOSKEY work=cd "C:\work"

:: Linux
DOSKEY clone-esm=git clone "ssh://git@bitbucket.metro.ad.selinc.com:7999/icon/8022.ethernet_switch_manager.git" $*
DOSKEY clone-linux-c=git clone "ssh://git@bitbucket.metro.ad.selinc.com:7999/time/linux-components.git" $*
DOSKEY clone-ipc=git clone "ssh://git@bitbucket.metro.ad.selinc.com:7999/icon/8022.ipc.git" $*

DOSKEY linux=cd "C:\work\Linux"
DOSKEY esm=cd "C:\work\Linux\esm"
DOSKEY uber=cd "C:\work\Linux\uber"

:: Server Module
DOSKEY sm=cd "C:\SEL8030_Development"


:: Verification
DOSKEY clone-v=git clone "ssh://git@bitbucket.metro.ad.selinc.com:7999/icon/sel-8000-verification-repo.git" $*

DOSKEY tt=cd "C:\work\verification\vscode-settings\sel-8000-vscode"
