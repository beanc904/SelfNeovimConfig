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
    function()
      local builddir =
        vim.fn.input("Meson build directory: ", "builddir/", "dir")
      local cmd = { "meson", "setup", "--buildtype=debug", builddir }
      local output = vim.system(cmd):wait()
      if output.code == 0 then
        vim.notify("Meson setup successfully.", vim.log.levels.INFO)
      else
        vim.notify(
          "Meson setup failed!\nstderr:\n"
            .. output.stderr
            .. "\nstdout:\n"
            .. output.stdout,
          vim.log.levels.ERROR
        )
      end
    end,
    icon = { icon = " ", color = "yellow" },
    desc = "Meson setup",
    mode = "n",
  },
  {
    "<leader>mr",
    function()
      local builddir =
        vim.fn.input("Meson reconfigure directory: ", "builddir/", "dir")
      local cmd = { "meson", "setup", "--reconfigure", builddir }
      local output = vim.system(cmd):wait()
      if output.code == 0 then
        vim.notify("Meson reconfigure successfully.", vim.log.levels.INFO)
      else
        vim.notify(
          "Meson reconfigure failed\nstderr:\n"
            .. output.stderr
            .. "\nstdout\n"
            .. output.stdout,
          vim.log.levels.ERROR
        )
      end
    end,
    icon = { icon = " ", color = "yellow" },
    desc = "Meson reconfigure",
    mode = "n",
  },
  {
    "<leader>mm",
    function()
      local builddir =
        vim.fn.input("Meson compile directory: ", "builddir/", "dir")
      local cmd = { "meson", "compile", "-C", builddir }
      local output = vim.system(cmd):wait()
      if output.code == 0 then
        vim.notify("Meson compile successfully.", vim.log.levels.INFO)
      else
        vim.notify(
          "Meson compile failed\nstderr:\n"
            .. output.stderr
            .. "\nstdout\n"
            .. output.stdout,
          vim.log.levels.ERROR
        )
      end
    end,
    icon = { icon = " ", color = "yellow" },
    desc = "Meson compile",
    mode = "n",
  },
  {
    "<leader>ml",
    function()
      local builddir =
        vim.fn.input("Linked compile_commands.json dir: ", "build/", "dir")
      local cmd =
        { "ln", "-sf", "./" .. builddir .. "/compile_commands.json", "." }
      vim.system(cmd):wait()
      vim.notify(
        "Linked compile_commands.json from " .. builddir,
        vim.log.levels.INFO
      )
    end,
    icon = { icon = " ", color = "orange" },
    desc = "Link compile_commands.json",
    mode = "n",
  },
  {
    "<leader>mg",
    function()
      local builddir = vim.fn.input("CMake build directory: ", "build/", "dir")
      local cmd = {
        "cmake",
        "-B",
        builddir,
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
        "-DCMAKE_BUILD_TYPE=Debug",
      }
      local output = vim.system(cmd):wait()
      if output.code == 0 then
        vim.notify("CMake generate successfully.", vim.log.levels.INFO)
      else
        vim.notify(
          "CMake generate failed\nstderr:\n"
            .. output.stderr
            .. "\nstdout\n"
            .. output.stdout,
          vim.log.levels.ERROR
        )
      end
    end,
    icon = { icon = " ", color = "purple" },
    desc = "CMake generate",
    mode = "n",
  },
  {
    "<leader>mb",
    function()
      local builddir =
        vim.fn.input("CMake compile directory: ", "build/", "dir")
      local cmd = { "cmake", "--build", builddir }
      local output = vim.system(cmd):wait()
      if output.code == 0 then
        vim.notify("CMake compile successfully.", vim.log.levels.INFO)
      else
        vim.notify(
          "CMake compile failed\nstderr:\n"
            .. output.stderr
            .. "\nstdout\n"
            .. output.stdout,
          vim.log.levels.ERROR
        )
      end
    end,
    icon = { icon = " ", color = "purple" },
    desc = "CMake compile",
    mode = "n",
  },
}
