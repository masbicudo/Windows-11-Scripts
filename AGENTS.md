# Repository Constitution

## Normative Language

- The key words MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY are normative only
  when written in uppercase, as defined by RFC 2119 and RFC 8174 (BCP 14).
- MUST and MUST NOT apply only to requirements that admit no valid exception.

## Authority

- Rules follow this authority order:

  ```text
  AGENTS.md
      -> docs/architecture, docs/policies, docs/guides
      -> declared configuration and interfaces
      -> implementation
      -> tests
  ```

- A lower-level rule MUST NOT contradict a higher-level rule.
- When same-level rules conflict, work MUST stop until the conflict is made
  explicit and a resolution is proposed.
- Code comments MUST NOT introduce hidden architectural rules.
- Tests SHOULD verify important normative properties.

## Project Boundaries

- New work MUST support a declarative, reproducible, and secure Windows
  development environment.
- Legacy content under `_old/` MUST be treated as historical reference, not as
  approved design or safe executable code.
- Independent Windows utilities MAY coexist with the provisioning system.
- The RAPM secret broker is outside this repository's current scope.

## Architecture

- Components MUST follow `docs/architecture/overview.md`.
- Undecided architecture MUST remain explicit instead of being invented during
  implementation.
- Historical behavior MUST NOT become a new requirement without justification.

## Configuration

- Configuration MUST follow `docs/policies/configuration.md`.
- Configuration MUST describe desired state rather than migration history.

## Security

- Secrets and privileged operations MUST follow `docs/policies/security.md`.
- Secrets MUST NOT be committed, logged, or embedded in examples.

## Development

- Changes MUST follow `docs/guides/development.md`.
- Documentation and declared interfaces MUST be updated before or with code
  that changes their behavior.
- Repository governance and documentation MUST be written in English.
