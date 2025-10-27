require "nvchad.mappings"
require "whichkey"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map(
  "v",
  "J",
  ":m '>+1<CR>gv=gv",
  { noremap = true, silent = true, desc = "Move selected line down" }
)
map(
  "v",
  "K",
  ":m '<-2<CR>gv=gv",
  { noremap = true, silent = true, desc = "Move selected line up" }
)

-- re-bind <leader>rn
del("n", "<leader>rn")
map("n", "<leader>rN", function()
  ---@diagnostic disable-next-line: undefined-field
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { silent = true, noremap = true, desc = "Toggle Relative Number" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

map(
  "v",
  "<leader>ff",
  vim.lsp.buf.format,
  { noremap = true, silent = true, desc = "V-LINE format block" }
)

-- refresh nvim-tree.lua
map(
  "n",
  "<leader>rf",
  "<cmd>NvimTreeRefresh<CR>",
  { noremap = true, silent = true, desc = "Refresh Files Tree" }
)

map(
  "n",
  "<leader>dd",
  vim.diagnostic.open_float,
  { desc = "Open diagnostic float" }
)
map("n", "<leader>de", function()
  vim.diagnostic.open_float {
    severity = vim.diagnostic.severity.ERROR,
  }
end, { desc = "Show errors only" })
map("n", "<leader>dw", function()
  vim.diagnostic.open_float {
    severity = vim.diagnostic.severity.WARN,
  }
end, { desc = "Show warnings only" })

-- bind inlay hints
map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end, { desc = "Toggle inlay hints" })

-- Telescope jump to definitions / references / implementations / type definitions
map(
  "n",
  "<leader>tr",
  "<cmd>Telescope lsp_references<CR>",
  { desc = "Telescope LSP references" }
)
-- map("n", "<leader>td", "<cmd>Telescope lsp_definitions<CR>", { desc = "Telescope LSP definitions" })
-- map("n", "<leader>ti", "<cmd>Telescope lsp_implementations<CR>", { desc = "Telescope LSP implementations" })
-- map("n", "<leader>tt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Telescope LSP definitions" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
