return {
  -- show function signature at the top of the pane
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true
      }
    end,
    lazy = false,
  },
}
