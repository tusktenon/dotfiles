# Unmaintained Files

## Emacs

TODO: Describe your setup -- using Chemacs2 to manage Doom Emacs and a custom "Emacs from Scratch."


## Linux

**Arch System Files** contains root-owned files, mosting residing in `/etc`. I only kept files that had been been substantially customized, and since there were just a handful of these, I linked them by hand. You could also write a simple script to set up the links, or some of the more flexible dotfile managers (perhaps Dotbot or Stow) could probably be used. If you ever need a more robust system, you might consider something like [etckeeper](https://etckeeper.branchable.com/) ([ArchWiki entry](https://wiki.archlinux.org/title/Etckeeper)).


## Mac

The file `xterm-256color-italic.terminfo` was used to correct an issue in iTerm2, in which text that should be italicized was highlighted instead; I haven't encountered this issue recently, so it may have been resolved.

If you use Alacritty on macOS, the included `terminfo` handles italics correctly, but the Alacritty installer does not move it into place, so you'll need to do this for yourself:

    sudo cp -r /Applications/Alacritty.app/Contents/Resources/61 ~/.terminfo/

Again, I haven't used Alacritty in over a year, so this may no longer be relevant.
