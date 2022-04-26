g.mapleader = ' '

-- basic
opt.scrolloff = 3
opt.mouse = 'a'
opt.title = true
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.undofile = true
opt.cmdheight = 1
opt.termguicolors = true
opt.showmode = false
opt.cul = true

-- timeout stuff
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10

-- status, tab, number, sign line
opt.ruler = false
opt.laststatus = 2
opt.number = true
opt.numberwidth = 1
opt.relativenumber = false
opt.signcolumn = "yes"

-- window, buffer, tabs
opt.switchbuf = "newtab"
opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.fillchars = {
  vert = " ",
  eob = " ",
  diff = " ",
  msgsep = " "
}

-- text formatting
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.showmatch = true
opt.smartcase = true
opt.whichwrap:append "<>[]hl"

-- remove intro
opt.shortmess:append "sI"

-- disable inbuilt vim plugins
local built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(built_ins) do
  g["loaded_" .. plugin] = 1
end
