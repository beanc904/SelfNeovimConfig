# Self Neovim Config

一个基于 **NvChad** 的个人 Neovim 配置，旨在在 Linux/macOS 环境下提供轻量、优雅且功能完善的开发体验。
该配置支持多语言 LSP、格式化、补全、语法高亮以及 Neovide 外观定制。

---

## 🚀 使用指南

> 当前仅针对 Unix 系统（Linux / macOS）提供使用说明。
> Windows 用户可参考路径结构自行适配。

### 🧩 初次安装

```bash
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1 && nvim
```

执行后 Neovim 将自动加载配置并开始初始化插件。

---

### ♻️ 覆盖安装

如果你已有旧配置，可通过以下命令覆盖：

```bash
rm -rf ~/.config/nvim/*
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1
```

> [!WARNING]
> 此操作会删除你当前的所有 Neovim 配置。
> 建议事先备份 `~/.config/nvim` 目录。

---

### 🧹 卸载配置

若希望完全移除该配置：

```bash
# Unix
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

---

## 🧠 LSP 项目初始化示例

### Python (`pyright`)

在项目根目录创建 `pyrightconfig.json` 文件：

```json
{
  "pythonVersion": "3.9",
  "venvPath": "/Users/coffeebean/.miniconda3/envs",
  "venv": "pyqt5-env",
  "typeCheckingMode": "basic",
  "reportMissingImports": false,
  "reportAttributeAccessIssue": false
}
```

你也可以通过 LuaSnip 插件中的 `pyconf` 片段快速生成模板。
更多配置项请参考 [Based Pyright 官方文档](https://docs.basedpyright.com/v1.20.0/configuration/config-files/)。

---

## 🎨 Neovide 外观配置

你可以在 `neovide.toml` 或配置文件中自定义窗口与字体样式：

```toml
# macOS
frame = "transparent"

# Linux
frame = "none"

[font]
normal = ["JetBrainsMono Nerd Font", "Noto Sans CJK SC"]
size = 18
```

---

## ❤️ 鸣谢

* [Neovim](https://github.com/neovim/neovim)
* [Neovide](https://github.com/neovide/neovide)
* [NvChad](https://github.com/NvChad/NvChad)

  * [All Plugins](./lua/plugins)

