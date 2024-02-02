-- Use <Space> as <Leader> and <LocalLeader>
vim.g.mapleader = ' '       -- Must be set before loading Lazy
vim.g.maplocalleader = ' '

-- nvim-tree users are advised to disable netrw at the top of their init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

local opts = {
  ui = {
    border = 'single',
    -- border = { '┏', '━' ,'┓', '┃', '┛', '━', '┗', '┃' },  -- heavy single
  },
  diff = { cmd = 'diffview.nvim' },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false
  }
}

require("lazy").setup('user.plugins', opts)
