function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function __git_prompt {
  local DIRTY="\e[0;33m"
  local CLEAN="\e[0;32m"
  local UNMERGED="\e[0;31m"
  local RESET="\e[0m"
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    echo -n " "
    if [[ `git ls-files -u >& /dev/null` == '' ]]
    then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]]
      then
        echo -n $DIRTY
      else
        git diff --cached --quiet >& /dev/null
        if [[ $? == 1 ]]
        then
          echo -n $DIRTY
        else
          echo -n $CLEAN
        fi
      fi
    else
      echo -n $UNMERGED
    fi
    echo -n `git branch | grep '* ' | sed 's/..//'`
    echo -n $RESET
    # echo -n ")"
  fi
}

function __virtualenv {
  local COLOR="\e[0;34m"
  local CLEAN="\e[0m"

  if [ $VIRTUAL_ENV ] ; then
    echo -n $COLOR
    echo -n " (venv: `basename \"$VIRTUAL_ENV\"`)"
    echo -n $CLEAN
  fi
}

function generate () {
    printf $'\n\e[0;32m[ %s\e[0m%s\e[0;32m%s\e[0;32m ]\e[0m\n:> ' "%~" "$(__git_prompt)" "$(__virtualenv)"
}

setopt prompt_subst
autoload -Uz generate

PROMPT='$(generate)'
VIRTUAL_ENV_DISABLE_PROMPT=1

autoload -U promptinit
promptinit
