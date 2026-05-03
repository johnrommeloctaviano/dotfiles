if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit -C

zmodload zsh/complist

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
KEYTIMEOUT=1

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true

[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
[ -f ~/.secrets ] && source ~/.secrets

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  fnm_lazy() {
    eval "$(fnm env --shell zsh)"
    eval "$(fnm env --use-on-cd --shell zsh)"
  }
  alias node='fnm_lazy; node'
  alias npm='fnm_lazy; npm'
  alias npx='fnm_lazy; npx'
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

bindkey -v
bindkey -M viins '^I' menu-complete
bindkey -M viins '^[[Z' reverse-menu-complete
bindkey -M viins '^[[A' menu-select
bindkey -M viins '^[[B' menu-select

alias dot="cd ~/.dotfiles"
alias vdot="nvim ~/.dotfiles"

alias ezsh="nvim ~/.dotfiles/zsh/.zshrc"
alias envim="nvim ~/.dotfiles/nvim"
alias etmux="nvim ~/.dotfiles/tmux/.tmux.conf"
alias ezellij="nvim ~/.dotfiles/zellij"
alias egit="nvim ~/.dotfiles/git"
alias estarship="nvim ~/.dotfiles/starship"

alias rzsh="source ~/.zshrc"
alias szsh="exec zsh"

alias v="nvim"
alias lg="lazygit"
alias ld="lazydocker"
alias t="tmux"
alias z="zellij"

alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"

alias ..="cd .."
alias ...="cd ../.."
alias c="clear"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
