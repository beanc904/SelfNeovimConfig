return {
  {
    "mfussenegger/nvim-dap",
    -- ft = { 'c', 'cpp' },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
      "nvim-neotest/nvim-nio",
    },
    -- config = function()
    --   require("configs.dapconfig")
    -- end
    keys = {
      {
        "<leader>da",
        function ()
          require("configs.dapconfig")
          vim.notify("Launche DAP successfully!")
          vim.keymap.del("n", "<leader>da");
        end,
        desc = "Launche DAP",
      },
    },
    lazy = true,
  }
}
