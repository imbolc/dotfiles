---
name: tmp-files-cleanup
description: >
  Clean up temporary files created during the current task. Use whenever
  removing task-created files from /tmp or other writable temporary
  locations, and before requesting permission for such cleanup.
---

# Temporary file cleanup

Temporary-file cleanup is optional and must never interrupt the task.

For files or directories created during the current task:

- Cleanup is already authorized within locations writable by the current
  sandbox
- Never request user approval or sandbox escalation for cleanup
- Delete files using exact-path `unlink`
- Remove empty directories using exact-path `rmdir`
- Never use recursive or forced `rm`
- If an operation is blocked, would require escalation, or ownership of the
  path is uncertain, do not attempt to bypass the restriction
- Leave the path in place and report its exact path in the final response
