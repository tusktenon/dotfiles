-- Magit clone
return {
  'NeogitOrg/neogit',
  dependencies = {'nvim-lua/plenary.nvim'},
  config = function()
    require('neogit').setup {
      disable_hint = true,
      disable_commit_confirmation = true,
      graph_style = "unicode",
      integrations = {
        diffview = true,  -- View diffs using `sindrets/diffview.nvim`
        telescope = true  -- Use Telescope for menu selection rather than vim.ui.select
      }
    }

    -- Disable spell-checking in the Neogit Status buffer
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      pattern = { 'NeogitStatus' },
      callback = function()
        vim.opt.spell = false
      end
    })
  end
}
