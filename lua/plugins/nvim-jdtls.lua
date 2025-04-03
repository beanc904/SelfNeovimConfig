return {
  "mfussenegger/nvim-jdtls",
  -- ft = { "java" }, -- 仅在打开 Java 文件时加载
  config = function()
    local config = {
      cmd = { '~/.local/share/nvim/mason/bin/jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(config)
  end
}
