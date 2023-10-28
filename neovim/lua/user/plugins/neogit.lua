-- Magit clone
return {
  'NeogitOrg/neogit',
  dependencies = {'nvim-lua/plenary.nvim'},
  opts = {
    disable_commit_confirmation = true,
    integrations = {
      diffview = true,  -- View diffs using `sindrets/diffview.nvim`
      telescope = true  -- Use Telescope for menu selection rather than vim.ui.select
    }
  }
}
