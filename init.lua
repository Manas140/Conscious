local modules = {
	'options',
	'plugins',
	'status',
	'config',
  'colors',
	'mappings'
}

for i, a in ipairs(modules) do
	local ok, err = pcall(require, a)
	if not ok then 
		error("Error calling " .. a .. err)
	end
end

-- Auto commands
vim.cmd [[
  augroup open-tabs
    au!
    au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
  augroup end
  au TermOpen term://* setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal
]]
