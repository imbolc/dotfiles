---
name: docs-refine
description: >-
  Review and edit Markdown documents using the embedded technical writing rules.
  Accept a document path, or review all repository Markdown documents when no
  path is supplied. Use only when the user explicitly invokes docs-refine.
---

# Docs Refine

Use the embedded Technical writing rules below for every review.

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
2. Edit the prose in place using the Technical writing rules below. Preserve
   intended meaning and technical requirements; leave compliant passages alone.
3. Preserve Markdown syntax, frontmatter, code examples, commands, link
   destinations, and required verbatim text. If a heading changes, update
   affected internal links. Resolve factual ambiguities from relevant sources
   when possible; report unresolved ones without guessing.
4. Review the diff against the writing standard and check affected Markdown
   structure and links. Run relevant existing documentation checks when available.
5. Report the review scope, files changed, main improvements, and validation
   performed. Account for skipped or unreadable documents and unresolved issues.

## Technical writing

Apply these defaults when writing or revising developer-facing technical text,
including documentation, explanations, code comments, design notes, pull request
descriptions, reviews, commit messages, runbooks, and instructions. Follow
explicit user requirements and established repository or document conventions.
Preserve text that must remain verbatim.

Optimize in this order:

1. Technical accuracy and task-relevant completeness
2. Comprehension
3. Findability while skimming
4. Brevity

Never sacrifice the first three goals for brevity.

- Lead with the answer, action, decision, or most important information. Put
  background, rationale, and qualifications later. Do not restate the request or
  add an introduction that carries no useful information.
- Organize around reader questions and tasks, not the author's thought process.
  Keep related information together and put optional or specialized detail after
  the information most readers need.
- Use only as much structure as the material warrants. Use descriptive headings
  when they improve navigation, prose for reasoning, bullets for parallel items,
  numbered lists for ordered steps, and tables when repeated attributes make a
  comparison materially easier to scan.
- Write for the target reader's knowledge and immediate task. Prefer concrete
  nouns, direct verbs, and consistent technical terms. Do not replace clear
  language with dense shorthand merely to reduce length.
- Preserve constraints, exceptions, risks, and causal relationships. Use examples
  when they remove ambiguity, demonstrate intended use, or clarify an important
  edge case. Do not introduce claims unsupported by the source material.
- Avoid accidental repetition. Repeat critical information only when it improves
  safety, local comprehension, or a section's ability to stand alone.
- When revising, preserve the intended meaning, tone, and scope. Remove filler,
  empty transitions, excessive hedging, repeated conclusions, and unnecessary
  restatement.
- Make code comments explain intent, rationale, invariants, constraints,
  assumptions, or non-obvious behavior. Do not narrate operations already clear
  from the code.
- Omit trailing periods in single-sentence list items, even when they are
  complete sentences
- Never use an em dash (U+2014). Prefer a comma, colon, parentheses, or a separate
  sentence. Use the ASCII hyphen-minus (`-`) only where a hyphen is appropriate.

Before returning substantial technical text, verify that the important point
appears early, the structure is proportionate, the wording is concrete, no useful
qualification or explanation was removed, and no removable filler remains.
