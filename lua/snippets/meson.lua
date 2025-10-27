local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("mesoncc", fmt([[
project('{name}', 'cpp',
  version : '{version}',
  default_options : ['cpp_std={std}']
)

executable('{target}', ['{src}'])
  ]], {
    name = i(1, "my_project"),
    version = i(2, "0.1.0"),
    std = i(3, "c++17"),
    target = i(4, "main"),
    src = i(5, "main.cc"),
  })),
}
