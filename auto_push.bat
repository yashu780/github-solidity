@echo off
cd /d "D:\solidity-github"

git add .

git -c user.name="yashu780" -c user.email="sharmayashu740@gmail.com" ^
commit -m "Update Solidity practice files" || echo Nothing to commit

git push origin main

echo [%date% %time%] Auto push completed >> D:\solidity-github\git_log.txt

pause
```

---

**Key changes:**
1. Added `pause` at the end — window stays open so you can read output
2. Changed `|| exit /b 0` to `|| echo Nothing to commit` — so you can see what happened instead of silently exiting

---

**Run it manually first**

Double click the bat file directly — don't use Task Scheduler yet. Read what the window shows and share it here.

Most likely you'll see one of:
```
Everything up-to-date        ← already pushed, no new changes
Nothing to commit            ← no changes made since last push
error: authentication failed ← GitHub credentials issue