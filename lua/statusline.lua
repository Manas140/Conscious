local modes = {
  ['n']    = ' ',
  ['no']   = ' ',
  ['nov']  = ' ',
  ['noV']  = ' ',
  ['no'] = ' ',
  ['niI']  = ' ',
  ['niR']  = ' ',
  ['niV']  = ' ',

  ['i']   = ' ',
  ['ic']  = ' ',
  ['ix']  = ' ',
  ['s']   = ' ',
  ['S']   = ' ',

  ['v']   = ' ',
  ['V']   = ' ',
  ['']  = ' ',
  ['r']   = '﯒ ',
  ['r?']  = ' ',
  ['c']   = ' ',
  ['t']   = ' ',
  ['!']   = ' ',
  ['R']   = ' ',
}

local icons = {
  ['typescript']         = ' ' ,
  ['python']             = ' ' ,
  ['java']               = ' ' ,
  ['html']               = ' ' ,
  ['css']                = ' ' ,
  ['scss']               = ' ' ,
  ['javascript']         = ' ' ,
  ['javascriptreact']    = ' ' ,
  ['markdown']           = ' ' ,
  ['sh']                 = ' ',
  ['zsh']                = ' ',
  ['vim']                = ' ',
  ['rust']               = ' ',
  ['cpp']                = ' ',
  ['c']                  = ' ',
  ['go']                 = ' ',
  ['lua']                = ' ',
  ['conf']               = ' ',
  ['haskel']             = ' ',
  ['ruby']               = ' ',
  ['txt']                = ' '
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

local function branch()
  local cmd = io.popen('git branch --show-current 2>/dev/null')
  local branch = cmd:read("*l") or cmd:read("*a")
  cmd:close()
  if branch ~= "" then
    return string.format("   " .. branch)
  else
    return ""
  end
end

-- StatusLine Modes
Status = function()
  return table.concat {
    color(), -- mode colors
    string.format("  %s ", modes[api.nvim_get_mode().mode]):upper(), -- mode
    "%#StatusLine#", -- middle color
    branch(),
    -- " %f ", -- file name
    "%=", -- right align
    string.format("%s", (icons[vim.bo.filetype] or "")),
    " %f ",
    color(), -- mode colors
    " %l:%c  ", -- line, column
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
