# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jaredchapman/.zshrc'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/bin:$GOBIN:$HOME/bin
export NVM_DIR="$HOME/.nvm"
export EDITOR=vim
. "/usr/local/opt/nvm/nvm.sh"

alias please=""
alias blaze="bazel"
alias kubedev="kubectl --kubeconfig='${HOME}/.kube/dev.conf'"
alias kubestg="kubectl --kubeconfig='${HOME}/.kube/stg.conf'"
alias kubemini="kubectl --kubeconfig='${HOME}/.kube/mini.conf'"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# End of lines added by compinstall
#prompt fade blue white gray
prompt bart

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -f '/Users/jared/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' ]; then source '/Users/jared/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'; fi
bindkey '^j' autosuggest-accept
bindkey '^n' forward-word

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jared/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jared/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jared/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jared/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
eval "$(fasd --init auto)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
