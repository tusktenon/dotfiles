# Dan Murphy's Dotfiles

Eventually, you should probably put these steps in a shell script that would

* create target directories as needed;
* before linking, check to see if a file already exists at the target location and, if it does, move it to a backup directory.


## Terminals & Shells

```
ln -sv ~/Documents/Development/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sv ~/Documents/Development/dotfiles/shells/config.fish ~/.config/fish/config.fish
ln -sv ~/Documents/Development/dotfiles/shells/zshrc ~/.zshrc
ln -sv ~/Documents/Development/dotfiles/shells/starship-single-line.toml ~/.config/starship-single-line.toml
ln -sv ~/Documents/Development/dotfiles/shells/starship-double-line.toml ~/.config/starship-double-line.toml
```
Use of the file `xterm-256color-italic.terminfo` is specific to macOS. It corrects an issue in which text that should be italicized is highlighted instead.


## Git
```
ln -sv ~/Documents/Development/dotfiles/gitconfig ~/.gitconfig
```


## Vim & Neovim

I like to put my vimrc in the more “modern” location `~/.vim/vimrc` instead of `~/.vimrc`; it's just cleaner to have all your Vim configuration files under the `.vim` directory.

Also, inspired by [Chris Toomey's dotfiles](https://github.com/christoomey/dotfiles/tree/master/vim), I like to keep my vimrc a little shorter and cleaner, by placing some settings in separate files in the directory `~/.vim/rcfiles`.

Even though I use Neovim almost exclusively, I still keep all my settings in the usual Vim locations, and have a minimal `init.vim` directing Neovim to share these settings.
```
ln -sv ~/Documents/Development/dotfiles/vim/vimrc ~/.vim/vimrc
ln -sv ~/Documents/Development/dotfiles/vim/spellfile ~/.vim/spell/en.utf-8.add
ln -sv ~/Documents/Development/dotfiles/vim/python.vim ~/.vim/after/ftplugin/python.vim
ln -sv ~/Documents/Development/dotfiles/vim/init.vim ~/.config/nvim/init.vim
```
After creating these links, start Neovim and run `:checkhealth` to see if you have the `pynvim` module, which is necessary to use Python plugins with Neovim. If necessary (and it probably will be), install it by running the following in your shell:
```
python3 -m pip install --user --upgrade pynvim
```

