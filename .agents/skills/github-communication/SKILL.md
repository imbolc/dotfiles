---
name: github-communication
description: >-
  Use when reading or updating GitHub issues, pull requests, reviews, comments,
  or other GitHub API resources.
---

# GitHub communication

- Prefer available connected GitHub tools when they provide the required data
  and operations. Use `gh` for missing capabilities, unavailable connections, or
  explicitly requested CLI/script workflows only if it's installed, don't
  install it yourself

## CLI fallback

- For PR discussions, start with `gh pr view <number> --json comments,reviews`
  or `gh pr view <number> --comments`. Query inline review comments only when
  those results do not provide the information needed
- Reuse prefixes approved in the current session. Before requesting additional
  access, check for an already-approved alternative that provides equivalent
  information, subject to the environment's permission rules
- For `gh api`, omit query strings when the endpoint and `--paginate` suffice.
  A `?` in the command can prevent an approved prefix from matching. Do not
  combine `--slurp` with `--jq` or `--template`; filter paginated output without
  `--slurp`, or save slurped JSON and process it locally
- Preserve approved Git subcommand prefixes too: `git -c ... commit` does not
  match `git commit`. When skipping hooks is already justified and required
  checks have passed separately, use `git commit --no-verify` instead of
  `git -c core.hooksPath=/dev/null commit`
- Run `gh` directly as a standalone command. Do not attach shell redirection,
  pipes, command substitutions, environment assignments, or shell wrappers.
  These can prevent matching an approved prefix and trigger another prompt
- Save captured stdout separately from the `gh` command
- For multiline comments and PR descriptions, write the body locally first,
  then pass its path with `--body-file`. Keep file creation separate from `gh`
