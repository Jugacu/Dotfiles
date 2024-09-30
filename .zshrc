# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

export LANG=en_US.UTF-8
export LANGUAGE=en

plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	z
	sudo
	extract
    fzf-tab
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=${ZDOTDIR:-~}/.zsh_functions

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bindings
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Styling
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# GO
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# BAT
export BAT_THEME="rose-pine"

# ----------------------
# Git Aliases
# ----------------------
alias gac="git add . && git commit -m"
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git push'
alias gl='git pull'
alias glr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
alias gbp='git branch --merged | egrep -v "(^\*|master|main|devel|develop)" | xargs git branch -d'
# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# Clipboard aliases
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'

# Ls grouping
alias ls='eza --color=always --group-directories-first --icons'

# Neovim
alias vi='nvim'

# Bat
alias cat='bat'

# zprof

