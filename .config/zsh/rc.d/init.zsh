for file in $ZDOTDIR/rc.d/*.zsh; do
    if [[ $file != *"init.zsh" ]]; then
        source "$file"
    fi
done
