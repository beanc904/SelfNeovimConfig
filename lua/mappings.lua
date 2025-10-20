require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected line up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- re-bind <leader>rn
vim.keymap.del("n", "<leader>rn")
map("n", "<leader>rN", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { silent = true, noremap = true, desc = "Toggle Relative Number" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })



map("v", "<leader>ff", vim.lsp.buf.format, { noremap = true, silent = true, desc = "V-LINE format block" })



-- refresh nvim-tree.lua
map("n", "<leader>rf", "<cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh Files Tree" })



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



-- bind inlay hints
map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Enable inlay hints" })



if vim.g.neovide then
  -- adjust the transparency of the background
  vim.g.neovide_opacity = vim.g.neovide_opacity or 1.0
  local function change_opacity(delta)
    local new_opacity = vim.g.neovide_opacity + delta
    -- limit the range between 0.0 and 1.0
    new_opacity = math.max(0.0, math.min(1.0, new_opacity))
    vim.g.neovide_opacity = new_opacity
    print(string.format("Neovide opacity: %.2f", new_opacity))
  end
  -- correspond keybind
  map("n", "<M-=>", function()
    change_opacity(0.05)
  end, { desc = "Increase Neovide opacity" })
  map("n", "<M-->", function()
    change_opacity(-0.05)
  end, { desc = "Decrease Neovide opacity" })

  -- adjust the scale of fonts
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor or 1.0
  local function change_scale(delta)
    local new_scale = vim.g.neovide_scale_factor + delta
    new_scale = math.max(0.5, math.min(3.0, new_scale))
    vim.g.neovide_scale_factor = new_scale
    print(string.format("Neovide font scale: %.2f", new_scale))
  end
  -- correspond keybind
  map("n", "<C-=>", function()
    change_scale(0.1)
  end, { desc = "Increase Neovide font size" })
  map("n", "<C-->", function()
    change_scale(-0.1)
  end, { desc = "Decrease Neovide font size" })
  map("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0; print("Neovide font scale reset to 1.0")
  end, { desc = "Reset Neovide font size" })
end



-- Telescope jump to definitions / references / implementations / type definitions
map("n", "<leader>tr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope LSP references" })
-- map("n", "<leader>td", "<cmd>Telescope lsp_definitions<CR>", { desc = "Telescope LSP definitions" })
-- map("n", "<leader>ti", "<cmd>Telescope lsp_implementations<CR>", { desc = "Telescope LSP implementations" })
-- map("n", "<leader>tt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Telescope LSP definitions" })
