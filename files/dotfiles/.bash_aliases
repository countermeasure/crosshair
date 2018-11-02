# ~/.bash_aliases: sourced by ~/.bashrc.

# Order aliases by the names of their main command, not by the names of the
# aliases themselves.


# abook
alias abook='abook --datafile $HOME/.data/contacts/addressbook'

# ctags
# "ut" for "update tags", to recursively update the current directory's ctags.
alias ut='ctags -f ~/.vimtags -R --tag-relative=yes'

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

# ranger
# "f" for "file manager".
alias f='ranger'

# weechat
alias irc='weechat'
