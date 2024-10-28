local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "│" },
    topdelete = { text = "│" },
    changedelete = { text = "│" },
    untracked = { text = "│" },
  },
}
