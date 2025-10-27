local wk = require "which-key"

wk.add {
  -- rename symbol
  { "<leader>rn", icon = { icon = "󰑕 ", color = "orange" } },
  -- diagnostic hover
  { "<leader>dd", icon = { icon = "🐞", color = "red" } },
  { "<leader>de", icon = { icon = " ", color = "red" } },
  { "<leader>dw", icon = { icon = " ", color = "red" } },
  -- copilot toggle
  {
    "<leader>ct",
    function()
      require("copilot.command").toggle()
    end,
    icon = { icon = " ", color = "orange" },
    desc = "Toggle copilot (buffer)",
    mode = { "n", "v" },
  },
  {
    "<leader>cT",
    function()
      local is_disabled = require("copilot.client").is_disabled()

      if is_disabled then
        require("copilot.command").enable()
      else
        require("copilot.command").disable()
      end
    end,
    icon = { icon = " ", color = "orange" },
    desc = "Toggle copilot (global)",
    mode = { "n", "v" },
  },
}

