# Documentation

This directory records the project's architecture, policies, and working
guides. `AGENTS.md` is the repository constitution and has higher authority;
these documents specialize its rules by subject.

## Structure

```text
docs/
├── architecture/   Stable boundaries, responsibilities, and open decisions
├── policies/       Normative requirements for configuration and security
└── guides/         Procedures for developing and validating changes
```

Current documents:

- [Architecture overview](architecture/overview.md)
- [Configuration policy](policies/configuration.md)
- [Security policy](policies/security.md)
- [Development guide](guides/development.md)

## Adding Documentation

- Put cross-cutting, fundamental rules in `AGENTS.md` only when agents must
  consult them frequently.
- Put architectural boundaries and decisions under `architecture/`.
- Put mandatory subject-specific behavior under `policies/`.
- Put repeatable procedures and examples under `guides/`.
- Create a new document only when an existing document would become ambiguous
  or cover unrelated concerns.
- Link new documents from this index and from the nearest governing document.

## Overlap and Conflicts

More specific documents may refine broader documents but may not contradict
them. The authority order is defined in `AGENTS.md`.

When two same-level documents overlap:

1. Identify the conflicting statements.
2. Stop work that depends on choosing one interpretation.
3. Propose one owner for the rule and update cross-references.
4. Resume implementation only after the conflict is resolved.
