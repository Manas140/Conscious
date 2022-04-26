local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  return
end

nvim_tree.setup {
  view = {
    width = 30,
    side = "left",
    hide_root_folder = true,
  },
  disable_netrw = true,
  hijack_cursor = true,
  update_cwd = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = false,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
}

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
  folder_arrows = 0,
}
