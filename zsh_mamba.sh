#!/bin/zsh
. ~/.zshrc
CYAN='\033[0;36m'; GREEN='\033[0;32m'; RED='\033[0;31m'; NC='\033[0m'
echo "${CYAN}##############################################"
echo "#    欢迎使用 Conda & VSCode 启动器          #"
echo "##############################################"
echo ""
echo "${GREEN}说明：为了让 VSCode 插件能正确使用 Conda 环境变量，"
echo "      请激活环境后，再从本终端中启动 VS Code。"
echo ""
echo "当前可用的 Conda 环境："
mamba env list
echo ""
echo -n "${NC}请输入你想要在哪个 Conda 环境打开 VSCode (为空则不激活 Conda, 采用原生环境): "
read name

if [[ -n "$name" ]]
then
    # 尝试激活环境
    conda activate $name
    if [[ $? -eq 0 ]]; then
        echo "${GREEN}成功激活 Conda 环境: $name${NC}"
        code
    else
        echo "${RED}激活 Conda 环境失败: $name${NC}"
        echo "可能的原因："
        echo "  - 环境名拼写错误"
        echo "  - 该环境不存在"
        echo "  - Conda 配置有问题"
        echo ""
        
        while true; do
            echo -n "是否要重新尝试？(y/n): "
            read retry
            case $retry in
                [Yy]* )  # 以 Y 或 y 开头的任何字符串  )表示一个模式匹配块的开始, 类似于其他语言中的 case "value": 后的冒号
                    echo -n "请重新输入环境名: "
                    read name
                    conda activate $name
                    if [[ $? -eq 0 ]]; then
                        echo "${GREEN}成功激活 Conda 环境: $name${NC}"
                        code
                        break
                    else
                        echo "${RED}再次激活失败: $name${NC}"
                    fi
                    ;; # 表示一个模式匹配块的结束, 类似于其他语言中的 break，防止执行下一个 case
                [Nn]* )
                    echo "退出脚本。"
                    exit 1
                    ;;
                * )
                    echo "请输入 y 或 n"
                    ;;
            esac  # esac 就是 case 的反写，用来表示 case 语句的结束。
        done
    fi
else
    code
fi

exit