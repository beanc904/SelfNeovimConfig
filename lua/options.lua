require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


-- 个性化配置
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- neoscroll按键映射
local neoscroll = require('neoscroll')
local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end;
  ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 350 }) end;
  ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 350 }) end;
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
  ["zt"]    = function() neoscroll.zt({ half_win_duration = 150 }) end;
  ["zz"]    = function() neoscroll.zz({ half_win_duration = 150 }) end;
  ["zb"]    = function() neoscroll.zb({ half_win_duration = 150 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

-- 禁用行末跳转第二行
vim.opt.whichwrap = "b,s"
