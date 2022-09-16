local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require 'telescope.builtin'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git/', 'node_modules' },
    layout_config = {
      prompt_position = 'top',  -- See `sorting_strategy`
      flex = {
        flip_columns = 164,  -- Number of columns required to switch from vertical to horizontal mode
      }
    },
    layout_strategy = 'flex',
    mappings = {
      i = {
        ['<esc>'] = actions.close,  -- <Esc> closes Telescope instead of entering normal mode
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-u>'] = false  -- <C-u> clears prompt instead of scrolling preview
      },
    },
    path_display = { 'smart' },
    sorting_strategy = 'ascending'  -- Use `ascending` when `layout_config.prompt_position = 'top'`
  },
  extensions = {
    heading = { treesitter = true },
    live_grep_args = {
      mappings = {
        i = {
          ['<C-a>'] = require('telescope-live-grep-args.actions').quote_prompt()
        }
      }
    }
  }
}

-- Load Telescope extensions
-- (must be called after `telescope.setup`)
-- telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'heading'
telescope.load_extension 'live_grep_args'


-- Custom Actions
local M = {}

-- Include hidden files, but not `.git` directories
function M.find_all()
  builtin.find_files {
    find_command = { "fd", "--type", "file", "--hidden", "--exclude", ".git" },
    -- find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },  -- From the Telescope Wiki
    prompt_title = 'All Files',
  }
end

return M
