# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias dot="cd ~/dotfiles"

# Bindings
bindkey -v

# Environment Variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$PATH:/opt/nvim/"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# bun
export PATH="$HOME/.bun/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/flutter/bin"

# android
export ANDROID_HOME=$HOME/Android/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest:$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# cargo
export PATH=$PATH:$HOME/.cargo/bin/

# fastapi
export PATH="$HOME/.local/bin:$PATH"
#eval "$(direnv hook zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/cy/.lmstudio/bin"


# Usage game engine
export PATH="/home/cy/.usagi/bin:$PATH"

fastfetch

