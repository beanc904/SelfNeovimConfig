require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap = require("dap")
local dapui = require("dapui")

-- 调试快捷键
vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "开始/继续调试" })
vim.keymap.set("n", "<S-F5>", function() dap.terminate() end, { desc = "结束调试" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "单步跳过" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "单步进入" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "单步跳出" })
vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, { desc = "切换断点" })
vim.keymap.set("n", "<Leader>db", function() dap.set_breakpoint(vim.fn.input("条件断点: ")) end, { desc = "设置条件断点" })
vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "打开 REPL" })
vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "切换 DAP UI" })

-- 在调试会话开始时自动打开 UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- 结束后自动关闭
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- 以下用于配置 dap 服务器
--
-- codelldb 服务器配置
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  }
}



-- 语言配置
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  }
}



dap.configurations.c = dap.configurations.cpp
