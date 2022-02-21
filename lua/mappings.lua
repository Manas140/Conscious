api = vim.api
opt = vim.opt

active = false
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
    opt.relativenumber = true
    opt.showmode = false
    opt.showtabline = 1
    opt.laststatus = 2
    opt.signcolumn = 'yes'
    opt.foldcolumn = '0'
    active = false
  else
    opt.number = false
    opt.relativenumber = false
    opt.showmode = true
    opt.showtabline = 0
    opt.laststatus = 0
    opt.signcolumn = 'no'
    opt.foldcolumn = '1'
    active = true
  end
end

-- Normal Map
nmap("<TAB>", ":bnext")
nmap("<S-TAB>", ":bprev")
nmap("hs", ":split")
nmap("vs", ":vs")
nmap("<leader>v", ":vs +terminal | startinsert")
nmap("<leader>h", ":split +terminal | startinsert")
nmap("<leader>t", ":tabnew")

nmap("<C-S>", ":w")
nmap("<leader>x", ":q")
nmap("<ESC>", ":nohlsearch")

-- Minimal toggle
nmap("<leader>m", ":lua minimal()")

-- Hard update
nmap("<leader>u", ":tabnew | term cd $HOME/.config/nvim && git reset --hard HEAD && git pull")

-- Telescope
nmap("<leader><space>", ":Telescope")
nmap("ff", ":Telescope find_files")
nmap("fb", ":Telescope buffers")

-- NvimTree
nmap("<C-N>", ":NvimTreeToggle")
nmap("<C-B>", ":NvimTreeFocus")

-- Comment
nmap("<leader>/", ":lua require('Comment.api').toggle_current_linewise()")
-- Visual Map
vmap("<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())")

-- Insert Map
imap("<C-E>" , "<End>")
imap("<C-A>" , "<Home>")
