fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g

_G.theme = "paradise"

local modules = {
  'options',
  'mappings',
  'statusline',
  'plugins',
  'colors',
}

for _, a in ipairs(modules) do
  local ok, err = pcall(require, a)
  if not ok then
    error("Error calling " .. a .. err)
  end
end

-- Auto commands
api.nvim_create_autocmd({"TermOpen", "TermEnter"}, {
  pattern = "term://*",
  command = "setlocal nonumber norelativenumber signcolumn=no | setfiletype term",
})

api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert"
})

api.nvim_create_autocmd("VimLeave", {
  command = "set guicursor=a:ver20",
})
