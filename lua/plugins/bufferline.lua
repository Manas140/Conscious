local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

local present, colors = pcall(require, "colors." .. _G.theme)

if not present then
  return
end

bufferline.setup {
  options = {
    separator_style = { "", ""},
    show_tab_indicators = false,
  },
  highlights = {
    fill = {
      guifg = colors.base00,
      guibg = colors.base00,
    },
    background = {
      guifg = colors.base03,
      guibg = colors.base00,
    },

    -- buffers
    buffer_selected = {
      guifg = colors.base05,
      guibg = colors.base00,
      gui = "bold",
    },
    buffer_visible = {
      guifg = colors.base03,
      guibg = colors.base00,
    },

    -- close buttons
    close_button = {
      guifg = colors.base03,
      guibg = colors.base00,
    },
    close_button_visible = {
      guifg = colors.base03,
      guibg = colors.base00,
    },
    close_button_selected = {
      guifg = colors.base08,
      guibg = colors.base00,
    },

    indicator_selected = {
      guifg = colors.base00,
      guibg = colors.base00,
    },
    
    -- modified
    modified = {
      guifg = colors.base03,
      guibg = colors.base00,
    },
    modified_visible = {
      guifg = colors.base00,
      guibg = colors.base00,
    },
    modified_selected = {
      guifg = colors.base0B,
      guibg = colors.base00,
    },

    -- tabs
    tab_close = {
      guifg = colors.base08,
      guibg = colors.base00,
    },
  },
}
