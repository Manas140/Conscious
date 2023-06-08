local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

opt.rtp:prepend(lazypath)

g.mapleader = " "

require("lazy").setup({
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent_blankline')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nathom/filetype.nvim' },
    config = function()
      require('plugins.treesitter')
    end
  },
  'RRethy/nvim-base16',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.nvim-tree')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.gitsigns')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope')
    end
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.bufferline')
    end
  },

  -- Completion, LSP
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline'},
    config = function()
      require('plugins.cmp')
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'williamboman/mason.nvim',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require("plugins.lsp")
    end
  },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
    config = function()
      require('plugins.luasnip')
    end
  }

})
