#!/bin/bash
cd "$(dirname "$0")"
echo "🚀 推送代码到 GitHub..."
git push
if [ $? -eq 0 ]; then
  echo "✅ 推送成功！Vercel 自动部署中..."
  echo "🌐 https://toolkit-delta-ten.vercel.app"
else
  echo "❌ 推送失败，请检查网络"
fi
echo ""
read -p "按回车关闭..." 
