# Global agent guidelines

## Tool permissions

- Assume the user may not be available to approve permission prompts. Before
  requesting permission, prefer a safe, in-scope, already-approved command that
  achieves the same goal, even if it uses a different approach or produces
  different output. Do not modify an approved command in a way that unnecessarily
  requires new approval; for example, prefer an approved full test suite over an
  unapproved targeted test.
