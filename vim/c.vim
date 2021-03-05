"----------------------------------------------------------------------------
" C-specific settings
" Author: Dan Murphy
"----------------------------------------------------------------------------

" Place in `~/.vim/ftplugin/` or `~/.vim/after/ftplugin/`

" Turn off spell checking
setlocal nospell

" Set maximum line length to 79 characters, and highlight column 80.
set textwidth=79
set colorcolumn=80

" Use soft tabs (insert spaces instead of tab characters);
" set tab stops and indentation at 4 spaces
set expandtab smarttab
setlocal shiftwidth=4 tabstop=4 softtabstop=4
