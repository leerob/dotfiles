alias upgrade="yarn upgrade-interactive --latest"
export ZSH="/Users/lrobinson/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git,
  osx
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function automaticNvm() {
    if [ -f .nvmrc ]; then
        nvm use;
    fi
}

function checkForNvmOnCd() {
  cd $1
  automaticNvm
}

automaticNvm

# Change tab title to current directory.
function precmd() {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

DISABLE_AUTO_TITLE="true"
precmd
