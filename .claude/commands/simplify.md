Simplify and refactor the code in the specified file.

Target: $ARGUMENTS

## Simplification Approach

1. **Remove redundant code**: Unused variables, unreachable code, duplicate logic
2. **Improve readability**: Simplify complex conditionals, rename to clearer names
3. **Modernize syntax**: Replace legacy patterns with modern equivalents
4. **Improve structure**: Split overly long functions, clarify responsibilities

## Execution Mode

- **Single file**: Analyze and refactor the target file directly
- **Multiple files / directory**: Launch a **Task subagent** (subagent_type: general-purpose) for each file to perform simplification in parallel. Collect results and present a unified report.

When using subagents:
1. Identify all files matching the target pattern
2. Launch one subagent per file for parallel analysis
3. Each subagent reports: findings, suggested changes, and risk level
4. Compile a summary before applying any changes

## Rules

- Do not change behavior (refactoring only)
- Explain the reason for each change
- Avoid making too many changes at once
- Present all proposed changes to the user before applying
