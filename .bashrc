#
# ~/.bashrc
#

echo "--## bashrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# this is disabled - for some reason scp does not like it.
for sh in $HOME/Library/bashrc.d/*.sh; do
  echo "--## .bashrc: including $sh" 
  source "$sh"
done

