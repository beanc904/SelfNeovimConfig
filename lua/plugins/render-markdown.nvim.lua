return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- cmd = { 'RenderMarkdown' },
  ft = { "markdown", "md", "mdx" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- define foreground color (font color)
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#89B4FA", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#FAB387", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#A6E3A1", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#94E2D5", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#CBA6F7", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#B4BEFE", bold = true })

    -- define background color
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#1E1E2E" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#1A1A26" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#1A2620" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#122222" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#1F1A26" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#1D1C2A" })
    require("render-markdown").setup {
      render_modes = true,
      completions = {
        lsp = { enabled = true },
        blink = { enabled = true },
      },
      heading = {
        border = true,
      },
    }
  end,
}
