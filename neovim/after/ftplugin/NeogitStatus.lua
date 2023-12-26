-- Yank a commit message from the 'Recent commits' section
vim.keymap.set('n', 'ym', '0wy$0', {buffer = true, desc = 'Commit message'})
