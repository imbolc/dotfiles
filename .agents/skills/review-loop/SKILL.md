---
name: review-loop
description: Review in a loop
---

# review-loop <target>

Targets:

- `branch` => `Review changes of the current branch`
- `uncommitted` => `Review uncommitted changes`
- `commit` => `Review the last commit`
- `repo` => `Review whole repo`

Any other target is used as the review instruction.

Reviewer models:

```csv
model,reasoning effort
gpt-6.1-sol,high
gpt-6.1-sol,xhigh
gpt-6.1-sol,max
```

Delete `./var/review` if not absent. For each reviewer model run the
loop:

- Run an agent using the following command and wait for the result. It
  could take quite a bit depending on the review size. Never read
  `./var/review/stderr` during the review to save tokens, read it only on error
  status. The review itself will be in `./var/review/stdout`.

  Resolve `scripts/codex-reviewer` relative to this skill's directory. Run it
  from the project directory.

  ```sh
  "<skill directory>/scripts/codex-reviewer" \
      "<reviewer model>" "<reviewer reasoning effort>" "<target>"
  ```

- Evaluate its review. For each valuable finding, assign a severity: high,
  medium or low.
- Address every valuable finding of the review and commit
- Update the streak based on the highest-severity valuable finding:
  - high: reset streak to 0
  - medium: leave streak unchanged
  - low or no valuable findings: increment streak
- Write into `./var/review/result.csv` (don't commit it):
  - timestamp
  - model used (e.g. `sol-high`)
  - number of valuable findings
  - highest severity
  - streak
- Repeat until the streak reaches 3, then start the loop using the next reviewer
  model
