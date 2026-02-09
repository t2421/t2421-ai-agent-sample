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

### 4. Save uncommitted changes
- Run `git status --porcelain` to check for uncommitted changes (staged, unstaged, and untracked)
- If there are uncommitted changes:
  1. Record the list of changed/untracked files for later
  2. Run `git stash --include-untracked` to temporarily save all changes
- If there are no uncommitted changes, skip this step

### 5. Create worktree
- Run `git worktree add .worktrees/$BRANCH -b $BRANCH`
  - This creates the new branch and the worktree in one step
- Confirm creation by running `ls .worktrees/$BRANCH`

### 6. Restore uncommitted changes to the new worktree
- If changes were stashed in step 4:
  1. Run `git stash show --name-only` to confirm stash contents
  2. Run `cd .worktrees/$BRANCH` to move into the new worktree
  3. Run `git stash pop` to apply the stashed changes into the new worktree
  4. Verify with `git status` that the changes are present
- If no changes were stashed, just run `cd .worktrees/$BRANCH`

### 7. Report
- Confirm that the working directory is now `.worktrees/$BRANCH` (run `pwd`)
- Print a summary:
  - Worktree path
  - Branch name
  - Whether uncommitted changes were carried over
- Remind the user they can run a separate Claude Code instance in the worktree

## Branch naming rules

- Format: `<type>/<short-description>`
- Type must be one of: `feature`, `fix`, `refactor`, `docs`, `chore`
- Description: lowercase, words separated by hyphens (`-`)
- Max length: 50 characters total
- Examples: `feature/add-login-page`, `fix/header-overflow`, `chore/update-deps`

## Rules

- Do NOT chain commands with `&&`
- After creation, always `cd` into the new worktree directory so subsequent work happens there
- If `git stash pop` fails due to conflicts, inform the user and leave the stash intact
- If `.worktrees` is not in `.gitignore`, warn the user to add it
