---
name: review-repo
description:
  Explicitly invoked review of the whole current repository that reports only
  actionable issues. Use only when the user manually invokes `$review-repo`;
  never select it implicitly.
---

# Review Repository

Read and follow [shared review rules](../review-rules.md).
Complete their preflight before inspecting the review target.

## Review Target

Review the entire tracked codebase in the current worktree, including tests,
configuration, scripts, and documentation relevant to correctness. Do not limit
the review to Git changes. Exclude `.git`, ignored build output, vendored
dependencies, and generated files unless repository instructions explicitly
make them review targets.

Start with repository instructions and architecture, then inspect components and
their interactions systematically.
