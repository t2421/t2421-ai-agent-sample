#!/bin/bash
# Auto-format hook for PostToolUse (Write)
# Runs Prettier on supported file types after Claude writes a file.

FILE_PATH="${1:-$CLAUDE_FILE_PATH}"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

echo "[Hook] File written: $FILE_PATH"

# Auto-format supported file types (excluding markdown to preserve intentional formatting)
case "$FILE_PATH" in
  *.html|*.css|*.js|*.json)
    # Check for local prettier first, fall back to npx
    if npx --no-install prettier --version >/dev/null 2>&1; then
      npx --no-install prettier --write "$FILE_PATH" 2>/dev/null
    elif command -v npx >/dev/null 2>&1; then
      npx --yes prettier --write "$FILE_PATH" 2>/dev/null
    fi
    if [ $? -eq 0 ]; then
      echo "[Hook] Auto-formatted with Prettier"
    fi
    ;;
esac
