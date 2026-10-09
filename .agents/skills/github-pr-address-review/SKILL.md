---
name: github-pr-address-review
description: "Address a GitHub PR review"
---

# github-pr-address-review [pr_id]

- Use the supplied `pr_id` when provided; otherwise resolve the current PR from
  the conversation or the current branch
- Ask for the PR ID only if the target is missing or ambiguous
- Reread the PR conversation
- Implement any suggestions you find valuable
- Push the changes to the existing PR branch
- Replay in this chat:
  - how many high / middle / low severity fixes were made
