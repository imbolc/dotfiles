# Global agent guidelines

## Tool permissions

- Default to sandbox execution (`use_default`). Decide permissions separately
  for each command; never copy escalation settings from another tool call
- Before escalating, check the exact command against the current session's
  approved prefixes. Preserve matching prefixes; approval for one subcommand
  does not imply approval for another
- Assume the user may be unavailable. If no approved prefix applies, try the
  sandbox first. Request new approval only after an actual access restriction
  and checking for a safe, in-scope, already-approved alternative. Prefer that
  alternative even if its approach or output differs, such as an approved full
  test suite instead of an unapproved targeted test
- Follow `tmp-files-cleanup` for temporary-file cleanup; never request cleanup
  permission or escalation
- Before the first permission request, identify all foreseeable operations in
  this task needing that permission. Batch those safe to run together, state
  the full scope, and reuse the approval. For goal or unattended workflows, plan
  before the loop for every iteration, model and completion step. Request more
  permission only for unforeseen operations with no safe, in-scope, approved alternative

## GitHub

- Before communicating with GitHub, read the global `github-communication`
  skill

## External data

- Separate remote acquisition from local processing. If a remote response may
  be searched, parsed, or inspected more than once, save it to a task-specific
  temporary file on the first request and reuse that file. Re-fetch only when
  freshness is required, the response varies by request, the source streams
  data, or storing it would expose sensitive data.

## Technical writing

Before writing or revising developer-facing technical text, including answers to
technical questions in chat, load and follow the global `technical-writing`
skill. This includes documentation, explanations, code comments, design notes,
pull request descriptions, reviews, commit messages, runbooks, and instructions.
