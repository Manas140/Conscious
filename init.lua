fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g

_G.theme = "paradise-dark"

local modules = {
  'options',
  'mappings',
  'statusline',
  'colors',
  'plugins',
}

for _, a in ipairs(modules) do
  local ok, err = pcall(require, a)
  if not ok then
    error("Error calling " .. a .. err)
  end
end

-- Auto commands
api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  command = "setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal",
})
