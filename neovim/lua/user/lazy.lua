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
  change_detection = {
    enabled = true,
    notify = false
  }
}

-- `virt-column` either needs to be loaded after your colorscheme (and possibly lualine?),
-- or you can run `highlight clear ColorColumn` after the color scheme has loaded
-- (see https://github.com/lukas-reineke/virt-column.nvim/issues/2)
vim.api.nvim_create_autocmd('ColorScheme', {
  command = 'highlight clear ColorColumn'
})

require("lazy").setup(plugins, opts)
