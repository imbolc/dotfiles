---
name: docs-refine
description: >-
  Review and edit Markdown documents using the global technical writing rules.
  Accept a document path, or review all repository Markdown documents when no
  path is supplied. Use only when the user explicitly invokes docs-refine.
---

# Docs Refine

Use the [global Technical writing rules](../../AGENTS.md#technical-writing) for
every review.

## Select documents

- `$docs-refine path/to/doc.md`: resolve the path relative to the invocation
  directory and review only that document
- `$docs-refine`: review every Markdown document in the current repository,
  starting at its root, including root files and nested directories

For repository scope, enumerate tracked and nonignored untracked files with
`git ls-files --cached --others --exclude-standard -z` from the repository root.
Select Markdown documents, including case variants of `.md` and `.markdown`,
and review each once. Report an invalid document path or missing repository
instead of silently expanding the scope.

## Refine and verify

1. Read each selected document in full and apply its relevant repository
   instructions and document conventions
2. Edit the prose in place using those writing rules. Preserve intended meaning
   and technical requirements; leave compliant passages alone.
3. Preserve Markdown syntax, frontmatter, code examples, commands, link
   destinations, and required verbatim text. If a heading changes, update
   affected internal links. Resolve factual ambiguities from relevant sources
   when possible; report unresolved ones without guessing.
4. Review the diff against the writing standard and check affected Markdown
   structure and links. Run relevant existing documentation checks when available.
5. Report the review scope, files changed, main improvements, and validation
   performed. Account for skipped or unreadable documents and unresolved issues.
