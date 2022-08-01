local present, cmp = pcall(require, 'cmp')

if not present then
  return
end

opt.completeopt = 'menuone,noselect'

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup({
  snippet = {
    expand = function(args)
      local present, luasnip = pcall(require, "luasnip")
      if present then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  window = {
    completion = { border = "solid" },
    documentation = { border = "solid" }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        -- buffer = "[Buf]",
        -- path = "[Path]",
        -- nvim_lsp = "[Lsp]",
        -- luasnip = "[Snip]",
        -- cmdline = "[Cmd]",
        -- nvim_lua = "[Lua]",
      })[entry.source.name]
      return vim_item
    end,
   },
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'cmdline' },
    { name = 'nvim_lsp' },
  }),
  enabled = function()
    local context = require 'cmp.config.context'
    if api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment')
        and not context.in_syntax_group('Comment')
    end
  end
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
