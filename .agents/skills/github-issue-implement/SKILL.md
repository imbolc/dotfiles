---
name: github-issue-implement
description: "Implement a GitHub issue in a worktree and open a PR"
---

# github-issue-implement <issue_id>

- Use [tmux-rename-window](../tmux-rename-window/SKILL.md) with `impl<issue_id>`
- Work on issue #<issue_id> in a separate Git worktree with a dedicated branch
- Ask all questions you can identify that require my attention **before** you
  start making any changes. After that, proceed independently using reasonable
  assumptions, only ask additional questions if genuinely blocked
- Create the worktree under `./var/worktrees/`
- Do all implementation and testing inside the new worktree
- Do not modify files or switch branches in the current worktree
- Leave the worktree in place when finished
- Create and commit `./pr-plan.md` with only content being the full step
  checklist, using `[.]` for in progress items
- Follow the plan to completion, committing each logical completed step and
  keeping the plan in sync
- When possible run benchmarks in parallel to save time
- Once implementation and testing are complete, push the branch and open a PR
  against `main`. The PR must fully address and close the issue.
- Use [tmux-rename-window](../tmux-rename-window/SKILL.md) with
  `i<issue_id>p<pr_id>`
