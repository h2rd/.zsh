# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

alias s='svn'
alias st='s st'

alias g='git'
alias clone='g clone'
alias rc='. ~/.zshrc; echo "ZSH reloaded"'
alias server='python -m SimpleHTTPServer'

alias pp='pjson'
alias vbr='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'
