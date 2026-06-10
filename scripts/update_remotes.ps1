# PowerShell 批量更新本地仓库的 origin remote 为新用户名 socks5ip
# 用法：在包含多个仓库的父目录中运行：
#   .\scripts\update_remotes.ps1

$NewUser = 'socks5ip'
Get-ChildItem -Directory | ForEach-Object {
    $repoDir = $_.FullName
    if (Test-Path (Join-Path $repoDir '.git')) {
        Write-Host "Processing $repoDir"
        Push-Location $repoDir
        try {
            $old = git remote get-url origin 2>$null
            if (-not $old) {
                Write-Host "  no origin remote, skipping"
            } else {
                Write-Host "  old remote: $old"
                if ($old -like 'git@github.com:*') {
                    $repoName = $old -replace '^git@github.com:(.*?)(\.git)?$','$1'
                    $new = "git@github.com:${NewUser}/${repoName}.git"
                } else {
                    $repoName = $old -replace '^https://github.com/(.*?)(\.git)?$','$1'
                    $new = "https://github.com/${NewUser}/${repoName}.git"
                }
                git remote set-url origin $new
                Write-Host "  updated remote -> $new"
            }
        } finally {
            Pop-Location
        }
    }
}
Write-Host "All done. Please verify each local repo with 'git remote -v'";
