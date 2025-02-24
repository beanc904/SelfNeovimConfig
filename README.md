# Self Neovim Config

## 目录

- [项目介绍](#项目介绍)
- [使用指南](#使用指南)
- [鸣谢](#鸣谢)

## 项目介绍

为便于多端`Neovim`配置信息同步，诞生了该个人仓库。其中以`NvChad`的配置为基底，外加个人偏好设置，形成该配置仓库。插件信息请自行查看[插件配置目录](lua/plugins)。

## 使用指南

目前，该配置仅编写`unix`系操作系统使用指南。其他系列的`nvim`配置文件夹不同，但该库配置文件不变，不便提供操作指南，可自行下载安装。

### 初次使用

```bash
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim && nvim
```

### 覆盖使用

```bash
rm -rf ~/.config/nvim/*
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim
```

***注意：***该操作会清除原先的所有个人`nvim`的配置信息。建议进行备份。

### 卸载

```bash
# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## 鸣谢

- [Neovim](https://github.com/neovim/neovim)
- [NvChad](https://github.com/NvChad/NvChad)
  - [All Plugins](lua/plugins)
