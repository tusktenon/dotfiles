-- Magit clone
return {
  'NeogitOrg/neogit',
  dependencies = {'nvim-lua/plenary.nvim'},
  opts = {
    disable_hint = true,
    disable_commit_confirmation = true,
    graph_style = "unicode",
    integrations = {
      diffview = true,  -- View diffs using `sindrets/diffview.nvim`
      telescope = true  -- Use Telescope for menu selection rather than vim.ui.select
    }
  }
}
