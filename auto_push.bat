@echo off
cd /d "D:\solidity-github"

:: Remove stale lock file if exists
if exist ".git\index.lock" (
    echo Removing stale lock file...
    del ".git\index.lock"
)

git add .

set msg=Auto update %date% %time%

git -c user.name="yashu780" -c user.email="sharmayashu740@gmail.com" ^
commit -m "%msg%" || (
    echo [%date% %time%] Nothing to commit >> git_log.txt
    exit /b 0
)

git pull origin main --rebase
if %errorlevel% neq 0 (
    echo [%date% %time%] Pull failed >> git_log.txt
    exit /b 1
)

git push origin main
if %errorlevel% neq 0 (
    echo [%date% %time%] Push failed >> git_log.txt
    exit /b 1
)

echo [%date% %time%] Auto push successful >> git_log.txt