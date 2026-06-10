#!/usr/bin/env bash
# 仓库内批量替换文件中旧的 GitHub 用户名为新的用户名
# 注意：请在执行前备份或在分支上操作。此脚本会修改工作区中的文件。
# 使用方法（在仓库根目录）:
#   bash scripts/replace_owner.sh "WUYAXI886" "socks5ip"

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 OLD_USER NEW_USER"
  exit 1
fi
OLD_USER=$1
NEW_USER=$2

# 扫描常见文件类型并替换 github.com/OLD_USER -> github.com/NEW_USER
find . -type f \( -name '*.md' -o -name '*.html' -o -name '*.yml' -o -name '*.yaml' -o -name '*.json' -o -name '*.svg' \) -print0 | \
  xargs -0 sed -i "s#github.com/${OLD_USER}#github.com/${NEW_USER}#g"

# 额外替换任何独立提及 OLD_USER 的纯文本（谨慎）
# find . -type f \( -name '*.md' -o -name '*.html' \) -print0 | xargs -0 sed -i "s#${OLD_USER}#${NEW_USER}#g"

echo "Replacement complete. Please review changes and commit in a branch before pushing.";
