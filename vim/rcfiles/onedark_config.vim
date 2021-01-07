"-----------------------------------------------------------------------------
" File: ~/.vim/rcfiles/onedark_ref.vim
" Author: Dan Murphy
"-----------------------------------------------------------------------------

" Onedark theme <joshdick/onedark.vim>

packadd! onedark.vim
" let g:onedark_terminal_italics = 1
colorscheme onedark


" Standard Lightline scheme
" let g:lightline = { 'colorscheme': 'onedark' }


" Custom Lightline theme
packadd! lightline-custom
let g:lightline = {}

" Use Powerline separators in terminal Vim
if !has('gui_running')
    let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
    let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }
    let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
    let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
endif


" let g:lightline.colorscheme = 'one_airlineish1'
" let g:lightline.active = {
"     \ 'left': [ [ 'mode', 'paste' ],
"     \           [ 'gitbranch' ],
"     \           [ 'readonly', 'filename', 'modified' ] ],
"     \ 'right': [ [ 'position_plLc' ],
"     \            [ 'fileinfo_fet' ] ]
"     \ }

let g:lightline.colorscheme = 'one_airlineish2'
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'position_lLc' ],
    \            [ 'percent' ],
    \            [ 'fileinfo_fe' ],
    \            [ 'filetype' ] ]
    \ }


let g:lightline.component = {
    \   'fileinfo_fe': '%{&ff} %{&fenc!=#""?&fenc:&enc}',
    \   'fileinfo_fet': '%{&ff} %{&fenc!=#""?&fenc:&enc} %{&ft!=#""?&ft:"no ft"}',
    \   'position_lLc': '%3l/%L: %-2c',
    \   'position_plLc': '%3p%% %3l/%L: %-2c'
    \ }

let g:lightline.component_function = {
    \   'gitbranch': 'gitbranch#name'
    \ }

