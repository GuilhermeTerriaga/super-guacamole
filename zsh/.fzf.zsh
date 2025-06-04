# Setup fzf
# ---------
if [[ ! "$PATH" == */home/guilhermet/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/guilhermet/.fzf/bin"
fi

source <(fzf --zsh)
