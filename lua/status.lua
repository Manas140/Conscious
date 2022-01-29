local api = vim.api

local modes = {
  ["n"] = " ",
  ["no"] = " ",
  ["v"] = " ",
  ["V"] = " ",
  [""] = " ",
  ["s"] = "里",
  ["S"] = "里",
  [""] = "ﱵ ",
  ["i"] = " ",
  ["ic"] = " ",
  ["R"] = "﯒ ",
  ["Rv"] = "﯒ ",
  ["c"] = " ",
  ["cv"] = " ",
  ["ce"] = " ",
  ["r"] = " ",
  ["rm"] = "MOAR",
  ["r?"] = "",
  ["!"] = " ",
  ["t"] = " ",
}

local function color()
  local mode = api.nvim_get_mode().mode
  local mode_color = "%#Normal#"
  if mode == "n" then
    mode_color = "%#StatusNormal#"
  elseif mode == "i" or mode == "ic" then
    mode_color = "%#StatusInsert#"
  elseif mode == "v" or mode == "V" or mode == "" then
    mode_color = "%#StatusVisual#"
  elseif mode == "R" then
    mode_color = "%#StatusReplace#"
  elseif mode == "c" then
    mode_color = "%#StatusCommand#"
  elseif mode == "t" then
    mode_color = "%#StatusTerminal#"
  end
  return mode_color
end

-- StatusLine Modes
Statusline = {}

Statusline.active = function()
  return table.concat {
    color(), -- mode colors
    string.format(" %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
    "%#Normal#", -- middle color
    " %f ", -- file name
    "%=", -- right align
    " %Y ", -- file type
    color(), -- mode colors
    " %l:%c " -- line, column 
  }
end

function Statusline.inactive()
  return "%#StatusInactive# %f "
end

function Statusline.short()
  return "%#Normal#"
end

-- Execute statusline
vim.cmd([[
  augroup Statusline
  au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
    au WinEnter,BufEnter,FileType NvimTree,terminal setlocal statusline=%!v:lua.Statusline.short()
    au WinLeave,BufLeave,FileType NvimTree,terminal setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
