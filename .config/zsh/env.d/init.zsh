for file in $ZDOTDIR/env.d/*.zsh; do
    if [[ $file != *"init.zsh" ]]; then
        source "$file"
    fi
done
