return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to text object, similar to targets.vim
          lookahead = true,

          keymaps = {
            ['aa'] = { query = '@parameter.outer', desc = 'Select around argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inside argument' },

            ['af'] = { query = '@call.outer', desc = 'Select around function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inside function call' },

            ['am'] = { query = '@function.outer', desc = 'Select around function definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inside function definition' },

            [';'] = { query = '@comment.outer', desc = 'Select comment' },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ['<leader>xna'] = '@parameter.inner', -- swap argument with next
            ['<leader>xnm'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>xpa'] = '@parameter.inner', -- swap argument with previous
            ['<leader>xpm'] = '@function.outer', -- swap function with previous
          },
        },

        move = {
          enable = true,
          set_jumps = true, -- set jumps in the jumplist
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'Next function call start' },
            [']m'] = { query = '@function.outer', desc = 'Next function definition start' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold start' },
            ['];'] = { query = '@comment.outer', desc = 'Next comment start' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']M'] = { query = '@function.outer', desc = 'Next function definition end' },
            [']Z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'Previous function call start' },
            ['[m'] = { query = '@function.outer', desc = 'Previous function defintion start' },
            ['[z'] = { query = '@fold', query_group = 'folds', desc = 'Previous fold start' },
            ['[;'] = { query = '@comment.outer', desc = 'Previous comment start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'Previous function call end' },
            ['[M'] = { query = '@function.outer', desc = 'Previous method/function def end' },
            ['[Z'] = { query = '@fold', query_group = 'folds', desc = 'Previous fold end' },
          },
        },
      },
    }

    -- Make movements repeatable with ; and ,
    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')
    local keymap = vim.keymap.set

    -- The Vim way: ; goes in the direction you were moving
    keymap({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    keymap({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Restore builtin behaviour of f, F, t, T
    keymap({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
    keymap({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
    keymap({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
    keymap({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)

    -- Set up repeatable next/previous hunk movements from gitsigns.nvim
    local gs = require 'gitsigns'
    local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
    keymap({ "n", "x", "o" }, ']h', next_hunk_repeat, {desc = 'Next hunk'})
    keymap({ "n", "x", "o" }, '[h', prev_hunk_repeat, {desc = 'Previous hunk'})
  end,
}
