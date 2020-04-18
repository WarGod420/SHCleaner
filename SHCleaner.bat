@echo off
title SHCleaner v2.0.8 By SarahH12099

MODE 107,25

net session >nul 2>&1
if %errorLevel% == 2 (
    echo.
    echo Failure: Permission Denied, Please Run As Administrator
    echo.
    pause
    goto exit
)

if not exist "%programdata%\SarahH12099\SHCleaner\sqlite3.exe" (
echo -----------------------------------------------------------------------------------------------------------
echo SHCleaner Dependency Checker
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Checking for SHCleaner ProgramData
if not exist "%programdata%\SarahH12099\SHCleaner" (
    echo.
    echo SHCleaner ProgramData Not Found, Making Directory
    mkdir "%programdata%\SarahH12099\SHCleaner"
    echo.
    echo Successfully Made Directory
    echo.
) else (
    echo.
    echo SHCleaner ProgramData Exists
    echo.
)
echo Checking for SHCleaner SQLite3
if not exist "%programdata%\SarahH12099\SHCleaner\sqlite3.exe" (
    echo.
    echo SHCleaner SQLite3 Not Found
    echo.
    ping sarahh12099.github.io -n 1 -w 1000 | find "Reply" > nul
    if not errorlevel 1 (
        echo Connected to the Internet
        echo.
        echo Downloading And Installing Dependencies
        echo.
        cd "%programdata%\SarahH12099\SHCleaner"
        if exist "sqlite3.zip" (
            del /f /q "sqlite3.zip">nul 2>&1
        )>nul 2>&1
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest https://sarahh12099.github.io/files/sqlite3.zip -OutFile sqlite3.zip"
        powershell -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('sqlite3.zip', '%programdata%\SarahH12099\SHCleaner'); }"
        if exist "sqlite3.zip" (
            del /f /q "sqlite3.zip">nul 2>&1
        )>nul 2>&1
        cd \
        echo Done Downloading And Installing Dependencies
        echo.
        pause
        goto menu
    ) else (
        echo Not Connected to the Internet, Please Connect to the Internet and Try Again
        echo.
        pause
        goto exit
    )
)
)

:menu
cd \
set op=
cls
echo -----------------------------------------------------------------------------------------------------------
echo SHCleaner v2.0.8
echo Made By SarahH12099
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Select A Tool
echo =============
echo.
echo [1] Delete Internet History/Cache/Cookies (Brave, Chrome, Edge Chromium, Firefox)
echo [2] Application Cleanup
echo [3] Windows Cleanup
echo [4] Windows Update Cleanup
echo [5] Clear Clipboard
echo [6] Check For Updates
echo [7] Exit
echo.
set /p op=Run:
if "%op%"=="1" goto 1
if "%op%"=="2" goto 2
if "%op%"=="3" goto 3
if "%op%"=="4" goto 4
if "%op%"=="5" goto 5
if "%op%"=="6" goto 6
if "%op%"=="7" goto exit
goto error

:1
cls
echo -----------------------------------------------------------------------------------------------------------
echo Delete Internet History/Cache/Cookies (Brave, Chrome, Edge Chromium, Firefox, Internet Explorer)
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Cleaning Internet History/Cache/Cookies

:: Brave
if exist "%localappdata%\BraveSoftware\Brave-Browser\User Data" (
taskkill /F /IM "brave.exe">nul 2>&1
cd "%localappdata%\BraveSoftware\Brave-Browser\User Data"
del /q /f "BrowserMetrics*.pma">nul 2>&1
del /q /f "CrashpadMetrics*.pma">nul 2>&1
if exist "BrowserMetrics" (
cd "BrowserMetrics"
del /q /f "*.pma">nul 2>&1
cd ../
)>nul 2>&1
if exist "Crashpad" (
cd "Crashpad"
del /q /f "metadata">nul 2>&1
cd ../
)>nul 2>&1
if exist "ShaderCache\GPUCache" (
cd "ShaderCache\GPUCache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../../
)>nul 2>&1
cd \
for /d %%i in ("%localappdata%\BraveSoftware\Brave-Browser\User Data\*") do (
cd "%%i"
if exist "History*.*" (
del /q /f "*.ldb">nul 2>&1
del /q /f "*.log">nul 2>&1
del /q /f "Bookmarks.bak">nul 2>&1
del /q /f "Cookies*.*">nul 2>&1
del /q /f "CURRENT*.*">nul 2>&1
del /q /f "Current Session*.*">nul 2>&1
del /q /f "Current Tabs*.*">nul 2>&1
del /q /f "DownloadMetadata*.*">nul 2>&1
del /q /f "Extension Cookies*.*">nul 2>&1
del /q /f "History*.*">nul 2>&1
del /q /f "Last Session*.*">nul 2>&1
del /q /f "Last Tabs*.*">nul 2>&1
del /q /f "LOCK*.*">nul 2>&1
del /q /f "LOG.*">nul 2>&1
del /q /f "MANIFEST*.*">nul 2>&1
del /q /f "Network Action*.*">nul 2>&1
del /q /f "Network Persistent State*.*">nul 2>&1
del /q /f "QuotaManager*.*">nul 2>&1
del /q /f "Shortcuts*.*">nul 2>&1
del /q /f "Top Sites*.*">nul 2>&1
del /q /f "Visited Links*.*">nul 2>&1
del /q /f "Web Data*.*">nul 2>&1
if exist "AutofillStrikeDatabase" (
cd "AutofillStrikeDatabase"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Cache" (
cd "Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Code Cache" (
cd "Code Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "data_reduction_proxy_leveldb" (
cd "data_reduction_proxy_leveldb"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension Rules" (
cd "Extension Rules"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension State" (
cd "Extension State"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Feature Engagement Tracker" (
cd "Feature Engagement Tracker"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "File System" (
cd "File System"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "GCM Store" (
cd "GCM Store"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "IndexedDB" (
cd "IndexedDB"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsMostVisited" (
cd "JumpListIconsMostVisited"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsRecentClosed" (
cd "JumpListIconsRecentClosed"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Extension Settings" (
cd "Local Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Storage\leveldb" (
cd "Local Storage\leveldb"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Managed Extension Settings" (
cd "Managed Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Platform Notifications" (
cd "Platform Notifications"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Service Worker\Database" (
cd "Service Worker\Database"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Session Storage" (
cd "Session Storage"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db" (
cd "shared_proto_db"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db\metadata" (
cd "shared_proto_db\metadata"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Site Characteristics Database" (
cd "Site Characteristics Database"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Sync Data" (
cd "Sync Data"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "VideoDecodeStats" (
cd "VideoDecodeStats"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
)>nul 2>&1
cd \
)>nul 2>&1
)>nul 2>&1

:: Chrome
if exist "%localappdata%\Google\Chrome\User Data" (
taskkill /F /IM "chrome.exe">nul 2>&1
cd "%localappdata%\Google\Chrome\User Data"
del /q /f "BrowserMetrics*.pma">nul 2>&1
del /q /f "CrashpadMetrics*.pma">nul 2>&1
if exist "BrowserMetrics" (
cd "BrowserMetrics"
del /q /f "*.pma">nul 2>&1
cd ../
)>nul 2>&1
if exist "Crashpad" (
cd "Crashpad"
del /q /f "metadata">nul 2>&1
cd ../
)>nul 2>&1
if exist "ShaderCache\GPUCache" (
cd "ShaderCache\GPUCache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../../
)>nul 2>&1
cd \
for /d %%i in ("%localappdata%\Google\Chrome\User Data\*") do (
cd "%%i"
if exist "History*.*" (
del /q /f "*.ldb">nul 2>&1
del /q /f "*.log">nul 2>&1
del /q /f "Bookmarks.bak">nul 2>&1
del /q /f "Cookies*.*">nul 2>&1
del /q /f "CURRENT*.*">nul 2>&1
del /q /f "Current Session*.*">nul 2>&1
del /q /f "Current Tabs*.*">nul 2>&1
del /q /f "DownloadMetadata*.*">nul 2>&1
del /q /f "Extension Cookies*.*">nul 2>&1
del /q /f "History*.*">nul 2>&1
del /q /f "Last Session*.*">nul 2>&1
del /q /f "Last Tabs*.*">nul 2>&1
del /q /f "LOCK*.*">nul 2>&1
del /q /f "LOG.*">nul 2>&1
del /q /f "MANIFEST*.*">nul 2>&1
del /q /f "Network Action*.*">nul 2>&1
del /q /f "Network Persistent State*.*">nul 2>&1
del /q /f "QuotaManager*.*">nul 2>&1
del /q /f "Shortcuts*.*">nul 2>&1
del /q /f "Top Sites*.*">nul 2>&1
del /q /f "Visited Links*.*">nul 2>&1
del /q /f "Web Data*.*">nul 2>&1
if exist "AutofillStrikeDatabase" (
cd "AutofillStrikeDatabase"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Cache" (
cd "Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Code Cache" (
cd "Code Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "data_reduction_proxy_leveldb" (
cd "data_reduction_proxy_leveldb"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension Rules" (
cd "Extension Rules"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension State" (
cd "Extension State"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Feature Engagement Tracker" (
cd "Feature Engagement Tracker"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "File System" (
cd "File System"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "GCM Store" (
cd "GCM Store"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "IndexedDB" (
cd "IndexedDB"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsMostVisited" (
cd "JumpListIconsMostVisited"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsRecentClosed" (
cd "JumpListIconsRecentClosed"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Extension Settings" (
cd "Local Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Storage\leveldb" (
cd "Local Storage\leveldb"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Managed Extension Settings" (
cd "Managed Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Platform Notifications" (
cd "Platform Notifications"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Service Worker\Database" (
cd "Service Worker\Database"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Session Storage" (
cd "Session Storage"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db" (
cd "shared_proto_db"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db\metadata" (
cd "shared_proto_db\metadata"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Site Characteristics Database" (
cd "Site Characteristics Database"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Sync Data" (
cd "Sync Data"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "VideoDecodeStats" (
cd "VideoDecodeStats"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
)>nul 2>&1
cd \
)>nul 2>&1
)>nul 2>&1

:: Edge Chromium
if exist "%localappdata%\Microsoft\Edge\User Data" (
taskkill /F /IM "chrome.exe">nul 2>&1
cd "%localappdata%\Microsoft\Edge\User Data"
del /q /f "BrowserMetrics*.pma">nul 2>&1
del /q /f "CrashpadMetrics*.pma">nul 2>&1
if exist "BrowserMetrics" (
cd "BrowserMetrics"
del /q /f "*.pma">nul 2>&1
cd ../
)>nul 2>&1
if exist "Crashpad" (
cd "Crashpad"
del /q /f "metadata">nul 2>&1
cd ../
)>nul 2>&1
if exist "ShaderCache\GPUCache" (
cd "ShaderCache\GPUCache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../../
)>nul 2>&1
cd \
for /d %%i in ("%localappdata%\Microsoft\Edge\User Data\*") do (
cd "%%i"
if exist "History*.*" (
del /q /f "*.ldb">nul 2>&1
del /q /f "*.log">nul 2>&1
del /q /f "Bookmarks.bak">nul 2>&1
del /q /f "Cookies*.*">nul 2>&1
del /q /f "CURRENT*.*">nul 2>&1
del /q /f "Current Session*.*">nul 2>&1
del /q /f "Current Tabs*.*">nul 2>&1
del /q /f "DownloadMetadata*.*">nul 2>&1
del /q /f "Extension Cookies*.*">nul 2>&1
del /q /f "History*.*">nul 2>&1
del /q /f "Last Session*.*">nul 2>&1
del /q /f "Last Tabs*.*">nul 2>&1
del /q /f "LOCK*.*">nul 2>&1
del /q /f "LOG.*">nul 2>&1
del /q /f "MANIFEST*.*">nul 2>&1
del /q /f "Network Action*.*">nul 2>&1
del /q /f "Network Persistent State*.*">nul 2>&1
del /q /f "QuotaManager*.*">nul 2>&1
del /q /f "Shortcuts*.*">nul 2>&1
del /q /f "Top Sites*.*">nul 2>&1
del /q /f "Visited Links*.*">nul 2>&1
del /q /f "Web Data*.*">nul 2>&1
if exist "AutofillStrikeDatabase" (
cd "AutofillStrikeDatabase"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Cache" (
cd "Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Code Cache" (
cd "Code Cache"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "data_reduction_proxy_leveldb" (
cd "data_reduction_proxy_leveldb"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension Rules" (
cd "Extension Rules"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Extension State" (
cd "Extension State"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Feature Engagement Tracker" (
cd "Feature Engagement Tracker"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "File System" (
cd "File System"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "GCM Store" (
cd "GCM Store"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "IndexedDB" (
cd "IndexedDB"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsMostVisited" (
cd "JumpListIconsMostVisited"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "JumpListIconsRecentClosed" (
cd "JumpListIconsRecentClosed"
del /q /s /f "*.tmp">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Extension Settings" (
cd "Local Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Local Storage\leveldb" (
cd "Local Storage\leveldb"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Managed Extension Settings" (
cd "Managed Extension Settings"
del /q /s /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "Platform Notifications" (
cd "Platform Notifications"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Service Worker\Database" (
cd "Service Worker\Database"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Session Storage" (
cd "Session Storage"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db" (
cd "shared_proto_db"
del /q /f "LOG*.*">nul 2>&1
cd ../
)>nul 2>&1
if exist "shared_proto_db\metadata" (
cd "shared_proto_db\metadata"
del /q /f "LOG*.*">nul 2>&1
cd ../../
)>nul 2>&1
if exist "Site Characteristics Database" (
cd "Site Characteristics Database"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "Sync Data" (
cd "Sync Data"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
if exist "VideoDecodeStats" (
cd "VideoDecodeStats"
del /q /s /f "*.*">nul 2>&1
FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q>nul 2>&1
cd ../
)>nul 2>&1
)>nul 2>&1
cd \
)>nul 2>&1
)>nul 2>&1

:: Firefox
if exist "%appdata%\Mozilla\Firefox\Profiles" (
taskkill /F /IM "firefox.exe">nul 2>&1
for /d %%i in ("%appdata%\Mozilla\Firefox\Profiles\*") do (
cd "%%i"
if exist "cookies.sqlite" (
del /q /f "cookies.sqlite">nul 2>&1
)>nul 2>&1
if exist "formhistory.sqlite" (
del /q /f "formhistory.sqlite">nul 2>&1
)>nul 2>&1
if exist "places.sqlite" (
"%programdata%\SarahH12099\SHCleaner\sqlite3.exe" places.sqlite "DELETE FROM moz_historyvisits;">nul 2>&1
)>nul 2>&1
cd \
)>nul 2>&1
)>nul 2>&1

echo.
echo Done Cleaning Internet History/Cache/Cookies
:: Go Back To Menu
echo.
pause
goto menu

:2
cls
echo -----------------------------------------------------------------------------------------------------------
echo Application Cleanup
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Doing Application Cleanup

:: Adobe Audition 2020
if exist "%appdata%\Adobe\Audition\13.0\logs" (
taskkill /F /IM "Adobe Audition.exe">nul 2>&1
del /q /f "%appdata%\Adobe\Audition\13.0\logs\*.txt">nul 2>&1
)>nul 2>&1

:: Adobe Photoshop 2020
if exist "%appdata%\Adobe\Adobe Photoshop 2020\Logs" (
taskkill /F /IM "photoshop.exe">nul 2>&1
del /q /f "%appdata%\Adobe\Adobe Photoshop 2020\Logs\*.log">nul 2>&1
)>nul 2>&1

:: Affinity Designer
if exist "%appdata%\Affinity\Designer\1.0\Log.txt" (
taskkill /F /IM "Designer.exe">nul 2>&1
del /q /f "%appdata%\Affinity\Designer\1.0\Log.txt">nul 2>&1
)>nul 2>&1

:: Affinity Photo
if exist "%appdata%\Affinity\Photo\1.0\Log.txt" (
taskkill /F /IM "Photo.exe">nul 2>&1
del /q /f "%appdata%\Affinity\Photo\1.0\Log.txt">nul 2>&1
)>nul 2>&1

:: AirParrot 2
if exist "%localappdata%\AirParrot 2" (
taskkill /F /IM "AirParrot2.exe">nul 2>&1
del /q /f "%localappdata%\AirParrot 2\*.log">nul 2>&1
)>nul 2>&1

:: Auslogics Anti-Malware
if exist "%programdata%\Auslogics\Anti-Malware\1.x\Logs" (
del /q /f "%programdata%\Auslogics\Anti-Malware\1.x\Logs\*.log">nul 2>&1
)>nul 2>&1

:: Auslogics BoostSpeed 11
if exist "%programdata%\Auslogics\BoostSpeed\11.x\Logs" (
del /q /f "%programdata%\Auslogics\BoostSpeed\11.x\Logs\*.log">nul 2>&1
)>nul 2>&1
if exist "%programdata%\Auslogics\BoostSpeed\11.x\Reports" (
del /q /f "%programdata%\Auslogics\BoostSpeed\11.x\Reports\*.xml">nul 2>&1
del /q /f "%programdata%\Auslogics\BoostSpeed\11.x\Reports\*.html">nul 2>&1
)>nul 2>&1

:: Auslogics Disk Defrag Ultimate
if exist "%programdata%\Auslogics\Disk Defrag Ultimate\4.x\Reports" (
taskkill /F /IM "DiskDefragPro.exe">nul 2>&1
del /q /f "%programdata%\Auslogics\Disk Defrag Ultimate\4.x\Reports\*.xml">nul 2>&1
)>nul 2>&1

:: Auslogics Driver Updater
if exist "%programdata%\Auslogics\Driver Updater\1.x\Logs" (
taskkill /F /IM "DriverUpdater.exe">nul 2>&1
del /q /f "%programdata%\Auslogics\Driver Updater\1.x\Logs\*.log">nul 2>&1
)>nul 2>&1

:: Auslogics Registry Cleaner
if exist "%programdata%\Auslogics\Registry Cleaner\8.x\Reports" (
taskkill /F /IM "Integrator.exe">nul 2>&1
taskkill /F /IM "RegistryCleaner.exe">nul 2>&1
del /q /f "%programdata%\Auslogics\Registry Cleaner\8.x\Reports\*.xml">nul 2>&1
del /q /f "%programdata%\Auslogics\Registry Cleaner\8.x\Reports\*.html">nul 2>&1
)>nul 2>&1

:: Auslogics Registry Defrag
if exist "%programdata%\Auslogics\Registry Defrag\12.x\Reports" (
taskkill /F /IM "Integrator.exe">nul 2>&1
taskkill /F /IM "RegistryDefrag.exe">nul 2>&1
del /q /f "%programdata%\Auslogics\Registry Defrag\12.x\Reports\*.xml">nul 2>&1
del /q /f "%programdata%\Auslogics\Registry Defrag\12.x\Reports\*.html">nul 2>&1
)>nul 2>&1

:: Auslogics Windows Slimmer
if exist "%programdata%\Auslogics\Windows Slimmer\2.x\Reports" (
taskkill /F /IM "Integrator.exe">nul 2>&1
taskkill /F /IM "WindowsSlimmer.exe">nul 2>&1
del /q /f "%programdata%\Auslogics\Windows Slimmer\2.x\Reports\*.xml">nul 2>&1
del /q /f "%programdata%\Auslogics\Windows Slimmer\2.x\Reports\*.html">nul 2>&1
)>nul 2>&1

:: Cygwin
if exist "%systemdrive%\cygwin\home\.bash_history" (1
del /q /s /f "%systemdrive%\cygwin\home\.bash_history">nul 2>&1
)>nul 2>&1

:: Cygwin64
if exist "%systemdrive%\cygwin64\home\.bash_history" (1
del /q /s /f "%systemdrive%\cygwin64\home\.bash_history">nul 2>&1
)>nul 2>&1

:: Discord
if exist "%appdata%\Discord" (
taskkill /F /IM "Discord.exe">nul 2>&1
del /q /f "%appdata%\Discord\modules.log">nul 2>&1
)>nul 2>&1
if exist "%appdata%\Discord\Cache" (
rmdir "%appdata%\Discord\Cache" /s /q>nul 2>&1
)>nul 2>&1
if exist "%appdata%\Discord\GPUCache" (
rmdir "%appdata%\Discord\GPUCache" /s /q>nul 2>&1
)>nul 2>&1

:: Driver Easy
if exist "%appdata%\Easeware\DriverEasy\update_histories" (
taskkill /F /IM "DriverEasy.exe">nul 2>&1
del /q /f "%appdata%\Easeware\DriverEasy\update_histories\*.txt">nul 2>&1
)>nul 2>&1

:: Epic Games
if exist "%localappdata%\EpicGamesLauncher" (
taskkill /F /IM "EpicGamesLauncher.exe">nul 2>&1
)>nul 2>&1
if exist "%localappdata%\EpicGamesLauncher\Saved\Logs" (
rmdir "%localappdata%\EpicGamesLauncher\Saved\Logs" /s /q>nul 2>&1
)>nul 2>&1
if exist "%localappdata%\EpicGamesLauncher\Saved\webcache" (
rmdir "%localappdata%\EpicGamesLauncher\Saved\webcache" /s /q>nul 2>&1
)>nul 2>&1

:: eM Client
if exist "%appdata%\eM Client\Logs" (
taskkill /F /IM "MailClient.exe">nul 2>&1
del /q /f "%appdata%\eM Client\Logs\*.log">nul 2>&1
)>nul 2>&1

:: FileZilla
if exist "%appdata%\FileZilla\recentservers.xml" (
taskkill /F /IM "filezilla.exe">nul 2>&1
del /q /f "%appdata%\FileZilla\recentservers.xml">nul 2>&1
)>nul 2>&1

:: FL Studio 20
if exist "%systemdrive%\Users\%username%\Documents\Image-Line\FL Studio\Support\Logs" (
taskkill /F /IM "FL.exe">nul 2>&1
taskkill /F /IM "FL (scaled).exe">nul 2>&1
taskkill /F /IM "FL64.exe">nul 2>&1
taskkill /F /IM "FL64 (scaled).exe">nul 2>&1
del /q /s /f "%systemdrive%\Users\%username%\Documents\Image-Line\FL Studio\Support\Logs\*.*">nul 2>&1
FOR /D %%p IN ("%systemdrive%\Users\%username%\Documents\Image-Line\FL Studio\Support\Logs\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: Git
if exist "%systemdrive%\Users\%username%\.bash_history" (
del /q /f "%systemdrive%\Users\%username%\.bash_history">nul 2>&1
)>nul 2>&1

:: HitmanPro
if exist "%programdata%\HitmanPro\Logs" (
taskkill /F /IM "HitmanPro.exe">nul 2>&1
del /q /f "%programdata%\HitmanPro\Logs\*.log">nul 2>&1
)>nul 2>&1

:: Icecream Password Manager
if exist "%systemdrive%\Users\%username%\.Icecream Password Manager\log" (
taskkill /F /IM "PasswordManager.exe">nul 2>&1
del /q /f "%systemdrive%\Users\%username%\.Icecream Password Manager\log\*.txt">nul 2>&1
)>nul 2>&1

:: Icecream PDF Editor
if exist "%systemdrive%\Users\%username%\.Icecream PDF Editor\log" (
taskkill /F /IM "icepdfeditor.exe">nul 2>&1
del /q /f "%systemdrive%\Users\%username%\.Icecream PDF Editor\log\*.txt">nul 2>&1
)>nul 2>&1
if exist "%programdata%\sx.log" (
del /q /f "%programdata%\sx.log">nul 2>&1
)>nul 2>&1

:: Icecream Screen Recorder
if exist "%systemdrive%\Users\%username%\.Icecream Screen Recorder\log" (
taskkill /F /IM "recorder.exe">nul 2>&1
del /q /f "%systemdrive%\Users\%username%\.Icecream Screen Recorder\log\*.txt">nul 2>&1
)>nul 2>&1

:: Intel
if exist "%programdata%\Intel\Logs" (
del /q /f "%programdata%\Intel\Logs\*.log">nul 2>&1
)>nul 2>&1

:: Mailbird
if exist "%localappdata%\Mailbird" (
taskkill /F /IM "Mailbird.exe">nul 2>&1
del /q /f "%localappdata%\Mailbird\CefLog.log">nul 2>&1
del /q /f "%localappdata%\Mailbird\Log.log">nul 2>&1
)>nul 2>&1

:: McAfee Endpoint Security
if exist "%programdata%\McAfee\Endpoint Security\Logs" (
del /q /f "%programdata%\McAfee\Endpoint Security\Logs\*.log">nul 2>&1
)>nul 2>&1

:: MEGAsync
if exist "%localappdata%\Mega Limited\MEGAsync\logs" (
taskkill /F /IM "MEGAsync.exe">nul 2>&1
del /q /f "%localappdata%\Mega Limited\MEGAsync\logs\*.log">nul 2>&1
)>nul 2>&1

:: Minecraft
if exist "%appdata%\.minecraft\logs" (
taskkill /F /IM "MinecraftLauncher.exe">nul 2>&1
del /q /s /f "%appdata%\.minecraft\logs\*.*">nul 2>&1
FOR /D %%p IN ("%appdata%\.minecraft\logs\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: PDFelement 7
if exist "%appdata%\Wondershare\PDFelement 7\Configs\HistoryDatas.dat" (
taskkill /F /IM "PDFelement.exe">nul 2>&1
del /q /f "%appdata%\Wondershare\PDFelement 7\Configs\HistoryDatas.dat">nul 2>&1
)>nul 2>&1
if exist "%appdata%\Wondershare\PDFelement 7\Log" (
taskkill /F /IM "PDFelement.exe">nul 2>&1
del /q /f "%appdata%\Wondershare\PDFelement 7\Log\*.log">nul 2>&1
)>nul 2>&1

:: Process Lasso
if exist "%appdata%\ProcessLasso\logs" (
del /q /f "%appdata%\ProcessLasso\logs\*.log">nul 2>&1
)>nul 2>&1

:: qBittorrent
if exist "%localappdata%\qBittorrent\logs" (
taskkill /F /IM "qbittorrent.exe">nul 2>&1
del /q /f "%localappdata%\qBittorrent\logs\*.log">nul 2>&1
)>nul 2>&1

:: Reflector 3
if exist "%localappdata%\Reflector 3" (
taskkill /F /IM "Reflector3.exe">nul 2>&1
del /q /f "%localappdata%\Reflector 3\*.log">nul 2>&1
)>nul 2>&1

:: Revo Uninstaller Pro
if exist "%localappdata%\VS Revo Group\Revo Uninstaller Pro\Logs" (
taskkill /F /IM "RevoUninPro.exe">nul 2>&1
del /q /s /f "%localappdata%\VS Revo Group\Revo Uninstaller Pro\Logs\*.*">nul 2>&1
FOR /D %%p IN ("%localappdata%\VS Revo Group\Revo Uninstaller Pro\Logs\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: SOUND FORGE Pro & Pro Suite 13.0
if exist "%localappdata%\MAGIX\SOUND FORGE Pro\13.0" (
taskkill /F /IM "Forge130.exe">nul 2>&1
del /q /s /f "%localappdata%\MAGIX\SOUND FORGE Pro\13.0\*.log">nul 2>&1
FOR /D %%p IN ("%localappdata%\MAGIX\SOUND FORGE Pro\13.0\*.log") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: Steam
if exist "%localappdata%\Steam\htmlcache" (
taskkill /F /IM "Steam.exe">nul 2>&1
del /q /s /f "%localappdata%\Steam\htmlcache\*.*">nul 2>&1
FOR /D %%p IN ("%localappdata%\Steam\htmlcache\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: VEGAS Pro 17.0
if exist "%localappdata%\VEGAS Pro\17.0" (
taskkill /F /IM "vegas170.exe">nul 2>&1
del /q /s /f "%localappdata%\VEGAS Pro\17.0\*.log">nul 2>&1
FOR /D %%p IN ("%localappdata%\VEGAS Pro\17.0\*.log") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: Visual Studio Code
if exist "%appdata%\Code" (
taskkill /F /IM "Code.exe">nul 2>&1
)>nul 2>&1
if exist "%appdata%\Code\Cache" (
del /q /s /f "%appdata%\Code\Cache\*.*">nul 2>&1
FOR /D %%p IN ("%appdata%\Code\Cache\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1
if exist "%appdata%\Code\GPUCache" (
del /q /s /f "%appdata%\Code\GPUCache\*.*">nul 2>&1
FOR /D %%p IN ("%appdata%\Code\GPUCache\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1
if exist "%appdata%\Code\logs" (
del /q /s /f "%appdata%\Code\logs\*.*">nul 2>&1
FOR /D %%p IN ("%appdata%\Code\logs\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

echo.
echo Done Application Cleanup
:: Go Back To Menu
echo.
pause
goto menu

:3
cls
echo -----------------------------------------------------------------------------------------------------------
echo Windows Cleanup
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Doing Windows Cleanup

:: Local Temp
if exist "%temp%" (
del /q /s /f "%temp%\*.*">nul 2>&1
FOR /D %%p IN ("%temp%\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: Recycle Bin
if exist "C:\$Recycle.Bin" (
rd /q /s C:\$Recycle.Bin>nul 2>&1
)>nul 2>&1
if exist "D:\$Recycle.Bin" (
rd /q /s D:\$Recycle.Bin>nul 2>&1
)>nul 2>&1
if exist "E:\$Recycle.Bin" (
rd /q /s E:\$Recycle.Bin>nul 2>&1
)>nul 2>&1

:: Windows Temp
if exist "%windir%\Temp" (
del /q /s /f "%windir%\Temp\*.*">nul 2>&1
FOR /D %%p IN ("%windir%\Temp\*.*") DO rmdir "%%p" /s /q>nul 2>&1
)>nul 2>&1

:: Windows Recents & Thumbnail Cache
taskkill /F /IM "explorer.exe">nul 2>&1
if exist "%appdata%\Microsoft\Windows\Recent" (
del /q /a /f "%appdata%\Microsoft\Windows\Recent\*.lnk">nul 2>&1
)>nul 2>&1
if exist "%localappdata%\Microsoft\Windows\Explorer" (
del /q /a /f "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db">nul 2>&1
)>nul 2>&1
start explorer.exe>nul 2>&1

echo.
echo Done Windows Cleanup
:: Go Back To Menu
echo.
pause
goto menu


:4
cls
echo -----------------------------------------------------------------------------------------------------------
echo Windows Update Cleanup
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Doing Windows Update Cleanup

:: Windows Updates Downloads
if exist "%windir%\SoftwareDistribution\Download" (
net stop "wuauserv">nul 2>&1
del /q /s /f "%windir%\SoftwareDistribution\Download\*.*">nul 2>&1
FOR /D %%p IN ("%windir%\SoftwareDistribution\Download\*.*") DO rmdir "%%p" /s /q>nul 2>&1
net start "wuauserv">nul 2>&1
)>nul 2>&1

:: Windows Updates Logs
if exist "%windir%\Logs\WindowsUpdate" (
del /q /f "%windir%\Logs\WindowsUpdate\*.etl">nul 2>&1
)>nul 2>&1

echo.
echo Done Windows Update Cleanup
:: Go Back To Menu
echo.
pause
goto menu

:5
cls
echo -----------------------------------------------------------------------------------------------------------
echo Clear Clipboard
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Clearing Clipboard

:: Clear Clipboard
echo off | clip>nul 2>&1

echo.
echo Done Clearing Clipboard
:: Go Back To Menu
echo.
pause
goto menu

:6
cls
echo -----------------------------------------------------------------------------------------------------------
echo Check For Updates
echo -----------------------------------------------------------------------------------------------------------
echo.
echo Checking For Updates
echo.

:: Update Checker

ping sarahh12099.github.io -n 1 -w 1000 | find "Reply" > nul
if errorlevel 1 (
    echo Not Connected to the Internet, Please Connect to the Internet and Try Again
    echo.
    pause
    goto menu
)

Set "MD5="
For /f "skip=1 Delims=" %%# in (
  'certutil -hashfile "%programdata%\SarahH12099\SHCleaner\sqlite3.exe" MD5'
) Do If not defined MD5 Set MD5=%%#
Set MD5=%MD5: =%

set Version=2.0.8
cd %temp%

if exist "sqlite3md5.txt" (
del /f /q "sqlite3md5.txt">nul 2>&1
)>nul 2>&1
if exist "version.txt" (
del /f /q "version.txt">nul 2>&1
)>nul 2>&1

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest https://sarahh12099.github.io/files/sqlite3md5.txt -OutFile sqlite3md5.txt"
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest https://sarahh12099.github.io/files/version.txt -OutFile version.txt"

set /p Build=<sqlite3md5.txt
set /p Check=<version.txt

if exist "sqlite3md5.txt" (
del /f /q "sqlite3md5.txt">nul 2>&1
)>nul 2>&1
if exist "version.txt" (
del /f /q "version.txt">nul 2>&1
)>nul 2>&1

if %Check% == %Version% (
    echo SHCleaner is Up to Date
    echo.
) else (
    echo SHCleaner is Outdated
    echo.
    echo Opening update page
    echo.
    start "" https://github.com/SarahH12099/SHCleaner
)

if exist "%programdata%\SarahH12099\SHCleaner\sqlite3.exe" (
if %Build% == %MD5% (
    echo SHCleaner Dependencies are Up to Date
) else (
    echo SHCleaner Dependencies are Outdated
    echo.
    echo Preparing to Update Dependencies
    echo.
    del /f /q "%programdata%\SarahH12099\SHCleaner\sqlite3.exe">nul 2>&1
    echo Downloading And Installing Dependencies
    echo.
    cd "%programdata%\SarahH12099\SHCleaner"
    if exist "sqlite3.zip" (
        del /f /q "sqlite3.zip">nul 2>&1
    )>nul 2>&1
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest https://sarahh12099.github.io/files/sqlite3.zip -OutFile sqlite3.zip"
    powershell -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('sqlite3.zip', '%programdata%\SarahH12099\SHCleaner'); }"
    if exist "sqlite3.zip" (
        del /f /q "sqlite3.zip">nul 2>&1
    )>nul 2>&1
    echo Done Downloading And Installing Dependencies
)
)
cd \>nul 2>&1

echo.
echo Done Checking For Updates
:: Go Back To Menu
echo.
pause
goto menu

:error
cls
goto menu

:exit
exit