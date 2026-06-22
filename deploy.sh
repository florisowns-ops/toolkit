#!/bin/bash
set -e

echo "🚀 免费工具箱 · 一键部署"
echo "========================="
echo ""

# Check for required tools
command -v gh >/dev/null 2>&1 || { echo "❌ 需要安装 GitHub CLI"; echo "   brew install gh"; echo "   然后运行: gh auth login"; exit 1; }

REPO="toolkit-$(date +%s | cut -c8-)"

echo "📦 创建 GitHub 仓库: $REPO"
gh repo create "$REPO" --public --source=. --push

echo ""
echo "✅ 已推送到 GitHub: https://github.com/$(gh api user --jq .login)/$REPO"
echo ""

# Vercel deploy
echo "🌐 部署到 Vercel..."
npx vercel --prod --yes 2>/dev/null || {
  echo ""
  echo "🔧 Vercel CLI 未登录，请手动操作："
  echo "   1. 打开 https://vercel.com"
  echo "   2. 用 GitHub 登录"
  echo "   3. 点击 New Project → Import → 选择 $REPO"
  echo "   4. 点 Deploy，30秒上线"
}

echo ""
echo "💰 上线后别忘了："
echo "   1. 把 sitemap.xml 里的 yourdomain.com 换成你的域名"
echo "   2. 提交到 Google Search Console"
echo "   3. 接入 Google AdSense 开始赚钱"
