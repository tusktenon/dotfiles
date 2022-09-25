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

-- Appearance and Interface  {{{2

-- Auto-save
-- (best used with Vim option `undofile` for peristent undo)
use {
  'Pocco81/auto-save.nvim',
  config = function() require("auto-save").setup {} end
}

-- Close several buffers at once; close buffers while preserving windows
use {
  'kazhala/close-buffers.nvim',
  config = function()
    require('close_buffers').setup {
      -- Types of deletion that should preserve window layout:
      preserve_window_layout = { 'this', 'nameless' }
    }
  end
}

-- Colorizer
use {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      user_default_options = {
        RGB = true,     -- #RGB hex codes
        RRGGBB = true,  -- #RRGGBB hex codes
        names = false,   -- Named colors
        rgb_fn = true,  -- rgb() and rgba()
        hsl_fn = true,   -- hsl() and hsla()
      }
    }
  end
}

-- Column guides: use a character for the colorcolumn
use {
  'lukas-reineke/virt-column.nvim',
  -- `virt-column` needs to be loaded after your colorscheme (and lualine?),
  -- or you can run `highlight clear ColorColumn` after the color scheme has
  -- loaded (see https://github.com/lukas-reineke/virt-column.nvim/issues/2)
  -- after = 'everforest',
  config = function()
    require('virt-column').setup {
      char = '│'  -- Default is '┃'; indent_blankline_char default is '│'
    }
  end
}

-- Illuminate: Highlight other occurrences of word under cursor
use {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure {
      filetypes_denylist = {  -- Filetypes not to illuminate
        'markdown', 'text'
      },
      under_cursor = false  -- Don't illuminate under cursor 
    }
  end
}

-- Indent guides
use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      show_trailing_blankline_indent = false,
    }
  end
}

-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  requires = {
    {'nvim-lua/plenary.nvim'},
    -- A native (compiled C) sorter for improved performance:
    -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    -- A file browser:
    {'nvim-telescope/telescope-file-browser.nvim'},
    -- Pass arguments to the grep command:
    {'nvim-telescope/telescope-live-grep-args.nvim'},
    -- Navigate headings in Markdown, Org, Vim Help, etc.
    {'crispgm/telescope-heading.nvim'}
  },
  config = "require 'user.plugins.telescope'"
}

-- Tree-style file explorer (netrw replacement)
use {
  'kyazdani42/nvim-tree.lua',
  config = "require 'user.plugins.nvim-tree'"
}

-- WhichKey
use {
  "folke/which-key.nvim",
  config = "require 'user.plugins.which-key'"
}


