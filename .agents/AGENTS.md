# Global agent guidelines

## Tool permissions

- Assume the user may not be available to approve permission prompts. Before
  requesting permission, prefer a safe, in-scope, already-approved command that
  achieves the same goal, even if it uses a different approach or produces
  different output. Do not modify an approved command in a way that unnecessarily
  requires new approval; for example, prefer an approved full test suite over an
  unapproved targeted test.
- Before the first permission request, identify every foreseeable operation in
  the current task that needs the same permission. Batch those operations into
  one request when they can run safely together, and list the full scope in that
  request. Do not request the same permission separately for items already known,
  such as querying one dependency at a time.

## External data

- Separate remote acquisition from local processing. If a remote response may
  be searched, parsed, or inspected more than once, save it to a task-specific
  temporary file on the first request and reuse that file. Re-fetch only when
  freshness is required, the response varies by request, the source streams
  data, or storing it would expose sensitive data.

## Technical writing

Apply these defaults when writing or revising developer-facing technical text,
including documentation, explanations, code comments, design notes, pull request
descriptions, reviews, commit messages, runbooks, and instructions. Follow
explicit user requirements and established repository or document conventions.
Preserve text that must remain verbatim.

Optimize in this order:

1. Technical accuracy and task-relevant completeness
2. Comprehension
3. Findability while skimming
4. Brevity

Never sacrifice the first three goals for brevity.

- Lead with the answer, action, decision, or most important information. Put
  background, rationale, and qualifications later. Do not restate the request or
  add an introduction that carries no useful information.
- Organize around reader questions and tasks, not the author's thought process.
  Keep related information together and put optional or specialized detail after
  the information most readers need.
- Use only as much structure as the material warrants. Use descriptive headings
  when they improve navigation, prose for reasoning, bullets for parallel items,
  numbered lists for ordered steps, and tables when repeated attributes make a
  comparison materially easier to scan.
- Write for the target reader's knowledge and immediate task. Prefer concrete
  nouns, direct verbs, and consistent technical terms. Do not replace clear
  language with dense shorthand merely to reduce length.
- Preserve constraints, exceptions, risks, and causal relationships. Use examples
  when they remove ambiguity, demonstrate intended use, or clarify an important
  edge case. Do not introduce claims unsupported by the source material.
- Avoid accidental repetition. Repeat critical information only when it improves
  safety, local comprehension, or a section's ability to stand alone.
- When revising, preserve the intended meaning, tone, and scope. Remove filler,
  empty transitions, excessive hedging, repeated conclusions, and unnecessary
  restatement.
- Make code comments explain intent, rationale, invariants, constraints,
  assumptions, or non-obvious behavior. Do not narrate operations already clear
  from the code.
- Never use an em dash (U+2014). Prefer a comma, colon, parentheses, or a separate
  sentence. Use the ASCII hyphen-minus (`-`) only where a hyphen is appropriate.

Before returning substantial technical text, verify that the important point
appears early, the structure is proportionate, the wording is concrete, no useful
qualification or explanation was removed, and no removable filler remains.
