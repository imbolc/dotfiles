---
name: review-commit
description:
  Review one Git commit and report only actionable issues. Use when the user
  asks to review a commit, commit hash, revision, HEAD, or the most recent
  commit without reviewing an entire branch or repository.
---

# Review Commit

## Preflight

Resolve the repository root before inspecting the commit.

If `.review.md` exists at the repository root, report that it already exists and
stop immediately. Do not read, overwrite, delete, or update it. Perform no
review work after finding it.

## Review Target

Review the commit or revision specified by the user. If none is specified,
review `HEAD`. Resolve it to exactly one commit and report an invalid or
ambiguous revision instead of guessing.

Review that commit's complete patch, including all parents needed to understand
the change. Handle a root commit as a diff against an empty tree. Do not include
later commits, unrelated branch changes, or uncommitted worktree changes. Read
enough surrounding and related code to validate the commit in context.

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
