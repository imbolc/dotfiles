---
name: optimize-agents-md
description: >-
  Create, review, or reduce AGENTS.md files and other persistent agent
  instructions. Use when optimizing instruction scope, hierarchy, compliance,
  maintainability, or recurring context cost. Do not use for ordinary project
  documentation or one-off prompts.
---

# Optimize AGENTS.md

Optimize in this order:

1. Correct agent behavior
2. Unambiguous instruction scope
3. Human maintainability
4. Context-token cost

Use `AGENTS.md` for persistent instructions and only the project context needed
to apply them. Keep general project documentation elsewhere.

## Establish scope and authority

- Determine whether the user requested review only or authorized edits.
- Do not modify files when the user requested only review or recommendations.
- Identify the instruction format and its discovery and precedence rules.
- Discover every accessible global, root, nested, fallback, and override
  instruction file that can affect the target scope.
- Account for inherited instructions before treating repeated text as redundant.
- Preserve deliberate overrides, exceptions, and narrower local rules.
- For non-Codex instruction formats, determine their actual discovery rules
  instead of assuming they behave like `AGENTS.md`.

## Keep only behavior-changing information

Include content only if it can change an agent decision or action, or is
necessary to interpret another instruction.

Remove or relocate:

- project descriptions the agent can reliably infer from canonical files;
- explanations of standard tools or conventions;
- instructions already guaranteed by higher-priority behavior;
- duplicated rules that do not narrow or override inherited guidance;
- generic advice such as "write clean code";
- information available more precisely from a canonical source.

Do not remove project context that is necessary to choose the correct action.

## Make rules directly actionable

- Write rules as short imperatives.
- State the required action, constraint, or prohibition explicitly.
- Prefer exact commands, paths, names, and conditions over descriptive prose.
- Use consistent terminology.
- Use `MUST`, `NEVER`, or similar emphasis only when violation is especially
  costly.
- Replace vague terms such as "appropriate", "properly", "carefully", or "when
  possible" with explicit conditions.
- Keep rationale only when it changes how an agent interprets or applies a rule.

## Scope instructions narrowly

Keep each rule at the narrowest scope where it always applies.

- Put user-wide defaults in the global instruction file.
- Put repository-wide rules in the repository root `AGENTS.md`.
- Put directory-specific rules in the closest applicable nested instruction
  file.
- Use override files only when replacement, rather than inheritance, is
  intentional.
- Do not repeat inherited rules unless the local rule narrows, overrides, or
  clarifies them.
- Reference a canonical document only when conditional loading saves context
  without weakening compliance.

## Identify skill candidates

A section may belong in a local skill when it:

- applies only to a specific kind of task;
- defines a reusable multi-step workflow;
- contains specialized domain knowledge or tool instructions;
- requires scripts, references, templates, or other supporting resources;
- is irrelevant to most tasks and has meaningful context cost.

Each time such a section is found, ask the user whether to split it into a local
skill. Ask separately for each materially distinct candidate.

Include in the question:

- the section being considered;
- why conditional skill loading is preferable;
- the proposed skill name and scope;
- the short trigger or pointer that would remain in the instruction file.

Do not move, delete, or rewrite the section as a skill until the user agrees. If
the user declines, retain the section and optimize it in place.

Do not propose a skill for a short preference or constraint that should apply to
nearly every task.

## Optimize for recognition

- Group rules by the action they affect.
- Use short, descriptive headings such as `Build and test`, `Rust`, `Database`,
  `Shell`, or `Generated files`.
- Put the most frequently applicable and consequential rules first.
- Keep related rules together.
- Avoid narrative transitions between rules.
- Remove a heading when it adds no navigation value.

## Use examples selectively

- Include an example only when the rule remains ambiguous without it.
- Prefer one concrete example over a longer abstract explanation.
- Do not include multiple examples that demonstrate the same rule.
- Ensure examples clarify the rule rather than silently adding new requirements.

## Review workflow

1. Establish whether the task is review-only or permits editing.
2. Discover the applicable instruction chain and precedence rules.
3. Validate commands, paths, terminology, and assumptions against canonical
   project sources.
4. Classify each section as keep, rewrite, relocate, extract, or remove.
5. Ask about every applicable local-skill candidate before changing it.
6. Apply only authorized changes.
7. Compare the original and revised behavioral requirements.
8. Verify that commands, paths, references, overrides, and skill triggers remain
   correct.
9. Report material removals, relocations, extractions, and unresolved conflicts.
