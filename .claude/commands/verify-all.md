Verify all HTML files in the project using a subagent for parallel validation.

## Steps

### 1. Discover HTML files

Run `find apps -name "*.html" -type f` to list all HTML files.

### 2. Run automated validation

Run `npx --yes html-validate apps/**/*.html` to perform bulk validation.

### 3. Per-file verification (via subagent)

For each HTML file found, launch a **Task subagent** (subagent_type: Explore) to:
- Check HTML syntax (DOCTYPE, tag nesting, required attributes)
- Check accessibility (heading hierarchy, alt text, ARIA)
- Check SEO basics (title, meta description, lang)
- Detect broken links (empty href/src, missing local files)

Run subagents **in parallel** for maximum efficiency.

### 4. Generate summary report

Compile results from all subagents into a single report:

```
=== Verification Report ===

Files checked: N
Total errors: N
Total warnings: N

--- file1.html ---
  Errors: N, Warnings: N
  - [ERROR] description (line X)
  - [WARN] description (line X)

--- file2.html ---
  ...

=== End of Report ===
```

## Rules

- This command is **read-only** — do not modify any files
- If no HTML files are found, report "No HTML files found" and exit
- Use subagents to avoid flooding the main context with verbose output
