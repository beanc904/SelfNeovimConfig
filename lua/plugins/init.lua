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
    opts = {
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
        "bash"
      },
    },
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
