-- nvim-tree users are advised to disable netrw at the top of their init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Use <Space> as <Leader> and <LocalLeader>
-- Must be set before loading Lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
