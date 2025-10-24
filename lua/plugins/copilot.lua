return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enable = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-l>",
        next = "<M-j>",
        prev = "<M-k>",
        dismiss = "<M-r>",
      },
    },
    panel = {
      enable = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<M-l>",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
    server_opts_overrides = {
      settings = {
        advanced = {
          inlineSuggestCount = 3,
        },
      },
    },
  },
}
