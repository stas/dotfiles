# Get antigen: https://github.com/zsh-users/antigen
source "$HOME/.zsh/antigen/antigen.zsh"

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle ssh-agent

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting
# ZSH port of Fish shell's history search feature.
# antigen-bundle zsh-users/zsh-history-substring-search

# # Load the theme.
antigen-theme gallifrey

# # Tell antigen that you're done.
antigen-apply

# don't write over existing files with >, use >! instead
setopt NOCLOBBER
# watch other user login/out
watch=notme

# Include home dot-bin to $PATH
export PATH="$HOME/.bin:$PATH"

# Load Android SDK
export PATH="$HOME/.bin/android-sdk/platform-tools:$PATH"

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Set python startup script
export PYTHONSTARTUP="$HOME/.pystartup"

# Load nvm
source "$HOME/.nvm/nvm.sh"

export EDITOR='vim'
export VISUAL='vim'
export EMAIL='Stas Sușcov <stas@nerd.ro>'

## apt specific
alias sa='sudo apt-get'
alias sai='sudo apt-get install'
alias sau='sudo apt-get update'
alias saug='sudo apt-get upgrade'
alias sar='sudo apt-get remove'
alias sap='sudo apt-get --purge autoremove'
alias ac='apt-cache'

## admin specific
alias stf='sudo tail -f'

## play safe
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias 'mkdir=mkdir -p'
alias 'dus=du -ms * | sort -n'
alias 'v=vim'
alias 'gv=gvim .'
alias 'j=jobs -l'
alias 'tf=tail -f'
alias 'rh=rehash'
alias 'q=exit'
alias 'h=history'
alias 'e=gedit'

## useful args
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'

## tools
alias http='python -m SimpleHTTPServer ${1}'
alias jsonify='python -m json.tool'
alias brake='noglob bundle exec rake'
alias be='noglob bundle exec'
