#!/usr/bin/env zsh

if [ -n "${EMSDK:-}" && -f "$EMSDK/emsdk_env.sh" ]; then
    EMSDK_QUIET=1 source "$EMSDK/emsdk_env.sh"
fi
