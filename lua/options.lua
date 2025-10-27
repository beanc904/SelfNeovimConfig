require "nvchad.options"
require "neovide"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local g = vim.g

---------- opt ----------
opt.whichwrap = "b,s"
opt.guifont = "Maple Mono NF:h16"

---------- g ----------
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
