# Installation:
#   git clone https://github.com/zdharma/zinit.git ~/.zinit

source ~/.zinit/zinit.zsh

# prompt expressions
setopt promptsubst
# don't write over existing files with >, use >! instead
setopt NOCLOBBER
# watch other user login/out
watch=notme
# load colors
autoload colors; colors

zinit light zdharma/fast-syntax-highlighting

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zinit snippet OMZ::themes/gallifrey.zsh-theme

# Include home dot-bin to $PATH
export PATH="$HOME/.bin:$PATH"

export EDITOR='vim'
export VISUAL='vim'
export EMAIL='Stas Sușcov <stas@nerd.ro>'

## Aliases
alias _='sudo'
alias sa='sudo apt-get'
alias sai='sudo apt-get install'
alias sau='sudo apt-get update'
alias saug='sudo apt-get upgrade'
alias sar='sudo apt-get remove'
alias sap='sudo apt-get --purge autoremove'
alias ac='apt-cache'
alias stf='sudo tail -f'
alias l='ls -lah'
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
