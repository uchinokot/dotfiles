#
# zplug
#

source ~/.zplug/init.zsh

eval "$(starship init zsh)"

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'mollifier/anyframe'
zplug 'paulirish/git-open', as:plugin

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

zplug load

#
# Autoloadings
#

autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz url-quote-magic
autoload -Uz vcs_info

autoload -Uz is-at-least

#
# ZLE settings
#

zle -N self-insert url-quote-magic

#
# General settings
#

setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history
setopt transient_rprompt

#
# Exports
#

export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export EDITOR=vim
export HISTFILE=~/.zhistory
export HISTSIZE=1000
export SAVEHIST=1000000
export LANG=ja_JP.UTF-8

#
# Key bindings
#

bindkey -v
bindkey -v '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey '^@' anyframe-widget-cd-ghq-repository
bindkey '^r' anyframe-widget-put-history
bindkey '^ ' autosuggest-accept
bindkey '^A' beginning-of-line
bindkey '^B' backward-char
bindkey '^E' end-of-line
bindkey '^F' forward-char

#
# Aliases
#

alias vi='vim'
alias git see='git browse'
alias g='cd $(ghq list -p | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias be='bundle exec'
alias ll='ls -al'

#
# Module settings
#

# Completion

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'

#
# Other settings
#

# SQLite

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# hub

function git(){hub "$@"}

# go

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# flutter

export PATH="$PATH:$HOME/src/flutter/bin"

# libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# mise
eval "$(~/.local/bin/mise activate zsh)"

function search_org() {
  local org="${GITHUB_ORG:-your-organization}"
  rg "$1" "$(ghq root)/github.com/$org"
}
