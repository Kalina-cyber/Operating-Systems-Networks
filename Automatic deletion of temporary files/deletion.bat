@echo off
chcp 65001 > nul
rem Видалення всіх файлів із тимчасової директорії Windows
echo Очищення тимчасової директорії Windows...
del /q /f /s "%TEMP%\*" > nul 2>&1
for /d %%x in ("%TEMP%\*") do (
    rd /s /q "%%x" >nul 2>&1
)
timeout /t 3

rem Видалення історії відвідин інтернет-сторінок, яка зберігається у інтернет-браузері
echo Закінчення процесу Chrome...
taskkill /F /IM chrome.exe /T > nul 2>&1
if %errorlevel% equ 0 (
    echo Браузер Chrome було закрито.
) else (
    echo Chrome не був запущений.
)
timeout /t 3

set "CHROME_HIST=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Profile 16\History"
set "CHROME_HIST_JOURNAL=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Profile 16\History-journal"

echo Видалення історії Chrome...

if exist "%CHROME_HIST%" (
    del /q /f "%CHROME_HIST%"
    del /q /f "%CHROME_HIST_JOURNAL%"
    echo Файл історії успішно видалено.
) else (
    echo Файл історії не знайдено.
)

timeout /t 3