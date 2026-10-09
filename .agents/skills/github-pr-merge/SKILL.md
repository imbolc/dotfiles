---
name: github-pr-merge
description: "Merge GitHub PR and delete worktree"
---

- Delete the plan file from the branch
- Merge the PR into `main`
- In the original worktree, update local `main` with

  ```sh
  git fetch origin main
  git merge --ff-only FETCH_HEAD
  ```

- Delete the git worktree
- Delete remote PR branch
