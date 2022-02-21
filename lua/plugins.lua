local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[ packadd packer.nvim ]]

require('packer').startup {
  function()
    use 'wbthomason/packer.nvim'
    
    -- On buffer stuff
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use { 
      'norcalli/nvim-colorizer.lua',
      config = function() 
        require('colorizer').setup() 
      end,
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins.indent_blankline")
      end,
    }
    
    -- UI
    use 'RRethy/nvim-base16'
    use {
      'kyazdani42/nvim-tree.lua',
      config = function() 
        require('plugins.nvim-tree')
      end,
    }
    use { 
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() 
        require('plugins.gitsigns')
      end,
    }
    use { 
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() 
        require('plugins.telescope')
      end,
    }
    use {
      'akinsho/bufferline.nvim',
      config = function()
        require('plugins.bufferline')
      end,
    }
     
    -- Completion
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path'},
      config = function()
        require('plugins.cmp')
      end,
    }
    
    -- Snippets
    use {
      'L3MON4D3/LuaSnip',
      requires = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
      after = 'nvim-cmp',
      config = function()
        require('plugins.luasnip')
      end,
    }
  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    },
  },
}
