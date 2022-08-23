local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

local ok, color = pcall(require, "colors." .. _G.theme)
if not ok then
  return
end

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "" } },
    separator_style = { "", ""},
    show_tab_indicators = false,
  },
  highlights = {
    fill = {
      fg = color.base00,
      bg = color.base00,
    },
    background = {
      fg = color.base03,
      bg = color.base00,
    },

    -- buffers
    buffer_selected = {
      fg = color.base05,
      bg = color.base00,
      italic = false,
    },
    buffer_visible = {
      fg = color.base03,
      bg = color.base00,
    },

    -- close buttons
    close_button = {
      fg = color.base03,
      bg = color.base00,
    },
    close_button_visible = {
      fg = color.base03,
      bg = color.base00,
    },
    close_button_selected = {
      fg = color.base08,
      bg = color.base00,
    },

    indicator_selected = {
      fg = color.base00,
      bg = color.base00,
    },

    -- modified
    modified = {
      fg = color.base03,
      bg = color.base00,
    },
    modified_visible = {
      fg = color.base00,
      bg = color.base00,
    },
    modified_selected = {
      fg = color.base0B,
      bg = color.base00,
    },

    -- tabs
    tab_close = {
      fg = color.base00,
      bg = color.base00,
    },
  },
}
