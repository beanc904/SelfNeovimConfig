return {
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
}
