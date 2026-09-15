# Shared Review Rules

## Preflight

Resolve the repository root before inspecting the review target.

If `.review.md` exists at the repository root, report that it already exists and
stop immediately. Do not read, overwrite, delete, or update it. Perform no
review work after finding it.

## Review Method

Follow repository shell, Git, and code-discovery conventions. Prefer available
structured code-search or graph tools for architecture, call relationships,
related code, and duplication; fall back to text search.

Review by static inspection. Do not run tests, builds, linters, formatters, or
other project checks; assume they pass.

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

Invocation of the calling review skill authorizes creation of that single file;
do not ask for confirmation. Do not modify any other repository file. If the
environment blocks the write, still print the complete review, report that the
file could not be created, and stop without requesting elevated access.
