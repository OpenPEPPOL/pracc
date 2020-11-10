@ECHO OFF

FOR /F %%I IN ("%~dp0\..\..") DO SET FOLDER=%%~fI

PUSHD %FOLDER%

ECHO stopping running pracc container
FOR /F "delims=" %%i IN ('docker ps -q --filter "ancestor=pracc"') DO docker container stop %%i

ECHO removing pracc image
docker image rm -f pracc

ECHO clean target
rmdir /S /Q target

ECHO running build.cmd
call tools\bin\build.cmd

ECHO building pracc image
docker build --tag pracc .

ECHO running pracc image
docker run --rm -p 80:8000 -d pracc:latest

POPD

PAUSE
