_G.theme = "paradise-dark"

local modules = {
  'options',
  'mappings',
  'statusline',
  'colors',
  'plugins',
}

for i, a in ipairs(modules) do
  local ok, err = pcall(require, a)
  if not ok then 
    error("Error calling " .. a .. err)
  end
end

-- Auto commands
vim.cmd [[
  au TermOpen term://* setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal
]]
