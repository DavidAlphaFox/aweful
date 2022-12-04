SAVEHIST=1000
HISTFILESIZE=1000
HISTFILE=~/.zsh/history

# Variables
export EDITOR="emacsclient -c"

# HiDPI Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Add emacs binaries to path
export PATH=~/.local/bin:~/.cargo/bin:~/go/bin:~/.emacs.d/bin:$PATH

# Timezone configuration
export TZ=Europe/London

# Fix GPG
export GPG_TTY=$(tty)
export $(dbus-launch)

# XDG_RUNTIME_DIR
if test -z $XDG_RUNTIME_DIR; then
  export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d $XDG_RUNTIME_DIR; then
      mkdir $XDG_RUNTIME_DIR	
      chmod 0700 $XDG_RUNTIME_DIR
    fi
fi

# Starship prompt (https://starship.rs)
export STARSHIP_CONFIG=~/.zsh/starship.toml
eval $(starship init zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Regular aliases
alias xclip='xclip -selection clipboard -i'
alias cat='bat'
alias ls='exa --oneline --sort=size --long'
alias l='exa --oneline --sort=size --long --all'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias grep='rg'
alias mkdir='mkdir -p'

# XBPS
alias xbps-i='sudo xbps-install'
alias xbps-isyu='sudo xbps-install -Syu'
alias xbps-qrs='sudo xbps-query -Rs'
alias xbps-q='sudo xbps-query'
alias xbps-roo='sudo xbps-remove -oO'
alias xbps-r='sudo xbps-remove'

### zr Package Manager
. <(zr zsh-users/zsh-completions zsh-users/zsh-history-substring-search zdharma-continuum/fast-syntax-highlighting zsh-users/zsh-autosuggestions)

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
