require "nvchad.options"
require "neovide"

local sysname = vim.loop.os_uname().sysname

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
local g = vim.g

---------- opt ----------
opt.whichwrap = "b,s"

if sysname == "Linux" then
  opt.guifont = "Maple Mono NF:h12"
elseif sysname == "Darwin" then
  opt.guifont = "Maple Mono NF:h16"
else
  opt.guifont = "Maple Mono NF:h16"
end

---------- g ----------
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
