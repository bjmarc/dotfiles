
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

echo "--## evaluating:"
cat $XDG_RUNTIME_DIR/ssh-agent.env

#if [[ ! "$SSH_AUTH_SOCK" ]]; then
        eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
#fi

