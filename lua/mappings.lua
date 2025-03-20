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
