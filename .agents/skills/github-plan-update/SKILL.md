---
name: github-plan-update
description: "Update GitHub plan"
---

# github-plan-update [issue_id]

- Use the supplied `issue_id` when provided; otherwise resolve the current issue
  from the conversation or the issue linked to the current branch's PR
- Ask for the issue ID only if the target is missing or ambiguous
- Read the issue discussion
- Include any valuable new findings from the discussion that are within the
  issue's scope in the implementation plan in the issue description
- Check whether the reviewers understand the issue's scope. If not, update the
  initial issue description to make the scope rigid enough
