require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.whichwrap = "b,s"
-- "<font sytle>:<size>"
vim.opt.guifont = "UbuntuMono Nerd Font:h18"

if vim.g.neovide then
  -- Put anything you want to configure Neovide here
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_noraml_opacity = 0.95

  vim.g.neovide_refresh_rate = 120

  vim.g.neovide_cursor_vfx_mode = { "pixiedust" }
  vim.g.neovide_cursor_particle_lifetime = 0.4
  vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_opacity = 180.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
end


-- -- auto save
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   pattern = "*.rs",
--   callback = function()
--     vim.cmd("silent! write")
--   end,
-- })
