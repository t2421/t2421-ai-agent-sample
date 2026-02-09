Create a new branch and set up a git worktree in the `.worktrees` directory.

Branch name (optional): $ARGUMENTS

## Steps

### 1. Determine branch name
- If `$ARGUMENTS` is provided, set `BRANCH` to the provided value
- If `$ARGUMENTS` is empty:
  1. Run `git status` and `git diff` to understand the current changes
  2. Propose a branch name based on the changes, following the branch naming rules below
  3. Present the proposed name to the user and ask for confirmation (allow them to pick a different name)
  4. Set `BRANCH` to the confirmed name

### 2. Validate branch name format
- Ensure `BRANCH` follows the branch naming rules below
- If the name does not comply, suggest a corrected version and ask the user

### 3. Check prerequisites
- Run `git branch --list $BRANCH` to check the branch does not already exist
- If the branch already exists, inform the user and stop

### 4. Create worktree
- Run `git worktree add .worktrees/$BRANCH -b $BRANCH`
  - This creates the new branch and the worktree in one step
- Confirm creation by running `ls .worktrees/$BRANCH`

### 5. Report
- Print the worktree path: `.worktrees/$BRANCH`
- Suggest the user open a new terminal tab/window and `cd` into the worktree directory
- Remind the user they can run a separate Claude Code instance in the worktree

## Branch naming rules

- Format: `<type>/<short-description>`
- Type must be one of: `feature`, `fix`, `refactor`, `docs`, `chore`
- Description: lowercase, words separated by hyphens (`-`)
- Max length: 50 characters total
- Examples: `feature/add-login-page`, `fix/header-overflow`, `chore/update-deps`

## Rules

- Do NOT chain commands with `&&`
- Do NOT switch the current working directory with `cd`
- If `.worktrees` is not in `.gitignore`, warn the user to add it
