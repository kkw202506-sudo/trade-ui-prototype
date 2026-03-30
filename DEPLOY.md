# GitHub Pages 部署指南

## 📋 操作步骤

### 第一步：创建GitHub仓库

1. 访问 [github.com/new](https://github.com/new)
2. Repository name: `trade-ui-prototype`
3. Public/Private: 选择 **Public**（GitHub Pages免费版需要公开仓库）
4. **不要**勾选 "Add a README file"（我们已经有了）
5. 点击 "Create repository"

### 第二步：推送代码到GitHub

在项目目录 `d:/AI实验室/trade` 下执行以下命令：

```bash
# 添加远程仓库（替换 YOUR_USERNAME 为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/trade-ui-prototype.git

# 推送代码
git branch -M main
git push -u origin main
```

**如果需要登录**：GitHub会提示你输入用户名和Personal Access Token
- 生成Token：[github.com/settings/tokens](https://github.com/settings/tokens)
- 权限选择：`repo`（完整控制私有仓库）

### 第三步：启用GitHub Pages

1. 进入你刚创建的仓库
2. 点击 **Settings**（仓库页面右上角的齿轮图标）
3. 在左侧菜单找到 **Pages**（在 "Code and automation" 部分下）
4. 配置如下：
   - **Build and deployment** > **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main` / `root`
5. 点击 **Save**

### 第四步：获取访问链接

等待约1-2分钟，GitHub Pages 会自动部署，你会看到：

```
Your site is live at 🚀
https://YOUR_USERNAME.github.io/trade-ui-prototype/
```

点击链接即可访问你的UI原型！

## 🌐 访问示例

假设你的GitHub用户名是 `yourname`，访问链接将是：

```
https://yourname.github.io/trade-ui-prototype/
```

## 🔧 自定义域名（可选）

如果你有自己的域名：

1. 在仓库的 **Settings** > **Pages**
2. 点击 **Custom domain**
3. 输入你的域名（如：`ui.yourdomain.com`）
4. 在域名DNS管理中添加CNAME记录：
   - 名称：`ui`（或 `@`）
   - 值：`yourname.github.io`
5. 等待DNS生效（最多24小时）

## 📝 常见问题

### Q: 推送时提示权限错误？
A: 使用Personal Access Token替代密码：
1. 访问 [github.com/settings/tokens](https://github.com/settings/tokens)
2. 点击 "Generate new token" > "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 复制生成的token，在推送时作为密码输入

### Q: GitHub Pages显示404？
A: 检查以下几点：
1. 确认仓库是 **Public** 的
2. 等待2-3分钟让GitHub部署完成
3. 检查Settings > Pages中的配置是否正确
4. 确认 `ui-prototype.html` 文件在仓库根目录

### Q: 如何更新网站？
A: 直接推送新代码：
```bash
git add .
git commit -m "Update UI"
git push
```
GitHub Pages会自动重新部署（约1分钟）

## 📊 部署后的文件结构

```
trade-ui-prototype/
├── README.md              # 项目说明（会显示在仓库首页）
├── LICENSE                # 开源协议
├── ui-prototype.html      # UI原型主文件
├── ui-design-documentation.md  # 设计文档
└── .gitignore           # Git忽略配置
```

访问路径：
- 原型：`https://YOUR_USERNAME.github.io/trade-ui-prototype/ui-prototype.html`
- 文档：`https://YOUR_USERNAME.github.io/trade-ui-prototype/ui-design-documentation.md`
- README：`https://github.com/YOUR_USERNAME/trade-ui-prototype`

## 🎉 完成！

部署成功后，你可以：
1. ✅ 分享链接给团队成员查看
2. ✅ 在手机浏览器上测试响应式布局
3. ✅ 继续开发新功能并自动更新
4. ✅ 使用GitHub Issues跟踪问题

---

**需要帮助？** 查看 [GitHub Pages 官方文档](https://docs.github.com/en/pages)