-- Color Schemes  {{{3

-- The `frappe` flavour is a pleasant, pastel take on Palenight.
use {
  'catppuccin/nvim',
  as = "catppuccin",
  opt = true,
  config = function()
    vim.g.catppuccin_flavour = 'frappe'  -- frappe, macchiato or mocha
    require('catppuccin').setup {
      styles = {
        comments = {}
      }
    }
    -- vim.cmd 'colorscheme catppuccin'
  end
}

-- A really nice One Dark scheme ported from Doom Emacs.
-- Avoids much use of red by instead having two shades of purple.
use {
  'NTBBloodbath/doom-one.nvim',
  opt = true,
  setup = "require 'user.plugins.doom-one'",
  -- config = "vim.cmd 'colorscheme doom-one'"
}

-- My favourite scheme. Beautiful and practical.
use {
  'sainnhe/everforest',
  -- opt = true,
  config = function()
    -- require 'user.plugins.everforest'
    vim.cmd 'source ~/.config/nvim/lua/user/plugins/everforest.vim'
    vim.cmd 'colorscheme everforest'
  end
}

-- A nice implementation of the GitHub theme.
use {
  'projekt0n/github-nvim-theme',
  disable = true,
  config = function()
    -- To play well with other schemes, `github-nvim-theme` is best configured
    -- in VimScript, because a call to `require('github-theme').setup`
    -- automatically sets the `colorscheme`
    vim.g.github_comment_style = 'none'
    -- vim.cmd 'colorscheme github_dark'
  end
}

-- A great Onedark scheme that uses red sparingly.
use {
  'navarasu/onedark.nvim',
  opt = true,
  config = function()
    require 'user.plugins.onedark'
    -- require('onedark').load()
  end
}

-- Another great Onedark implementation. Compared to `navarasu/onedark.nvim`,
-- this scheme uses a lot more red by default, but also offers more
-- sophisticated customization options.
use {
  'olimorris/onedarkpro.nvim',
  opt = true,
  config = function()
    require 'user.plugins.onedarkpro'
    -- vim.cmd 'colorscheme onedarkpro'
  end
}

-- An attractive, relatively high-contrast theme
use {
  'folke/tokyonight.nvim',
  opt = true,
}


-- Editor Enhancements  {{{2

-- Autopairs
use {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup {
      check_ts = true  -- Use Treesitter to check for a pair
    }
  end
}

-- Commenting (c.f. tpope/vim-commentary)
use {
  'numToStr/Comment.nvim',
  config = "require 'user.plugins.comment'"
}

-- Enhanced `matchit` and `matchparen`
use 'andymass/vim-matchup'

-- Switch between single- and multi-line code forms
use 'AndrewRadev/splitjoin.vim'

-- Surround: add/change/delete delimiter pairs (c.f. tpope/vim-surround)
use {
  'kylechui/nvim-surround',
  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function() require('nvim-surround').setup {} end
}

-- Text Objects
use {
  'kana/vim-textobj-entire',           -- Entire buffer
  requires = {'kana/vim-textobj-user'}
}
use 'michaeljsmith/vim-indent-object'  -- Indentation level
use {
  'whatyouhide/vim-textobj-xmlattr',   -- HTML/XML attribute
  requires = {'kana/vim-textobj-user'}
}

-- Visual Star: Run `*` and `#` searches on Visual selection
use 'bronson/vim-visual-star-search'


-- Git  {{{2

-- Diff interface
use {
  'sindrets/diffview.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function() require('diffview').setup { use_icons = false } end
}

-- Show diff in the sign column; stage/unstage/preview hunks; line  blame
use {
  'lewis6991/gitsigns.nvim',
  config = "require 'user.plugins.gitsigns'"
}

-- Magit clone
use {
  'TimUntersberger/neogit',
  requires = 'nvim-lua/plenary.nvim',
  config = function() require('neogit').setup {
    disable_commit_confirmation = true,
    integrations = { diffview = true }  -- View diffs using `sindrets/diffview.nvim`
  } end
}


-- IDE Features  {{{2

-- Package manager for LSP servers, DAP servers, linters and formatters
use {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup {
      ui = { border = 'rounded' }
    }
  end
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

-- Completion and Snippets
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

-- Project Management
use {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      -- Don't calculate root for specific directories
      exclude_dirs = {'~/Development/dotfiles/neovim/.config/*'}
    }
  end
}

-- Treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  requires = {
    'windwp/nvim-ts-autotag',                       -- Autopair functionality for HTLM/XML tags
    'JoosepAlviste/nvim-ts-context-commentstring',  -- Set `commentstring` based on cursor location
    'nvim-treesitter/playground',                   -- View Treesitter output
    'p00f/nvim-ts-rainbow',                         -- Rainbow brackets
  },
  config = "require 'user.plugins.treesitter'"
}


-- Language-Specific  {{{2

-- Markdown
-- use 'preservim/vim-markdown'  -- Enhanced Markdown mode
-- use 'ixru/nvim-markdown'      -- A fork of `preservim/vim-markdown` with extra functionality
use 'itspriddle/vim-marked'   -- Open in Marked


-- Other  {{{2

-- Diff Visual selections
use 'AndrewRadev/linediff.vim'


-- Packer Setup (Completion)  {{{1

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end


-- vim: et sw=2 ts=2 sts=2 fdm=marker
