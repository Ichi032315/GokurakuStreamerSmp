@echo off
rem StreamerSMP2 pack auto update. Run before launching the game (Modrinth App: Settings > Launch hooks > Pre-launch).
cd /d "%~dp0"
set "JAVA_EXE="
for /d %%d in ("%APPDATA%\ModrinthApp\meta\java_versions\zulu21*") do if exist "%%d\bin\java.exe" set "JAVA_EXE=%%d\bin\java.exe"
if not defined JAVA_EXE for /d %%d in ("%APPDATA%\ModrinthApp\meta\java_versions\zulu*") do if exist "%%d\bin\java.exe" set "JAVA_EXE=%%d\bin\java.exe"
if not defined JAVA_EXE where java >nul 2>nul && set "JAVA_EXE=java"
if not defined JAVA_EXE (
  echo Java was not found. Skipping the update.
  exit /b 0
)
"%JAVA_EXE%" -jar packwiz-installer-bootstrap.jar -s client https://raw.githubusercontent.com/Ichi032315/GokurakuStreamerSmp/main/pack.toml
rem Never block the game from starting, even if the update failed.
exit /b 0