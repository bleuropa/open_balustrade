#!/bin/bash

# Install Git hooks for OpenCode projects
# Run this script from anywhere in the repository

set -e

# Get git root directory (works anywhere in repo)
GIT_ROOT=$(git rev-parse --show-toplevel)

cd "$GIT_ROOT"

echo "Installing Git hooks..."

# Make hooks executable
chmod +x .opencode/hooks/pre-commit.sh
chmod +x .opencode/hooks/commit-msg.sh
chmod +x .opencode/hooks/post-commit.sh

# Create symlinks in .git/hooks/
ln -sf ../../.opencode/hooks/pre-commit.sh .git/hooks/pre-commit
ln -sf ../../.opencode/hooks/commit-msg.sh .git/hooks/commit-msg
ln -sf ../../.opencode/hooks/post-commit.sh .git/hooks/post-commit

echo "Git hooks installed successfully!"
echo ""
echo "Hooks installed:"
echo "  - pre-commit: Validates code quality, task files, temporal language, PM discipline"
echo "  - commit-msg: Validates conventional commit format"
echo "  - post-commit: Auto-updates PROJECT_STATUS.md timestamp and recent files"
echo ""
