PATH="/usr/local/bin:$(getconf PATH)"
export ZSH="/Users/leerobinson/.oh-my-zsh"
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
plugins=(git osx)

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

alias headers="curl -I -s -X GET"
alias ls="ls -la"
alias mkdir="mkdir -p"
alias server="python -m SimpleHTTPServer 8000"
alias sourcerc="source ~/.bash_profile && source ~/.zshrc"
alias usebash="chsh -s /bin/bash"
alias usezsh="chsh -s /bin/zsh"
alias yarnu="yarn upgrade-interactive --latest"
