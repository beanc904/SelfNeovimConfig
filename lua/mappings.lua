require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- <leader>rn 的重新绑定
vim.keymap.del("n", "<leader>rn")
map("n", "<leader>rN", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { silent = true, noremap = true, desc = "Toggle Relative Number" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- 定义块格式化快捷键
map("v", "<leader>ff", vim.lsp.buf.format, { noremap = true, silent = true, desc = "V-LINE format block" })

-- nvim-tree.lua文件树的刷新快捷键绑定
map("n", "<leader>rf", "<cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh Files Tree" })

-- 自定义neoscroll描述文本
local neoscroll = require('neoscroll')
local modes = { 'n', 'v', 'x' }
map(modes, "<C-u>", function() neoscroll.ctrl_u({ duration = 150 }) end, { desc = "Neoscroll Cursor Up" })
map(modes, "<C-d>", function() neoscroll.ctrl_d({ duration = 150 }) end, { desc = "Neoscroll Cursor Down" })
map(modes, "<C-b>", function() neoscroll.ctrl_b({ duration = 350 }) end, { desc = "Neoscroll Cursor Up Faster" })
map(modes, "<C-f>", function() neoscroll.ctrl_f({ duration = 350 }) end, { desc = "Neoscroll Cursor Down Faster" })
map(modes, "<C-y>", function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
  { desc = "Neoscroll Screen Down" })
map(modes, "<C-e>", function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
  { desc = "Neoscroll Screen Up" })
map(modes, "zt", function() neoscroll.zt({ half_win_duration = 150 }) end, { desc = "Neoscroll Cursor Top" })
map(modes, "zz", function() neoscroll.zz({ half_win_duration = 150 }) end, { desc = "Neoscroll Cursor Middle" })
map(modes, "zb", function() neoscroll.zb({ half_win_duration = 150 }) end, { desc = "Neoscroll Cursor Bottom" })

-- 显示诊断悬浮窗
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "<leader>de", function()
  vim.diagnostic.open_float({
    severity = vim.diagnostic.severity.ERROR
  })
end, { desc = "Show errors only" })
map("n", "<leader>dw", function()
  vim.diagnostic.open_float({
    severity = vim.diagnostic.severity.WARN
  })
end, { desc = "Show warnings only" })

-- 启用 inlay hints
map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Enable inlay hints" })

-- Lspsaga 快捷键绑定
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "悬浮文档" })
map("n", "<leader>of", "<cmd>Lspsaga finder<CR>", { desc = "引用访达" })
map("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", { desc = "显示大纲" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "代码建议" })
map("n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "后向诊断跳转" })
map("n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "前向诊断跳转" })
