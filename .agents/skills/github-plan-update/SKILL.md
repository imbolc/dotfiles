---
name: github-plan-update
description: "Update GitHub plan"
---

# github-plan-update [issue_id]

## Preflight

- Use the supplied `issue_id` when provided; otherwise resolve the current issue
  from the conversation or the issue linked to the current branch's PR
- Ask for the issue ID only if the target is missing or ambiguous
- Use [tmux-rename-window](../tmux-rename-window/SKILL.md) with `plan<issue_id>`

## Goal

The first issue message contains implementation plan. Your job is to integrate
relevant findings from the comments into the plan.

## Ensure the plan is relevant

Check the current plan and ensure it's still relevant to the `main` code branch.

## Integrate findings

Loop, processing one comment completely before moving to the next, so the
integration progress isn't lost if you stop at any point. Update the plan before
replacing the corresponding comment body.

- Read the first unprocessed comment
- Leave comments that only report no new findings unchanged, and skip comments
  whose entire body is already a status marker
- If the comment contains any new relevant findings that are within the issue's
  scope - integrate them into the first message plan and replace the comment
  body with `integrated into plan` text
- If the comment contains no new findings replace its body with
  `rejected: no new findings`
- If the comment is out of the issue scope replace it body with
  `rejected: out of scope`. Ask yourself - why did the commenter didn't
  understand the scope? If you find the issue scope isn't rigid enough update
  its description in the first issue message.
- Loop until there's no unprocessed comments left
- Report how many comment's are integrated / rejected
