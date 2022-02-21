require("indent_blankline").setup {
  char = "│",
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "TelescopePrompt",
    "TelescopeResults",
  },
}
