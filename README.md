https://github.com/paulmillr/dotfiles

# Dotfiles
Colourful & robust OS X configuration files and utilities.

Installation is done with simple command set (see “building system from scratch” for setup of new system):

```
curl --silent https://raw.github.com/bhubbard/dotfiles/master/install.sh | sh
```

## Features



Shell (zsh):

* Auto-completion
* Syntax highlighting
* Automatic setting up of terminal tab / window title to current dir
* `rm` moves file to the OS X trash
* A bunch of useful functions:
    * `extract archive.tar.bz` — unpack any archive (supports many extensions)
    * `ram safari` — show app RAM usage
    * `loc py coffee js html css` — count lines of code
    in current dir in a colourful way.
* Neat git extras:
    * Opinionated `git log`, `git graph`
    * `git ghpull` — create GitHub pull requests from command line simply.
    * `git cleanup` — clean up merged git branches. Very useful if
    you’re doing github pull requests in topic branches.
    * `git summary` — outputs commit email statistics.
    * `git release` — save changes, tag commit. If used on node.js project, also push to npm.
    * `git-changelog`, `git-setup` etc.

## Structure
* `bin` — files that are symlinked to any directory with binaries in `$PATH`
* `etc` — various stuff like osx text substitutions / hosts backup
* `git-extras` — useful git functions, defined in `home/gitconfig`
* `home` — files that are symlinked to `$HOME` directory
* `sublime` — sublime text 2 theme & settings
* `terminal` — terminal theme & prompt

## Building system from scratch (reminder)

* Install XCode & its Command Line Tools.
* Change default shell to ZSH: `chsh -s /bin/zsh`.
* Create `~/Development/`
* Clone:
    * this project (dotfiles) and run `sh bootstrap-new-system.sh`

