require("nvchad.configs.lspconfig").defaults()

-- lsps with default config
local servers = {
  "html", "cssls", "pyright",
  "bashls", "cmake", "marksman",
}
vim.lsp.enable(servers)

-- 实时诊断信息显示配置
vim.diagnostic.config({
  virtual_text = true, -- 显示虚拟文本
  update_in_insert = true, -- 实时更新诊断
  float = { -- 浮动窗口配置
    border = "rounded", -- 圆角边框
    focusable = true, -- 允许聚焦悬浮窗
    source = true, -- 多来源时显示诊断工具名称
    header = "🐞 Diagnostics:", -- 自定义标题
    format = function(diagnostic)
      -- 按等级添加图标
      local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " "
      }
      return icons[diagnostic.severity] .. diagnostic.message
    end
  }
})
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({
    border = 'rounded',
  })
end, { desc = 'LSP hover_doc' })


vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--header-insertion-decorators=1",
    "--completion-style=detailed",
    "--fallback-style=Google"
  },
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust_analyzer"] = {
      check = {
        command = "clippy"
      },
    }
  }
})


vim.lsp.enable({
  "clangd", "rust_analyzer",
})
