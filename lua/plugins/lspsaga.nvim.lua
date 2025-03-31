return {
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
      require('lspsaga').setup({
        -- 先清除预先设定的插件信息
        vim.keymap.del("n", "gd"),
        -- vim.keymap.del("n", "gD"),
        vim.keymap.del("n", "<leader>rn"),

        -- 重新映射快捷键
        vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>",
          { noremap = true, silent = true, desc = "快速定义跳转" }),
        -- vim.keymap.set("n", "gD", "<cmd>Lspsaga finder decl<CR>",
        --   { noremap = true, silent = true, desc = "Lspsaga Goto Declaration" }),
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "变量重命名" }),
        -- 新建快捷键
        vim.keymap.set("n", "<leader>of", "<cmd>Lspsaga finder<CR>", { desc = "引用访达" }),
        vim.keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", { desc = "显示大纲" }),
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "代码建议" }),
        vim.keymap.set("n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "后向诊断跳转" }),
        vim.keymap.set("n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "前向诊断跳转" })
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
    -- ft = { 'c', 'cpp', 'lua', 'rust', 'go' }
  }
}
