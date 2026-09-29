# Security Policy

## Secrets

- Secrets MUST NOT be committed to Git.
- Secrets MUST NOT be printed to console output, transcripts, or test logs.
- Examples MUST use obvious placeholders rather than realistic credentials.
- Local secret files MUST be excluded from version control.
- Configuration SHOULD reference secret inputs without owning their storage.
- The RAPM secret broker MUST NOT be integrated until its scope is explicitly
  adopted by a future decision.

If a secret is found in Git history, it MUST be treated as compromised and
rotated. History rewriting requires a separate, explicit decision because it
affects every clone and reference.

## Downloads and Execution

- Remote content MUST NOT be piped directly into an interpreter or shell.
- Downloaded executables and scripts MUST be authenticated before execution.
- SHA-256 or a stronger appropriate mechanism SHOULD be used when publisher
  signatures are unavailable.
- Download sources SHOULD be official and use HTTPS.

## Privileges and Mutations

- Administrative elevation MUST be requested only for the smallest operation
  that requires it.
- Mutating operations SHOULD support preview or dry-run behavior.
- Destructive operations MUST identify their exact targets before execution.
- Security controls MUST NOT be broadly disabled for convenience.
- Logs MUST provide useful audit information without exposing sensitive data.

## Backup and Restore

- Backups containing identity, credentials, or tokens MUST be treated as
  sensitive data.
- Backup output MUST remain outside version control.
- Restore operations MUST validate their source and destination.
- Risky restore categories SHOULD require explicit opt-in.
- A backup feature is incomplete until restoration is tested.

## Legacy Code

Code under `_old/` is not security-approved. It MUST be reviewed before any
reuse because it may contain outdated download URLs, broad exclusions, fixed
credentials, or unsafe elevation patterns.
