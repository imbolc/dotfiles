---
name: review-branch
description:
  Explicitly invoked review of the current Git branch against the repository's
  main branch that reports only actionable issues. Use only when the user
  manually invokes `$review-branch`; never select it implicitly.
---

# Review Branch

Read and follow [shared review rules](../review-rules.md).
Complete their preflight before inspecting the review target.

## Review Target

Determine the repository's main branch from local Git configuration and refs,
preferring the configured remote default branch, then `main`, then `master`. Do
not fetch or mutate refs.

Require the current branch to differ from the main branch. If it does not,
report that there is no branch diff to review and stop.

Review the committed branch diff from the merge base through `HEAD`. Do not
silently substitute the latest commit or include unrelated uncommitted changes.
Read enough surrounding and related code to validate the change in context.
