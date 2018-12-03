# ~/.bash_aliases: sourced by ~/.bashrc.

# Order aliases by the names of their main command, not by the names of the
# aliases themselves.


# TODO: Add bash completion to all aliases which should have it.

# abook
alias abook='abook --datafile $HOME/.data/contacts/addressbook'

# ag
alias ag='ag --hidden --silent'

# apt
# TODO: Rethink the install/uninstall naming, as install may already be a
# program. Use "add" instead of "install"?
alias add='sudo apt install'
alias remove='sudo apt purge --autoremove'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'

# aunpack
# "x" for "extract", to extract files from most archive formats.
alias x='aunpack'

# cal
alias cal='cal -3'

# cd
alias ~='cd'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

# clear
alias c='clear'

# cp
alias cp='cp -iv'

# ctags
# "ut" for "update tags", to recursively update the current directory's ctags.
alias ut='ctags -f ~/.vimtags -R --tag-relative=yes'

# df
alias df='df -H --total'

# du
alias du='df -ch'

# find
alias fd='find . -type d -iname'
alias ff='find . -type f -iname'

# history
alias h='history'
alias hl='history | less'

# git
alias g='git'
__git_complete g _git
alias ga='git add --all'
__git_complete ga _git_add
alias gap='git add --patch'
__git_complete gap _git_add
alias gb='git branch'
__git_complete gb _git_branch
alias gch='git checkout'
__git_complete gch _git_checkout
alias gco='git commit -m'
__git_complete gco _git_commit
alias gcoa='git commit --amend'
alias gcoar='git commit --amend --reuse-message=HEAD'
alias gd='git diff'
__git_complete gd _git_diff
alias gds='git diff --staged'
__git_complete gds _git_diff
alias gf='git fetch --all --prune'
__git_complete gf _git_fetch
alias gl='git log'
__git_complete gl _git_log
alias gm='git merge'
__git_complete gm _git_merge
alias gr='git rebase'
__git_complete gr _git_rebase
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias gs='git status'
__git_complete gs _git_status

# grep
alias grep='grep --color=auto'

# less
alias less='less -i'

# ln
alias ln='ln -iv'

# ls
alias ls='ls --color=auto'
alias ll='ls -Ahl --group-directories-first'

# mkdir
alias mkdir='mkdir -pv'

# mv
alias mv='mv -iv'

# ping
alias ping='ping -c 5 -i 0.2'

# python
alias p='python'

# reset
alias r='reset'

# rm
alias rm='rm -i'

# ranger
# "f" for "file manager".
alias f='ranger'

# weechat
alias irc='weechat'

# x-terminal-emulator
# "nt" for "new terminal", to spawn a new terminal inheriting from its parent.
alias nt='x-terminal-emulator &'
