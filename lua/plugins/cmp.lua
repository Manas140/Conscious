local present, cmp = pcall(require, "cmp")

if not present then
  return
end

opt.completeopt = "menuone,noselect"

cmp.setup {
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif api.nvim_get_mode().mode == "c" then
        fallback()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif api.nvim_get_mode().mode == "c" then
        fallback()
      else
        fallback()
      end
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", vim_item.kind)
      vim_item.menu = ({
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
        cmdline = "[Cmd]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  snippet = {
    expand = function(args)
      local present, luasnip = pcall(require, "luasnip")
      if present then 
        luasnip.lsp_expand(args.body)
      end
    end,
  },
}

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer'}
  }
})

cmp.setup.cmdline("?", {
  sources = {
    { name = "buffer"},
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline", keyword_length = 2 },
  },
})
