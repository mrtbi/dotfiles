# TMUX
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#    tmux attach -t default || tmux new -s default; exit
#  fi
#fi
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/tmux/plugins/"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# k9s
export K9S_CONFIG_DIR=$HOME/.config/k9s

#age
export SOPS_AGE_RECIPIENT="age1n50gn375hw4zldle7s4w00zqa9htwrg3eq2jxnn3g57pjcutw5uqxwdnqn"

# Flux
source <(flux completion zsh)
# Talos
source <(talosctl completion zsh)
# Kubectl
source <(kubectl completion zsh)