# Locale settings
export LANG="de_DE.UTF-8" # Sets default locale for all categories
export LC_ALL="de_DE.UTF-8" # Overrides all other locale settings
export LC_CTYPE="de_DE.UTF-8" # Controls character classification and case conversion

# General
export USERNAME="$(whoami)"
export GPG_TTY=$(tty)

#Themes & Font
export TMUX_THEME="catppuccin"
export NVIM_THEME="catppuccin"
export STARSHIP_THEME="catppuccin"
export WEZTERM_THEME="catppuccin"
export FONT="JetBrainsMono Nerd Font"

# Use Neovim as default editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

#Browser
export BROWSER="firefox"

# History
export HISTFILE=$HOME/.histfile
export SAVEHIST=25000
export HISTSIZE=25000
export HISTCONTROL=ignorespace
export HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# directories
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/.local/share/chezmoi"
export SCRIPTS="$HOME/.config/custom/scripts"
export UTILS="$HOME/.config/custom/utils"

# DoNotTrack
export HOMEBREW_NO_ANALYTICS=1
