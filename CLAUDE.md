# CLAUDE.md - Project Instructions

## Project Overview

A sample project demonstrating Claude Code best practices.
Simple static HTML-based structure that showcases various Claude Code configuration patterns.

## Directory Structure

```
.
├── CLAUDE.md                  # This file (AI project instructions)
├── .claude/
│   ├── settings.json          # Permission management & Hooks config
│   ├── commands/              # Slash command definitions
│   │   ├── review.md          # /review - Code review
│   │   ├── simplify.md        # /simplify - Code simplification
│   │   ├── verify.md          # /verify - HTML verification
│   │   ├── plan.md            # /plan - Implementation planning
│   │   ├── commit-push-pr.md  # /commit-push-pr - Commit, push & create PR
│   │   ├── create-worktree.md # /create-worktree - Create branch & worktree
│   │   └── delete-worktree.md # /delete-worktree - Delete worktree & branch
│   └── scripts/
│       └── notify.sh          # Notification hook script (iTerm2 tab name)
├── .mcp.json                  # MCP server config (template)
├── apps/
│   └── index.html             # Main HTML
└── .gitignore
```

## Coding Conventions

- Indentation: 2 spaces
- HTML files: specify lang="ja", UTF-8 encoding
- Commit messages: English, start with a verb (Add / Update / Fix / Remove)

## AI Instructions

### Command Execution Rules

- Do not chain commands with `&&`. Execute `git add` and `git commit` in separate Bash calls
- Destructive operations (`rm -rf`, `git push --force`, `git reset --hard`) are prohibited

### Commit Rules

- Only create commits when explicitly requested by the user
- Keep commit messages concise, describing the "why" of the change

## Development Workflow Guidelines

### Plan Mode (Practice #4)

- For new features or changes spanning multiple files, design in Plan Mode first before implementing
- The `/plan` slash command enables read-only planning

### Parallel Execution (Practice #1)

- Independent tasks can be run in parallel across multiple Claude Code instances
- The Notification hook sends macOS notifications when AI work completes
- Git worktree allows parallel work in separate directories per branch

### Model Selection (Practice #2)

- Design & planning: Opus (when high-precision reasoning is needed)
- Implementation & coding: Sonnet (balance of speed and cost)
- Minor fixes & searches: Haiku (fast & low cost)

## MCP Integration (Practice #9)

MCP servers can be configured in `.mcp.json`. Examples:

```json
{
  "mcpServers": {
    "fetch": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-fetch@latest"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-github@latest"],
      "env": { "GITHUB_TOKEN": "<token>" }
    }
  }
}
```
