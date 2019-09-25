echo off

REM ### This is a new comment done on new-feature

REM ##########################################################################
REM Program Name: <job name>_post.bat
REM Description:
REM  This script is a part of the batch framework.
REM  It is used to run bat/cmd processes.
REM Parameters:
REM #
REM History:
REM Date        Who                 Description
REM ----------  ------------------  ----------------------------------------
REM # June 19   JDA                 Created
REM ##########################################################################

REM #--- Initial Settings ---------------------------------------
SET SCRIPT_NAME=%CMD_DIR%\%process_id%_post.BAT
SET SOURCE_ZIP=%SFTP_IN_DIR%\%process_id%.ZIP
SET SOURCE_DAT=%IN_DIR%\%process_id%.dat
SET ARC_ZIP=%ARCHIVE_DIR%\%date:~-4%_%date:~4,2%_%date:~0,3%_%time:~0,2%_%time:~3,2%_%time:~6,2%_%process_id%.ZIP
SET ARC_DAT=%ARCHIVE_DIR%\%date:~-4%_%date:~4,2%_%date:~0,3%_%time:~0,2%_%time:~3,2%_%time:~6,2%_%process_id%.dat

REM #--- Script Output  -----------------------------------------
echo "Script          : %SCRIPT_NAME%"
echo "Source  ZIP File: %SOURCE_ZIP%"
echo "Source  DAT File: %SOURCE_DAT%"
echo "Archive ZIP File: %ARC_ZIP%"
echo "Archive DAT File: %ARC_DAT%"

REM #--- Checks  ------------------------------------------------
IF "%job_id%" == "" (
  echo "ERROR: Job must be started.\n"
  exit /b 1
)

IF NOT EXIST "%SOURCE_ZIP%" (
 echo "ERROR: Data File %SOURCE_ZIP% does not exist."
 exit /b 1
)

IF NOT EXIST "%SOURCE_DAT%" (
 echo "ERROR: Data File %SOURCE_DAT% does not exist."
 exit /b 1
)

REM #--- Archive File -------------------------------------------
move "%SOURCE_ZIP%" "%ARC_ZIP%"
move "%SOURCE_DAT%" "%ARC_DAT%"

 IF %ERRORLEVEL% GTR 0 (
	set RC=%ERRORLEVEL%
	exit /b %RC%
 )
