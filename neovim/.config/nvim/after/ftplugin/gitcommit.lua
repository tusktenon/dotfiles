--[[
Per Tim Pope's 'A Note About Git Commit Messages'
(https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html):
  * Summary line of 50 characters or less, followed by a blank line.
  * Detailed explanatory text, if necessary, wrapped at 72 characters.
  * Use a hanging indent for bullet points.

Note that Neogit has its own filetype for commit messages
(`NeogitCommitMessage`), but it already manages line length correctly.
--]]

local opt = vim.opt

opt.colorcolumn = '50,72'
opt.textwidth = 72
opt.expandtab = true
