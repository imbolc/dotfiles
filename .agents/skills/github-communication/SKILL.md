---
name: github-communication
description: >-
  Use when reading or updating GitHub issues, pull requests, reviews, comments,
  or other GitHub API resources.
---

# GitHub communication

- Check that `gh` is installed with `gh --version`. If it is unavailable, stop
  the task and report that the GitHub CLI is missing. Do not install it or
  substitute another tool without the user's instruction
- Prefer `gh pr` and `gh issue` when they expose all required information. Use
  `gh api` only for information those commands cannot provide, such as inline
  review comments
- For PR discussions, start with `gh pr view <number> --json comments,reviews`
  or `gh pr view <number> --comments`. Query inline review comments only when
  those results do not provide the information needed
- Reuse prefixes approved in the current session. Before requesting additional
  access, check for an already-approved alternative that provides equivalent
  information, subject to the environment's permission rules
- For `gh api`, omit query strings when the endpoint and `--paginate` suffice.
  A `?` in the command can prevent an approved prefix from matching
- Preserve approved Git subcommand prefixes too: `git -c ... commit` does not
  match `git commit`. When skipping hooks is already justified and required
  checks have passed separately, use `git commit --no-verify` instead of
  `git -c core.hooksPath=/dev/null commit`
- Run `gh` directly as a standalone command. Do not attach shell redirection,
  pipes, command substitutions, environment assignments, or shell wrappers.
  These can prevent matching an approved prefix and trigger another prompt
- Save captured stdout separately. Reuse saved responses before making another
  request unless freshness is required
- For multiline comments and PR descriptions, write the body locally first,
  then pass its path with `--body-file`. Keep file creation separate from `gh`
