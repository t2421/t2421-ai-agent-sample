#!/bin/bash
# Auto-format hook for PostToolUse (Write)
# Runs Prettier on supported file types after Claude writes a file.

FILE_PATH="${1:-$CLAUDE_FILE_PATH}"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

echo "[Hook] File written: $FILE_PATH"

# Auto-format supported file types
case "$FILE_PATH" in
  *.html|*.css|*.js|*.json|*.md)
    if command -v npx >/dev/null 2>&1; then
      npx --yes prettier --write "$FILE_PATH" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "[Hook] Auto-formatted with Prettier"
      fi
    fi
    ;;
esac
