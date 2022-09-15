local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require 'telescope.builtin'

-- Load Telescope extensions
-- telescope.load_extension('fzf')
-- telescope.load_extension('live_grep_args')

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.git/', 'node_modules' },
    mappings = {
      i = {
        ["<esc>"] = actions.close,  -- <Esc> closes Telescope instead of entering normal mode
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    },
    path_display = { 'smart' },
  },
  extensions = {
    heading = { treesitter = true }
  }
}

-- Load extensions
-- (Must be called after `telescope.setup`)
telescope.load_extension('heading')


-- Custom Actions
local M = {}

-- Include hidden files, but not `.git` directories
function M.find_all()
  builtin.find_files {
    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    prompt_title = 'All Files',
  }
end
return M
