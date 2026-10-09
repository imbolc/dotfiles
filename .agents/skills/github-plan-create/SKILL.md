---
name: github-plan-create
description: "Create an implementation plan for a GitHub issue"
---

# github-plan-create <issue_id>

- Use [tmux-rename-window](../tmux-rename-window/SKILL.md) with `plan<issue_id>`
- Review issue #<issue_id> and its discussion
- Create an implementation plan for a less capable agent to follow
- Make sure the plan is unambiguous and leaves no open questions for the
  implementer
- Define a rigid scope to prevent the implementation from growing during review
- Add the plan to the first issue message

If you can't resolve some parts yourself or are sure they require my approval,
stop and ask questions one at a time. Phrase them simply from the user's
perspective, avoid excessive technical details, explain the trade-offs clearly,
and mark the recommended option.
