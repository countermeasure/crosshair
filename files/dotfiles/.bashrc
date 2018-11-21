# ~/.bashrc: executed by bash(1) for non-login shells.


# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file rather than overwriting it.
shopt -s histappend

# When a shell exits, save the last 1000 lines from the history list to
# the history file.
HISTSIZE=1000

# Set the maximum size of the history file to 2000 lines.
HISTFILESIZE=2000

# Check the window size after each command and update it if necessary.
shopt -s checkwinsize

# "**" in a pathname matches all files and any directories/subdirectories.
#shopt -s globstar

# Enable less to handle file types like PDFs and archives.
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Show a color prompt in certain terminals.
case "$TERM" in
    rxvt-unicode|xterm-color|*-256color) color_prompt=yes;;
esac

# Trim long paths in the prompt.
PROMPT_DIRTRIM=3

# Set the prompt.
if [ "$color_prompt" = yes ]; then
    PS1='\n\[\033[0;33m\]\A  \w$(__git_ps1 "   %s")\n\$\[\033[00m\] '
    PS2='\[\033[0;33m\]>\[\033[00m\] '
else
    # TODO: Check that the branch character appears in from of the branch in
    # xterm.
    PS1='\n\A  \w$(__git_ps1 "   %s")\n\$ '
fi
unset color_prompt

# Enable colored ls output.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Enable colored GCC warnings and errors.
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Aliases. Requires bash_completion to be sourced before .bash_aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set the default text editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Enable autojump.
. /usr/share/autojump/autojump.sh
