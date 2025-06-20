#!/usr/bin/env bash

set -eu

# Initialize SSH directory and setup SSH key
echo "Setting up SSH configuration..."

# Create .ssh directory if it doesn't exist
SSH_DIR="$HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    echo "Creating SSH directory: $SSH_DIR"
    mkdir -p "$SSH_DIR"
fi

# Set correct permissions for .ssh directory
chmod 700 "$SSH_DIR"

# Check if SSH_KEY_id_ed25519 environment variable is set
if [ -z "${SSH_KEY_ID_ED25519:-}" ]; then
    echo "Warning: SSH_KEY_ID_ED25519 environment variable is not set"
    echo "Skipping SSH key setup"
else
    # Write SSH private key to file
    SSH_KEY_FILE="$SSH_DIR/id_ed25519"
    echo "Writing SSH private key to: $SSH_KEY_FILE"
    echo "$SSH_KEY_ID_ED25519" > "$SSH_KEY_FILE"
    
    # Set correct permissions for private key file
    chmod 600 "$SSH_KEY_FILE"
    
    echo "SSH key setup completed successfully"
fi

echo "SSH configuration setup finished"

