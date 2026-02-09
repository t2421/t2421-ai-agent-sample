#!/bin/bash
# Claude Code Notification Hook Script
# Usage: notify.sh <message>
#
# Sends a macOS notification with the iTerm2 tab name.
# Falls back to the current directory name if tab name cannot be determined.

MSG="${1:-Claude Code needs your attention}"

# Get iTerm2 tab name by matching tty device
TNAME=""
TTY_DEV=$(tty 2>/dev/null)
if [ -n "$TTY_DEV" ]; then
  TNAME=$(TTY_DEV="$TTY_DEV" osascript \
    -e 'set ttyDev to system attribute "TTY_DEV"' \
    -e 'tell application "iTerm2"' \
    -e 'repeat with w in windows' \
    -e 'repeat with t in tabs of w' \
    -e 'repeat with s in sessions of t' \
    -e 'if tty of s is ttyDev then return name of t' \
    -e 'end repeat' \
    -e 'end repeat' \
    -e 'end repeat' \
    -e 'end tell' 2>/dev/null)
fi

# Fallback to directory name
[ -z "$TNAME" ] && TNAME=$(basename "$PWD")

# Escape double quotes and backslashes for AppleScript
MSG_ESCAPED=$(printf '%s' "$MSG" | sed 's/\\/\\\\/g; s/"/\\"/g')
TNAME_ESCAPED=$(printf '%s' "$TNAME" | sed 's/\\/\\\\/g; s/"/\\"/g')

osascript -e "display notification \"$MSG_ESCAPED\" with title \"Claude Code\" subtitle \"$TNAME_ESCAPED\""
