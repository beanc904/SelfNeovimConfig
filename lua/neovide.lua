local g = vim.g
local map = vim.keymap.set

if g.neovide then
  -- Put anything you want to configure Neovide here
  g.neovide_opacity = 0.90
  g.neovide_noraml_opacity = 0.90

  g.neovide_refresh_rate = 120

  g.neovide_cursor_vfx_mode = { "pixiedust" }
  g.neovide_cursor_particle_lifetime = 0.4
  g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
  g.neovide_cursor_vfx_particle_density = 10.0
  g.neovide_cursor_vfx_opacity = 180.0
  g.neovide_cursor_vfx_particle_speed = 10.0
end

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
    vim.g.neovide_scale_factor = 1.0
    print "Neovide font scale reset to 1.0"
  end, { desc = "Reset Neovide font size" })
end
