@echo off
chcp 65001 >nul
setlocal

echo ============================================================
echo   Git 一键上传
echo ============================================================
echo.

REM 检查是否在 git 仓库内
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 当前目录不是 Git 仓库，请先 git init 或进入项目目录。
    pause
    exit /b 1
)

REM 检查是否有变更
git diff --quiet HEAD -- .
if %errorlevel% equ 0 (
    echo [INFO] 没有检测到文件变更，无需提交。
    pause
    exit /b 0
)

echo [1/3] 添加所有变更...
git add .

echo [2/3] 提交...
git commit -m "auto update %date% %time%"

echo [3/3] 推送到远程...
git push

if %errorlevel% equ 0 (
    echo.
    echo [OK] 上传完成。
) else (
    echo.
    echo [ERROR] 推送失败，请检查网络或凭据。
)

echo.
pause
endlocal
