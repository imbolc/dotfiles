---
name: review-loop
description: Run repeated Codex CLI branch reviews, address valuable findings, and track severity-based streaks for a model and reasoning-effort matrix. Use for iterative local review loops, not single reviews or GitHub review polling.
---

Reviewer models:

```csv
model,reasoning effort
gpt-6.1-sol,high
gpt-6.1-sol,xhigh
gpt-6.1-sol,max
```

Delete `./var/review/result.csv` if not absent. For each reviewer model run the
loop:

- Run another agent using the following command and wait for the result. It
  could take quite a bit depending on the branch size. Never read
  `./var/review/stderr` during the review to save tokens, read it only on error
  status. The review itself will be in `./var/review/stdout`.

  ```sh
  /home/imbolc/.agents/skills/review-loop/scripts/codex-reviewer \
      "<reviewer model>" "<reviewer reasoning effort>"
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
