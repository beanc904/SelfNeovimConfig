require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- clangd定义跳转快捷键配置
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to Declaration" })
map("n", "<leader>rN", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("v", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format code block" })

-- -- neoscroll按键映射
-- local neoscroll = require('neoscroll')
-- local keymap = {
--   ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end;
--   ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end;
--   ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 350 }) end;
--   ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 350 }) end;
--   ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
--   ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
--   ["zt"]    = function() neoscroll.zt({ half_win_duration = 150 }) end;
--   ["zz"]    = function() neoscroll.zz({ half_win_duration = 150 }) end;
--   ["zb"]    = function() neoscroll.zb({ half_win_duration = 150 }) end;
-- }
-- local modes = { 'n', 'v', 'x' }
-- for key, func in pairs(keymap) do
--   map(modes, key, func, { desc = "Neoscroll Plugin" })
-- end

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
