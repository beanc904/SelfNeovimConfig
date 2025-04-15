return {
  {
    "dhruvmanila/browser-bookmarks.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
    lazy = true,
    keys = {
      { "<leader>Bm", "<cmd>Telescope bookmarks<CR>", desc = "打开浏览器书签" }
    },
    config = function()
      require("browser_bookmarks").setup({
        selected_browser = "firefox",
        config_dir = os.getenv("HOME") .. "/snap/firefox/common/.mozilla/firefox",
      })

      -- 可选：设置 Telescope 映射
      require("telescope").load_extension("bookmarks")
    end,
  },
}
