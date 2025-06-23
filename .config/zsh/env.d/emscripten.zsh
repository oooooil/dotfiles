#!/usr/bin/env zsh

# Setup Emscripten environment if EMSCRIPTEN_ROOT is defined
if [ -n "${EMSCRIPTEN_ROOT:-}" ]; then
    echo "Setting up Emscripten environment..."
    echo "EMSCRIPTEN_ROOT found: $EMSCRIPTEN_ROOT"
    
    if [ -f "$EMSCRIPTEN_ROOT/emsdk_env.sh" ]; then
        echo "Sourcing Emscripten environment script..."
        EMSDK_QUIET=1 source "$EMSCRIPTEN_ROOT/emsdk_env.sh"
        echo "Emscripten environment setup completed"
    else
        echo "Warning: emsdk_env.sh not found in $EMSCRIPTEN_ROOT"
    fi
else
    echo "EMSCRIPTEN_ROOT not defined, skipping Emscripten setup"
fi
