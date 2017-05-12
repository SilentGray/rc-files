# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export EDITOR=vim
export DIFFCMD="vimdiff"

# Vim input mode.
set -o vi
bind -m vi-insert "\C-l":clear-screen
stty -ixon

# Pretty prompt - Colourful prompts to cheer the day.
COLOR="0;34m"
GIT_COLOR="0;33m"
function color_set { echo "\[\e[$1\]"; }
function color_reset { color_set "m"; }
export GIT_PS1_SHOWDIRTYSTATE='TRUE'
export PS1="$(color_set $GIT_COLOR)"'$(__git_ps1 "%s ")'"$(color_set $COLOR)\W >> $(color_reset)"

# And sources.
source /usr/share/git-core/contrib/completion/git-prompt.sh
