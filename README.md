# Dan Murphy's Dotfiles

Eventually, you should probably put these steps in a shell script that would

* create target directories as needed;
* before linking, check to see if a file already exists at the target location and, if it does, move it to a backup directory.


## Shells

```
ln -sv ~/Documents/Development/dotfiles/shells/zshrc ~/.zshrc
```
Use of the file `xterm-256color-italic.terminfo` is specific to macOS. It corrects an issue in which text that should be italicized is highlighted instead.


## Git
```
ln -sv ~/Documents/Development/dotfiles/gitconfig ~/.gitconfig
```


## Vim and Neovim

I like to put my vimrc in the more “modern” location `~/.vim/vimrc` instead of `~/.vimrc` (and likewise for `gvimrc`); it's just cleaner to have all your Vim configuration files under the `.vim` directory.

Even though I use Neovim almost exclusively, I still keep all my settings in the usual Vim locations, and have a minimal `init.vim` directing Neovim to share these settings.
```
ln -sv ~/Documents/Development/dotfiles/vim/vimrc ~/.vim/vimrc
ln -sv ~/Documents/Development/dotfiles/vim/gvimrc ~/.vim/gvimrc
ln -sv ~/Documents/Development/dotfiles/vim/spellfile ~/.vim/spell/en.utf-8.add
ln -sv ~/Documents/Development/dotfiles/vim/python.vim ~/.vim/after/ftplugin/python.vim
ln -sv ~/Documents/Development/dotfiles/vim/init.vim ~/.config/nvim/init.vim
```
After creating these links, start Neovim and run `:checkhealth` to see if you have the `pynvim` module, which is necessary to use Python plugins with Neovim. If necessary (and it probably will be), install it by running the following in your shell:[^Vim1]
```
python3 -m pip install --user --upgrade pynvim
```

[^Vim1]: These instructions (and more) can be found by running `:help nvim-from-vim` in Neovim.
