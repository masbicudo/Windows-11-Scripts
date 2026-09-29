# Configuration Policy

## Principles

- Configuration MUST express desired end state.
- Configuration MUST NOT encode a chronological migration procedure.
- Global configuration MUST define defaults shared by applicable machines.
- Local configuration MUST inherit from global configuration.
- Local overrides MUST be explicit and discoverable.
- Provider credentials and other secrets MUST NOT appear in configuration.
- Machine-specific values SHOULD be isolated from reusable component
  definitions.
- Unknown properties and invalid states MUST produce actionable errors.

## Expected Model

The future model is expected to represent intent similar to this non-binding
example:

```yaml
components:
  git:
    state: install
    provider: winget
  obsolete-tool:
    state: uninstall
```

The syntax is illustrative only. YAML, property names, and provider selection
have not been chosen.

## Composition

The system must eventually combine a global configuration with a local one.
The exact merge algorithm remains open.

Before implementation, the project must decide:

- whether collections merge or replace;
- how a local configuration removes an inherited value;
- whether provider choice is configuration or planning policy;
- how conflicts and dependency cycles are reported;
- how configuration versions and schema evolution work.

No implementation SHOULD establish these semantics accidentally.
