@echo off
chcp 65001 > nul
title WARNNG: SYSTEM COMPROMISED
color 0C

if not exist "SANDBOX" md "SANDBOX"
echo Важливий документ > "SANDBOX\diploma.doc"
echo Сімейне фото > "SANDBOX\photo.jpg"
echo Паролі > "SANDBOX\passwords.txt"

echo Ініціалізація протоколу шифрування...
timeout /t 2 > nul

for %%i in ("SANDBOX\*.*") do (
    echo. >> "%%i"
    echo ENCRYPTED BY SIM-RANSOM >> "%%i"
    echo YOUR DATA IS LOCKED >> "%%i"
    ren "%%i" "%%~nxi.LOCKED"
)

color 4F
echo ======================================================
echo         УВАГА! ВАШІ ФАЙЛИ ЗАШИФРОВАНО!
echo ======================================================
echo.
echo    Ми заблокували файли у папці SANDBOX.
echo    Вони мають розширення .LOCKED і змінений вміст.
echo.
echo    Щоб повернути файли, введіть код деактивації.
echo.

:unlock_attempt
set /p "code=Введіть код >> "
echo [ATTEMPT] Користувач ввів: %code% -- Час: %time% >> keylog_attempts.txt
if "%code%"=="1234" goto restore
echo [ERROR] НЕВІРНИЙ КОД! Спроба записана.
echo.
goto unlock_attempt

:restore
color 2F
echo [ACCESS GRANTED] Код прийнято.
echo Відновлення файлів...
timeout /t 2 > nul

ren "SANDBOX\*.LOCKED" "*."

echo.
echo Файли розблоковано. Перевірте папку SANDBOX.
echo Дякуємо за участь у симуляції.
pause
exit