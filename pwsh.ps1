Write-Host "##############################################" -ForegroundColor Cyan
Write-Host "#    欢迎使用 Conda & VSCode 启动器          #" -ForegroundColor Cyan
Write-Host "##############################################" -ForegroundColor Cyan
Write-Host ""
Write-Host "说明：为了让 VSCode 插件能正确使用 Conda 环境变量，" -ForegroundColor Green
Write-Host "      请激活环境后，再从本终端中启动 VS Code。" -ForegroundColor Green
Write-Host ""
Write-Host "当前可用的 Conda 环境：" -ForegroundColor Magenta
conda env list
Write-Host ""

do {
    $name = Read-Host "请输入 Conda 环境名 (为空则使用基础环境，输入 'exit' 退出)"
    
    if ($name -eq "exit") {
        exit 0
    }
    elseif ($name -eq "") {
        code
        break
    }
    else {
        # 尝试激活 Conda 环境
        conda activate $name
        if ($LASTEXITCODE -eq 0) { # 成功激活 Conda 环境
            code
            break
        }
        else {
            Write-Host "激活 Conda 环境失败: $name" -ForegroundColor RED
            Write-Host "可能的原因：" -ForegroundColor YELLOW
            Write-Host "  - 环境名拼写错误" -ForegroundColor YELLOW
            Write-Host "  - 该环境不存在" -ForegroundColor YELLOW
            Write-Host "  - Conda 配置有问题" -ForegroundColor YELLOW
            Write-Host ""
        }
    }
} while ($true)

# exit 视情况选择