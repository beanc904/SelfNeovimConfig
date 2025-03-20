return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },   -- 仅在打开 Java 文件时加载
  config = function()
    local jdtls = require('jdtls')

    -- 定义工作区路径
    local workspace_dir = vim.fn.stdpath('data') .. "/jdtls_workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    -- 配置 jdtls
    local config = {
      cmd = { 'jdtls', '-data', workspace_dir },
      root_dir = jdtls.setup.find_root({ "pom.xml", "build.gradle", ".git" }) or vim.fn.getcwd(),
      settings = {
        java = {
          home = "/usr/lib/jvm/jdk-21.0.4-oracle-x64",
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          references = { includeDecompiledSources = true },
          inlayHints = { parameterNames = { enabled = "all" } },
          format = { enabled = true },
        },
      },
      init_options = {
        bundles = {},
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }

    -- 启动或连接到 jdtls
    jdtls.start_or_attach(config)
  end
}
