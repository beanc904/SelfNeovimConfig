# Self Neovim Config

## 使用指南

目前，该配置仅编写`unix`系操作系统使用指南。其他系列的`nvim`配置文件夹不同，但该库配置文件不变，不便提供操作指南，可自行下载配置。

### 初次使用

```bash
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1 && nvim
```

### 覆盖使用

```bash
rm -rf ~/.config/nvim/*
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1
```

> [!IMPORTANT]
> 该操作会清除原先的所有个人`nvim`的配置信息。
> 建议对原先`nvim`配置文件进行备份。

### 卸载

```bash
# unix
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## lsp项目初始化

### `pyright`

将以下内容写入 `pyrightconfig.json` ，并根据实际项目信息修改相关配置项。可以使用 LuaSnip 插件中配置的 `pyconf` 片段快捷编写。其他相关配置项，可参考[其官网](https://docs.basedpyright.com/v1.20.0/configuration/config-files/)。

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

## Vide外观配置

关于外观配置，可于配置文件中编写如下：
```toml
# macOS
frame = "transparent"

# Linux
frame="none"

[font]
normal = ["JetBrainsMono Nerd Font", "Noto Sans CJK SC"]
size = 18
```

## 鸣谢

- [Neovim](https://github.com/neovim/neovim)
- [Neovide](https://github.com/neovide/neovide)
- [NvChad](https://github.com/NvChad/NvChad)
  - [All Plugins](./lua/plugins)
