# zstyle ':omz:plugins:pipenv' auto-shell no

# User configuration
export PATH="$HOME/.local/kitty.app/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$ASDF_DATA_DIR:$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
# export PATH=$PATH:$HOME/.cargo/bin 
export CDPATH=.:..:$HOME
export PATH="$PATH:$ASDF_DATA_DIR/installs/python/3.12.7/lib/python3.12/site-packages"
export COWPATH="$COWPATH:$HOME/.cowsay/cowfiles"
fortune -s| cowsay -f duck
#langs
export PYTHON="$HOME/.asdf/shims/python"
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_CTRL_T_COMMAND="fd -E '.git' -E 'node_modules' -E 'Games'"
export FZF_ALT_C_COMMAND="$FZF_CTRL_T_COMMAND"
export GOPATH="/home/guilhermet/.asdf/installs/golang/1.24.3/packages"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOPATH"
export PATH="$PATH:$PYTHON"
export PATH="$PATH:$JAVA_HOME/bin"
export BAT_THEME="ansi"

# export fpath=($ASDF_DATA_DIR/completions: $fpath)
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

#
#alias uteis
#
alias esc2caps="setxkbmap -option caps:escape"
alias gai='ga -i'
alias ls="lsd -l"
alias kd="kitten diff"
alias fp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias v="fd --type f --hidden --exclude .git | fp --reverse --exit-0| xargs -r nvim"
alias pgclids="pgcli --list-dsn | fzf | xargs -oe pgcli --dsn"
alias slp="sleep 1 && xset dpms force off"
alias suroot="sudo -E -s"
alias cat=bat
alias psh="pipenv shell"

ZSH_THEME="spaceship"
spaceship_prompt_order=(
  user          # username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Add in zsh plugins
zinit light spaceship-prompt/spaceship-prompt
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit load zdharma-continuum/history-search-multi-word
##Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::copypath 
zinit snippet OMZP::copyfile
zinit snippet OMZP::colored-man-pages
# zinit snippet OMZP::asdf
# zinit snippet OMZP::pipenv
zinit snippet OMZP::gitignore
zinit snippet OMZP::command-not-found

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':omz:plugins:pipenv' auto-shell no

# history substring
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
