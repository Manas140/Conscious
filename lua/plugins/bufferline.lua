local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

local present, color = pcall(require, "colors." .. _G.theme)

if not present then
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
      guifg = color.base00,
      guibg = color.base00,
    },
    background = {
      guifg = color.base03,
      guibg = color.base00,
    },

    -- buffers
    buffer_selected = {
      guifg = color.base05,
      guibg = color.base00,
      gui = "bold",
    },
    buffer_visible = {
      guifg = color.base03,
      guibg = color.base00,
    },

    -- close buttons
    close_button = {
      guifg = color.base03,
      guibg = color.base00,
    },
    close_button_visible = {
      guifg = color.base03,
      guibg = color.base00,
    },
    close_button_selected = {
      guifg = color.base08,
      guibg = color.base00,
    },

    indicator_selected = {
      guifg = color.base00,
      guibg = color.base00,
    },
    
    -- modified
    modified = {
      guifg = color.base03,
      guibg = color.base00,
    },
    modified_visible = {
      guifg = color.base00,
      guibg = color.base00,
    },
    modified_selected = {
      guifg = color.base0B,
      guibg = color.base00,
    },

    -- tabs
    tab_close = {
      guifg = color.base00,
      guibg = color.base00,
    },
  },
}
