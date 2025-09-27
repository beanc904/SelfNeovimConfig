return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      -- "jay-babu/mason-nvim-dap.nvim"
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- 设置 Markdown 一级到六级标题的颜色和样式
      local heading_colors = {
        [1] = "#89B4FA", -- H1 蓝色
        [2] = "#FAB387", -- H2 橙色
        [3] = "#A6E3A1", -- H3 绿色
        [4] = "#94E2D5", -- H4 青色
        [5] = "#CBA6F7", -- H5 紫色
        [6] = "#B4BEFE", -- H6 浅蓝
      }
      for level, color in pairs(heading_colors) do
        vim.api.nvim_set_hl(0, ("@markup.heading.%d.markdown"):format(level), {
          fg = color,
          bold = true,
          -- clear 链接防止被覆盖
          default = false,
        })
      end

      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ensure_installed = {
          "vim", "lua", "vimdoc", "html", "css", "c", "cpp", "python", "java",
          "bash", "rust", "markdown",
        },
        auto_install = true,
        -- 增量选择
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
      })
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldlevel = 99
      vim.wo.foldenable = true
    end,
  },

  -- 重复点击插件
  {
    "tpope/vim-repeat",
    lazy = false,
  },

  -- 光标移动插件
  {
    "xiyaowong/fast-cursor-move.nvim",
    lazy = false,
  },
}
