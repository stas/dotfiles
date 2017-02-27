# Installation:
#   git clone https://github.com/zplug/zplug ~/.zplug

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh

zplug "themes/gallifrey", from:oh-my-zsh, as:theme

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

# don't write over existing files with >, use >! instead
setopt NOCLOBBER
# watch other user login/out
watch=notme

# Include home dot-bin to $PATH
export PATH="$HOME/.bin:$PATH"

# Version manager
. $HOME/.asdf/asdf.sh

export EDITOR='vim'
export VISUAL='vim'
export EMAIL='Stas Sușcov <stas@nerd.ro>'

## Aliases
alias sa='sudo apt-get'
alias sai='sudo apt-get install'
alias sau='sudo apt-get update'
alias saug='sudo apt-get upgrade'
alias sar='sudo apt-get remove'
alias sap='sudo apt-get --purge autoremove'
alias ac='apt-cache'
alias stf='sudo tail -f'
alias 'tf=tail -f'
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias 'mkdir=mkdir -p'
alias 'dus=du -ms * | sort -n'
alias 'v=vim'
alias 'gv=gvim .'
alias 'j=jobs -l'
alias 'rh=rehash'
alias 'q=exit'
alias 'h=history'
alias 'e=gvim'

## Tools
alias http='python -m SimpleHTTPServer ${1}'
alias jsonify='python -m json.tool'
