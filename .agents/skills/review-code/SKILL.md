---
name: review-code
description: Review the current repository's git changes with an issue-only code-review format. Use when the user asks for a focused review of local code changes, a branch, a commit, or the current diff, especially when they want only actionable issues grouped by category.
---

# Review Code

## Workflow

Determine the repository's main branch, such as `main`, `master`, or the configured default branch.

- If currently on the main branch, review the most recent commit or change shown by git.
- If currently on another branch, review the branch diff against the main branch.

Use the repository's normal shell, git, and code-discovery conventions. Prefer available structured code-search or graph tools for finding duplicated code or related definitions; fall back to text search when needed.

## Review Scope

Review only for actionable issues in these categories:

- Bugs
- Typos
- Variable naming
- Idiomatic usage
- Best-practice compliance
- Performance issues
- Duplicated code from elsewhere in the codebase
- Clear, concise comments and user-facing messages
- Consistency between comments and code

## Output

Skip anything that is fine. Do not describe what the code does. Do not describe what was checked.

List issues with unique IDs. Group issues by category and omit empty categories. Include precise file and line references when possible.

If everything looks good, just say so.
