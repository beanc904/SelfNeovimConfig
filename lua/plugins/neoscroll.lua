return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        -- 配置选项
        easing_function = "sine",         -- 使用缓动效果
      })
    end,
  },
}
