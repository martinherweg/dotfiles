source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH
export PATH=${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:${PATH}
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export NVM_DIR=~/.nvm

# # predictable location for homebrew casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# # change default editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

# # load aliases and functions
for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# # Grab binaries from GitHub Releases
# # and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# include Z, yo
. /usr/local/etc/profile.d/z.sh

# # Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/rsync",   from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/composer",   from:oh-my-zsh
zplug "plugins/npm",   from:oh-my-zsh
zplug "plugins/fzf-zsh",   from:oh-my-zsh
zplug "plugins/laravel5",   from:oh-my-zsh

# # nvm
zplug "lukechilds/zsh-nvm"


# # Also prezto
# # zplug "modules/prompt", from:prezto
zplug "modules/history", from:prezto

# # Run a command after a plugin is installed/updated
# # Provided, it requires to set the variable like the following:
# # ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# # Can manage gist file just like other packages
# zplug "b4b4r07/79ee61f7c140c63d2786", \
#     from:gist, \
#     as:command, \
#     use:get_last_pane_path.sh

# # Rename a command with the string captured with `use` tag
# # zplug "b4b4r07/httpstat", \
# #     as:command, \
# #     use:'(*).sh', \
# #     rename-to:'$1'

# # Group dependencies
# # Load "emoji-cli" if "jq" is installed in this example
# # zplug "stedolan/jq", \
# #     from:gh-r, \
# #     as:command, \
# #     rename-to:jq
# # zplug "b4b4r07/emoji-cli", \
# #     on:"stedolan/jq"
# # Note: To specify the order in which packages should be loaded, use the defer
# #       tag described in the next section

# # Set the priority when loading
# # e.g., zsh-syntax-highlighting must be loaded
# # after executing compinit command and sourcing other plugins
# # (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# # History Substring Search
# zplug "zsh-users/zsh-history-substring-search", defer:2
# # zmodload zsh/terminfo
# # OPTION 1: for most systems
# # zmodload zsh/terminfo
# # bindkey "$terminfo[kcuu1]" history-substring-search-up
# # bindkey "$terminfo[kcud1]" history-substring-search-down
# # OPTION 2: for iTerm2 running on Apple MacBook laptops
zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down

# # when you type a command like `cd` and hit the up arrow you search the history for this command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

zplug "lib/completion", from:oh-my-zsh


# # Can manage local plugins
# zplug "~/.zsh", from:local

# # Load theme file
# zplug mafredri/zsh-async, from:github
zplug denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme


# # Keypad
# # 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# # 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# # 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# # 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# # + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# #
# # http://jeromedalbert.com/migrate-from-oh-my-zsh-to-prezto/
# # custom style
# #
# # Directories
# zstyle ':completion:*:default' list-colors ''

# unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
#                                       # command that may look like an existing one.

# expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
#   echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
#   zle expand-or-complete
#   zle redisplay
# }
# zle -N expand-or-complete-with-dots
# bindkey "^I" expand-or-complete-with-dots

export PATH="$HOME/.yarn/bin:$PATH"

# ### things from default install
# # The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/martinherweg/.zshrc'

# #autoload -Uz compinit
# #compinit
# # End of lines added by compinstall
# # Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
# # End of lines configured by zsh-newuser-install

# ## autosuggest
zplug "zsh-users/zsh-autosuggestions", defer:2
if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=200'
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
fi

## autocompletio
zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/martinherweg/.nvm/versions/node/v9.11.1/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/martinherweg/.nvm/versions/node/v9.11.1/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh