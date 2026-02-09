Scan the project for technical debt and report findings.

Target: $ARGUMENTS (optional — defaults to entire project)

## Checks

### 1. TODO / FIXME / HACK Comments
- Search all source files for `TODO`, `FIXME`, `HACK`, and `XXX` comments
- List each with file path, line number, and the comment text

### 2. Duplicated Code
- Identify repeated patterns or copy-pasted blocks across files
- Suggest extraction into shared components or utilities

### 3. Unused Files
- Check for files that are not referenced by any other file
- Flag orphaned assets (images, stylesheets, scripts)

### 4. Static Analysis (Automated Tools)
- Run `npx --yes html-validate apps/**/*.html` for HTML validation
- If CSS files exist, run `npx --yes stylelint "apps/**/*.css"` for CSS linting
- If JS files exist, run `npx --yes eslint apps/**/*.js` for JS linting
- Report tool output with file paths and line numbers
- If a tool is not available, skip it and note in the report

### 5. Outdated Patterns
- Detect deprecated HTML tags or attributes
- Flag inline styles that should be in CSS
- Identify accessibility issues (missing alt, missing labels)

### 6. Configuration Drift
- Verify CLAUDE.md directory structure matches actual files
- Check that `.claude/commands/` entries match documented commands
- Verify `.gitignore` covers all generated directories

## Output Format

```
=== Technical Debt Report ===

Summary:
  TODOs/FIXMEs: N
  Duplications: N
  Unused files: N
  Static analysis: N errors, N warnings
  Outdated patterns: N
  Config drift: N

--- Details ---

[TODO] file.html:42 — TODO: refactor this section
[DUPL] file1.html + file2.html — similar block (lines 10-25)
[UNUSED] assets/old-logo.png — not referenced
[LINT] file.html:15 — html-validate: element "center" is deprecated
[PATTERN] file.html:30 — inline style attribute should be moved to CSS
[DRIFT] CLAUDE.md lists verify-all.md but file missing

=== End of Report ===
```

## Rules

- This command is **read-only** — do not modify any files
- Run at the end of a session to catch accumulated debt
- Use subagents for large codebases to parallelize scanning
