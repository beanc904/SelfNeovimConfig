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
        ensure_install = { "clangd", "jdtls", "pyright", "rust_analyzer" },
        automatic_installation = true,
      })
    end
  }
}
