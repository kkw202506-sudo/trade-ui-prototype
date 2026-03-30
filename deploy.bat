@title GitHub Pages 部署快捷脚本
@echo off
chcp 65001 >nul
echo ========================================
echo   GitHub Pages 部署到云端
echo ========================================
echo.

REM 检查是否在正确的目录
if not exist "ui-prototype.html" (
    echo ❌ 错误：请先在项目目录 d:\AI实验室\trade 下运行此脚本
    echo.
    pause
    exit /b 1
)

echo ✅ 项目目录检查通过
echo.

REM 检查是否已配置远程仓库
git remote -v | findstr "origin" >nul
if errorlevel 1 (
    echo ℹ️  尚未配置远程仓库
    echo.
    echo 请按以下步骤操作：
    echo.
    echo 1. 访问 https://github.com/new 创建新仓库
    echo    - Repository name: trade-ui-prototype
    echo    - 选择 Public (GitHub Pages免费版需要)
    echo.
    echo 2. 创建完成后，将 YOUR_USERNAME 替换为你的GitHub用户名，
    echo    然后执行以下命令：
    echo.
    echo    git remote add origin https://github.com/YOUR_USERNAME/trade-ui-prototype.git
    echo    git branch -M main
    echo    git push -u origin main
    echo.
    echo 3. 等待推送完成后，访问仓库设置启用GitHub Pages
    echo.
    pause
    exit /b 0
)

echo ✅ 远程仓库已配置
echo.

REM 显示当前分支
for /f "delims=" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i
echo 当前分支: %CURRENT_BRANCH%
echo.

REM 检查是否有未提交的更改
git status --short | findstr /r "." >nul
if not errorlevel 1 (
    echo ⚠️  检测到未提交的更改
    echo.
    echo 正在添加并提交更改...
    git add .
    git commit -m "Auto commit: Update before deploy"
    echo ✅ 提交完成
    echo.
)

echo 正在推送到 GitHub...
echo.

REM 推送到远程仓库
git push -u origin %CURRENT_BRANCH%

if errorlevel 1 (
    echo.
    echo ❌ 推送失败，可能的原因：
    echo    1. GitHub凭证已过期（需要使用Personal Access Token）
    echo    2. 网络连接问题
    echo    3. 仓库权限问题
    echo.
    echo 💡 解决方法：
    echo    1. 访问 https://github.com/settings/tokens 生成新的Token
    echo    2. 勾选 repo 权限
    echo    3. 推送时使用Token作为密码
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ 推送成功！
echo.
echo ========================================
echo   下一步：启用 GitHub Pages
echo ========================================
echo.
echo 1. 访问你的GitHub仓库
echo 2. 点击 Settings ⚙️
echo 3. 在左侧菜单找到 Pages
echo 4. Source 选择: Deploy from a branch
echo 5. Branch 选择: main / root
echo 6. 点击 Save
echo.
echo 等待1-2分钟后，你将获得访问链接：
echo.
echo 🌐 https://你的用户名.github.io/trade-ui-prototype/
echo.
echo 详细说明请查看: DEPLOY.md
echo.

choice /c YN /m "是否打开部署指南 (DEPLOY.md)"
if errorlevel 2 (
    echo.
    echo 完成！按任意键退出...
    pause >nul
) else (
    start notepad DEPLOY.md
)

exit /b 0