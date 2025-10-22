require("nvchad.configs.lspconfig").defaults()

-- lsps with default config
local servers = {
  "html",
  "cssls",
  "pyright",
  "bashls",
  "cmake",
  "marksman",
}
vim.lsp.enable(servers)

vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = true,
  float = {
    border = "rounded",
    focusable = true,
    source = true,
    header = "🐞 Diagnostics:",
    format = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      }
      return icons[diagnostic.severity] .. diagnostic.message
    end,
  },
}
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover {
    border = "rounded",
  }
end, { desc = "LSP Hover Doc" })

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--header-insertion-decorators=1",
    "--completion-style=detailed",
    "--fallback-style=Google",
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust_analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.enable {
  "clangd",
  "rust_analyzer",
}
