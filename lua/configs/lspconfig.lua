require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- lsps with default config
local servers = {
  "html", "cssls", "pyright",
  "bashls", "cmake", "marksman"
}
local nvlsp = require "nvchad.configs.lspconfig"
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

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


lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--header-insertion-decorators=1",
    "--completion-style=detailed",
    "--fallback-style=Google"
  }, -- 后台索引支持跨文件跳转
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require('lspconfig.util').root_pattern(
    "compile_commands.json",
    "compile_flags.txt",
    ".git"
  ),
})



lspconfig.rust_analyzer.setup({
  settings = {
    ["rust_analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
      -- 优化实时诊断
      diagnostics = {
        enable = true,
        enableExperimental = true,
        disable = {},
        -- 诊断延迟配置
        debounce = 100, -- 默认为500ms
      },
    },
  },
})
