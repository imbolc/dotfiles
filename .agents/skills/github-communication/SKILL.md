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
- Reuse prefixes approved in the current session
- Preserve approved Git subcommand prefixes too: `git -c ... commit` does not
  match `git commit`. When skipping hooks is already justified and required
  checks have passed separately, use `git commit --no-verify` instead of
  `git -c core.hooksPath=/dev/null commit`
- Run `gh` directly as a standalone command. Do not attach shell redirection,
  pipes, command substitutions, environment assignments, or shell wrappers.
  These can prevent matching an approved prefix and trigger another prompt
- Save captured stdout separately and reuse it for further inspection
- For multiline comments and PR descriptions, write the body locally first,
  then pass its path with `--body-file`. Keep file creation separate from `gh`
