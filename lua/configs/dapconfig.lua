require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap = require "dap"
local dapui = require "dapui"

-- debug keymap
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "Start / Continue Debug" })
vim.keymap.set("n", "<S-F5>", function()
  dap.terminate()
end, { desc = "End Debug" })
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<F9>", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>db", function()
  dap.set_breakpoint(vim.fn.input "set Conditional Breakpoint: ")
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>dr", function()
  dap.repl.open()
end, { desc = "Open REPL" })
vim.keymap.set("n", "<Leader>du", function()
  dapui.toggle()
end, { desc = "Toggle DAP UI" })

-- automatically open UI when Debug session start
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- automatically close after Debug finished
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- configure dap server below
--
-- codelldb server configurations
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

-- language configurations
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
