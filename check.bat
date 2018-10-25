@SETLOCAL&ECHO OFF

SET env_install_vsto=1

REG QUERY "HKLM\SOFTWARE\Microsoft\VSTO Runtime Setup\v4">NUL 2>&1
IF %ERRORLEVEL% EQU 0  SET env_install_vsto=0
CALL REM Suppresses previous errors.

REG QUERY "HKLM\SOFTWARE\Microsoft\VSTO Runtime Setup\v4R">NUL 2>&1
IF %ERRORLEVEL% EQU 0  SET env_install_vsto=0
CALL REM Suppresses previous errors.

REG QUERY "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSTO Runtime Setup\v4">NUL 2>&1
IF %ERRORLEVEL% EQU 0  SET env_install_vsto=0
CALL REM Suppresses previous errors.

REG QUERY "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSTO Runtime Setup\v4R">NUL 2>&1
IF %ERRORLEVEL% EQU 0  SET env_install_vsto=0
CALL REM Suppresses previous errors.

IF %env_install_vsto% EQU 1 (
    @ECHO:&ECHO @ Run VSTO Runtime installer. It also updates older VSTO versions.  %TIME%
    @ECHO CALL %vsto_installer% ALLUSERS="1" /quiet /norestart /log %LogFile_vsto_installer%
    REM CALL %vsto_installer% ALLUSERS="1" /quiet /norestart /log %LogFile_vsto_installer%
    REM CALL %q_env_cmd_util%\exit_if_error
) ELSE (
    @ECHO:&ECHO @ No need to install VSTO.
)