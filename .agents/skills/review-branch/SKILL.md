---
name: review-branch
description:
  Review the current Git branch against the repository's main branch and report
  only actionable issues. Use when the user asks to review a feature branch,
  branch diff, pull-request-sized change, or all commits on the current branch.
---

# Review Branch

## Preflight

Resolve the repository root before inspecting the branch.

If `.review.md` exists at the repository root, report that it already exists and
stop immediately. Do not read, overwrite, delete, or update it. Perform no
review work after finding it.

## Review Target

Determine the repository's main branch from local Git configuration and refs,
preferring the configured remote default branch, then `main`, then `master`. Do
not fetch or mutate refs.

Require the current branch to differ from the main branch. If it does not,
report that there is no branch diff to review and stop.

Review the committed branch diff from the merge base through `HEAD`. Do not
silently substitute the latest commit or include unrelated uncommitted changes.
Read enough surrounding and related code to validate the change in context.

Use the repository's normal shell, Git, and code-discovery conventions. Prefer
available structured code-search or graph tools for finding related or
duplicated code; fall back to text search when needed.

## Review Scope

Report only actionable issues in these categories:

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

Skip anything that is fine. Do not describe what the code does or what was
checked.

List issues with unique IDs. Group issues by category and omit empty categories.
Include precise file and line references when possible.

If everything looks good, say so and do not create `.review.md`.

If issues are found, print the complete issue list in the final response and
write the same Markdown issue list to `.review.md` at the repository root. Do
not replace the terminal output with a summary or only a link to the file.

Treat invocation of this skill as authorization to create that single file; do
not ask for confirmation. Do not modify any other repository file. If the
environment blocks the write, still print the complete review, report that the
file could not be created, and stop without requesting elevated access.
