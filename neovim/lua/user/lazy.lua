-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = { {import = "user.plugins"}, {import = "user.plugins.colorschemes"} }

local opts = {
  diff = { cmd = 'diffview.nvim' },
  checker = {
    -- Automatically check for plugin updates, but don't show notification when updates
    -- are found (we'll display the number of updates in the statusline instead).
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false
  }
}

require("lazy").setup(plugins, opts)
