local present, friendly_snippets = pcall(require, 'luasnip.loaders.from_vscode')

if present then
  friendly_snippets.load()
end
