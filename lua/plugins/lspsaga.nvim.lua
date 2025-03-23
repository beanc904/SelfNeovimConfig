return {
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
      require('lspsaga').setup({
        -- 先清除预先设定的插件信息
        vim.keymap.del("n", "gd"),
        vim.keymap.del("n", "gD"),
        vim.keymap.del("n", "<leader>rn"),

        -- 重新映射快捷键
        vim.keymap.set("n", "gd", "<cmd>Lspsaga finder def<CR>",
          { noremap = true, silent = true, desc = "Lspsaga Goto Definition" }),
        vim.keymap.set("n", "gD", "<cmd>Lspsaga finder decl<CR>",
          { noremap = true, silent = true, desc = "Lspsaga Goto Declaration" }),
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Lspsaga Rename Symbol" }),
        -- 新建快捷键
        vim.keymap.set("n", "<leader>of", "<cmd>Lspsaga finder<CR>", { desc = "Lspsaga Open Finder" }),
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Lspsaga Code Action" }),
        vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Lspsaga Diagnostic Jump Next" }),
        vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Lspsaga Diagnostic Jump Prev" })
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
    -- ft = { 'c', 'cpp', 'lua', 'rust', 'go' }
  }
}
