-- Packer Setup  {{{1

-- Automatically install Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


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

use {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  requires = {
    {'nvim-lua/plenary.nvim'},
    -- A native (compiled C) sorter for improved performance:
    -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    -- Pass arguments to the grep command:
    -- {'nvim-telescope/telescope-live-grep-args.nvim'},
  },
  config = "require 'user.plugins.telescope'"
}

-- Colorschemes  {{{3
use 'arcticicestudio/nord-vim'


-- IDE Features  {{{2

-- Package manager for LSP servers, DAP servers, linters and formatters
use {
  'williamboman/mason.nvim',
  config = function() require('mason').setup {} end
}

-- Bridges mason and lspconfig
use {
  'williamboman/mason-lspconfig.nvim',
  after = 'mason.nvim',
  config = function() require('mason-lspconfig').setup {} end
}

-- LSP client
use {
  'neovim/nvim-lspconfig',
  after = 'mason-lspconfig.nvim',
  -- requires = { 'b0o/schemastore.nvim' },  -- Easy access to JSON schemas from SchemaStore.org
  config = "require 'user.plugins.lspconfig'"
}

-- Completion and Snippets  {{{3
use {
  'hrsh7th/nvim-cmp',            -- Completion engine
  requires = {
    'hrsh7th/cmp-buffer',        -- buffer completions
    'hrsh7th/cmp-cmdline',       -- cmdline completions
    'hrsh7th/cmp-path',          -- path completions
    'hrsh7th/cmp-nvim-lsp',      -- LSP completions
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',      -- Neovim Lua API completions
    'saadparwaiz1/cmp_luasnip',  -- LuaSnip completions
  },
  config = "require 'user.plugins.cmp'"
}
use 'L3MON4D3/LuaSnip'              -- Snippet engine
use 'rafamadriz/friendly-snippets'  -- Snippets collection

-- Git  {{{2
use {
  'sindrets/diffview.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function() require('diffview').setup { use_icons = false } end
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
