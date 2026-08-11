---
name: review-repo
description:
  Review the whole current repository and report only actionable issues. Use
  when the user asks for a repository-wide audit, full codebase review, broad
  quality review, or issues beyond a particular branch, commit, or diff.
---

# Review Repository

## Preflight

Resolve the repository root before inspecting its contents.

If `.review.md` exists at the repository root, report that it already exists and
stop immediately. Do not read, overwrite, delete, or update it. Perform no
review work after finding it.

## Review Target

Review the entire tracked codebase in the current worktree, including tests,
configuration, scripts, and documentation relevant to correctness. Do not limit
the review to Git changes. Exclude `.git`, ignored build output, vendored
dependencies, and generated files unless repository instructions explicitly
make them review targets.

Start with repository instructions and architecture, then inspect components and
their interactions systematically. Use the repository's normal shell, Git, and
code-discovery conventions. Prefer available structured code-search or graph
tools for architecture, call relationships, and duplicated code; fall back to
text search when needed.

## Review Scope

Report only actionable issues in these categories:

- Bugs
- Typos
- Variable naming
- Idiomatic usage
- Best-practice compliance
- Performance issues
- Duplicated code within the codebase
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
