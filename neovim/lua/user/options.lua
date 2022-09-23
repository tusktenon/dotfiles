local cmd = vim.cmd
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- [[ Appearance & Interface ]]

opt.clipboard = 'unnamedplus'  -- Share the system clipboard
opt.cmdheight = 2         -- Use two screen lines for the command line (helps avoid 'hit enter' prompts)
opt.completeopt = {'longest', 'menuone', 'noselect', 'preview'}  -- For a better completion experience
opt.confirm = true        -- Present a dialog instead of failing a command due to unsaved changes
cmd('set fillchars+=diff:╱')  -- Nicer deleted lines in diff-mode
opt.foldenable = false    -- Open buffers unfolded
opt.mouse = 'a'           -- Enable mouse support in all modes
opt.scrolloff = 2         -- Keep some lines visible above/below the cursor
opt.sidescrolloff = 4     -- Keep some columns visible to the left/right of the cursor
opt.showmatch = true      -- Show matching brace/bracket/parenthesis
opt.signcolumn = 'yes'    -- Always show the sign column (to avoid annoying visual shift)
opt.splitbelow = true     -- Open new windows below the current one
opt.splitright = true     -- Open new windows to the right of the current one
opt.termguicolors = true  -- 24-bit color support in the TUI
opt.undofile = true       -- Enable persistent undo

-- Line Wrapping
--   These settings only affect how text is displayed; they do not change
--   the actual text in the buffer (see `textwidth` for that)
opt.wrap = false           -- Wrap long lines
opt.linebreak = true      -- Break lines only at the characters in `breakat`
opt.breakindent = true    -- Maintain indentation of wrapped lines

-- Hightlight selection on yank
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { timeout=300 }
    end,
})

-- Display relative line numbers,
-- but switch to absolute line numbers when a window loses focus
opt.number = true
opt.relativenumber = true
local number_toggle = augroup('number_toggle', {})
autocmd('WinEnter', {
    group = number_toggle,
    pattern = '*',
    callback = function()
      if vim.wo.number then
        opt.relativenumber = true
      end
    end
})
autocmd('WinLeave', {
    group = number_toggle,
    pattern = '*',
    callback = function()
      if vim.wo.number then
        opt.relativenumber = false
      end
    end
})

-- Don't display line numbers in terminal buffers
autocmd('TermOpen', {
  pattern = '*',
  command = 'setlocal nonumber norelativenumber'
})


-- [[ Searching ]]

opt.ignorecase = true  -- Use case-insensitive search
opt.smartcase = true   -- Override 'ignorecase' when search pattern contains uppercase characters

-- Highlight search matches only while searching
local search_highlight_toggle = augroup('search_highlight_toggle', {})
autocmd('CmdLineEnter', {
  group = search_highlight_toggle,
  pattern = '/,?',
  command = 'set hlsearch',
})
autocmd('CmdLineLeave', {
  group = search_highlight_toggle,
  pattern = '/,?',
  command = 'set nohlsearch',
})


-- [[ Text Format ]]

-- Automatic formatting
--   Note:
--   * Even with auto-formatting disabled, you can use `gq` for manual formatting
--   * To quickly delete an auto-inserted comment leader from Insert mode, use CTRL-U
opt.formatoptions = opt.formatoptions
  - 'a'  -- Auto-format paragraphs
  - 't'  -- Auto-wrap text using `textwidth`
  + 'c'  -- Auto-wrap comments using `textwidth`
  + 'q'  -- Allow formatting of comments with `gq`
  + 'j'  -- Auto-remove comment leaders when joining lines
  - 'o'  -- Continue comments after pressing 'o' or 'O' in Normal mode
  + '/'  -- With option `o`: do not continue comments that follow a statement
  + 'r'  -- Continue comments after pressing <CR> in Insert mode
  + 'n'  -- Indent lists past their bullet/number using `formatlistpat`

-- Tabs & Indentation 
opt.expandtab = true  -- Insert spaces instead of tab characters
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.smartindent = true
opt.smarttab = true
