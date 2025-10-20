return {
  "uga-rosa/translate.nvim",
  cmd = { "Translate", "TranslateClipboard", "TranslateReplace" },
  keys = {
    { "<leader>t", "<cmd>Translate zh<CR>", mode = "v", desc = "Translate into Chinese" }
  },
  opts = {
    default = {
      command = "google",
      output = "floating",
      parse = true,
    },
    preset = {
      output = {
        floating = {
          border = "rounded",
        },
      },
    },
  },
}
