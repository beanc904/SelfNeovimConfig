-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
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

-- vim.diagnostic配置
vim.diagnostic.config({
  virtual_text = true,     -- 显示虚拟文本
  update_in_insert = true, -- 实时更新诊断
  float = {                -- 浮动窗口配置
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

-- cpp的代码提示配置
--
-- 让clangd识别CMake项目
-- 进入项目后进行如下操作
-- cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=on
lspconfig.clangd.setup({
  cmd = { "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--header-insertion-decorators=1",
    "--completion-style=detailed",
    "--fallback-style=Google" },     -- 后台索引支持跨文件跳转
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require('lspconfig.util').root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})

lspconfig.cmake.setup({
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
})

-- java的代码提示配置
-- local workspace_dir = vim.fn.stdpath('data') .. "/jdtls_workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- lspconfig.jdtls.setup {
--     cmd = { "jdtls", "-data", workspace_dir },
--     root_dir = function(fname)
--         return lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git")(fname) or vim.fn.getcwd()
--     end,
--     settings = {
--         java = {
--             home = "/usr/lib/jvm/jdk-21.0.4-oracle-x64",
--             eclipse = { downloadSources = true },
--             configuration = { updateBuildConfiguration = "interactive" },
--             maven = { downloadSources = true },
--             implementationsCodeLens = { enabled = true },
--             referencesCodeLens = { enabled = true },
--             references = { includeDecompiledSources = true },
--             inlayHints = { parameterNames = { enabled = "all" } },
--             format = { enabled = true },
--         }
--     },
--     init_options = {
--         bundles = {}
--     }
-- }

-- python的代码提示配置
lspconfig.pyright.setup {}

-- rust的代码提示
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust_analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    }
  }
})

