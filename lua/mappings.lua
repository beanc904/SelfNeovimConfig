require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 取消原先<leader>rn的绑定
vim.keymap.del("n", "<leader>rn")
-- 完成<leader>rN的重新绑定
map("n", "<leader>rN", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { silent = true, noremap = true, desc = "Toggle Relative Number" })
-- 定义跳转快捷键配置
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to Declaration" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("v", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format code block" })

-- nvim-tree.lua文件树的刷新快捷键绑定
map("n", "<leader>rf", "<cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh Files Tree" })

-- 自定义neoscroll描述文本
local neoscroll = require('neoscroll')
local modes = { 'n', 'v', 'x' }
map(modes, "<C-u>", function() neoscroll.ctrl_u({ duration = 150 }) end, { desc = "Neoscroll Cursor Up" })
map(modes, "<C-d>", function() neoscroll.ctrl_d({ duration = 150 }) end, { desc = "Neoscroll Cursor Down" })
map(modes, "<C-b>", function() neoscroll.ctrl_b({ duration = 350 }) end, { desc = "Neoscroll Cursor Up Faster" })
map(modes, "<C-f>", function() neoscroll.ctrl_f({ duration = 350 }) end, { desc = "Neoscroll Cursor Down Faster" })
map(modes, "<C-y>", function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end, { desc = "Neoscroll Screen Down" })
map(modes, "<C-e>", function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end, { desc = "Neoscroll Screen Up" })
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
