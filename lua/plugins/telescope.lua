local present, telescope = pcall(require, "telescope")

if not present then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.otf",
      "%.ttf",
      "node_modules",
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
    },
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  },
}
