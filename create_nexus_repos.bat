@echo off
setlocal enabledelayedexpansion

set NEXUS_URL=http://192.168.110.239:8081
set AUTH=SY14021003:shinhan1!

call :create_repo "by-maven-central-proxy" "maven/proxy" "{\"name\":\"by-maven-central-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://repo1.maven.org/maven2/\",\"contentMaxAge\":-1,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true},\"maven\":{\"versionPolicy\":\"RELEASE\",\"layoutPolicy\":\"STRICT\",\"contentDisposition\":\"INLINE\"}}"

call :create_repo "by-maven-google-proxy" "maven/proxy" "{\"name\":\"by-maven-google-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://maven.google.com/\",\"contentMaxAge\":-1,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true},\"maven\":{\"versionPolicy\":\"RELEASE\",\"layoutPolicy\":\"STRICT\",\"contentDisposition\":\"INLINE\"}}"

call :create_repo "by-maven-jboss-proxy" "maven/proxy" "{\"name\":\"by-maven-jboss-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://repository.jboss.org/nexus/service/rest/repository/browse/public/\",\"contentMaxAge\":-1,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true},\"maven\":{\"versionPolicy\":\"RELEASE\",\"layoutPolicy\":\"STRICT\",\"contentDisposition\":\"INLINE\"}}"

call :create_repo "by-maven-plugin-proxy" "maven/proxy" "{\"name\":\"by-maven-plugin-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://repo1.maven.org/maven2/\",\"contentMaxAge\":-1,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true},\"maven\":{\"versionPolicy\":\"RELEASE\",\"layoutPolicy\":\"STRICT\",\"contentDisposition\":\"INLINE\"}}"

call :create_repo "oss-gradle-plugin-proxy" "maven/proxy" "{\"name\":\"oss-gradle-plugin-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://plugins.gradle.org/m2\",\"contentMaxAge\":-1,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true},\"maven\":{\"versionPolicy\":\"RELEASE\",\"layoutPolicy\":\"STRICT\",\"contentDisposition\":\"INLINE\"}}"

call :create_repo "by-maven-group" "maven/group" "{\"name\":\"by-maven-group\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"group\":{\"memberNames\":[\"by-maven-central-proxy\",\"by-maven-jboss-proxy\",\"by-maven-google-proxy\"]}}"

call :create_repo "by-npm-proxy" "npm/proxy" "{\"name\":\"by-npm-proxy\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://registry.npmjs.org\",\"contentMaxAge\":1440,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true}}"

call :create_repo "internal" "pypi/proxy" "{\"name\":\"internal\",\"online\":true,\"storage\":{\"blobStoreName\":\"default\",\"strictContentTypeValidation\":true},\"proxy\":{\"remoteUrl\":\"https://pypi.org\",\"contentMaxAge\":1440,\"metadataMaxAge\":1440},\"negativeCache\":{\"enabled\":true,\"timeToLive\":1440},\"httpClient\":{\"blocked\":false,\"autoBlock\":true}}"

goto :eof

:create_repo
set NAME=%~1
set TYPE=%~2
set PAYLOAD=%~3

for /f %%i in ('curl -s -o NUL -w "%%{http_code}" -u "%AUTH%" "%NEXUS_URL%/service/rest/v1/repositories/%NAME%"') do set STATUS=%%i

if "%STATUS%"=="200" (
  echo [SKIP] %NAME% - 이미 존재
) else (
  for /f %%i in ('curl -s -o NUL -w "%%{http_code}" -u "%AUTH%" -X POST "%NEXUS_URL%/service/rest/v1/repositories/%TYPE%" -H "Content-Type: application/json" -d "%PAYLOAD%"') do set RESULT=%%i
  if "!RESULT!"=="201" (
    echo [OK] %NAME% - HTTP !RESULT!
  ) else (
    echo [FAIL] %NAME% - HTTP !RESULT!
  )
)
goto :eof
