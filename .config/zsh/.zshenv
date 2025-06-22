# ~/.zshenv should only be a one-liner that sources this file
# echo "source ~/.config/zsh/.zshenv" >| ~/.zshenv

export XDG_CONFIG_HOME=~/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
