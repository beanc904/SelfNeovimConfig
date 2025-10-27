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
  -- some compile commands
  {
    "<leader>ms",
    "<cmd>!meson setup build<CR>",
    icon = { icon = " ", color = "yellow" },
    desc = "Meson setup",
    mode = "n",
  },
  {
    "<leader>mr",
    "<cmd>!meson setup --reconfigure build<CR>",
    icon = { icon = " ", color = "yellow" },
    desc = "Meson reconfigure",
    mode = "n",
  },
  {
    "<leader>mm",
    "<cmd>!meson compile -C build -j$(nproc)<CR>",
    icon = { icon = " ", color = "yellow" },
    desc = "Meson compile",
    mode = "n",
  },
  {
    "<leader>mc",
    "<cmd>rm -rf build<CR>",
    icon = { icon = " ", color = "red" },
    desc = "Build clean",
    mode = "n",
  },
  {
    "<leader>ml",
    "<cmd>!ln -sf ./build/compile_commands.json .<CR>",
    icon = { icon = " ", color = "orange" },
    desc = "Link compile_commands.json",
    mode = "n",
  },
  {
    "<leader>mg",
    "<cmd>!cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug<CR>",
    icon = { icon = " ", color = "purple" },
    desc = "CMake generate",
    mode = "n",
  },
  {
    "<leader>mb",
    "<cmd>!cmake --build build -- -j$(nproc)<CR>",
    icon = { icon = " ", color = "purple" },
    desc = "CMake build",
    mode = "n",
  },
}
