---
name: github-pr-address-review-loop
description: "Loop addressing GitHub PR reviews"
---

# github-pr-address-review-loop [pr_id]

1. Use the supplied `pr_id`, or resolve it from the conversation or current
   branch. Ask only if the target is missing or ambiguous
2. Start the clean-review streak at zero. Run
   `$github-pr-address-review <pr_id>` immediately, then every 5 minutes without
   overlapping runs
3. After each run, process each new reviewer report once, oldest first:
   - Accepted or rejected findings: reset the streak to zero
   - Explicitly no new findings: increment the streak
   - No new report or no explicit review result: leave the streak unchanged
4. Include the streak in each cycle's chat update. Stop on user request, or
   when the streak reaches three after processing all new reports. Otherwise,
   keep the loop active between runs
