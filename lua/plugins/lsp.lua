local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason.setup {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

local servers = {
  "lua_ls",
  "pyright",
}

require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_installation = true,
}

for _, a in ipairs(servers) do
  require('lspconfig')[a].setup {
    capabilities = capabilities
  }
end
