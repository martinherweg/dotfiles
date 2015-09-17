#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

autoload -Uz promptinit
promptinit
prompt peepcode

#nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#set path to brew path
export PATH="/usr/local/bin:$PATH"

. `brew --prefix`/etc/profile.d/z.sh


# Aliases
#alias lap="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'
alias lap="ls -la  | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias hosts="sudo subl /etc/apache2/extra/httpd-vhosts.conf && sudo subl /etc/hosts"
alias apachestart="sudo apachectl start"
alias apachestop="sudo apachectl stop"
alias apacherestart="sudo apachectl restart"
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"
alias mysqlconfigfile='/usr/local/bin/mysql --verbose --help | grep -A 1 "Default options"'
alias copypath="pwd|pbcopy"

# make new directory and cd into it
function md() {
    mkdir -p "$@" && cd "$@"
}

# update hosts file
function hup {
  echo "192.168.10.10 $1.dev" | sudo tee -a /etc/hosts
}

#git alias additions
alias gst="git status"
alias ga="git add"

# ssh key generation and copying
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias h="history"
alias j="jobs"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Add a spacer to the left side of the Dock (where the applications are)
alias addDockSpacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'"
# Add a spacer to the right side of the Dock (where the Trash is)
alias addRightDockSpacer="defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'"

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
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

# predictable location for homebrew casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"

# change default editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim



export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# WP-CLI Bash completions
autoload -U +X bashcompinit && bashcompinit
bashcompinit
source $HOME/.wp-cli/wp-completion.bash