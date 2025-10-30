@echo off
cd /d "D:\solidity-github"

:: Configure git user (only needed once)
git config user.name "yashu780"
git config user.email "sharmayashu74@gmail.com"

:: Add and commit changes
git add .
git commit -m "Auto update from Remix" || echo "Nothing to commit"

:: Push to GitHub
git push https://github.com/yashu780/github-solidity.git main

:: Log the result
echo [%date% %time%] Auto push attempt completed >> D:\solidity-github\git_log.txt
pause