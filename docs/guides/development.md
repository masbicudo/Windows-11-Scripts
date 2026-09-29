# Development Guide

## Current Phase

The repository is establishing governance and documenting decisions.

- Do not implement a new provisioning engine during this phase.
- Do not convert legacy scripts in bulk.
- Record undecided behavior under an `Open Decisions` section.
- Prefer the smallest document that captures a known requirement.

## Change Workflow

1. Read `AGENTS.md` and the documents governing the affected area.
2. Check the working tree and preserve unrelated user changes.
3. Identify whether the change introduces or resolves an architectural
   decision.
4. Update normative documentation before or with the implementation.
5. Add focused tests for stable behavior and important invariants.
6. Run relevant static checks and tests.
7. Commit one coherent intention at a time.

## Implementation Expectations

- New behavior SHOULD be idempotent where the underlying system permits it.
- Diagnostics SHOULD explain the failed component, desired state, provider,
  and safe recovery action.
- Platform assumptions MUST be explicit and testable.
- Provider-specific behavior SHOULD be isolated behind declared interfaces.
- Tests MUST NOT require real credentials.
- Tests SHOULD avoid mutating the developer's machine.

## Documentation Style

- Write governance and documentation in English.
- Keep sections short and use examples for concrete behavior.
- Use BCP 14 terms only for genuinely normative statements.
- Avoid empty placeholder documents.
- Link to the governing rule instead of duplicating it.

## Commit Guidance

Commit messages should explain intent. Mass file movement should remain
separate from semantic edits so Git can recognize history accurately.

Examples:

```text
Archive the legacy Windows scripts baseline
Define repository governance and decision boundaries
Document configuration override semantics
```
