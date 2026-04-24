# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# =============================================
# OH-MY-ZSH (Optional but recommended)
# =============================================
# If you want a framework, install oh-my-zsh:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Then uncomment:
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" # or "agnoster", "robbyrussel"
export TERM=xterm-256color 
export COLORTERM=truecolor


plugins=(
    git
    sudo
    systemd
    archlinux
    docker
    kubectl
    terraform
    command-not-found # Suggests packages for missing commands
    zsh-autosuggestions
    zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================================
# MAIN SETTINGS
# ============================================
source "$HOME/.zshrc.core"

# =============================================
# ALIASES (Your Linux Admin Specials)
# =============================================

source "$HOME/.zshrc.aliases"

# =============================================
# FUNCTIONS (custom tools)
# =============================================

source "$HOME/.zshrc.functions"

# =============================================
# ENVIRONMENT
# =============================================
export EDITOR=nano
export VISUAL=nano
export PAGER=less
export LESS='-R'

# If you code
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# For Rust
export PATH="$HOME/.cargo/bin:$PATH"

# For Python virtualenvs
export WORKON_HOME=~/.virtualenvs

# Color for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# GTK is a dick
export GTK_THEME=Adwaita-dark
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# =============================================
# KEY BINDINGS
# =============================================
bindkey '^R' history-incremental-search-backward
bindkey '^U' backward-kill-line

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
# =============================================
# MISC SETTINGS
# =============================================
setopt autocd
setopt correct
setopt extendedglob
setopt notify
unsetopt beep

# Auto-ls after cd
function chpwd() {
    emulate -L zsh
    ls
}

# =============================================
# WELCOME MESSAGE - in .zprofile
# =============================================

