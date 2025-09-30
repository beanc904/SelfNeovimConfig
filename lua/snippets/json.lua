local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("json", {
  -- pyrightconfig.json
  s("pyconf", fmt([[
{{
  "pythonVersion": "{}",
  "venvPath": "/home/coffeebean/miniforge3/envs",
  "venv": "{}",
  "typeCheckingMode": "basic",
  "reportMissingImports": false,
  "reportAttributeAccessIssue": false
}}
]], {
      i(1, "version"),
      i(2, "envname"),
    }),
    {
      show_condition = function()
        return vim.fn.expand("%:t") == "pyrightconfig.json"
      end
    }
  ),
})
