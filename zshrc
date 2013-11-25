autoload -U compinit
compinit

setopt multios
setopt cdablevarS
setopt prompt_subst

export EDITOR='vim'

source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/correction.zsh
source ~/.zsh/directories.zsh
source ~/.zsh/history.zsh
source ~/.zsh/key-bindings.zsh

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

source ~/.zsh/rbenv.zsh
source ~/.zsh/theme.zsh

export PATH=/usr/bin:$PATH
