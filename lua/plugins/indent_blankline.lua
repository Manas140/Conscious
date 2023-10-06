local present, ibl = pcall(require, "ibl")

if not present then
  return
end

ibl.setup {
  indent = { char="│" },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "TelescopePrompt",
      "TelescopeResults",
      "",
    },
    buftypes = { "terminal", "nofile" },
  },
  scope= { enabled = false }
}
