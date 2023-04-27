# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# zi
typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi"
source "${ZI[BIN_DIR]}/zi.zsh"
# zi completions
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

setopt prompt_subst

zi wait lucid for \
    OMZL::git.zsh \
    OMZL::compfix.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::functions.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::misc.zsh \
    OMZL::spectrum.zsh \
    OMZL::theme-and-appearance.zsh \
    atload"unalias grv" OMZP::git \

# Temporary prompt
PS1="❯ "

zi wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::nicoulaj

zi wait lucid for \
    atload"base16_tomorrow-night" chriskempson/base16-shell \
    zpm-zsh/zsh-history-substring-search \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    OMZP::colored-man-pages \
    has'python' has'python3' OMZP::python \
    OMZP::colorize \
    has'dnf' OMZP::dnf \
    has'deno' OMZP::deno \
    has'nvm' OMZP::nvm \
    has'rbenv' OMZP::rbenv \
    has'thefuck' OMZP::thefuck \
    OMZP::command-not-found \
    has'exa' z-shell/zsh-exa \
    has'zoxide' z-shell/zsh-zoxide \

zi wait lucid as'completion' blockf for \
    has'rg' https://github.com/BurntSushi/ripgrep/blob/master/complete/_rg \
    has'rustc' OMZP::rust/_rustc \
    has'cargo' https://github.com/rust-lang/cargo/blob/master/src/etc/_cargo \

zi wait lucid atload"zicompinit; zicdreplay" blockf for \
    z-shell/F-Sy-H \
    zsh-users/zsh-completions \

# Somehow nvm needs to be manually lazy loaded...
# ~300ms -> ~40ms, massive shave off in time
zstyle ':omz:plugins:nvm' lazy yes
# Use .nvmrc, _silently_
zstyle ':omz:plugins:nvm' silent-autoload yes

# set default editor to helix
export EDITOR=hx
# set pager to nvimpager
export PAGER=nvimpager
export MANPAGER=nvimpager

# some oh my zsh plugins need this...
export ZSH_CACHE_DIR=~/.zcache
mkdir -p $ZSH_CACHE_DIR

# Fuck you resolved
alias rsdns="sudo systemctl restart systemd-resolved"

# `fg` shouldn't pollute history
HISTORY_IGNORE='(fg)'

# TeX Live
export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux

# nim
export PATH=$HOME/.nimble/bin:$PATH

# perl 5 & CPAN
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# rsmpeg
export FFMPEG_PKG_CONFIG_PATH=$HOME/ffmpeg_build/lib/pkgconfig

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# nvim stuff
alias vim=nvim
alias neovide="neovide --multigrid"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
