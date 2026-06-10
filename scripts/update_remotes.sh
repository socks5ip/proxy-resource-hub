#!/usr/bin/env bash
# 批量更新本地 clone 仓库的 origin remote 为新用户名 socks5ip
# 用法：把本脚本放到包含多个仓库目录的父目录下运行：
#   bash scripts/update_remotes.sh

set -e
NEW_USER="socks5ip"
for d in */.git; do
  repo_dir="$(dirname "$d")"
  echo "Processing $repo_dir"
  cd "$repo_dir" || continue
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    old_url=$(git remote get-url origin || true)
    if [ -z "$old_url" ]; then
      echo "  no origin remote, skipping"
    else
      echo "  old remote: $old_url"
      # Build new url for both ssh and https
      if [[ $old_url == git@github.com:* ]]; then
        repo_name=${old_url#git@github.com:}
        repo_name=${repo_name%%.git}
        new_url="git@github.com:${NEW_USER}/${repo_name}.git"
      else
        # assume https
        repo_name=${old_url#https://github.com/}
        repo_name=${repo_name%%.git}
        new_url="https://github.com/${NEW_USER}/${repo_name}.git"
      fi
      git remote set-url origin "$new_url"
      echo "  updated remote -> $new_url"
    fi
  fi
  cd - >/dev/null
done

echo "All done. Please verify each local repo with 'git remote -v'";
