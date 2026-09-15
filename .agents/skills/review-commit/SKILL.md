---
name: review-commit
description:
  Explicitly invoked review of one Git commit that reports only actionable
  issues. Use only when the user manually invokes `$review-commit`; never
  select it implicitly.
---

# Review Commit

Read and follow [shared review rules](../review-rules.md).
Complete their preflight before inspecting the review target.

## Review Target

Review the commit or revision specified by the user. If none is specified,
review `HEAD`. Resolve it to exactly one commit and report an invalid or
ambiguous revision instead of guessing.

Review that commit's complete patch, including all parents needed to understand
the change. Handle a root commit as a diff against an empty tree. Do not include
later commits, unrelated branch changes, or uncommitted worktree changes. Read
enough surrounding and related code to validate the commit in context.
