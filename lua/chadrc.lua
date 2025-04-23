-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  transparency = false,   -- set transparent background

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- 字体显示设置
-- "<font sytle>:<size>"
-- "Hack Nerd Font:h11"
vim.opt.guifont = "Hack Nerd Font"

return M
