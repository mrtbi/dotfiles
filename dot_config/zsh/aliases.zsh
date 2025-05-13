# Basics
alias ..="cd .."
alias scripts='cd $SCRIPTS'
alias utils='cd $UTILS'
alias dot='cd $DOTFILES'
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'
edit(){
    nvim "$1"
}

# git
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'

# terraform
alias t='tofu'
alias tp='tofu plan'

# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

# Flux
alias fgk='flux get kustomizations'

# Talos

# Fabric

yt() {
    local video_link="$1"
    fabric -y "$video_link" --transcript
}
