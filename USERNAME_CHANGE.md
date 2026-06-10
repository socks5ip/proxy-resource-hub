# GitHub 用户名变更记录

本仓库的 GitHub 用户名已从 `WUYAXI886` 更改为 `socks5ip`。

为了尽可能减少影响，我已在仓库中添加了以下资源，并完成了能直接做的服务器端更新（包括 SEO/front-matter 与 部分文档的调整）。

本文件说明如何在本地与第三方服务中完成必要的更新，以及提供一键化脚本用于本地批量更新。

---

变更要点

- 新用户名： `socks5ip`
- 旧用户名： `WUYAXI886`
- GitHub 会对大多数旧 URL 生成 301 重定向，但建议尽快更新硬编码链接以缩短依赖重定向的时间。

---

我已在本仓库中新增或更新以下文件：

- scripts/update_remotes.sh  —— 在本地父目录批量更新多个仓库的 remote URL（bash）。
- scripts/update_remotes.ps1 —— PowerShell 版本，适用于 Windows。
- scripts/replace_owner.sh  —— 在仓库内批量替换文件中旧用户名的占位脚本（仅供本地/托管环境运行，提交前请审查）。
- USERNAME_CHANGE.md  —— 本说明文档（即本文件）。

---

本地操作（必须在本地执行）

- 单仓库改 remote（SSH）：
  git remote set-url origin git@github.com:socks5ip/REPO.git

- 单仓库改 remote（HTTPS）:
  git remote set-url origin https://github.com/socks5ip/REPO.git

- 批量（bash，适用于 macOS / Linux）：
  请先把需要更新的仓库放在同一个父目录下，然后运行 scripts/update_remotes.sh

- 批量（PowerShell，Windows）：
  在包含多个本地 repo 的父目录运行 scripts/update_remotes.ps1

---

其他第三方服务

- GitHub Actions、CI、Webhooks、OAuth 回调、部署脚本、Packages（npm/pypi 等）的回调 URL 如有硬编码旧用户名需手动更新。
- 若使用 GitHub Pages（username.github.io），请将 Pages 绑定到自有域（如 socks5ip.com.cn）以避免用户名变更影响访问地址。

---

如果您希望我继续：
- 我可以在仓库内检索并逐个替换所有旧用户名引用（需在我执行替换前由您确认以避免误替换）。
- 我也可以直接提交替换（一次性替换所有匹配项并提交），我建议先在分支上执行并创建 PR 供您审查。


已提交者：全网低价IP
