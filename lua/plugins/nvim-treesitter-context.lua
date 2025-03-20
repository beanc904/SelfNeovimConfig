return {
  -- 显示函数路径的插件
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true         -- 启用该功能
      }
    end,
    lazy = false,
  },
}
