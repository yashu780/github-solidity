@REM @echo off
@REM cd /d "D:\solidity-github"

@REM :: Configure git user (only needed once)
@REM git config user.name "yashu780"
@REM git config user.email "sharmayashu74@gmail.com"

@REM :: Add and commit changes
@REM git add .
@REM git commit -m "Auto update from Remix" || echo "Nothing to commit"

@REM :: Push to GitHub
@REM git push https://github.com/yashu780/github-solidity.git main

@REM :: Log the result
@REM echo [%date% %time%] Auto push attempt completed >> D:\solidity-github\git_log.txt
@REM pause
@echo off
cd /d "D:\solidity-github"

git add .

git -c user.name="yashu780" -c user.email="sharmayashu740@gmail.com" ^
commit -m "Update Solidity practice files" || exit /b 0

git push origin main

echo [%date% %time%] Auto push completed >> D:\solidity-github\git_log.txt
