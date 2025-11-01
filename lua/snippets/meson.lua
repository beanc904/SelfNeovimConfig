local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("meson", {
  s(
    "ccexe",
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

{sub1} = subproject('{sub2}')
{sub3}_dep = {sub4}.get_variable('{lib_dep}')

executable(
  '{exe_name}',
  [{sources}],
  dependencies : [{sub5}_dep],
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
        sub1 = i(7, "sub"),
        sub2 = rep(7),
        sub3 = rep(7),
        sub4 = rep(7),
        sub5 = rep(7),
        lib_dep = i(8, "lib_dep"),
        exe_name = rep(1),
        sources = i(9, "'main.cc'"),
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

{lib1} = library(
  '{lib2}',
  [{sources}],
  include_directories : include_directories('.'),
  install : true
)

lib_dep = declare_dependency(
  include_directories : include_directories('.'),
  link_with : {lib3}
)
      ]],
      {
        lib_name = i(1, "my_lib"),
        lib1 = rep(1),
        lib2 = rep(1),
        lib3 = rep(1),
        languages = i(2, "cpp"),
        version = i(3, "'0.1.0'"),
        meson_version = i(4, "'>=0.60.0'"),
        default_options = i(5, "'cpp_std=c++17', 'warning_level=3'"),
        sources = i(6, "'src/foo.cc', 'src/bar.cc'"),
      }
    )
  ),
})
