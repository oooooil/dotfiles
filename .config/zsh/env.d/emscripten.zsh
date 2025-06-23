#!/usr/bin/env zsh

if [[ -n "${EMSDK:-}" && -f "$EMSDK/emsdk_env.sh" ]]; then
    export EMSDK_QUIET=1
    source "$EMSDK/emsdk_env.sh"
    unset EMSDK_QUIET
fi
