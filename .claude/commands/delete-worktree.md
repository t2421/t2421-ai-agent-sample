Delete a git worktree and its associated branch.

Branch name (optional): $ARGUMENTS

## Steps

### 1. Determine target
- If `$ARGUMENTS` is empty:
  1. Run `git worktree list` to show all worktrees
  2. Present the list to the user and ask which one to delete
  3. If there are no worktrees under `.worktrees/`, inform the user and stop
- If `$ARGUMENTS` is provided, set `BRANCH` to the provided value

### 2. Validate
- Run `git worktree list` and confirm `.worktrees/$BRANCH` exists
- If the worktree does not exist, inform the user and stop
- Check that the user is NOT currently inside the worktree being deleted

### 3. Remove worktree
- Run `git worktree remove .worktrees/$BRANCH`
- If it fails due to uncommitted changes, inform the user and ask whether to force removal with `--force`

### 4. Delete branch
- Ask the user whether to also delete the local branch
- If yes, run `git branch -d $BRANCH`
- If the branch is not fully merged, inform the user and ask whether to force delete with `-D`

### 5. Delete remote branch
- Check if the remote branch exists with `git branch -r --list origin/$BRANCH`
- If it exists, ask the user whether to also delete the remote branch
- If yes, run `git push origin --delete $BRANCH`

### 6. Report
- Confirm the worktree and branch have been removed
- Run `git worktree list` to show remaining worktrees

## Rules

- Do NOT chain commands with `&&`
- Do NOT switch the current working directory with `cd`
- Always ask for confirmation before force-removing a worktree or force-deleting a branch
