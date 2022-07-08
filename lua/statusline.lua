local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function color()
  local mode = api.nvim_get_mode().mode
  local mode_color = "%#StatusLine#"
  if mode == "n" then
    mode_color = "%#StatusNormal#"
  elseif mode == "i" or mode == "ic" then
    mode_color = "%#StatusInsert#"
  elseif mode == "v" or mode == "V" or mode == "" then
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
Status = function()
  return table.concat {
    color(), -- mode colors
    string.format(" %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
    "%#StatusLine#", -- middle color
    " %f ", -- file name
    "%=", -- right align
    " %Y ", -- file type
    color(), -- mode colors
    " %l:%c ", -- line, column
  }
end


-- Execute statusline
api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
  pattern = "*",
  command = "setlocal statusline=%!v:lua.Status()", 
})
api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
  pattern = "*",
  callback = function() 
    opt.statusline = "%#StatusInactive# %f "
  end,
})
api.nvim_create_autocmd({"WinEnter", "BufEnter", "WinLeave" , "BufLeave", "FileType"}, {
  pattern = {"NvimTree*", "terminal"},
  callback = function()
    opt.statusline = "%#StatusLine#"
  end,
})
