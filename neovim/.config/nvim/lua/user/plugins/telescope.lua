local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set  -- Sets `noremap` by default

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

-- Mappings
keymap('n', '<leader>bb', builtin.buffers, {desc = 'Switch buffers'})
keymap('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})
keymap('n', '<leader>fr', builtin.oldfiles, {desc = 'Recent files'})
keymap('n', '<leader>ss', builtin.live_grep, {desc = 'Search for string'})
-- keymap('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args)
keymap('n', '<leader>so', telescope.extensions.heading.heading, {desc = 'Outline'})
keymap('n', '<leader>sw', builtin.grep_string, {desc = 'Search for string under cursor'})

-- Include hidden files, but not `.git` directories
-- (https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories)
keymap('n', '<leader>fa', function()
  builtin.find_files({
    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    prompt_title = 'All Files',
  })
end)
