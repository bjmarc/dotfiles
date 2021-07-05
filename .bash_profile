#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/.local/bin/:$HOME/bin:$HOME/opt/bin:/usr/local/cuda/bin:$PATH

for sh in $HOME/Library/profile.d/*.sh; do
  echo "--## .profile: including $sh" 
  source "$sh"
done

# User specific environment and startup programs

if [ "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi


