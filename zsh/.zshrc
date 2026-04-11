autoload -Uz compinit

compinit -C

export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.zsh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[ -f ~/.secrets ] && source ~/.secrets

export PNPM_HOME="/home/rayleighed/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

starship_precmd() {
  eval "$(starship init zsh)"
}
precmd_functions+=(starship_precmd)

FNM_PATH="/root/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  fnm_lazy() {
    eval "$(fnm env --shell zsh)"
  }
  alias node='fnm_lazy; node'
  alias npm='fnm_lazy; npm'
  alias npx='fnm_lazy; npx'
fi
