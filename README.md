# CondaVSCode Launcher

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-blueviolet)](https://www.zsh.org/)

一个为 Zsh/Powershell7+ 用户设计的超轻量级启动器，旨在解决在需要特定 Conda 环境才能正常工作的跨语言项目（如 Rust, CUDA）中启动 VS Code 的痛点。

## 🤔 痛点是什么？
  插件找不到conda里的编译器

当你在 VS Code 中开发 Rust 或 C++/CUDA 项目时，你的工具链（如 `rust-analyzer`, `Nsight Visual Studio Code Edition` 插件）可能没法找到 Conda 环境下的工具（Conda下的 nvcc、 Python 环境什么的）

最可靠的方法是：
1.  打开终端。
2.  手动输入 `conda activate my_special_env`。
3.  接着输入 `code .` 来启动 VS Code。

这个过程虽然可靠，但每天重复多次会非常乏味。**CondaCode Launcher** 将这个流程简化为一条命令，甚至一个快捷键。

## 🛠️ 使用方法
#### 如何自定义你的命令
shell 脚本已经给出，你可以发挥的空间非常大！可以设置alias，自定义func，大修原始脚本，或是集成到自动化流程里面，随你所欲。

#### 如何为 Launcher 配置快捷键（适用于Win，WSL）：
1. 对于Win主机：创建快捷方式，指向 `"C:\Program Files\PowerShell\7\pwsh.exe" "C:\Users\Xie bro\Desktop\useless-stuff\桌面图标库\命令台快捷脚本\conda-vscode.ps1"` （对于WSL，则是`"C:\Users\Xie bro\AppData\Local\Microsoft\WindowsApps\ubuntu.exe" -c ". ~/start-conda-vscode.zsh"`）
2. 将快捷方式放到`C:\ProgramData\Microsoft\Windows\Start Menu\Programs`目录下
3. 为快捷方式指定快捷键，即可。（tip：聚焦于桌面时快捷键无法生效）
