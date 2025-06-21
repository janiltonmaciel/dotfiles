# ZSH
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

plugins=(aliases docker iterm2 node npm zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
