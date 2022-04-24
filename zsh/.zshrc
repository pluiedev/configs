# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leocth/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zpm
[[ -f ~/.zpm/zpm.zsh ]] ||
git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
source ~/.zpm/zpm.zsh

zpm load @omz

zpm load \
	@omz-lib/compfix \
	@omz-lib/completion \
	@omz-lib/directories \
	@omz-lib/functions \
	@omz-lib/git \
	@omz-lib/grep \
	@omz-lib/history \
	@omz-lib/key-bindings \
	@omz-lib/misc \
	@omz-lib/spectrum \
	@omz-lib/theme-and-appearance

zpm load \
	@omz/git,async \
	@omz/colored-man-pages,async \
	@omz/python,async \
	@omz/command-not-found,async \
	@omz/colorize,async \
	@omz/common-aliases,async \
	@omz/dnf,async \
zpm load @omz-theme/nicoulaj

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# set default editor to nvim
export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fuck you resolved
alias rsdns="sudo systemctl restart systemd-resolved"

# Custom convenience aliases
alias exl="exa --long --color=always"
alias ext="exa --tree --color=always"
alias exg="exa --grid --level=3 --color=always"
alias extl="exa --grid --level=3 --long --color=always"
alias exgl="exa --grid --long --color=always"

# Syntax highlighting
zpm load \
	zsh-users/zsh-completions,async \
	zsh-users/zsh-autosuggestions,async \

zpm load zpm-zsh/fast-syntax-highlighting
zpm load zpm-zsh/zsh-history-substring-search

# `fg` shouldn't pollute history
HISTORY_IGNORE='(fg)'

# `thefuck`
PATH=$PATH:/home/leocth/.local/bin/

eval $(thefuck --alias f)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
