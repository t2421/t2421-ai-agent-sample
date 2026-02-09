Commit the current changes, push to remote, and create a Pull Request.

PR description hint (optional): $ARGUMENTS

## Steps

### 1. Check current status
Run the following bash commands to understand the current state:
- `git status` to see changed files
- `git diff` to see unstaged changes
- `git diff --cached` to see staged changes
- `git log --oneline -5` to see recent commit style
- `git branch --show-current` to get the current branch name

### 2. Stage and Commit
- Stage all relevant changed files with `git add` (exclude secrets, .env files, credentials)
- Write a concise English commit message starting with a verb (Add / Update / Fix / Remove)
- Do NOT chain `git add` and `git commit` with `&&`. Execute them as separate bash calls
- Include `Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>` in the commit message

### 3. Push to remote
- If the current branch has no upstream, push with `-u` flag: `git push -u origin <branch>`
- Otherwise: `git push`

### 4. Create Pull Request
- Use `gh pr create` to create a PR
- PR title: short (under 70 characters), describing the change
- PR body format:
```
## Summary
<1-3 bullet points summarizing the changes>

## Test plan
<Checklist of testing steps>
```
- If $ARGUMENTS is provided, use it as a hint for the PR description

## Rules

- Do NOT use `&&` to chain commands
- Do NOT use `git push --force`
- If there are no changes to commit, inform the user and stop
- If already on main/master branch, create a new feature branch first and ask the user for the branch name
- Return the PR URL when done
