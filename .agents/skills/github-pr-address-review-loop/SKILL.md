---
name: github-pr-address-review-loop
description: "Loop addressing GitHub PR reviews"
---

# github-pr-address-review-loop [pr_id]

- Use the supplied `pr_id` when provided; otherwise resolve the current PR from
  the conversation or the current branch
- Ask for the PR ID only if the target is missing or ambiguous
- Run `$github-pr-address-review <pr_id>` immediately, then every
  5 minutes. Do not overlap runs
- Start a clean-review streak at zero and track which reviewer reports have
  already been processed. Never count the same report twice
- After each run, process fresh reviewer reports in chronological order:
  - A report with accepted or rejected findings resets the streak to zero
  - A report explicitly stating there are no new findings increments the streak
  - No new reports, or reports without an explicit review result, leave the
    streak unchanged. Continue waiting and checking
- Include the current streak in each cycle's chat update
- Stop when the streak reaches three after processing all fresh reports, or
  when the user asks to stop. Keep the loop active between runs; silence from
  reviewers is not completion
