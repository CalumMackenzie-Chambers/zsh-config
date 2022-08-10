setopt INC_APPEND_HISTORY
HISTFILE="$HOME/.zsh_history"
SAVEHIST=10000
HISTSIZE=100000

alias zshconfig="nvim ~/.config/zsh"
PLUGINS_DIR="$HOME/.config/zsh/plugins"

# Update path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# User files
source "$HOME/.config/zsh/user/alias.zsh"

###########
# Plugins #
###########

# autopair
if [[ ! -d "$PLUGINS_DIR/zsh-autopair" ]]; then
  git clone git@github.com:hlissner/zsh-autopair.git "$PLUGINS_DIR/zsh-autopair"
fi
source "$PLUGINS_DIR/zsh-autopair/autopair.zsh"
autopair-init

# Autosuggestions
if [[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]]; then
  git clone git@github.com:zsh-users/zsh-autosuggestions.git "$PLUGINS_DIR/zsh-autosuggestions"
fi
source "$PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# You should use
if [[ ! -d "$PLUGINS_DIR/zsh-you-should-use" ]]; then
  git clone git@github.com:MichaelAquilina/zsh-you-should-use.git "$PLUGINS_DIR/zsh-you-should-use"
fi
source "$PLUGINS_DIR/zsh-you-should-use/you-should-use.plugin.zsh"

#  Zoxide
eval "$(zoxide init zsh)"

# syntax highlighting
if [[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]]; then
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
fi
source "$PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# history substring serach
if [[ ! -d "$PLUGINS_DIR/zsh-history-substring-search" ]]; then
  git clone git@github.com:zsh-users/zsh-history-substring-search.git "$PLUGINS_DIR/zsh-history-substring-search"
fi
source "$PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)"
