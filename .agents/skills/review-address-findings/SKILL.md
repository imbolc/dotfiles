---
name: review-address-findings
description:
  Validate and address findings recorded in the repository-root `.review.md`,
  apply agreed fixes, explain rejected findings, retain unresolved work, and
  remove resolved entries. Use when the user asks to apply, fix, resolve, or
  respond to an existing review produced by a review skill.
---

# Address Review Findings

## Preflight

Resolve the repository root and read its development instructions.

Require `.review.md` at the repository root. If it does not exist, report that
there are no review findings to address and stop.

Read the review and preserve each finding's ID. Inspect the current worktree
before editing and preserve unrelated user changes.

## Evaluate and Apply

Validate every finding against the current code and relevant surrounding
context. Do not assume the review is correct or current.

Classify each finding as:

- `Applied`: agree with it, implement the minimum appropriate fix, and verify
  the fix.
- `Rejected`: disagree because the finding is incorrect, stale, or would make
  the code worse; record a concrete explanation.
- `Blocked`: cannot safely finish it without user input, access, or successful
  verification; record the blocker.

Follow repository conventions and instructions while editing. Make only changes
needed for accepted findings. Do not refactor adjacent code, stage changes, or
commit them.

Run the repository's required formatting and verification checks. Treat a fix
as `Applied` only after the relevant checks pass. Do not hide or bypass failing
checks.

## Maintain the Review Queue

After verification, remove every `Applied` finding from `.review.md` without
asking. Remove category headings that become empty, but otherwise preserve the
remaining review text and finding IDs verbatim.

If no findings remain, delete `.review.md` without asking.

If rejected findings remain, keep them in `.review.md`, explain each rejection
in the final report, and ask whether to delete the file only when no blocked
findings remain.

If blocked findings remain, keep them in `.review.md`, report what is needed,
and ask the specific question required to continue. Do not ask to delete the
file while actionable blocked findings remain.

Treat invocation of this skill as authorization to update or delete only the
repository-root `.review.md` according to these rules; do not ask for file-write
confirmation. If the environment blocks that operation, report the block and
stop without requesting elevated access.

## Report

Report every original finding ID with its `Applied`, `Rejected`, or `Blocked`
status. Summarize verification results and whether `.review.md` was updated,
deleted, or retained.
