# Self Neovim Config

## 目录

- [项目介绍](#项目介绍)
- [使用指南](#使用指南)
- [依赖软件](#外部依赖软件)
- [鸣谢](#鸣谢)

## 项目介绍

为便于多端`Neovim`配置信息同步，诞生了该个人仓库。其中以`NvChad`配置为基底，外加个人偏好设置，形成该配置仓库。插件信息请自行查看[插件配置目录](./lua/plugins)。

### 语言服务协议(Language Server Protocol)

语言服务协议配置信息参见[lspconfig.lua](./lua/configs/lspconfig.lua)。

- `C/CXX`: 使用`clangd`语言服务协议，项目读取参见`:LspInfo`文档部分。默认采用[Google代码风格](https://zh-google-styleguide.readthedocs.io/en/latest/contents.html)，若需要个性化配置代码风格可与项目根目录编写`.clang-format`文件。关于`cmake`项目，额外使用`cmake-language-server`语言服务协议。
- `Java`: 使用`jdtls`语言服务协议。
- `Python`: 使用`pyright`语言服务协议。

关于各语言服务的[安装方式](#外部依赖软件)。

#### 语言服务协议配置示例

- `pyright`
    ```json
    {
      "pythonVersion": "3.9",
      "venvPath": "/Users/coffeebean/.miniconda3/envs",
      "venv": "pyqt5-env",
      "typeCheckingMode": "basic",
      "reportMissingImports": false,
      "reportAttributeAccessIssue": false,
    }
    ```

## 使用指南

目前，该配置仅编写`unix`系操作系统使用指南。其他系列的`nvim`配置文件夹不同，但该库配置文件不变，不便提供操作指南，可自行下载配置。

### 初次使用

```bash
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim && nvim
```

### 覆盖使用

```bash
rm -rf ~/.config/nvim/*
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim
```

> [!note] 注意
> 该操作会清除原先的所有个人`nvim`的配置信息。
> 建议对原先`nvim`配置文件进行备份。

### 卸载

```bash
# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## 外部依赖软件

- 核心编辑器: `Neovim`
    - `brew / bin`
- 图形渲染工具: `Neovide`
- `lsp`:
    - `clangd`: `brew / apt / bin`
    - `jdtls`: `brew / bin`
    - `cmake-language-server`: `brew / bin`
    - `lua-language-server`: `brew / bin`
    - `pyright`: `brew / npm / bin`
- 额外插件:
    - `lazygit`: `brew / bin`
    - `ripgrep`: `brew / apt / bin`

> [!note] 注意
> 在使用`nvim`内部相关功能时需保持外部依赖软件的正确配置。
> 目前采用`Mason`进行语言服务的自动化管理。

### 外部依赖软件的配置

#### 核心编辑器`Neovim`

> [!warning] 警告
> 推荐使用`brew`或从源码编译安装，否则会出现插件组建安装不齐全等问题，尤其是`Ubuntu`发行版的包管理器。

#### 图形渲染工具`Neovide`

由于软件未被上传包管理器，需移步官方[仓库](https://github.com/neovide/neovide)下载。

其中，由于`Neovide`软件的启动会导致终端对话的阻塞，将提供如下思路以新建图形线程。

将`Neovide`二进制文件移动到用户管理的二进制环境目录，如：`/usr/local/bin/neovide`。接着，于个人配置文件中编写如下替换。
```.zshrc
alias nvim="setsid neovide"
```
macOS思路类似，将`Neovide`软件包中的二进制文件，链接至`/usr/local/bin/`下。并使用来自`brew`的`util-linux`工具包中的`setsid`完成非终端阻塞图形线程的创建。
同时，为避免出现 macOS 新建图形线程时产生的警告垃圾，可采用如下`Neovide`启动器，将输出信息转流至空。
```bash
#!/bin/bash

setsid /Applications/Neovide.app/Contents/MacOS/neovide "$@" > /dev/null 2>&1 &
```

关于外观配置，macOS 于配置文件中编写如下替换：
```toml
frame = "transparent"
```

#### `lazygit`

官方[配置文档](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)

全局配置文件的默认路径:

- Linux: `~/.config/lazygit/config.yml`
- MacOS: `~/Library/Application Support/lazygit/config.yml`
- Windows: `%LOCALAPPDATA%\lazygit\config.yml`(default locaion, but it will also be found in `%APPDATA%\lazygit\config.yml`)

**OneDark Theme**:
```yml
gui:
  theme:
    activeBorderColor:
      - '#61afef'
      - bold
    inactiveBorderColor:
      - '#5c6370'
    optionsTextColor:   # 底部字体颜色
      - '#8aadf4'
    selectedLineBgColor:
      - '#363a4f'
    cherryPickedCommitBgColor:
      - '#494d64'
    cherryPickedCommitFgColor:
      - '#8bd5ca'
    unstagedChangesColor:
      - '#ed8796'
    defaultFgColor:
      - '#cad3f5'
    searchingActiveBorderColor:
      - '#eed49f'

    authorColors:
      '*': '#b7bdf8'
```

#### `ripgrep`

`Telescope live grep`项目级全局文本关键词查找工具。

## 鸣谢

- [Neovim](https://github.com/neovim/neovim)
- [NvChad](https://github.com/NvChad/NvChad)
  - [All Plugins](./lua/plugins)
