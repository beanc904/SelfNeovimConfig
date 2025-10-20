# Self Neovim Config

A personal **Neovim** configuration built on top of **NvChad**, designed for a clean, fast, and modern development experience on Linux and macOS.
It provides rich features including LSP support, code formatting, autocompletion, syntax highlighting, and Neovide UI customization.

---

## 🚀 Usage Guide

> Currently, only Unix-based systems (Linux/macOS) are documented.
> Windows users may adapt paths manually if needed.

### 🧩 First Installation

```bash
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1 && nvim
```

This command clones the configuration and launches Neovim to install all plugins automatically.

---

### ♻️ Reinstall / Overwrite Existing Config

```bash
rm -rf ~/.config/nvim/*
git clone https://github.com/beanc904/SelfNeovimConfig.git ~/.config/nvim --depth=1
```

> [!WARNING]
> This will **remove all your existing Neovim configurations**.
> Please make a backup of `~/.config/nvim` beforehand.

---

### 🧹 Uninstallation

To remove all related data completely:

```bash
# Unix
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

---

## 🧠 LSP Setup Example

### Python (`pyright`)

Create a file named `pyrightconfig.json` in your project root:

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

You can quickly insert this template using the `pyconf` snippet provided by **LuaSnip**.
For detailed configuration, see the [Based Pyright documentation](https://docs.basedpyright.com/v1.20.0/configuration/config-files/).

---

## 🎨 Neovide Appearance

Example `neovide.toml` configuration:

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

## ❤️ Acknowledgments

* [Neovim](https://github.com/neovim/neovim)
* [Neovide](https://github.com/neovide/neovide)
* [NvChad](https://github.com/NvChad/NvChad)

  * [All Plugins](./lua/plugins)

