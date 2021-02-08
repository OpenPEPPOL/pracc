@ECHO OFF

FOR /F %%I IN ("%~dp0\..\..") DO SET FOLDER=%%~fI

ECHO Run vefa-structure
docker-compose --project-directory %FOLDER% -f %FOLDER%\docker-compose.yml -p vefa-ehf-espd run --rm structure

REM echo Create ZIP file with schematrons
REM zip -qr "%FOLDER%\target\site\files\schematrons-1.zip" "%FOLDER%\rules\"
REM ren "%FOLDER%/target/site/files/schematrons-1.zip" "%FOLDER%/target/site/files/schematrons.zip"

ECHO Build and verify validation artifacts
docker-compose --project-directory %FOLDER% -f %FOLDER%\docker-compose.yml -p vefa-ehf-espd run --rm validator

ECHO Generate Asciidoctor documents
docker-compose --project-directory %FOLDER% -f %FOLDER%\docker-compose.yml -p vefa-ehf-espd run --rm asciidoctor
