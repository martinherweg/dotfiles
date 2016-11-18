#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

autoload -Uz promptinit
promptinit
prompt pure

#nvm
export NVM_DIR=~/.nvm

#set path to brew path
export PATH="/usr/local/bin:$PATH"

. `brew --prefix`/etc/profile.d/z.sh


# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

#homebrew php
#export PATH="$(brew --prefix homebrew/php70)/bin:$PATH"

# predictable location for homebrew casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"

# change default editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim



export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# wp cli mamp
#export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.10/bin
#export PATH="$MAMP_PHP:$PATH"


# WP-CLI Bash completions
autoload -U +X bashcompinit && bashcompinit
bashcompinit
source $HOME/.wp-cli/wp-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#
# http://jeromedalbert.com/migrate-from-oh-my-zsh-to-prezto/
# custom style
#
# Directories
zstyle ':completion:*:default' list-colors ''

unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

export PATH="$HOME/.yarn/bin:$PATH"
