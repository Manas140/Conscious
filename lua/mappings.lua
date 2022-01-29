active = false
function nmap(keys, command)
  vim.api.nvim_set_keymap("n", keys, command .. " <CR>", { noremap = true, silent = true })
end

function vmap(keys, command)
  vim.api.nvim_set_keymap("v", keys, command .. " <CR>", { noremap = true, silent = true })
end

function minimal()
  if active then
    vim.cmd [[
      set number relativenumber noshowmode showtabline=1 laststatus=2 signcolumn=yes foldcolumn=0 
      au WinEnter,BufEnter, * set number relativenumber 
    ]]
    active = false
  else 
    vim.cmd [[
      set nonumber norelativenumber showmode showtabline=0 laststatus=0 signcolumn=no foldcolumn=1
      au WinEnter,BufEnter, * set nonumber norelativenumber 
    ]]
    active = true
  end
end

-- Normal Map
nmap("<TAB>", ":tabnext")
nmap("<S-TAB>", ":tabprev")
nmap("hs", ":split")
nmap("vs", ":vs")
nmap("<leader>v", ":vs +terminal | startinsert")
nmap("<leader>h", ":split +terminal | startinsert")
nmap("<leader>t", ":tabnew")

nmap("<leader>x", ":q")
nmap("<C-S>", ":w")

-- Minimal toggle
nmap("<leader>m", ":lua minimal()")

-- Telescope
nmap("<leader>/", ":lua require('Comment.api').toggle_current_linewise()")
nmap("<leader><space>", ":Telescope")
nmap("ff", ":Telescope find_files")
nmap("fb", ":Telescope buffers")

-- NvimTree
nmap("<C-N>", ":NvimTreeToggle")
nmap("<C-E>", ":NvimTreeFocus")

-- Visual Map
vmap("<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())")
