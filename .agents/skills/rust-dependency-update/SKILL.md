---
name: rust-dependency-update
description:
  Update Rust workspace dependencies to latest release-compatible versions while
  preserving repository conventions. Use when the user asks to update Rust deps,
  bump Cargo crates, refresh Cargo.lock, move crates to latest versions, or
  review/fix fallout from Rust dependency upgrades.
---

# Rust Dependency Update

## Workflow

1. Read target repository instructions first and follow their documented
   dependency, formatting, and check commands.
2. Inspect the current worktree before editing. If there are uncommitted
   changes, ask the user whether to proceed. Do not revert unrelated user
   changes.
3. Update direct dependencies in workspace manifests to latest stable releases.
   Treat `Cargo.lock` packages as transitive unless they are also direct
   dependencies.
4. Preserve each existing `Cargo.toml` version style:
   - Keep major-only requirements major-only when the latest version is in the
     same major line, e.g. `walkdir = "2"`.
   - Keep minor-style requirements minor-style, e.g. `crate = "0.12"` can become
     `crate = "0.13"`.
   - Keep patch-style requirements patch-style when the manifest already uses
     that precision.
   - Do not replace broad existing requirements with exact patch versions just
     because a patch release exists.
5. Allow stable direct crates to pull prerelease transitive crates. Do not
   reject those lockfile entries solely because they are prerelease.
6. Refresh `Cargo.lock` with Cargo commands; do not hand-edit lockfile contents.
7. Fix only compile/test fallout caused by the dependency update. Keep source
   changes surgical.
8. Run required checks and make them pass unless blocked by missing external
   state.
