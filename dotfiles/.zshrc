# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jared/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

prompt bart
eval "$(fasd --init auto)"

export PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/jared/.gopath/bin
export GOPATH=/home/jared/.gopath
export GOBIN=/home/jared/.gopath/bin

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.cargo/env
