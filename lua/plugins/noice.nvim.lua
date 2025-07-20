-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
    presets = {
      lsp_doc_border = true,
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("noice").setup(opts)

    require("notify").setup({
      background_colour = "#0F1419", -- Ayu Dark background color
    })

    vim.keymap.del("n", "<leader>n") -- remove default keymap
    vim.keymap.set("n", "<leader>nd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss Noice" })
    vim.keymap.set("n", "<leader>nl", function() require("noice").cmd("last") end, { desc = "Noice Last Message" })
    vim.keymap.set("n", "<leader>nh", function() require("noice").cmd("history") end, { desc = "Noice History" })
  end
}
