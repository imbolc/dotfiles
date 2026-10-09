---
name: github-plan-update
description: "Update GitHub plan"
---

# github-plan-update [issue_id]

- Use the supplied `issue_id` when provided; otherwise resolve the current issue
  from the conversation or the issue linked to the current branch's PR
- Ask for the issue ID only if the target is missing or ambiguous

The first issue message contains implementation plan. Your job is to
integrate relevant findings from the comments into the plan. Loop, processing
one comment completely before moving to the next, so the integration progress
isn't lost if you stop at any point. Update the plan before replacing the
corresponding comment body.

- Read the first unprocessed comment
- If the comment reports no new findings or is already integrated - loop to the
  next comment
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
