# Automated GitHub Deployment Script for Figma & NotebookLM Dual MCP Workspace
$ErrorActionPreference = "Continue"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   DAY DU AN FIGMA + NOTEBOOKLM MCP LEN GITHUB            " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

Set-Location $PSScriptRoot

# 1. Kiem tra git remote
$originUrl = git remote get-url origin 2>$null

# Neu origin van tro ve repository goc figma, doi thanh upstream
if ($originUrl -like "*figma/mcp-server-guide*") {
    Write-Host "[*] Chuyen remote goc figma thanh 'upstream'..." -ForegroundColor Gray
    git remote rename origin upstream 2>$null
}

# 2. Kiem tra remote origin cua nguoi dung
$remotes = git remote
if (-not ($remotes -contains "origin")) {
    Write-Host ""
    Write-Host "[!] Chua co lien ket voi GitHub ca nhan cua ban!" -ForegroundColor Yellow
    Write-Host "1. Truy cap https://github.com/new de tao repo moi (vi du: figma-mcp)" -ForegroundColor White
    Write-Host "2. Copy link HTTPS repo vua tao (vi du: https://github.com/tmtien2911/figma-mcp.git)" -ForegroundColor White
    Write-Host ""
    $repoUrl = Read-Host "Nhap link GitHub Repository URL cua ban"
    if ($repoUrl -and $repoUrl.Trim() -ne "") {
        git remote add origin $repoUrl.Trim()
        Write-Host "[+] Da lien ket thanh cong: $repoUrl" -ForegroundColor Green
    } else {
        Write-Host "[-] Chua nhap URL, huy bo thao tac." -ForegroundColor Red
        exit 1
    }
}

# 3. Add va commit toan bo file cau hinh
Write-Host ""
Write-Host "[*] Dang chuan bi commit cac file cau hinh..." -ForegroundColor Cyan
git add .
$commitMsg = Read-Host "Nhap noi dung commit (Nhan Enter de lay mac dinh: Setup dual Figma and NotebookLM MCP workspace)"
if (-not $commitMsg -or $commitMsg.Trim() -eq "") {
    $commitMsg = "Setup dual Figma and NotebookLM MCP workspace"
}

git commit -m "$commitMsg"

# 4. Day code len nhanh main
Write-Host ""
Write-Host "[*] Dang day code len GitHub..." -ForegroundColor Cyan
git branch -M main
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "==========================================================" -ForegroundColor Red
    Write-Host "[X] DAY LEN GITHUB CHUA THANH CONG!" -ForegroundColor Red
    Write-Host "Vui long kiem tra:" -ForegroundColor Yellow
    Write-Host "1. Ban da tao repository tren https://github.com/new chua?" -ForegroundColor White
    Write-Host "2. Link repo da dung va ban da dang nhap GitHub tren may chua?" -ForegroundColor White
    Write-Host "==========================================================" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "[OK] DA DAY DU AN LEN GITHUB THANH CONG!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
