-- Packer Setup  {{{1

-- Automatically install Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run `:PackerCompile` whenever `plugins.lua` is updated
vim.api.nvim_create_autocmd({'BufWritePost'}, {
  group = vim.api.nvim_create_augroup('packer_user_config', {}),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

local packer = require 'packer'
local use = packer.use

packer.init {
  -- Display Packer output in a floating window
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Call packer.reset() before packer.use() in case the plugin file is re-sourced
packer.reset()

-- Let Packer manage itself
use 'wbthomason/packer.nvim'


-- Plugins  {{{1
-- Editor Enhancements  {{{2
use {
  'windwp/nvim-autopairs',
  config = function() require("nvim-autopairs").setup {} end
}

use {
  'numToStr/Comment.nvim',
  config = function() require('Comment').setup {} end
}

use {
  'kylechui/nvim-surround',
  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function() require("nvim-surround").setup {} end
}


-- Apperance and Interface  {{{2
use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      show_trailing_blankline_indent = false,
    }
  end
}

use {
  'lukas-reineke/virt-column.nvim',
  config = function()
    require('virt-column').setup {
      char = '│'  -- Default is '┃'; indent_blankline_char default is '│'
    }
  end
}

-- Colorschemes  {{{3
use 'arcticicestudio/nord-vim'


-- IDE Features  {{{2
-- Completion and Snippets  {{{3
use {
  'hrsh7th/nvim-cmp',            -- Completion engine
  requires = {
    'hrsh7th/cmp-buffer',        -- buffer completions
    'hrsh7th/cmp-cmdline',       -- cmdline completions
    'hrsh7th/cmp-path',          -- path completions
    'saadparwaiz1/cmp_luasnip',  -- LuaSnip completions
  },

  config = "require 'user.plugins.cmp'"
}
use 'L3MON4D3/LuaSnip'              --Snippet engine
use 'rafamadriz/friendly-snippets'  -- Snippets collection

-- Git  {{{2
use {
  'sindrets/diffview.nvim',
  requires = 'nvim-lua/plenary.nvim'
}

use {
  'lewis6991/gitsigns.nvim',
  config = function() require('gitsigns').setup {} end
}


-- Packer Setup (Completion)  {{{1
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end


-- vim: sw=2 ts=2 sts=2 et fdm=marker
