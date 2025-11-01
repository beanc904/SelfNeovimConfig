local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("meson", {
  s(
    "ccproj",
    fmt(
      [[
project(
  '{project_name}',
  '{languages}',
  version         : {version},
  meson_version   : {meson_version},
  default_options : [{default_options}],
  subproject_dir  : {subproject_dir},
)

executable(
  '{exe_name}',
  [{sources}],
  install : true
)
      ]],
      {
        project_name = i(1, "my_project"),
        languages = i(2, "cpp"),
        version = i(3, "'0.1.0'"),
        meson_version = i(4, "'>=0.60.0'"),
        default_options = i(
          5,
          "'cpp_std=c++17', 'warning_level=3', 'optimization=2'"
        ),
        subproject_dir = i(6, "'subprojects'"),
        exe_name = rep(1),
        sources = i(7, "'main.cc'"),
      }
    )
  ),

  s(
    "cclib",
    fmt(
      [[
project(
  '{lib_name}',
  '{languages}',
  version         : {version},
  meson_version   : {meson_version},
  default_options : [{default_options}],
)

library(
  '{lib_name}',
  [{sources}],
  include_directories : include_directories('.'),
  install : true
)

lib_dep = declare_dependency(
  include_directories : include_directories('.'),
  link_with : {lib_name}
)
      ]],
      {
        lib_name = i(1, "my_lib"),
        languages = i(2, "cpp"),
        version = i(3, "'0.1.0'"),
        meson_version = i(4, "'>=0.60.0'"),
        default_options = i(5, "'cpp_std=c++17', 'warning_level=3'"),
        sources = i(6, "'src/foo.cc', 'src/bar.cc'"),
      }
    )
  ),
})
