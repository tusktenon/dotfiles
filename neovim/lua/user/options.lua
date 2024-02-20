local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- [[ Appearance & Interface ]]

opt.clipboard = 'unnamedplus'  -- Share the system clipboard
-- opt.cmdheight = 0         -- Only show command line as needed
-- opt.cmdheight = 2         -- Use two screen lines for the command line (helps avoid 'hit enter' prompts)
opt.completeopt = {'longest', 'menuone', 'noselect', 'preview'}  -- For a better completion experience
opt.confirm = true        -- Present a dialog instead of failing a command due to unsaved changes
opt.cursorline = true          -- Highlight the current line and/or line number
opt.cursorlineopt = 'number'   -- Highlight only the cursor line number, not the line itself
opt.fillchars:append "eob: "   -- Don't show `~` characters at end of buffer
opt.fillchars:append "diff:╱"  -- Nicer deleted lines in diff-mode
opt.foldenable = false    -- Open buffers unfolded
opt.laststatus = 3        -- Global status line
opt.mouse = 'a'           -- Enable mouse support in all modes
opt.scrolloff = 2         -- Keep some lines visible above/below the cursor
opt.sidescrolloff = 4     -- Keep some columns visible to the left/right of the cursor
opt.showmatch = true      -- Show matching brace/bracket/parenthesis
opt.signcolumn = 'yes'    -- Always show the sign column (to avoid annoying visual shift)
opt.splitbelow = true     -- Open new windows below the current one
opt.splitright = true     -- Open new windows to the right of the current one
opt.termguicolors = true  -- 24-bit color support in the TUI
opt.undofile = true       -- Enable persistent undo
opt.wildoptions =  "fuzzy,tagfile"  -- Display cmdline completions horizontally

-- Line Wrapping
--   These settings only affect how text is displayed; they do not change
--   the actual text in the buffer (see `textwidth` for that)
opt.wrap = false           -- Wrap long lines
opt.linebreak = true      -- Break lines only at the characters in `breakat`
opt.breakindent = true    -- Maintain indentation of wrapped lines

-- Spell Checking
-- opt.spelllang = 'en'      -- English spelling (all regions)
opt.spelllang = 'en_ca'      -- Canadian English spelling
-- opt.spelling = 'en_gb'    -- British spelling
-- opt.spelllang = 'en_us'   -- U.S. spelling
opt.spell = true             -- Enable spell checking

-- Highlight selection on yank
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

-- In terminal buffers, don't display line numbers, turn off spell-checking,
-- and pause the Illuminate plugin
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    opt.number = false
    opt.relativenumber = false
    opt.spell = false
    require('illuminate').pause_buf()
  end
})

-- The default characters used for window/split separators are the Light variants
-- from the Unicode Box Drawing block; I think the Heavy variants look a little nicer.
--   * The first option below connects all intersecting lines;
--   * The second option leaves a gap in the verticals, which actually looks fine,
--     and prevents odd visual glitches when using an invisible separator with nvim-tree:
-- opt.fillchars:append 'horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋'
-- opt.fillchars:append 'horiz:━,horizup:━,horizdown:━,vert:┃,vertleft:━,vertright:━,verthoriz:━'


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
