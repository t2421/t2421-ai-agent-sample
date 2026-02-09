Verify the specified HTML file.

Target: $ARGUMENTS

## Steps

### 1. Automated Validation (html-validate)

Run `npx html-validate <target-file>` to perform W3C-style syntax validation.

- If the command is not available, fall back to manual review
- Report all errors and warnings from the tool output
- Categorize issues by severity (error / warning)

### 2. HTML Syntax Check

- Presence of DOCTYPE declaration
- Correct tag nesting structure
- Required attributes (img alt, a href, etc.)
- Use of deprecated tags or attributes
- Valid `lang` attribute on `<html>` tag
- Correct `charset` meta tag

### 3. Accessibility (WCAG 2.1 Compliance Check)

- Heading hierarchy (h1-h6 order)
- Form element label associations
- Image alternative text
- Color contrast ratio considerations
- Keyboard navigation support
- ARIA attributes usage

### 4. Basic SEO Check

- Presence and content of title tag
- Presence of meta description
- lang attribute specification
- Appropriate heading structure

### 5. Broken Link Detection

- Scan all `href` and `src` attributes in the file
- Flag any empty or placeholder links (`#`, `javascript:void(0)`)
- Flag references to local files that do not exist (check with `ls`)

### 6. Performance

- Unnecessary resource loading
- Image optimization considerations

## Output Format

### Summary Table

| Category | Pass | Fail | Warning |
|----------|------|------|---------|
| Syntax   |      |      |         |
| A11y     |      |      |         |
| SEO      |      |      |         |
| Links    |      |      |         |
| Perf     |      |      |         |

### Details

For each Fail and Warning item, provide:
1. The issue description
2. The line number (if applicable)
3. A concrete fix suggestion

## Rules

- Always run `npx html-validate` first before manual checks
- Do not modify the target file — this command is read-only
- If no target file is specified, verify all HTML files under `apps/`
