return {
  {
    "mfussenegger/nvim-dap",
    -- ft = { 'c', 'cpp' },
    dependencies = {
      "rcarriga/nvim-dap-ui",            -- UI 界面
      "theHamsta/nvim-dap-virtual-text", -- 变量悬浮提示
      "nvim-telescope/telescope-dap.nvim", -- Telescope 集成
      "jay-babu/mason-nvim-dap.nvim",    -- 自动安装调试器
      "williamboman/mason.nvim",         -- Mason 依赖
      "nvim-neotest/nvim-nio",
    },
    -- config = function()
    --   -- 加载 dapconfig 配置信息
    --   require("configs.dapconfig")
    -- end
    keys = {
      {
        "<leader>da",
        function ()
          require("configs.dapconfig")
          vim.notify("完成 DAP 启动！")
          vim.keymap.del("n", "<leader>da");
        end,
        desc = "启动DAP",
      },
    },
    lazy = true,
  }
}
