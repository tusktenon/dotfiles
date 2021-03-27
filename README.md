# Dan Murphy's Dotfiles

With two exceptions (the `mac` and `resources` directories described below), this repository has been structured for use with [GNU Stow](https://www.gnu.org/software/stow/). For example, to add the symlinks for all Vim and Neovim configuration files, run `stow vim` from within the `dotfiles` directory.

If your dotfiles directory isn't right beneath your home directory, you'll need to run stow with the `-t $HOME` option. In fact, you may want to add some version of the following line to your bashrc/zshrc, and use `dstow` instead of `stow` (as an added convenience, `dstow` can be run from within any directory):
```
alias dstow='stow --dir=$HOME/Documents/Development/dotfiles --target=$HOME'
```


## macOS Issues

The Brewfile found in the `mac` directory can be used to install all programs managed by [Homebrew](https://brew.sh/).

The file `xterm-256color-italic.terminfo` is used to correct an issue in iTerm 2, in which text that should be italicized is highlighted instead. If you use Alacritty, the included terminfo handles italics correctly, but the Alacritty installer does not move it into place, so you'll need to do this for yourself:
```
sudo cp -r /Applications/Alacritty.app/Contents/Resources/61 ~/.terminfo/
```


## Vim & Neovim

I like to put my vimrc in the more “modern” location `~/.vim/vimrc` instead of `~/.vimrc`; it's just cleaner to have all your Vim configuration files under the `.vim` directory. Even though I use Neovim almost exclusively, I still keep all my settings in the usual Vim locations, and have a minimal `init.vim` directing Neovim to share these settings.

Once Stow has added the (Neo)Vim symlinks, start Neovim and run `:checkhealth` to see if you have the `pynvim` module, which is necessary to use Python plugins with Neovim. If necessary (and it probably will be), install it by running the following in your shell:
```
python3 -m pip install --user --upgrade pynvim
```

## Other Resources

The `resources` folder contains alternate, deprecated and sample/template configuration files.
