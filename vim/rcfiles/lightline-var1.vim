"-----------------------------------------------------------------------------
" File: ~/.vim/rcfiles/lightline-var1.vim
" Author: Dan Murphy
"-----------------------------------------------------------------------------

packadd! lightline-custom

let g:lightline = {
    \ 'colorscheme': 'one_swap', 
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'position' ],
    \              [ 'filetype', 'fileinfo' ] ]
    \ },
    \ 'component': {
    \   'fileinfo': '%{&fenc!=#""?&fenc:&enc} %{&ff}',
    \   'position': '%3p%%  %3l/%L: %-2c'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

