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
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability.
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Set the prompt.
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable colored ls output.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    #alias grep='grep --color=auto'
fi

# Enable colored GCC warnings and errors.
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# More ls aliases.
#alias ll='ls -l'

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
