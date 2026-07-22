#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/cy/.lmstudio/bin"
. "$HOME/.cargo/env"


# Added by Antigravity CLI installer
export PATH="/home/cy/.local/bin:$PATH"
