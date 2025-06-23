#!/usr/bin/env zsh

if [ -n "${EMSCRIPTEN_ROOT:-}" && -f "$EMSCRIPTEN_ROOT/emsdk_env.sh" ]; then
    EMSDK_QUIET=1 source "$EMSCRIPTEN_ROOT/emsdk_env.sh"
fi
