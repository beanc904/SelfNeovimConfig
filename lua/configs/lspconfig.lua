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

-- cpp的代码提示配置
--
-- 让clangd识别CMake项目
-- 进入项目后进行如下操作
-- cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=on
-- cp build/compile_commands.json .
lspconfig.clangd.setup {}

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
            cargo = {allFeatures = true},
            checkOnSave = {command = "clippy"},
        }
    }
})



-- 使用 ts_ls 配置 TypeScript LSP
lspconfig.ts_ls.setup{
  on_attach = function(client, bufnr)
    -- 在编辑时实时更新诊断
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      -- 自动显示诊断
      vim.diagnostic.setqflist(result.diagnostics)
    end

    -- 启用实时诊断
    vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
  end
}
-- 启用 CursorHold 事件触发的诊断显示
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
