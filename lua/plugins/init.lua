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
      -- set Markdown color and style of H1~6 title
      local heading_colors = {
        [1] = "#89B4FA", -- H1 blue
        [2] = "#FAB387", -- H2 origin
        [3] = "#A6E3A1", -- H3 green
        [4] = "#94E2D5", -- H4 cyan
        [5] = "#CBA6F7", -- H5 purple
        [6] = "#B4BEFE", -- H6 light blue
      }
      for level, color in pairs(heading_colors) do
        vim.api.nvim_set_hl(0, ("@markup.heading.%d.markdown"):format(level), {
          fg = color,
          bold = true,
          default = false,
        })
      end

      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ensure_installed = {
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "c",
          "cpp",
          "python",
          "java",
          "bash",
          "rust",
          "markdown",
        },
        auto_install = true,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
      }
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldlevel = 99
      vim.wo.foldenable = true
    end,
  },

  {
    "tpope/vim-repeat",
    lazy = false,
  },

  {
    "xiyaowong/fast-cursor-move.nvim",
    lazy = false,
  },
}
