# Architecture Overview

## Purpose

The project will provide a declarative, reproducible, and secure way to set up
Windows development environments. It begins with one machine but is intended
to support more machines and developers without encoding one user's identity
in the implementation.

No new provisioning engine exists yet. This document defines boundaries for
future decisions; it does not select an implementation architecture.

## Intended Capabilities

- A global configuration describing default desired state.
- Local configuration that inherits from and explicitly overrides the global
  configuration.
- Desired states such as `install` and `uninstall`.
- Dependencies between components.
- Package providers such as WinGet and Chocolatey.
- Self-contained installers for exceptional cases.
- Windows properties such as `PATH`.
- Selective relocation of user folders to a data drive.
- Backup and restoration of state that cannot be reproduced from declarations.
- Future integration with Kopia.
- Small Windows utilities independent of provisioning.

## Conceptual Boundaries

```text
configuration
    -> planning and dependency resolution
        -> providers and Windows adapters
            -> operating system state

non-reproducible state
    -> backup and restore

independent utilities
    -> standalone tools
```

- Configuration MUST remain independent from provider-specific commands.
- Planning MUST NOT perform system mutations.
- Providers and adapters MUST own external system mutations.
- Backup data MUST remain outside version control.
- Independent utilities SHOULD avoid coupling to the provisioning engine.

These boundaries describe responsibilities, not a required directory layout or
runtime design.

## Legacy Boundary

`_old/` is an immutable reference area in normal development. Content there
may contain obsolete assumptions, unsafe commands, machine-specific values,
and unsupported APIs.

- New code MUST NOT import or execute legacy code directly.
- A legacy behavior MAY be reimplemented only after its current value and
  security properties are reviewed.
- Migration SHOULD preserve intent, not incidental implementation details.

## Open Decisions

- Configuration format and schema.
- Merge and override semantics for global and local configuration.
- Component identity, dependency representation, and cycle handling.
- Provider selection and fallback behavior.
- Planning, execution, rollback, and idempotency guarantees.
- Supported Windows and PowerShell versions.
- State and audit-log storage.
- Kopia integration boundaries.
- Packaging and distribution of independent utilities.
