@echo off
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Not a git repository.
    pause
    exit /b 1
)

git diff --quiet HEAD -- .
if %errorlevel% equ 0 (
    echo [INFO] No changes to commit.
    pause
    exit /b 0
)

echo [1/3] Staging changes...
git add .

echo [2/3] Committing...
git commit -m "auto update %date% %time%"

echo [3/3] Pushing to remote...
git push

if %errorlevel% equ 0 (
    echo [OK] Done.
) else (
    echo [ERROR] Push failed.
)

pause
