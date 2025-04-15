return {
  -- install with yarn or npm
  -- run as root: sudo npm install --unsafe-perm=true --allow-root
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      -- 配置快捷键
      vim.keymap.set("n", "<leader>Bp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown预览" })
      vim.keymap.set("n", "<leader>Bs", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown预览关闭" })
    end,
    ft = { "markdown" },
  },

  -- -- install without yarn or npm
  -- {
  --     "iamcco/markdown-preview.nvim",
  --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --     ft = { "markdown" },
  --     build = function() vim.fn["mkdp#util#install"]() end,
  -- }

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   ft = { "markdown" },
  --   cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  --   config = function()
  --     vim.g.mkdp_auto_start = 0 -- 是否自动启动预览
  --     vim.g.mkdp_auto_close = 1 -- 关闭 markdown 缓冲区时自动关闭预览
  --     vim.g.mkdp_refresh_slow = 0
  --     vim.g.mkdp_browser = "" -- 使用默认浏览器
  --     vim.g.mkdp_theme = "dark" -- 主题：dark 或 light
  --   end,
  -- }
}
