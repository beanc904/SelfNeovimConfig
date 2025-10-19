return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      -- require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "jdtls",
          "cmake",
          "pyright",
          "rust_analyzer",
          "lua_ls",
          "markdown_oxide",
          "marksman",
          "bashls",
          "mesonlsp",
        },
        automatic_installation = true,
        automatic_enable = false,
      })
    end
  }
}
