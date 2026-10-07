---
name: tmux-rename-window
description: Use only in Codex when requested Tmux window naming.
---

# tmux-rename-window <window_name>

Rename the window containing this conversation to the requested literal name.

1. Treat `TMUX` and `TMUX_PANE` as hints. Tool commands may inherit them from
   a detached Codex app-server; a pane ID can be stale or belong to another
   conversation even when it still exists. Do not use the active pane or working
   directory alone as proof of ownership.

2. Enumerate live panes on the relevant tmux server:

   ```sh
   tmux list-panes -a -F '#{pane_id} #{pane_pid} #{pane_tty} #{pane_current_path} #{pane_title}'
   ```

   Use a user-specified pane when provided. Otherwise, find an unambiguous match
   for this conversation's title and project context, then confirm the
   terminal-attached Codex client's process ancestry or controlling terminal
   matches that pane's `pane_pid` or `pane_tty`. Inspect the client, not a
   detached backend running tool commands. If sandboxing hides the processes or
   denies socket access, follow the session's execution-permission rules; an
   access error does not establish that tmux is absent.

3. If ownership is ambiguous, ask which pane to use and continue independent
   work in the calling workflow while waiting. Do not guess. If tmux is
   unavailable or no server is running, report that the rename was skipped and
   continue the calling workflow.

4. Retain the verified server, pane ID, and client/terminal identity for later
   renames in this conversation. Recheck that identity before each rename.
   A later worktree change or conversation-title change does not require
   switching panes.

5. Run the rename with the verified pane ID and requested name as separate,
   safely quoted arguments on the same server:

   ```sh
   tmux rename-window -t <verified-pane-id> <window_name>
   ```

   Verify the result on that pane:

   ```sh
   tmux display-message -p -t <verified-pane-id >'#{window_name}'
   ```

   Report any failure accurately; do not claim the window was renamed without
   confirmation.
