-- Show diff in the sign column; stage/unstage/preview hunks; line  blame
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      delete = { text = '󰍵' },
      changedelete = { text = '󰾟' },
      untracked = { text = '│' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      local bufmap = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigation Mappings
      -- Define ']h' and '[h' (next/previous hunk) with treesitter-textobjects,
      -- so they can be repeated with ';' and ','

      -- Actions Mappings
      bufmap('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })
      bufmap('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
      bufmap('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
      bufmap('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'Stage hunk' })
      bufmap('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'Reset hunk' })
      bufmap('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Unstage hunk' })
      bufmap('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
      bufmap('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
      bufmap('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = 'Line blame' })
      bufmap('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle line blame' })
      bufmap('n', '<leader>gd', gs.diffthis, { desc = 'Diff against index' })
      bufmap('n', '<leader>gD', function() gs.diffthis('~') end, { desc = 'Diff against parent' })
      bufmap('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle old version view' })

      -- Text object
      bufmap({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  }
}
