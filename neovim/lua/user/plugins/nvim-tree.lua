-- Tree-style file explorer (netrw replacement)

-- NOTE: Consider setting the highlight group NvimTreeSpecialFile.
-- See *nvim-tree.renderer.special_files*

-- NOTE: Consider setting the NvimTreeGit* highlight groups.

-- TODO: Set the NvimTreeModifiedFile group
-- TODO: Improve the appearance of folder arrows.
-- * The highlight groups are NvimTreeFolderArrowClosed and NvimTreeFolderArrowOpen,
--   both of which are linked to NvimTreeIndentMarker by default.
-- * 

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  config = function()
    -- Optional: Hide the window-separator character.
    -- This looks very nice (see NvChad), but you need to also need to adjust
    -- the window-separator character (see `h: fillchars`) to avoid ugly visual
    -- glitches with split windows.
    -- vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = 'bg' })

    local function on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    require('nvim-tree').setup {
      on_attach = on_attach,

      diagnostics = {
        enable = true,
        icons = { error = 'E', warning = 'W', hint = 'H', info = 'I' }
      },

      filters = {
        custom = { "^.git$" }  -- Hide the .git directory
      },

      renderer = {
        highlight_opened_files = 'all',
        highlight_modified = 'all',
        indent_markers = {
          enable = false,
          inline_arrows = false
        },
        icons = {
          git_placement = 'after',
          show = { file = false, folder = false },
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
            },
            git = {
              unstaged = "⭑",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "⭒",
              deleted = "",
              ignored = "",
            }
          }
        }
      },

      -- Settings for integration with `ahmedkhalf/project.nvim`:
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      }
    }
  end
}
