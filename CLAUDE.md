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
│   │   ├── simplify.md        # /simplify - Code simplification (subagent-capable)
│   │   ├── verify.md          # /verify - HTML verification (html-validate)
│   │   ├── verify-all.md      # /verify-all - Parallel HTML validation via subagent
│   │   ├── techdebt.md        # /techdebt - Technical debt scanner
│   │   ├── plan.md            # /plan - Implementation planning
│   │   ├── commit-push-pr.md  # /commit-push-pr - Commit, push & create PR
│   │   ├── create-worktree.md # /create-worktree - Create branch & worktree
│   │   └── delete-worktree.md # /delete-worktree - Delete worktree & branch
│   └── scripts/
│       ├── notify.sh          # Notification hook script (iTerm2 tab name)
│       └── auto-format.sh     # Auto-format hook (Prettier on Write)
├── .mcp.json                  # MCP server config (Fetch + GitHub)
├── .github/
│   └── workflows/
│       └── claude-md-reminder.yml  # CLAUDE.md update reminder on PR merge
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

### Pre-work Confirmation

- Before starting planning or implementation, always run `git branch --show-current` and `pwd`
- Present the current branch and directory to the user and ask for confirmation before proceeding
- If the user is on `main`, suggest creating a new branch or worktree first

### Commit Rules

- Only create commits when explicitly requested by the user
- Keep commit messages concise, describing the "why" of the change

### Continuous Improvement

- When Claude makes a mistake and the user corrects it, update this CLAUDE.md to prevent recurrence
- Periodically review and prune outdated instructions
- Keep this file concise — it is read on every session start

## Best Practices

### 1. Parallel Execution

- Independent tasks can be run in parallel across multiple Claude Code instances
- The Notification hook sends macOS notifications when AI work completes
- Git worktree allows parallel work in separate directories per branch
- Use `/create-worktree` and `/delete-worktree` to manage worktrees

### 2. Model Selection

- Design & planning: Opus (when high-precision reasoning is needed)
- Implementation & coding: Sonnet (balance of speed and cost)
- Minor fixes & searches: Haiku (fast & low cost)

### 3. CLAUDE.md as Living Document

- This file is checked into git and shared across the team
- Update it whenever Claude makes a repeated mistake
- Keep instructions actionable and specific

### 4. Plan Mode

- For new features or changes spanning multiple files, design in Plan Mode first before implementing
- The `/plan` slash command enables read-only planning
- Go back and forth with Claude until satisfied, then switch to auto-accept mode

### 5. Slash Commands (Reusable Skills)

- Repetitive workflows are defined as slash commands in `.claude/commands/`
- If you do something more than once a day, turn it into a command
- Available commands: `/review`, `/simplify`, `/verify`, `/verify-all`, `/techdebt`, `/plan`, `/commit-push-pr`, `/create-worktree`, `/delete-worktree`

### 6. Smart Permissions

- Permissions are pre-configured in `.claude/settings.json` with 3 tiers: allow, deny, ask
- Safe read-only commands are pre-allowed to reduce prompts
- Destructive commands are denied outright
- Do not use `--dangerously-skip-permissions`

### 7. Hooks

- **PostToolUse (Write)**: Auto-formats files with Prettier via `.claude/scripts/auto-format.sh`
- **Stop**: Runs `html-validate` on all HTML files before session ends
- **Notification**: Sends macOS notifications when Claude needs attention

### 8. Subagents

- Use subagents for high-volume work (bulk validation, deep code search, parallel analysis)
- `/verify-all` runs HTML validation across all files via subagent
- `/simplify` supports subagent mode for multi-file refactoring
- `/techdebt` uses subagents for large codebases

### 9. MCP Integration

- Fetch MCP server: enables web content retrieval
- GitHub MCP server: enables direct Issue/PR management
- Configuration is in `.mcp.json`
- To use the GitHub server, set your token directly in `.mcp.json` (gitignored via `.claude/settings.local.json`) or replace the empty `GITHUB_TOKEN` value

### 10. Verification

- The most important practice for quality — can 2-3x the quality of results
- `/verify` runs html-validate + manual checks on individual files
- `/verify-all` runs parallel validation across all HTML files
- Stop hook automatically validates before session ends
- Always give Claude a way to verify its own work
