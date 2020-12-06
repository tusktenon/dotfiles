" ~/.config/nvim/init.vim
" Author: Dan Murphy

" Share settings, package path and runtime path with Vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" Share spellfile with Vim
set spellfile=~/.vim/spell/en.utf-8.add

