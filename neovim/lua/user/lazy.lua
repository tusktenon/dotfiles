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
    enabled = true,  -- automatically check for plugin updates
    notify = true,   -- show notification when new updates are found
  },
  change_detection = {
    enabled = true,
    notify = false
  }
}

require("lazy").setup(plugins, opts)
