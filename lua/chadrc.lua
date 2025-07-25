-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  transparency = true,

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
  },
}

M.ui = {
  telescope = { style = "bordered" },

  statusline = {
    theme = "minimal",
    separator_style = "round",
    order = {
      "mode", "file", "git", "%=",
      "lsp_msg", "%=", "diagnostics", "encoding",
      "eol", "lsp", "cwd", "cursor"
    },
    modules = {
      encoding = function()
        if vim.list_contains({ "help" }, vim.bo.filetype) then
          return ""
        end
        local encoding = vim.bo.fileencoding:upper()
        if encoding == "" then
          return ""
        end
        -- "%*" is used to clear highlight group (use default highlight)
        return " %*" .. encoding .. " "
      end,
      eol = function()
        if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "terminal" then
          return ""
        end
        if vim.list_contains({ "help", "terminal", "NvimTree", "nvdash" }, vim.bo.filetype) then
          return ""
        end
        -- LF, CRLF or CR
        local file_format = vim.bo.fileformat
        local eol
        if file_format == "unix" then
          eol = "LF"
        elseif file_format == "dos" then
          eol = "CRLF"
        elseif file_format == "mac" then
          eol = "CR"
        end
        -- "%*" is used to clear highlight group (use default highlight)
        return " %*" .. eol .. " "
      end,
    },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "  Configed by CoffeeBean  ",
    "                            ",
  },
}

return M
