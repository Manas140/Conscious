active = false

function hl(highlight, fg, bg)
  cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
end

function nmap(keys, command)
  api.nvim_set_keymap("n", keys, command .. " <CR>", { noremap = true, silent = true })
end

function vmap(keys, command)
  api.nvim_set_keymap("v", keys, command .. " <CR>", { noremap = true, silent = true })
end

function imap(keys, command)
  api.nvim_set_keymap("i", keys, command, { noremap = true, silent = true })
end

function minimal()
  if active then
    opt.number = true 
    opt.showmode = false
    opt.showtabline = 2
    opt.laststatus = 2
    opt.signcolumn = 'yes'
    opt.foldcolumn = '0'
  else
    opt.number = false
    opt.showmode = true
    opt.showtabline = 0
    opt.laststatus = 0
    opt.signcolumn = 'no'
    opt.foldcolumn = '1'
  end
  active = not active 
end

-- Normal Map
nmap("<TAB>", ":bnext")
nmap("<S-TAB>", ":bprev")
nmap("hs", ":split")
nmap("vs", ":vs")

-- Terminal
nmap("<leader>v", ":vs +terminal | startinsert")
nmap("<leader>h", ":split +terminal | startinsert")

-- Save
imap("<C-S>", "<ESC>:w<CR><Insert>")
nmap("<C-S>", ":w")

nmap("<leader>x", ":bd")
nmap("<leader>s", ":w")

nmap("<leader>t", ":enew")
nmap("<ESC>", ":nohlsearch")

-- Minimal toggle
nmap("<leader>m", ":lua minimal()")
nmap("<leader>n", ":set relativenumber!")

-- Hard update
nmap("<leader>u", ":tabnew | term cd $HOME/.config/nvim && git reset --hard HEAD && git pull")

-- Telescope
nmap("<leader><space>", ":Telescope")
nmap("ff", ":Telescope find_files")

-- NvimTree
nmap("<C-N>", ":NvimTreeToggle")
nmap("<C-B>", ":NvimTreeFocus")

-- Comment
nmap("<leader>/", ":lua require('Comment.api').toggle_current_linewise()")
vmap("<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())")

-- Insert Map
imap("<C-E>" , "<End>")
imap("<C-A>" , "<Home>")
