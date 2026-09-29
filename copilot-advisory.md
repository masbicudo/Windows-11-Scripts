copilot-advisory

Purpose
- Short advisory listing candidate "preference-only" files and small exports you may want backed up (no defaults, no large caches).

How I worked
- Scanned `masb-avell-install.ps1` (installed apps list) and compared with your current `backup.ps1`.
- Kept recommendations conservative: only items likely to store user-defined settings, credentials, or customizations.

Recommended additions (preference-only)
- VS Code Copilot memory (already added):
  - `%APPDATA%\Code\User\globalStorage\github.copilot-chat\memory-tool\memories`
  - (Insiders variant): `%APPDATA%\Code - Insiders\User\globalStorage\github.copilot-chat\memory-tool\memories`
  - Why: stores assistant/chat memory and small preference files.

- VS Code: explicit exports (prefer this to copying the full extensions folder):
  - Export extension list:
    - `code --list-extensions > "%USERPROFILE%\\dev-setup\\vscode-extensions.txt"`
  - Back up your `settings.json` / `keybindings.json` / `snippets` (already present in `backup.ps1`).
  - Why: captures exactly the extensions you chose, without copying binary extension folders.

- GitHub CLI (`gh`) config and auth (if you use it interactively):
  - Possible path to include: `%USERPROFILE%\.config\gh`
  - You can export auth tokens with `gh auth status` and back up the config folder instead of tokens directly.
  - Why: stores remotes, hosts and some auth state that speeds recovery.

- Google Cloud SDK (`gcloud`) config:
  - `%USERPROFILE%\.config\gcloud`
  - Why: stores project defaults, account config, credentials (beware: contains sensitive tokens).

- Docker client config and credentials:
  - `%USERPROFILE%\.docker`
  - `%APPDATA%\Docker` (if present and small)
  - Why: contains `config.json`, credential helpers and CLI preferences.

- Windows Terminal (profiles + settings):
  - `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
  - Or if using new Store/preview paths, check `%LOCALAPPDATA%\Programs\Microsoft VS Code\` (note: verify location on your system first)
  - Why: terminal profiles and color schemes you likely configured.

- Google Drive / rclone remotes (already touched):
  - `%APPDATA%\rclone\rclone.conf` (already in `backup.ps1`)
  - Why: stores remote endpoints and tokens (sensitive, but useful to restore if encrypted).

- gcloud / aws / az CLI (some already covered):
  - AWS: `%USERPROFILE%\.aws` (already in `backup.ps1`)
  - Azure: `%USERPROFILE%\.azure` (already in `backup.ps1`)
  - Why: CLI profiles and credentials.

- WSL distro exports: use the built-in `-ExportWslDistros` option in `backup.ps1` if you want reproducible VMs. These are optional but invaluable if you rely on WSL.

- pgAdmin / database client configs:
  - `%APPDATA%\pgAdmin` or `%APPDATA%\pgadmin` (if present)
  - `%APPDATA%\DBeaverData` (already in `backup.ps1`)

- Android SDK / emulator settings (only if you changed them):
  - `%LOCALAPPDATA%\Android\Sdk` (usually large — prefer noting SDK path and reinstalling unless you have custom AVDs)
  - AVDs: `%USERPROFILE%\.android\avd` (smallish, include only if you created custom AVDs)

- Windows Terminal and other shell profiles (PowerShell profiles are already handled):
  - `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

What I did not include (by design)
- Browser caches, app caches, or large program data.
- Full extension or program programfiles folders (prefer `choco` / `winget` inventory already created in backups to reinstall programs).
- Any plain-text secrets unless you elect to include them (many recommended paths contain sensitive tokens).

Suggested quick workflow (safe + minimal)
1. Keep `backup.ps1` as-is (you already back up many key items).
2. Add these three safe, small items now:
   - `"%APPDATA%\\Code\\User\\globalStorage\\github.copilot-chat\\memory-tool\\memories"` (already added)
   - `%USERPROFILE%\\.config\\gh` (GitHub CLI config) — add only if you use `gh`.
   - Create and back up `%USERPROFILE%\\dev-setup\\vscode-extensions.txt` (use `code --list-extensions`) and include that file in backup set.
3. For large items (Docker images, Android SDKs, WSL distros) use manual opt-in flags you already have like `-IncludeLargeAppState` or `-ExportWslDistros`.

Commands you can run to capture small exports now
- VS Code extensions list:
```powershell
code --list-extensions > "$env:USERPROFILE\dev-setup\vscode-extensions.txt"
```
- Export WSL distros (already supported by the script): run `backup.ps1 -ExportWslDistros`.

Next steps I can take for you (pick any):
- Add the three conservative items above to `backup.ps1` automatically.
- Add a `dev-setup` inventory export step that captures `code --list-extensions`, `pip freeze` for a chosen Python environment, and `choco list --local-only` (already in manifest), then back up that small inventory file.
- Add `gh` and `gcloud` config paths to `backup.ps1` only if you confirm you want them included (they may contain tokens).

Privacy note
- Many of these files contain credentials. If you include them in backups, ensure the backup is encrypted (see `manifest.Notes` in `backup.ps1` recommending encrypted storage).

If you'd like, I'll add the conservative defaults now and create the small inventory export step. Reply with which of these you want me to add (or say "Add all conservative defaults").
