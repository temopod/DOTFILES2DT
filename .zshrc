# Aliases
alias ls='eza -la --icons'
alias cat='batcat' # In Ubuntu, bat is often installed as batcat

# Zoxide initialization
eval "$(zoxide init zsh)"

# Oh My Zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)