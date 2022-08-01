local function map(mode, keys, command)
  api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true })
end

local active = false
function Minimal()
  if active then
    opt.number = true
    opt.showmode = false
    opt.showtabline = 2
    opt.laststatus = 2
    opt.signcolumn = 'yes'
    opt.foldcolumn = '0'
  else
    opt.number = false
    opt.relativenumber = false
    opt.showmode = true
    opt.showtabline = 0
    opt.laststatus = 0
    opt.signcolumn = 'no'
    opt.foldcolumn = '1'
  end
  active = not active
end

-- Normal Map
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprev<CR>")
map("n", "hs", ":split<CR>")
map("n", "vs", ":vs<CR>")

-- Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>")
map("n", "<leader>h", ":split +terminal | startinsert<CR>")

-- Save
map("i", "<C-S>", "<ESC>:w<CR><Insert>")
map("n", "<C-S>", ":w<CR>")

-- Buffer
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>t", ":enew<CR>")
map("n", "<ESC>", ":nohlsearch<CR>")

-- Minimal toggle
map("n", "<leader>m", ":lua Minimal()<CR>")
map("n", "<leader>n", ":set relativenumber!<CR>")

-- Hard update
map("n", "<leader>u", ":tabnew | term cd $HOME/.config/nvim && git reset --hard HEAD && git pull<CR>")

-- Telescope
map("n", "<leader><space>", ":Telescope<CR>")
map("n", "ff", ":Telescope find_files<CR>")

-- NvimTree
map("n", "<C-N>", ":NvimTreeToggle<CR>")
map("n", "<C-B>", ":NvimTreeFocus<CR>")

-- Comment
map("n", "<leader>/", ":lua require('Comment.api').toggle_current_linewise()<CR>")
map("v", "<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")

-- Insert Map
map("i", "<C-E>", "<End>")
map("i", "<C-A>", "<Home>")

-- Shift tab
map("i", "<S-TAB>", "<ESC><<<Ins>")
