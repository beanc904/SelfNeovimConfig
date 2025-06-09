return {
  {
    "dhruvmanila/browser-bookmarks.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
    lazy = true,
    keys = {
      { "<leader>tb", "<cmd>Telescope bookmarks<CR>", desc = "打开浏览器书签" }
    },
    config = function()
      require("browser_bookmarks").setup({
        selected_browser = "firefox",
        -- config_dir = os.getenv("HOME") .. "/.mozilla/firefox",
        -- config_dir = os.getenv("HOME") .. "/Library/Application Support/Firefox",
        -- config_dir = os.getenv("HOME") .. "/AppData/Roaming/Mozilla/Firefox",
      })

      -- 可选：设置 Telescope 映射
      require("telescope").load_extension("bookmarks")
    end,
  },
}
