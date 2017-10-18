# Instantiate oh-my-zsh
export ZSH=/Users/anirudh/.oh-my-zsh

# Configuration
ZSH_THEME=""
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=(git vi-mode zsh-nvm yarn web-search)

# User Configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
source $ZSH/oh-my-zsh.sh

# Setup NPM 
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

## Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
bindkey -v

# Setup NVM
export NVM_DIR="/Users/anirudh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup Pure Prompt
autoload -U promptinit; promptinit
prompt pure
