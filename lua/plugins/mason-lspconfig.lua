return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "jdtls",
          "cmake",
          "pyright",
          "rust_analyzer",
          "lua_ls",
          "marksman"
        },
        automatic_installation = true,
      })
    end
  }
}
