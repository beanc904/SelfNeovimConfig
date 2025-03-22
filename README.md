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

**注意：** 该操作会清除原先的所有个人`nvim`的配置信息。建议对原先`nvim`配置文件进行备份。

### 卸载

```bash
# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## 外部依赖软件

- `lsp`:
    - `clangd`: `brew / apt / bin`
    - `jdtls`: `brew / bin`
    - `cmake-language-server`: `brew / bin`
    - `lua-language-server`: `brew / bin`
    - `pyright`: `brew / npm / bin`
- 额外插件:
    - `lazygit`: `brew / bin`

**注意：** 在使用`nvim`内部相关功能时需保持外部依赖软件的正确配置。

### 外部依赖软件的配置

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

## 鸣谢

- [Neovim](https://github.com/neovim/neovim)
- [NvChad](https://github.com/NvChad/NvChad)
  - [All Plugins](./lua/plugins)
