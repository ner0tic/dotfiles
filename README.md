# Ner0tic’s dotfiles

## Installation

### Git And The Bootstrap Script

You can clone the repository wherever you want. (I like to keep it in `/opt/dotfiles`, with `~/.dotfiles` as a symlink.)  The bootstrapper script will pull in the latest version and copy the files to your home folder.  
Remember to use the `--recursive` flag to ensure all the vim plugins are cloned as well.

``bash
git clone --recursive https://github.com/ner0tic/dotfiles.git && cd dotfiles && source bootstrap.sh
``

To update, `cd` into your local `dotfiles` repository and then:

``bash
source bootstrap.sh
``

Alternatively, to update while avoiding the confirmation prompt:

``bash
set -- -f; source bootstrap.sh
``

### Non-Git Install 

To install these dotfiles without Git:

``bash
cd; curl -#L https://github.com/ner0tic/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
``

To update later on, just run that command again.

### Specify The `$PATH`

If `~/.path` exists, it will be sourced along with the other files.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

``bash
export PATH="$HOME/utils:$PATH"
``

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

``bash
# PATH additions
export PATH="~/bin:$PATH"

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="David Durost"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="david.durost@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
``

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository.


## Credits
Based off varies configurations found around the web
Bootstrap deployment based off of [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
