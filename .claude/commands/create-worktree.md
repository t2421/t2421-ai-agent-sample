Create a new branch and set up a git worktree in the `.worktrees` directory.

Branch name (required): $ARGUMENTS

## Steps

### 1. Validate input
- If `$ARGUMENTS` is empty, ask the user for a branch name and stop
- Set `BRANCH` to the provided branch name

### 2. Check prerequisites
- Run `git status` to confirm the working directory state
- Run `git branch --list $BRANCH` to check the branch does not already exist
- If the branch already exists, inform the user and stop

### 3. Create worktree
- Run `git worktree add .worktrees/$BRANCH -b $BRANCH`
  - This creates the new branch and the worktree in one step
- Confirm creation by running `ls .worktrees/$BRANCH`

### 4. Report
- Print the worktree path: `.worktrees/$BRANCH`
- Suggest the user open a new terminal tab/window and `cd` into the worktree directory
- Remind the user they can run a separate Claude Code instance in the worktree

## Rules

- Do NOT chain commands with `&&`
- Do NOT switch the current working directory with `cd`
- If `.worktrees` is not in `.gitignore`, warn the user to add it
