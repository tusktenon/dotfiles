-- Completion and Snippets
return {
  'hrsh7th/nvim-cmp',            -- Completion engine
  -- event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',        -- buffer completions
    'hrsh7th/cmp-cmdline',       -- cmdline completions
    'hrsh7th/cmp-path',          -- path completions
    'hrsh7th/cmp-nvim-lsp',      -- LSP completions
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',      -- Neovim Lua API completions
    'L3MON4D3/LuaSnip',              -- Snippet engine
    'saadparwaiz1/cmp_luasnip',  -- LuaSnip completions
    'rafamadriz/friendly-snippets',  -- Snippets collection
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- A helper function for setting up 'Super-Tab' mapping
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    -- Load VSCode-style snippets from a plugin like Friendly Snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      -- REQUIRED: Specify a snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      enabled = function()
        -- Disable completion in comments,
        -- but keep command-mode completion enabled when cursor is in a comment
        local context = require 'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
        end
      end,

      experimental = {
        ghost_text = true,
        native_menu = false,
      },

      mapping = {
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-c>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),

        -- Set `select = true` to accept currently selected item; if none selected, select first item.
        -- Set `select = false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- 'Super-Tab' mapping:
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s", }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", }),
      },

      sources = {
        { name = "nvim_lsp" },
        { name = 'nvim_lsp_signature_help' },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
    })

    cmp.setup.cmdline({'/', '?'}, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      },
      view = { entries = {name = 'wildmenu'} },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      }),
      view = { entries = {name = 'wildmenu'} },
    })
  end
}
