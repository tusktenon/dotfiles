"----------------------------------------------------------------------------
" Python-specific settings
" Author: Dan Murphy
"----------------------------------------------------------------------------

" Place in `~/.vim/ftplugin/` or `~/.vim/after/ftplugin/`
"
" Settings informed by the PEP 8 Style Guide:
" <https://www.python.org/dev/peps/pep-0008/>


" Turn off spell checking
setlocal nospell

" Set maximum line length to 79 characters
" Make it obvious where 72 and 79 characters are
set textwidth=79
set colorcolumn=73,80

" Use soft tabs (insert spaces instead of tab characters)
set expandtab smarttab

" Set tab stops and indentation at 4 spaces
setlocal shiftwidth=4 tabstop=4 softtabstop=4
