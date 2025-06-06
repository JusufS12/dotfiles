# Zinit plugin manager

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then   # download zinit if it's not foud
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab


# Add snippets
zinit snippet OMZP::command-not-found


# Opts
setopt autocd


# Enable colors
autoload -U colors && colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward


# Basic auto/tab complete
autoload -U compinit && compinit
zinit cdreplay -q
zstyle ':completion:*' menu select
# zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
_comp_options+=(globdots)		# Include hidden files.
bindkey '^f' autosuggest-accept


# Adding modules
source ~/zsh/shell/aliases.sh
source ~/zsh/shell/prompt.sh
source ~/zsh/shell/start.sh
source ~/zsh/shell/newline.sh
