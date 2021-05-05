# Dan Murphy's Dotfiles

## GNU Stow

I've structured my dotfiles repository for use with [GNU Stow](https://www.gnu.org/software/stow/). Stow lets you organize the top level of your repository into subdirectories of your choosing, but the contents of these subdirectories must follow the actual installation path. For example, if `dotfiles` contains the following `vim` subdirectory,
```
vim
├── .config
│   └── nvim
│       └── init.vim
└── .vim
    ├── after
    │   └── ftplugin
    │       ├── c.vim
    │       └── python.vim
    ├── spell
    │   └── en.utf-8.add
    └── vimrc
```
then running `stow vim` from within the `dotfiles` directory will add the symlinks for your Vim and Neovim configuration files.

If your dotfiles directory isn't right beneath your home directory, you'll need to run stow with the `-t $HOME` option. In fact, you may want to add the following line to your bashrc/zshrc, and use `dstow` instead of `stow` (as an added convenience, `dstow` can be run from within any directory):
```
alias dstow='stow --dir=$HOME/Development/dotfiles --target=$HOME'
```

You might also consider adding the `--no-folding` option, although I prefer to leave tree folding enabled.

Using Stow to manage your dotfiles works particularly well if you manage a number of different systems, since it gives you very precise control over which dotfiles get installed on each system. Having to follow the installation paths does make your repository a little awkward to navigate (lots of long paths and hidden files), but that's a minor disadvantage.

Stow will add links for all the contents of a directory, but you can specify exceptions in `.stow-lcoal-ignore`. In this dotfiles repository, I've configured Stow to ignore directories named `resources` or `deprecated`, as well as README files.

### Creating links manually

With Stow, you should rarely need to do this, but in case it comes up...

It seems that you can use relative paths from the target directory but not the source directory. For example, running

    ln -s ~/Development/dotfiles/vim/init.vim init.vim

from within the `~/.config/nvim` directly works as expected, but running

    ln -s init.vim ~/.config/nvim/init.vim

from `dotfiles/vim` does not create the link you want.


## Fish

Unmaintained. I was never able to get fish working to my liking, and haven't used it for some time.


## MacOS Setup

On macOS, stow `alacritty mac` instead of `alacritty`.

The Brewfile can be used to install all programs managed by [Homebrew](https://brew.sh/).

The file `xterm-256color-italic.terminfo` is used to correct an issue in iTerm 2, in which text that should be italicized is highlighted instead. If you use Alacritty, the included terminfo handles italics correctly, but the Alacritty installer does not move it into place, so you'll need to do this for yourself:

    sudo cp -r /Applications/Alacritty.app/Contents/Resources/61 ~/.terminfo/


## Vim & Neovim

I like to put my vimrc in the more “modern” location `~/.vim/vimrc` instead of `~/.vimrc`; it's just cleaner to have all your Vim configuration files under the `.vim` directory. Even though I use Neovim almost exclusively, I still keep all my settings in the usual Vim locations, and have a minimal `init.vim` directing Neovim to share these settings.

Once your Vim and Neovim symlinks are in place, start Neovim and run `:checkhealth` to see if you have the `pynvim` module, which is necessary to use Python plugins with Neovim. If necessary (and it probably will be), install it by running the following in your shell:

    python3 -m pip install --user --upgrade pynvim

