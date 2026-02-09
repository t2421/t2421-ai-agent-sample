Perform a code review on the specified file.

Target: $ARGUMENTS

Analyze from the following perspectives and report any issues with specific suggestions for improvement:

## Review Criteria

1. **Bugs & Logic Errors**: Code that could lead to runtime errors or unintended behavior
2. **Readability**: Appropriateness of variable/function names, code structure
3. **Security**: XSS, injection, unsafe input handling
4. **Performance**: Unnecessary DOM operations, memory leaks, inefficient algorithms
5. **Accessibility**: HTML semantics, ARIA attributes, alt attributes

## Output Format

Report each issue in the following format:

- **Severity**: Critical / Warning / Info
- **Location**: filename:line_number
- **Issue**: Description of the problem
- **Suggestion**: Specific fix proposal

If no issues are found, report that as well.
