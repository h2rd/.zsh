__virtualenv () {
  if [ $VIRTUAL_ENV ] ; then
      printf '%s' "%{$fg[blue]%}"
      printf '%s' "(venv: `basename $VIRTUAL_ENV`)"
  fi
}

generate () {
  workingDirectory="${(%):-%1~} "
  printf '\n%s' "%{$fg[cyan]%}"
  printf '%s' "$workingDirectory"

  gitStatus=$(gitInfo)
  if [ -n "$gitStatus" ]; then
    printf '%s' "$gitStatus"
  fi

  virtualEnv=$(__virtualenv)
  if [ -n "$virtualEnv" ]; then
    printf '%s' "$virtualEnv"
  fi

  printf '%s' "> "
  printf '%s' "%{$reset_color%}"
}

gitInfo() {
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]] then
    if [[ `git ls-files -u >& /dev/null` == '' ]] then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]] then
        printf '%s' "%{$fg[yellow]%}"
      else
        git diff --cached --quiet >& /dev/null
        if [[ $? == 1 ]] then
          printf '%s' "%{$fg[yellow]%}"
        else
          printf '%s' "%{$fg[green]%}"
        fi
      fi
    else
      printf '%s' "%{$fg[red]%}"
    fi

    printf '%s' "("
    printf '%s' `git branch | grep '* ' | sed 's/..//'`
    printf '%s' ")"
  fi
}

autoload -U promptinit
promptinit
setopt prompt_subst
autoload -Uz generate

PROMPT='$(generate)'

VIRTUAL_ENV_DISABLE_PROMPT=1
