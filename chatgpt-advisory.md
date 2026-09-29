# ChatGPT advisory: user-preference backup mining

Generated: 2026-05-24T03:08:38.7220799-03:00

This report is based on path existence, sizes, timestamps, and selected filenames. It does **not** copy files and does **not** print secret contents.

## Summary

- Candidates checked: 96
- Existing candidates: 61
- Already covered by backup.ps1: 26
- Recommended to add now: 9
- Worth considering: 7
- Manual/large/special handling: 10
- Sensitive existing locations: 26
- Large existing locations over 256 MB: 13

## Highest-value additions found

| Category | Name | Path | Size | Sensitive | Why |
|---|---|---|---:|:---:|---|
| Academic and writing | TeXstudio settings | %APPDATA%\texstudio | 1,04 MB | no | LaTeX editor settings/macros. |
| Containers and virtualization | pgAdmin config | %APPDATA%\pgAdmin | 54,23 MB | yes | Server registrations/preferences; may include saved passwords depending config. |
| Editors and AI assistants | Codex config | %USERPROFILE%\.codex | 94,28 MB | yes | Codex CLI/agent configuration, auth/session/preferences if present. |
| Language tooling | IPython config | %USERPROFILE%\.ipython | 27,92 MB | no | Profiles/startup scripts. |
| Language tooling | Jupyter config | %USERPROFILE%\.jupyter | 75,98 KB | yes | Notebook/lab config, kernels, server config; may include tokens. |
| Language tooling | NuGet config | %APPDATA%\NuGet\NuGet.Config | 210 B | yes | .NET package source configuration; may contain tokens. |
| Language tooling | PDM config/cache root | %APPDATA%\pdm | 50,01 MB | yes | PDM config and possibly auth/cache. Prefer config; avoid package caches. |
| Shells and terminals | Windows Terminal settings | %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json | 6,03 KB | no | Terminal profiles, colors, fonts, keybindings. |
| Windows customization | Startup folder | %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup | 5,49 KB | no | Explicit per-user startup shortcuts/scripts. |

## Consider / inspect before adding

| Category | Name | Path | Size | Sensitive | Why |
|---|---|---|---:|:---:|---|
| Academic and writing | Jarte settings | %APPDATA%\Jarte | 152,41 KB | no | Jarte preferences if used. |
| Android | Android Studio settings | %APPDATA%\Google\AndroidStudio* | 1,62 MB | no | IDE settings/options. Wildcard is advisory; inspect manually. |
| Applications | gallery-dl config | %APPDATA%\gallery-dl | 0 B | yes | Downloader config; may contain cookies/tokens. |
| Applications | Jackett config | %ProgramData%\Jackett | 261,39 MB | yes | Indexer configuration; may contain API keys. |
| Cloud and remote CLIs | OpenVPN app config | %APPDATA%\OpenVPN Connect | 12,08 MB | yes | VPN profiles/app state; likely sensitive. |
| Shells and terminals | Windows Terminal Preview settings | %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json | 7,81 KB | no | Preview terminal profiles/settings, if used. |
| Sync and storage | Synology Drive settings | %LOCALAPPDATA%\SynologyDrive | 504,45 MB | yes | May contain sync task definitions; can be medium/large. |

## Manual, large, or special-case items

| Category | Name | Path | Size | Sensitive | Restore note |
|---|---|---|---:|:---:|---|
| Academic and writing | Adobe user settings | %APPDATA%\Adobe\Acrobat | 5,19 MB | no |  |
| Android | Android AVDs | %USERPROFILE%\.android\avd | 31,22 GB | no |  |
| Android | Android user config | %USERPROFILE%\.android | 31,22 GB | yes |  |
| Applications | PowerToys settings | %LOCALAPPDATA%\Microsoft\PowerToys | 452,42 MB | no |  |
| Applications | Sandboxie config | %WINDIR%\Sandboxie.ini | 2,00 KB | no |  |
| Editors and AI assistants | VS Code global storage selected | %APPDATA%\Code\User\globalStorage | 382,47 MB | no | Review report children; avoid caches and auth blobs unless intentional. |
| Language tooling | Pyenv-win | %USERPROFILE%\.pyenv | 5,18 GB | no | Prefer inventory of installed versions over copying full versions. |
| Sync and storage | Google DriveFS settings | %LOCALAPPDATA%\Google\DriveFS | 1,11 GB | yes |  |
| Sync and storage | OneDrive settings | %LOCALAPPDATA%\Microsoft\OneDrive\settings | 183,52 MB | yes |  |
| Windows customization | Fonts installed by user | %LOCALAPPDATA%\Microsoft\Windows\Fonts | 35,64 MB | no |  |

## Already covered and found

| Category | Name | Path | Size | Sensitive |
|---|---|---|---:|:---:|
| Applications | Diffuse config | %USERPROFILE%\.config\diffuse | 85 B | no |
| Applications | Everything settings | %APPDATA%\Everything | 74,90 KB | no |
| Applications | IrfanView settings | %APPDATA%\IrfanView | 1,57 KB | no |
| Applications | KDiff3 config | %USERPROFILE%\.kdiff3rc | 2,20 KB | no |
| Applications | WinAuth | %APPDATA%\WinAuth | 43,22 KB | yes |
| Cloud and remote CLIs | AWS CLI | %USERPROFILE%\.aws | 275 B | yes |
| Cloud and remote CLIs | Azure CLI | %USERPROFILE%\.azure | 0 B | yes |
| Cloud and remote CLIs | gsutil | %USERPROFILE%\.gsutil | 0 B | yes |
| Cloud and remote CLIs | rclone config | %APPDATA%\rclone\rclone.conf | 190 B | yes |
| Containers and virtualization | DBeaver data | %APPDATA%\DBeaverData | 66 B | yes |
| Containers and virtualization | Docker client config | %USERPROFILE%\.docker | 603,24 MB | yes |
| Containers and virtualization | VirtualBox global config | %USERPROFILE%\.VirtualBox | 273,00 KB | no |
| Containers and virtualization | VirtualBox VMs | %USERPROFILE%\VirtualBox VMs | 49,03 GB | no |
| Developer identity | Git credentials | %USERPROFILE%\.git-credentials | 542 B | yes |
| Developer identity | Git global config | %USERPROFILE%\.gitconfig | 775 B | no |
| Developer identity | GnuPG | %USERPROFILE%\.gnupg | 828 B | yes |
| Developer identity | SSH keys and config | %USERPROFILE%\.ssh | 24,44 KB | yes |
| Editors and AI assistants | Notepad++ config | %APPDATA%\Notepad++ | 678,87 KB | no |
| Editors and AI assistants | VS Code Copilot memory | %APPDATA%\Code\User\globalStorage\github.copilot-chat\memory-tool\memories | 215 B | no |
| Editors and AI assistants | VS Code snippets | %APPDATA%\Code\User\snippets | 0 B | no |
| Editors and AI assistants | VS Code user settings | %APPDATA%\Code\User\settings.json | 4,40 KB | no |
| Language tooling | npm config | %USERPROFILE%\.npmrc | 24 B | yes |
| Shells and terminals | Bash rc | %USERPROFILE%\.bashrc | 199 B | no |
| Shells and terminals | WSL global config | %USERPROFILE%\.wslconfig | 33 B | no |
| Sync and storage | Syncthing local state | %LOCALAPPDATA%\Syncthing | 981,71 MB | yes |
| Sync and storage | SyncTrayzor config | %APPDATA%\SyncTrayzor\config.xml | 2,85 KB | no |

## Detail by category

### Academic and writing

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | Manual | Adobe user settings | %APPDATA%\Adobe\Acrobat | 5,19 MB | 2024-08-28 16:14 | no | Reader/Acrobat user preferences; often large/noisy. |
| found | Consider | Jarte settings | %APPDATA%\Jarte | 152,41 KB | 2026-04-21 14:06 | no | Jarte preferences if used. |
| missing | Consider | Pandoc defaults | %APPDATA%\pandoc | unknown |  | no | Pandoc defaults/templates/filters. |
| missing | Consider | TeX Live user tree | %USERPROFILE%\texmf | unknown |  | no | User-installed LaTeX packages/classes/bib styles. |
| found | Add | TeXstudio settings | %APPDATA%\texstudio | 1,04 MB | 2025-12-24 22:56 | no | LaTeX editor settings/macros. |

### Android

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | Manual | Android AVDs | %USERPROFILE%\.android\avd | 31,22 GB | 2023-08-06 00:25 | no | Custom emulator devices. Large opt-in. Large: prefer opt-in/manual backup. |
| found | Avoid | Android SDK | %LOCALAPPDATA%\Android\Sdk | 3,58 GB | 2022-04-23 17:38 | no | Usually large/reinstallable; avoid except custom AVDs/system images. Large: prefer opt-in/manual backup. |
| found | Consider | Android Studio settings | %APPDATA%\Google\AndroidStudio* | 1,62 MB | 2025-04-01 20:01 | no | IDE settings/options. Wildcard is advisory; inspect manually. |
| found | Manual | Android user config | %USERPROFILE%\.android | 31,22 GB | 2023-08-06 00:25 | yes | ADB keys, repositories.cfg, emulator config. AVDs may be large. Large: prefer opt-in/manual backup. |

### Applications

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| missing | Consider | AutoHotkey scripts common folder | %USERPROFILE%\Documents\AutoHotkey | unknown |  | no | User scripts/hotkeys if stored in the conventional folder. |
| found | AlreadyCovered | Diffuse config | %USERPROFILE%\.config\diffuse | 85 B | 2025-07-17 19:01 | no | N-way diff tool config. Already covered by backup.ps1. |
| missing | Consider | Everything service/program data | %ProgramData%\Everything | unknown |  | no | Everything service config/database may live here. |
| found | AlreadyCovered | Everything settings | %APPDATA%\Everything | 74,90 KB | 2026-05-23 01:31 | no | Search indexes/settings; current backup covers roaming path. Already covered by backup.ps1. |
| missing | AlreadyCovered | FastCopy settings | %APPDATA%\FastCopy | unknown |  | no | Copy presets/preferences. Already covered by backup.ps1. |
| missing | Manual | Fiddler settings | %USERPROFILE%\Documents\Fiddler2 | unknown |  | yes | Rules/certs/captures. Captures may be sensitive/large. |
| found | Consider | gallery-dl config | %APPDATA%\gallery-dl | 0 B | 2024-04-01 18:44 | yes | Downloader config; may contain cookies/tokens. |
| found | AlreadyCovered | IrfanView settings | %APPDATA%\IrfanView | 1,57 KB | 2024-03-17 22:01 | no | Viewer preferences/plugins configuration. Already covered by backup.ps1. |
| found | Consider | Jackett config | %ProgramData%\Jackett | 261,39 MB | 2026-05-21 19:40 | yes | Indexer configuration; may contain API keys. Large: prefer opt-in/manual backup. |
| found | AlreadyCovered | KDiff3 config | %USERPROFILE%\.kdiff3rc | 2,20 KB | 2026-03-24 18:33 | no | 3-way merge tool config. Already covered by backup.ps1. |
| missing | Manual | MSI Afterburner profiles | %ProgramFiles(x86)%\MSI Afterburner\Profiles | unknown |  | no | GPU fan/OC profiles, if customized. |
| found | AlreadyCovered | OBS Studio | %APPDATA%\obs-studio | 67,57 MB | 2025-10-14 01:47 | no | Scenes, profiles, plugin config. |
| missing | AlreadyCovered | Postman data | %APPDATA%\Postman | unknown |  | yes | Collections/workspaces/auth if not cloud-synced; can be large. Already covered by backup.ps1. |
| found | Manual | PowerToys settings | %LOCALAPPDATA%\Microsoft\PowerToys | 452,42 MB | 2026-05-24 02:59 | no | PowerToys modules/settings/key remaps. Large: prefer opt-in/manual backup. |
| found | AlreadyCovered | qBittorrent selected config | %APPDATA%\qBittorrent | 11,40 KB | 2026-04-04 21:19 | no | Preferences/categories/watched folders. Avoid BT_backup if not desired. |
| missing | Manual | RTSS profiles | %ProgramFiles(x86)%\RivaTuner Statistics Server\Profiles | unknown |  | no | Overlay/framerate profiles if installed. |
| found | Manual | Sandboxie config | %WINDIR%\Sandboxie.ini | 2,00 KB | 2025-08-17 19:56 | no | System-wide sandbox definitions; requires admin to back up. |
| missing | Consider | Sandboxie Plus config | %USERPROFILE%\Sandboxie-Plus.ini | unknown |  | no | Sandbox definitions/settings if present. |
| missing | Consider | Sizer settings | %APPDATA%\Sizer | unknown |  | no | Custom window sizes/layouts if present. |
| missing | AlreadyCovered | SumatraPDF settings | %APPDATA%\SumatraPDF | unknown |  | no | Reader preferences and history. Already covered by backup.ps1. |
| found | AlreadyCovered | WinAuth | %APPDATA%\WinAuth | 43,22 KB | 2026-05-20 20:12 | yes | 2FA authenticators. Critical and sensitive. Already covered by backup.ps1. |
| missing | AlreadyCovered | WinMerge settings | %APPDATA%\WinMerge | unknown |  | no | Diff tool preferences. Already covered by backup.ps1. |
| missing | Consider | Wireshark profile/preferences | %APPDATA%\Wireshark | unknown |  | no | Capture/display profiles and protocol preferences. |
| missing | Consider | yt-dlp config | %APPDATA%\yt-dlp | unknown |  | no | Downloader config if present. |

### Cloud and remote CLIs

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | AlreadyCovered | AWS CLI | %USERPROFILE%\.aws | 275 B | 2023-01-13 12:55 | yes | AWS profiles/credentials. Already covered by backup.ps1. |
| found | AlreadyCovered | Azure CLI | %USERPROFILE%\.azure | 0 B | 2025-05-16 19:56 | yes | Azure CLI profiles/tokens. Already covered by backup.ps1. |
| missing | Consider | GitHub CLI | %USERPROFILE%\.config\gh | unknown |  | yes | GitHub hosts, auth, aliases. |
| missing | Consider | Google Cloud SDK | %USERPROFILE%\.config\gcloud | unknown |  | yes | gcloud accounts/projects/tokens. |
| found | AlreadyCovered | gsutil | %USERPROFILE%\.gsutil | 0 B | 2025-09-02 21:05 | yes | gsutil credentials/config. Already covered by backup.ps1. |
| found | Consider | OpenVPN app config | %APPDATA%\OpenVPN Connect | 12,08 MB | 2025-09-10 00:58 | yes | VPN profiles/app state; likely sensitive. |
| missing | Consider | OpenVPN config | %USERPROFILE%\OpenVPN\config | unknown |  | yes | User VPN profiles/certs if stored here. |
| found | AlreadyCovered | rclone config | %APPDATA%\rclone\rclone.conf | 190 B | 2025-06-29 14:11 | yes | Cloud remote definitions and tokens. Already covered by backup.ps1. |

### Containers and virtualization

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | AlreadyCovered | DBeaver data | %APPDATA%\DBeaverData | 66 B | 2025-09-08 18:33 | yes | Database connections, drivers, workspace metadata. Already covered by backup.ps1. |
| found | AlreadyCovered | Docker client config | %USERPROFILE%\.docker | 603,24 MB | 2026-05-22 18:51 | yes | Docker CLI config/auth/contexts. Large: prefer opt-in/manual backup. Already covered by backup.ps1. |
| found | Avoid | Docker Desktop app data | %APPDATA%\Docker | 7,48 MB | 2026-05-22 18:51 | yes | Often cache/state-heavy; usually avoid unless specific settings matter. |
| found | Avoid | Docker Desktop local data | %LOCALAPPDATA%\Docker | 106,28 GB | 2025-09-22 14:03 | yes | Usually large internal VM/state/cache; avoid for preference-only backups. Large: prefer opt-in/manual backup. |
| found | Add | pgAdmin config | %APPDATA%\pgAdmin | 54,23 MB | 2026-05-24 01:39 | yes | Server registrations/preferences; may include saved passwords depending config. |
| missing | Consider | PostgreSQL roaming config | %APPDATA%\postgresql | unknown |  | yes | psql history/passfile/certs if present. |
| missing | Consider | psql passfile | %APPDATA%\postgresql\pgpass.conf | unknown |  | yes | PostgreSQL saved passwords. |
| found | AlreadyCovered | VirtualBox global config | %USERPROFILE%\.VirtualBox | 273,00 KB | 2025-07-07 22:09 | no | VM registry/preferences; VM disks are separate and large. Already covered by backup.ps1. |
| found | AlreadyCovered | VirtualBox VMs | %USERPROFILE%\VirtualBox VMs | 49,03 GB | 2025-07-04 15:49 | no | Actual VM disks; large opt-in only. Large: prefer opt-in/manual backup. Already covered by backup.ps1. |

### Developer identity

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| missing | Consider | Git attributes global | %USERPROFILE%\.gitattributes | unknown |  | no | Global line-ending/diff behavior if present. |
| found | AlreadyCovered | Git credentials | %USERPROFILE%\.git-credentials | 542 B | 2026-04-22 19:30 | yes | Possible stored HTTPS credentials/tokens. Already covered by backup.ps1. |
| found | AlreadyCovered | Git global config | %USERPROFILE%\.gitconfig | 775 B | 2026-02-10 11:57 | no | Global user.name, aliases, merge/diff tools, credential helpers. Already covered by backup.ps1. |
| missing | Consider | Git ignore global | %USERPROFILE%\.gitignore_global | unknown |  | no | Global ignore rules if present. |
| found | AlreadyCovered | GnuPG | %USERPROFILE%\.gnupg | 828 B | 2026-03-10 19:01 | yes | Signing/encryption keys and trust database. Already covered by backup.ps1. |
| found | AlreadyCovered | SSH keys and config | %USERPROFILE%\.ssh | 24,44 KB | 2025-09-03 00:39 | yes | SSH keys, host aliases, known_hosts. High-value and usually hand-defined. Already covered by backup.ps1. |

### Editors and AI assistants

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | Add | Codex config | %USERPROFILE%\.codex | 94,28 MB | 2026-05-24 02:59 | yes | Codex CLI/agent configuration, auth/session/preferences if present. |
| found | AlreadyCovered | Notepad++ config | %APPDATA%\Notepad++ | 678,87 KB | 2025-09-07 22:56 | no | Sessions, preferences, user-defined language files. Already covered by backup.ps1. |
| missing | Consider | OpenAI config | %USERPROFILE%\.openai | unknown |  | yes | OpenAI CLI/API local config if present. |
| found | AlreadyCovered | VS Code Copilot memory | %APPDATA%\Code\User\globalStorage\github.copilot-chat\memory-tool\memories | 215 B | 2026-05-24 02:15 | no | Copilot memory/preferences. Already covered by backup.ps1. |
| missing | Consider | VS Code extension inventory | %USERPROFILE%\dev-setup\vscode-extensions.txt | unknown |  | no | Small explicit extension list generated by code --list-extensions. |
| found | Manual | VS Code global storage selected | %APPDATA%\Code\User\globalStorage | 382,47 MB | 2026-05-24 03:07 | no | May contain extension-specific user state; should be mined selectively, not backed up wholesale. Large: prefer opt-in/manual backup. |
| missing | AlreadyCovered | VS Code keybindings | %APPDATA%\Code\User\keybindings.json | unknown |  | no | Explicit keyboard customizations. Already covered by backup.ps1. |
| missing | Consider | VS Code profile definitions | %APPDATA%\Code\User\profiles | unknown |  | no | Named VS Code profiles, if used. |
| found | AlreadyCovered | VS Code snippets | %APPDATA%\Code\User\snippets | 0 B | 2023-07-04 19:07 | no | Hand-written snippets. Already covered by backup.ps1. |
| found | AlreadyCovered | VS Code user settings | %APPDATA%\Code\User\settings.json | 4,40 KB | 2026-05-23 18:10 | no | Explicit editor settings. Already covered by backup.ps1. |

### Language tooling

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| missing | Consider | Cargo config | %USERPROFILE%\.cargo\config.toml | unknown |  | no | Rust registry/build config if present. |
| found | Add | IPython config | %USERPROFILE%\.ipython | 27,92 MB | 2022-08-22 08:42 | no | Profiles/startup scripts. |
| missing | Consider | Julia config | %USERPROFILE%\.julia\config | unknown |  | no | Julia startup/config only, not packages/artifacts. |
| found | Add | Jupyter config | %USERPROFILE%\.jupyter | 75,98 KB | 2026-04-30 21:56 | yes | Notebook/lab config, kernels, server config; may include tokens. |
| found | AlreadyCovered | npm config | %USERPROFILE%\.npmrc | 24 B | 2022-06-11 22:16 | yes | NPM registry/token config. Already covered by backup.ps1. |
| found | Add | NuGet config | %APPDATA%\NuGet\NuGet.Config | 210 B | 2022-06-18 18:28 | yes | .NET package source configuration; may contain tokens. |
| found | Add | PDM config/cache root | %APPDATA%\pdm | 50,01 MB | 2025-10-31 18:30 | yes | PDM config and possibly auth/cache. Prefer config; avoid package caches. |
| missing | Consider | PDM user home | %USERPROFILE%\.pdm | unknown |  | yes | Older/alternate PDM state. |
| missing | Consider | pip config | %APPDATA%\pip\pip.ini | unknown |  | yes | Custom package indexes/trusted-hosts; may include tokens. |
| found | Manual | Pyenv-win | %USERPROFILE%\.pyenv | 5,18 GB | 2023-07-06 08:18 | no | Python versions can be large; config/shims useful, versions reinstallable. Large: prefer opt-in/manual backup. |
| missing | Consider | R user profile | %USERPROFILE%\.Rprofile | unknown |  | no | R startup configuration. |
| missing | Consider | Renviron | %USERPROFILE%\.Renviron | unknown |  | yes | R environment variables; may contain secrets. |

### Shells and terminals

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | AlreadyCovered | Bash rc | %USERPROFILE%\.bashrc | 199 B | 2024-01-25 20:48 | no | User-defined shell initialization. Already covered by backup.ps1. |
| missing | Consider | Oh My Posh themes/config | %USERPROFILE%\.poshthemes | unknown |  | no | Custom prompt themes, if not only installed defaults. |
| missing | Consider | PowerShell profile folder | %USERPROFILE%\Documents\PowerShell | unknown |  | no | PowerShell 7 modules/profile scripts often live here. |
| missing | Consider | Windows PowerShell profile folder | %USERPROFILE%\Documents\WindowsPowerShell | unknown |  | no | Windows PowerShell 5.1 profile scripts/modules. |
| found | Consider | Windows Terminal Preview settings | %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json | 7,81 KB | 2025-08-27 21:33 | no | Preview terminal profiles/settings, if used. |
| found | Add | Windows Terminal settings | %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json | 6,03 KB | 2025-11-03 21:13 | no | Terminal profiles, colors, fonts, keybindings. |
| found | AlreadyCovered | WSL global config | %USERPROFILE%\.wslconfig | 33 B | 2026-05-22 21:27 | no | Global WSL limits/network/systemd behavior. Already covered by backup.ps1. |

### Sync and storage

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | Manual | Google DriveFS settings | %LOCALAPPDATA%\Google\DriveFS | 1,11 GB | 2026-05-24 03:06 | yes | Account/mount metadata. Usually not needed, but may speed restore. Large: prefer opt-in/manual backup. |
| found | Manual | OneDrive settings | %LOCALAPPDATA%\Microsoft\OneDrive\settings | 183,52 MB | 2026-05-08 17:17 | yes | Account/sync state. Usually reconstructable; settings may help. |
| found | AlreadyCovered | Syncthing local state | %LOCALAPPDATA%\Syncthing | 981,71 MB | 2026-05-23 17:42 | yes | Syncthing config/device/folder IDs. Large: prefer opt-in/manual backup. Already covered by backup.ps1. |
| found | AlreadyCovered | SyncTrayzor config | %APPDATA%\SyncTrayzor\config.xml | 2,85 KB | 2026-05-23 17:42 | no | SyncTrayzor UI/service settings. Already covered by backup.ps1. |
| found | Consider | Synology Drive settings | %LOCALAPPDATA%\SynologyDrive | 504,45 MB | 2026-05-23 17:44 | yes | May contain sync task definitions; can be medium/large. Large: prefer opt-in/manual backup. |

### Windows customization

| Status | Recommendation | Name | Path | Size | Last modified | Sensitive | Notes |
|---|---|---|---|---:|---|:---:|---|
| found | AlreadyCovered | Explorer Advanced registry | REG:HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced | unknown |  | no | Explorer/taskbar preferences. |
| found | Manual | Fonts installed by user | %LOCALAPPDATA%\Microsoft\Windows\Fonts | 35,64 MB | 2023-10-25 19:47 | no | User-installed fonts. Avoid sharing font files publicly; backup privately if licensed. |
| found | AlreadyCovered | Machine environment registry | REG:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment | unknown |  | no | Machine environment variables. |
| found | AlreadyCovered | Search registry | REG:HKCU\Software\Microsoft\Windows\CurrentVersion\Search | unknown |  | no | Search/Cortana/Bing preferences. |
| found | Add | Startup folder | %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup | 5,49 KB | 2026-04-30 21:13 | no | Explicit per-user startup shortcuts/scripts. |
| found | AlreadyCovered | User environment registry | REG:HKCU\Environment | unknown |  | no | User environment variables. |

## Interesting children from found directories

This section lists names only, not contents. It helps distinguish custom preference files from caches.


### Adobe user settings

- Path: `%APPDATA%\Adobe\Acrobat`
- Recommendation: Manual
- Children:
  - `DC/`
  - `TypeQuest/`
  - `Preflight Acrobat Continuous/`

### Jarte settings

- Path: `%APPDATA%\Jarte`
- Recommendation: Consider
- Children:
  - `Settings.ini`
  - `Custom Spell/`
  - `Templates/`
  - `Backgrounds/`
  - `Converters/`
  - `Document Backups/`
  - `Scripts/`

### TeXstudio settings

- Path: `%APPDATA%\texstudio`
- Recommendation: Add
- Children:
  - `texstudio.ini`
  - `texstudiopt_BR.ign`
  - `wordCount.usage`
  - `lastSession.txss2`
  - `packageCache.dat`
  - `macro/`
  - `templates/`
  - `completion/`

### Android AVDs

- Path: `%USERPROFILE%\.android\avd`
- Recommendation: Manual
- Children:
  - `MASBicudo_Pixel_3_API_30.avd/`
  - `MASBicudo_Pixel_3_API_30.ini`
  - `pixel_5_-_api_31.avd/`
  - `pixel_5_-_api_31.ini`
  - `Nexus_5_API_30_Nicolas_.avd/`
  - `Nexus_5_API_30_Nicolas_.ini`

### Android SDK

- Path: `%LOCALAPPDATA%\Android\Sdk`
- Recommendation: Avoid
- Children:
  - `skins/`
  - `.knownPackages`
  - `.temp/`
  - `.downloadIntermediates/`
  - `system-images/`
  - `build-tools/`
  - `emulator/`
  - `patcher/`
  - `platform-tools/`
  - `platforms/`
  - `extras/`
  - `licenses/`

### Android Studio settings

- Path: `%APPDATA%\Google\AndroidStudio*`
- Recommendation: Consider
- Children:
  - `C:\Users\masbi\AppData\Roaming\Google\AndroidStudio2021.1`
  - `C:\Users\masbi\AppData\Roaming\Google\AndroidStudio2022.2`
  - `C:\Users\masbi\AppData\Roaming\Google\AndroidStudio2024.2`
  - `C:\Users\masbi\AppData\Roaming\Google\AndroidStudio2024.2-backup`

### Android user config

- Path: `%USERPROFILE%\.android`
- Recommendation: Manual
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Diffuse config

- Path: `%USERPROFILE%\.config\diffuse`
- Recommendation: AlreadyCovered
- Children:
  - `prefs`

### Everything settings

- Path: `%APPDATA%\Everything`
- Recommendation: AlreadyCovered
- Children:
  - `Everything.ini`
  - `Run History.csv`

### gallery-dl config

- Path: `%APPDATA%\gallery-dl`
- Recommendation: Consider
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### IrfanView settings

- Path: `%APPDATA%\IrfanView`
- Recommendation: AlreadyCovered
- Children:
  - `i_view64.ini`

### Jackett config

- Path: `%ProgramData%\Jackett`
- Recommendation: Consider
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### KDiff3 config

- Path: `%USERPROFILE%\.kdiff3rc`
- Recommendation: AlreadyCovered
- Children:
  - `.kdiff3rc`

### OBS Studio

- Path: `%APPDATA%\obs-studio`
- Recommendation: AlreadyCovered
- Children:
  - `profiler_data/`
  - `user.ini`
  - `global.ini`
  - `plugin_config/`
  - `basic/`

### PowerToys settings

- Path: `%LOCALAPPDATA%\Microsoft\PowerToys`
- Recommendation: Manual
- Children:
  - `settings-telemetry.json`
  - `last_version_run.json`
  - `UpdateState.json`
  - `RunnerLogs/`
  - `settings-placement.json`
  - `settings.json`
  - `CmdPal/`
  - `MouseWithoutBorders/`
  - `Workspaces/`
  - `etw/`
  - `ZoomIt/`
  - `NewPlus/`
  - `AdvancedPaste/`
  - `PastePlain/`
  - `QuickAccent/`
  - `Keyboard Manager/`
  - `experimentation.json`
  - `CropAndLock/`
  - `FancyZones/`
  - `CmdNotFound/`
  - `EnvironmentVariables/`
  - `UpdateLogs/`
  - `MouseJump/`
  - `Measure Tool/`
  - `RegistryPreview/`
  - `ColorPicker/`
  - `Video Conference/`
  - `Peek/`
  - `Settings/`
  - `Registry Preview/`

### qBittorrent selected config

- Path: `%APPDATA%\qBittorrent`
- Recommendation: AlreadyCovered
- Children:
  - `qBittorrent.ini`
  - `qBittorrent-data.ini`
  - `rss/`
  - `lockfile`
  - `watched_folders.json`
  - `categories.json`

### Sandboxie config

- Path: `%WINDIR%\Sandboxie.ini`
- Recommendation: Manual
- Children:
  - `Sandboxie.ini`

### WinAuth

- Path: `%APPDATA%\WinAuth`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### AWS CLI

- Path: `%USERPROFILE%\.aws`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### gsutil

- Path: `%USERPROFILE%\.gsutil`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### OpenVPN app config

- Path: `%APPDATA%\OpenVPN Connect`
- Recommendation: Consider
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### rclone config

- Path: `%APPDATA%\rclone\rclone.conf`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### DBeaver data

- Path: `%APPDATA%\DBeaverData`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Docker client config

- Path: `%USERPROFILE%\.docker`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Docker Desktop app data

- Path: `%APPDATA%\Docker`
- Recommendation: Avoid
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Docker Desktop local data

- Path: `%LOCALAPPDATA%\Docker`
- Recommendation: Avoid
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### pgAdmin config

- Path: `%APPDATA%\pgAdmin`
- Recommendation: Add
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### VirtualBox global config

- Path: `%USERPROFILE%\.VirtualBox`
- Recommendation: AlreadyCovered
- Children:
  - `VBoxSVC.log`
  - `VirtualBox.xml`
  - `VBoxSVC.log.1`
  - `VirtualBox.xml-prev`
  - `VBoxSVC.log.2`
  - `VBoxSVC.log.3`
  - `VBoxSVC.log.4`
  - `VBoxSVC.log.5`
  - `VBoxSVC.log.6`
  - `VBoxSVC.log.7`
  - `VBoxSVC.log.8`
  - `VBoxSVC.log.9`
  - `VBoxSVC.log.10`
  - `selectorwindow.log`
  - `selectorwindow.log.1`
  - `selectorwindow.log.2`
  - `selectorwindow.log.3`
  - `selectorwindow.log.4`
  - `selectorwindow.log.5`
  - `selectorwindow.log.6`
  - `selectorwindow.log.7`
  - `selectorwindow.log.8`
  - `selectorwindow.log.9`
  - `selectorwindow.log.10`
  - `VirtualBox-1.12-windows.xml`
  - `vbox-ssl-cacertificate.crt`

### VirtualBox VMs

- Path: `%USERPROFILE%\VirtualBox VMs`
- Recommendation: AlreadyCovered
- Children:
  - `Teste/`
  - `Windows XP/`
  - `W10-Install/`
  - `Mininet-VM 1/`
  - `Mininet-VM/`
  - `RAPM-WebUI_API/`

### Git credentials

- Path: `%USERPROFILE%\.git-credentials`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Git global config

- Path: `%USERPROFILE%\.gitconfig`
- Recommendation: AlreadyCovered
- Children:
  - `.gitconfig`

### GnuPG

- Path: `%USERPROFILE%\.gnupg`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### SSH keys and config

- Path: `%USERPROFILE%\.ssh`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Codex config

- Path: `%USERPROFILE%\.codex`
- Recommendation: Add
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Notepad++ config

- Path: `%APPDATA%\Notepad++`
- Recommendation: AlreadyCovered
- Children:
  - `session.xml`
  - `session.xml.inCaseOfCorruption.bak`
  - `config.xml`
  - `nativeLang.xml`
  - `toolbarButtonsConf_example.xml`
  - `backup/`
  - `toolbarIcons.xml`
  - `nppLogNulContentCorruptionIssue.log`
  - `tabContextMenu_example.xml`
  - `cloud/`
  - `themes/`
  - `userDefineLangs/`
  - `plugins/`
  - `contextMenu.xml`
  - `stylers.xml`
  - `langs.xml`
  - `shortcuts.xml`

### VS Code Copilot memory

- Path: `%APPDATA%\Code\User\globalStorage\github.copilot-chat\memory-tool\memories`
- Recommendation: AlreadyCovered
- Children:
  - `long-task-preference.md`

### VS Code global storage selected

- Path: `%APPDATA%\Code\User\globalStorage`
- Recommendation: Manual
- Children:
  - `state.vscdb`
  - `storage.json`
  - `github.copilot-chat/`
  - `state.vscdb.backup`
  - `ms-python.vscode-python-envs/`
  - `vscode.git/`
  - `emptyWindowChatSessions/`
  - `ms-python.python/`
  - `redhat.java/`
  - `vscode-redhat-telemetry/`
  - `ms-toolsai.jupyter/`
  - `ms-vscode-remote.remote-containers/`
  - `streetsidesoftware.code-spell-checker/`
  - `visualstudioexptteam.intellicode-api-usage-examples/`
  - `haskell.haskell/`
  - `ms-dotnettools.vscode-dotnet-runtime/`
  - `ms-vscode.powershell/`
  - `ms-edgedevtools.vscode-edge-devtools/`

### VS Code user settings

- Path: `%APPDATA%\Code\User\settings.json`
- Recommendation: AlreadyCovered
- Children:
  - `settings.json`

### IPython config

- Path: `%USERPROFILE%\.ipython`
- Recommendation: Add
- Children:
  - `profile_default/`
  - `nbextensions/`
  - `extensions/`

### Jupyter config

- Path: `%USERPROFILE%\.jupyter`
- Recommendation: Add
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### npm config

- Path: `%USERPROFILE%\.npmrc`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### NuGet config

- Path: `%APPDATA%\NuGet\NuGet.Config`
- Recommendation: Add
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### PDM config/cache root

- Path: `%APPDATA%\pdm`
- Recommendation: Add
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Pyenv-win

- Path: `%USERPROFILE%\.pyenv`
- Recommendation: Manual
- Children:
  - `tests/`
  - `pyenv-win/`
  - `.version`
  - `README.md`
  - `setup.py`
  - `.github/`
  - `requirements_dev.txt`
  - `.gitignore`
  - `.coveralls.yml`
  - `.python-version`
  - `_config.yml`
  - `LICENSE`
  - `mirrors.txt`
  - `requirements.txt`

### Bash rc

- Path: `%USERPROFILE%\.bashrc`
- Recommendation: AlreadyCovered
- Children:
  - `.bashrc`

### Windows Terminal Preview settings

- Path: `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json`
- Recommendation: Consider
- Children:
  - `settings.json`

### Windows Terminal settings

- Path: `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
- Recommendation: Add
- Children:
  - `settings.json`

### WSL global config

- Path: `%USERPROFILE%\.wslconfig`
- Recommendation: AlreadyCovered
- Children:
  - `.wslconfig`

### Google DriveFS settings

- Path: `%LOCALAPPDATA%\Google\DriveFS`
- Recommendation: Manual
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### OneDrive settings

- Path: `%LOCALAPPDATA%\Microsoft\OneDrive\settings`
- Recommendation: Manual
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Syncthing local state

- Path: `%LOCALAPPDATA%\Syncthing`
- Recommendation: AlreadyCovered
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### SyncTrayzor config

- Path: `%APPDATA%\SyncTrayzor\config.xml`
- Recommendation: AlreadyCovered
- Children:
  - `config.xml`

### Synology Drive settings

- Path: `%LOCALAPPDATA%\SynologyDrive`
- Recommendation: Consider
- Children:
  - [hidden because location is marked sensitive; rerun with -IncludeSensitiveDetails to show names only]

### Fonts installed by user

- Path: `%LOCALAPPDATA%\Microsoft\Windows\Fonts`
- Recommendation: Manual
- Children:
  - `uechi.italic.ttf`
  - `uechi.gothic.ttf`
  - `Font Awesome 6 Brands-Regular-400.otf`
  - `Font Awesome 6 Free-Regular-400.otf`
  - `Font Awesome 6 Free-Solid-900.otf`
  - `XITSMath_monospacified_for_mononoki.ttf`
  - `XITSMath-Bold_monospacified_for_mononoki.ttf`
  - `TeXGyreScholaMath_monospacified_for_mononoki.ttf`
  - `Symbola_monospacified_for_mononoki.ttf`
  - `STIYMath_monospacified_for_mononoki.ttf`
  - `LatinModernMath_monospacified_for_mononoki.ttf`
  - `FreeSerif_monospacified_for_mononoki.ttf`
  - `Asanb_monospacified_for_mononoki.ttf`
  - `RustyCagePersonalUseRegular-mL3x2.ttf`
  - `Font Awesome 5 Brands-Regular-400.otf`
  - `Font Awesome 5 Free-Regular-400.otf`
  - `Font Awesome 5 Free-Solid-900.otf`
  - `SourceCodePro-BoldIt.otf`
  - `SourceCodePro-Bold.otf`
  - `SourceCodePro-BlackIt.otf`
  - `SourceCodePro-Black.otf`
  - `SourceCodePro-It.otf`
  - `SourceCodePro-Light.otf`
  - `SourceCodePro-LightIt.otf`
  - `SourceCodePro-ExtraLightIt.otf`
  - `SourceCodePro-ExtraLight.otf`
  - `SourceCodePro-MediumIt.otf`
  - `SourceCodePro-SemiboldIt.otf`
  - `SourceCodePro-Semibold.otf`
  - `SourceCodePro-Medium.otf`

### Startup folder

- Path: `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`
- Recommendation: Add
- Children:
  - `Synology Drive Client.lnk`
  - `AutorunsDisabled/`
  - `desktop.ini`

## Inventories

These are useful for reconstruction and usually better than copying program folders.

### VS Code extensions

```text
13xforever.language-x86-64-assembly
akamud.vscode-theme-onedark
amazon.datagenextension
bat67.markdown-extension-pack
batisteo.vscode-django
be5invis.vscode-icontheme-nomo-dark
bierner.emojisense
bierner.markdown-checkbox
bierner.markdown-emoji
bierner.markdown-mermaid
bierner.markdown-preview-github-styles
bpruitt-goddard.mermaid-markdown-syntax-highlighting
cschlosser.doxdocgen
csholmq.excel-to-markdown-table
cssho.vscode-svgviewer
d-koppenhagen.file-tree-to-text-generator
dahong.theme-bear
darkriszty.markdown-table-prettify
davidanson.vscode-markdownlint
docker.docker
donjayamanne.python-environment-manager
donjayamanne.python-extension-pack
emmanuelbeziat.vscode-great-icons
equinusocio.vsc-community-material-theme
file-icons.file-icons
formulahendry.code-runner
goessner.mdmath
golang.go
grapecity.gc-excelviewer
graphql.vscode-graphql
graphql.vscode-graphql-syntax
haskell.haskell
hooni.tokenscope
ionutvmi.path-autocomplete
james-yu.latex-workshop
janisdd.vscode-edit-csv
jeff-hykin.better-cpp-syntax
jerrdeh.sql-in-python-highlighter-formatter
jithurjacob.nbpreviewer
joaompinto.vscode-graphviz
jtlowe.vscode-icon-theme
justusadam.language-haskell
kevinrose.vsc-python-indent
mdickin.markdown-shortcuts
mechatroner.rainbow-csv
michelemelluso.code-beautifier
mikestead.dotenv
moshfeu.vscode-medium-to-markdown
ms-azuretools.vscode-containers
ms-azuretools.vscode-docker
ms-dotnettools.csharp
ms-dotnettools.vscode-dotnet-runtime
ms-edgedevtools.vscode-edge-devtools
ms-ossdata.vscode-postgresql
ms-python.black-formatter
ms-python.debugpy
ms-python.isort
ms-python.python
ms-python.vscode-pylance
ms-python.vscode-python-envs
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-powertoys
ms-toolsai.vscode-jupyter-slideshow
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode-remote.vscode-remote-extensionpack
ms-vscode.cmake-tools
ms-vscode.cpp-devtools
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
ms-vscode.hexeditor
ms-vscode.live-server
ms-vscode.mono-debug
ms-vscode.powershell
ms-vscode.remote-explorer
ms-vscode.remote-server
ms-vscode.theme-markdownkit
ms-vscode.theme-materialkit
ms-vsliveshare.vsliveshare
msjsdiag.vscode-react-native
njpwerner.autodocstring
octref.vetur
openai.chatgpt
pkief.material-icon-theme
qinjia.seti-icons
qwtel.sqlite-viewer
redhat.java
ryanluker.vscode-coverage-gutters
shd101wyy.markdown-preview-enhanced
shinotatwu-ds.file-tree-generator
slevesque.shader
stepanog.cage-icons
streetsidesoftware.code-spell-checker
streetsidesoftware.code-spell-checker-portuguese-brazilian
telesoho.vscode-markdown-paste-image
tgv.awk-language-client
twxs.cmake
visualstudioexptteam.intellicode-api-usage-examples
visualstudioexptteam.vscodeintellicode
vscjava.migrate-java-to-azure
vscjava.vscode-gradle
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-java-upgrade
vscjava.vscode-maven
vscode-icons-team.vscode-icons
vstirbu.vscode-mermaid-preview
vue.volar
wholroyd.jinja
xdebug.php-debug
xiangz19.codex-ratelimit
yy0931.save-as-root
yzane.markdown-pdf
yzhang.markdown-all-in-one
zhuangtongfa.material-theme
```

### Chocolatey packages

```text
Chocolatey v2.7.2
This is try 1/3. Retrying after 300 milliseconds.
 Error converted to warning:
 O acesso ao caminho 'C:\ProgramData\chocolatey\choco.exe.old' foi negado.
This is try 2/3. Retrying after 400 milliseconds.
 Error converted to warning:
 O acesso ao caminho 'C:\ProgramData\chocolatey\choco.exe.old' foi negado.
Maximum tries of 3 reached. Throwing error.
Invalid argument --local-only. This argument has been removed from the list command and cannot be used.
```

### Winget packages

```text

   - 
                                                                                                                        

  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  1024 KB / 2.96 MB
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  2.00 MB / 2.96 MB
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûê  2.96 MB / 2.96 MB
                                                                                                                        

  ÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  0%
  ÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  0%
  ÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  1%
  ÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  2%
  ÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  3%
  ÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  4%
  ÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  5%
  ÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  6%
  ÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  7%
  ÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  8%
  ÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  9%
  ÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  10%
  ÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  11%
  ÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  12%
  ÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  13%
  ÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  14%
  ÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  15%
  ÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  16%
  ÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  17%
  ÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  18%
  ÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  19%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  20%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  21%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  22%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  23%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  24%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  25%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  26%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  27%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  28%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  28%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  30%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  31%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  32%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  33%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  34%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  35%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  36%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  37%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  38%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  39%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  40%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  41%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  42%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  43%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  44%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  45%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  46%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  47%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  48%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  49%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  50%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  51%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  52%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  53%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  54%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  55%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  56%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  56%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  57%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  59%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  60%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  61%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  62%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  70%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  72%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆÔûÆÔûÆÔûÆÔûÆÔûÆ  83%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆ  99%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûÆ  99%
  ÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûêÔûê  100%
                                                                                                                        

   - 
   \ 
   | 
   / 
                                                                                                                        
Nome                                     ID                                       Vers├úo           Dispon├¡vel    Origem
-----------------------------------------------------------------------------------------------------------------------
NVM for Windows 1.2.2                    CoreyButler.NVMforWindows                1.2.2                          winget
7-Zip 26.00 (x64)                        7zip.7zip                                26.00            26.01         winget
Tad 0.11.0                               AntonyCourtney.Tad                       0.11.0           0.14.0        winget
Android Studio                           ARP\Machine\X64\Android Studio           2025.2                         
BlueStacks                               BlueStack.BlueStacks                     5.22.51.1038     5.22.166.1003 winget
Bulk Image Downloader v6.9.0.0 (64 bit)  ARP\Machine\X64\Bulk Image Downloader (ÔÇª 6.09                           
CCleaner                                 ARP\Machine\X64\CCleaner                 6.40                           
CPUID CPU-Z 2.16                         CPUID.CPU-Z                              2.16             2.20          winget
CrystalDiskInfo 8.17.13 Shizuku Edition  CrystalDewWorld.CrystalDiskInfo.ShizukuÔÇª 8.17.13          9.9.1         winget
CrystalDiskMark 9.0.1                    CrystalDewWorld.CrystalDiskMark          9.0.1            9.0.2         winget
CrystalDiskMark 8.0.6                    CrystalDewWorld.CrystalDiskMark          8.0.6                          winget
DBeaver 25.2.0                           DBeaver.DBeaver.Community                25.2.0           26.0.5        winget
Docker Desktop                           Docker.DockerDesktop                     4.46.0           4.73.0        winget
EaseUS Partition Master                  EaseUS.PartitionMaster                   19.0             20.2          winget
Everything 1.4.1.1028 (x64)              ARP\Machine\X64\Everything               1.4.1.1028                     
Git                                      ARP\Machine\X64\Git_is1                  2.51.0                         
HWiNFO┬« 64                               REALiX.HWiNFO                            8.30             8.46          winget
Link Shell Extension                     HermannSchinagl.LinkShellExtension       3.9.3.5                        winget
HashTab 6.0.0.34                         ARP\Machine\X64\HashTab                  6.0.0.34                       
HxD Hex Editor 2.5                       MHNexus.HxD                              2.5                            winget
ImDisk Toolkit                           ARP\Machine\X64\ImDiskApp                20250206                       
IrfanView 4.72 (64-bit)                  IrfanSkiljan.IrfanView                   4.72             4.73          winget
Microsoft Azure Compute Emulator - v2.9ÔÇª ARP\Machine\X64\Microsoft Azure ComputeÔÇª 2.9.8999.43                    
Mozilla Firefox (x64 pt-BR)              ARP\Machine\X64\Mozilla Firefox          147.0.3                        
Mozilla Maintenance Service              ARP\Machine\X64\MozillaMaintenanceServiÔÇª 129.0.2                        
Notepad++ (64-bit x64)                   Notepad++.Notepad++                      8.8.5            8.9.5         winget
Microsoft 365 - en-us                    ARP\Machine\X64\O365HomePremRetail - enÔÇª 16.0.19929.20172               
Microsoft 365 - pt-br                    ARP\Machine\X64\O365HomePremRetail - ptÔÇª 16.0.19929.20172               
Microsoft 365 - pt-pt                    ARP\Machine\X64\O365HomePremRetail - ptÔÇª 16.0.19929.20172               
Microsoft OneDrive                       Microsoft.OneDrive                       26.078.0426.0002               winget
Microsoft OneNote - pt-br                ARP\Machine\X64\OneNoteFreeRetail - pt-ÔÇª 16.0.19929.20172               
Microsoft OneNote - pt-pt                ARP\Machine\X64\OneNoteFreeRetail - pt-ÔÇª 16.0.19929.20172               
PostgreSQL 14                            PostgreSQL.PostgreSQL.14                 14.17-1          14.23-1       winget
PostgreSQL 17                            PostgreSQL.PostgreSQL.17                 17.4-1           17.10-1       winget
R for Windows 4.4.2                      RProject.R                               4.4.2            4.6.0         winget
R for Windows 4.4.1                      RProject.R                               4.4.1                          winget
R for Windows 4.3.2                      RProject.R                               4.3.2                          winget
R for Windows 4.1.3                      RProject.R                               4.1.3                          winget
R for Windows 4.2.0 Patched              ARP\Machine\X64\R for Windows 4.2.0 PatÔÇª 4.2.0 Patched                  
Sandboxie 5.70.12 (64-bit)               Sandboxie.Classic                        5.70.12          5.72.6        winget
Speccy                                   Piriform.Speccy                          1.33                           winget
People Playground                        ARP\Machine\X64\Steam App 1118200        Unknown                        
RetroArch                                Libretro.RetroArch                       Unknown          1.22.2        winget
Command & ConquerTM Remastered CollectiÔÇª ARP\Machine\X64\Steam App 1213210        Unknown                        
Jurassic World Evolution 2               ARP\Machine\X64\Steam App 1244460        Unknown                        
Crysis 2 Remastered                      ARP\Machine\X64\Steam App 2096600        Unknown                        
Battlefield: Bad CompanyTM 2             ARP\Machine\X64\Steam App 24960          Unknown                        
Command & ConquerTM Generals Zero Hour   ARP\Machine\X64\Steam App 2732960        Unknown                        
Fallout 4                                ARP\Machine\X64\Steam App 377160         Unknown                        
Planetary Annihilation: TITANS           ARP\Machine\X64\Steam App 386070         Unknown                        
Garry's Mod                              ARP\Machine\X64\Steam App 4000           Unknown                        
Supreme Commander 2                      ARP\Machine\X64\Steam App 40100          Unknown                        
Wallpaper Engine                         ARP\Machine\X64\Steam App 431960         Unknown                        
ICEY                                     ARP\Machine\X64\Steam App 553640         Unknown                        
Just Cause 2                             ARP\Machine\X64\Steam App 8190           Unknown                        
SumatraPDF                               SumatraPDF.SumatraPDF                    3.5.2            3.6.1         winget
TeX Live 2024                            ARP\Machine\X64\TeXLive2024              2024                           
TeX Live 2025                            ARP\Machine\X64\TeXLive2025              2025                           
TeXstudio - TeXstudio is a fully featurÔÇª TeXstudio.TeXstudio                      4.8.8            4.9.4         winget
VLC media player                         VideoLAN.VLC                             3.0.21           3.0.23        winget
WinMerge x64                             ARP\Machine\X64\WinMerge_is1             2.16.50.0                      
WinRAR 7.13 (64-bit)                     RARLab.WinRAR                            7.13.0           7.22.0        winget
WizTree v4.26                            AntibodySoftware.WizTree                 4.26             4.31          winget
XnView MP (x64)                          XnSoft.XnViewMP                          1.9.3.0          1.11.2.0      winget
pgAdmin 4 version 9.11                   PostgreSQL.pgAdmin                       9.11             9.15          winget
Inkscape                                 Inkscape.Inkscape                        1.4.2            1.4.4         winget
OpenVPN Connect                          OpenVPNTechnologies.OpenVPNConnect       3.7.3            3.8.0         winget
SharpKeys                                XPFFCG7M673D4F                           3.9.4000                       msstoÔÇª
GitHub CLI                               GitHub.cli                               2.78.0           2.92.0        winget
Free Download Manager                    SoftDeluxe.FreeDownloadManager           6.33.1.6648      6.34.0.6878   winget
Microsoft ODBC Driver 17 for SQL Server  Microsoft.msodbcsql.17                   17.10.6.1        17.11.1.1     winget
IIS 10.0 Express                         ARP\Machine\X64\{0F4F67F8-21E1-422D-B31ÔÇª 10.0.10007                     
Microsoft Visual Studio Code Insiders    Microsoft.VisualStudioCode.Insiders      1.122.0                        winget
Microsoft Visual Studio Code Insiders (ÔÇª Microsoft.VisualStudioCode.Insiders      1.109.0                        winget
Google Chrome                            Google.Chrome                            148.0.7778.179                 winget
Microsoft Visual C++ 2010  x64 RedistriÔÇª Microsoft.VCRedist.2010.x64              10.0.40219                     winget
Warsaw 2.50.1.6 64 bits                  ARP\Machine\X64\{20E60725-16C8-4FB9-8BCÔÇª 2.50.1.6                       
Oracle VirtualBox 7.2.0                  Oracle.VirtualBox                        7.2.0            7.2.8         winget
Paint.NET                                dotPDN.PaintDotNet                       5.1.9            5.1.12        winget
PDF24 Creator                            geeksoftwareGmbH.PDF24Creator            11.30.1                        winget
PowerToys (Preview) x64                  Microsoft.PowerToys                      0.94.0           0.99.1        winget
Windows Subsystem for Linux WSLg Preview ARP\Machine\X64\{3CBDE512-7510-4F90-B1CÔÇª 1.0.27                         
NVIDIA Nsight Systems 2023.4.4           ARP\Machine\X64\{3DC5F45D-5558-4881-B1CÔÇª 23.4.4.54                      
Microsoft SQL Server 2012 Native Client  Microsoft.SQLServer.2012.NativeClient    11.3.6518.0      11.4.7001.0   winget
NVIDIA Nsight Visual Studio Edition 202ÔÇª ARP\Machine\X64\{489EAF09-EE75-4D7A-925ÔÇª 25.3.1.25227                   
DB Browser for SQLite                    DBBrowserForSQLite.DBBrowserForSQLite    3.13.1                         winget
NVIDIA Nsight Systems 2025.3.2           ARP\Machine\X64\{57C828D3-F42C-4025-BD3ÔÇª 25.3.2.474                     
Pandoc 3.8                               JohnMacFarlane.Pandoc                    3.8              3.9.0.2       winget
Microsoft Visual C++ 2008 RedistributabÔÇª Microsoft.VCRedist.2008.x64              9.0.30729.6161                 winget
Microsoft System CLR Types para SQL SerÔÇª ARP\Machine\X64\{603A69EA-0AB6-4AED-8C2ÔÇª 15.0.2000.5                    
grepWin x64                              StefansTools.grepWin                     2.1.1429         2.1.1434      winget
Azure Data Studio                        Microsoft.Azure.DataStudio               1.44.0           1.52.0        winget
Git Extensions 5.2.1.18061               GitExtensionsTeam.GitExtensions          5.2.1.18061      6.0.5.18375   winget
Google Drive                             Google.GoogleDrive                       125.0.0.0                      winget
Microsoft Visual Studio Installer        ARP\Machine\X64\{6F320B93-EE3C-4826-85EÔÇª 4.0.2153.56108                 
Avell Custom Control                     ARP\Machine\X64\{6ea3ce12-b991-4b65-9f8ÔÇª 3.24.40.0                      
Java 8 Update 461 (64-bit)               Oracle.JavaRuntimeEnvironment            8.0.4610.11      8.0.4910.10   winget
Java 8 Update 461                        Oracle.JavaRuntimeEnvironment            8.0.4610.11                    winget
CMake                                    Kitware.CMake                            4.1.1            4.3.3         winget
Microsoft OLE DB Driver for SQL Server   Microsoft.SQLServer.OLEDBDriver          18.7.4.0         19.4.1.0      winget
Microsoft Azure Libraries for .NET ÔÇô v2ÔÇª ARP\Machine\X64\{7D1D9444-B5EA-4587-A81ÔÇª 3.0.2404.2502                  
PowerShell 7-x64                         Microsoft.PowerShell                     7.6.1.0          7.6.2.0       winget
PowerShell 7.5.5.0-x64                   Microsoft.PowerShell                     7.5.5.0                        winget
SSHFS-Win 2021.1 Beta2 (x64)             ARP\Machine\X64\{800C57D0-F34A-4755-A08ÔÇª 3.7.21011                      
Synology Drive Client                    ARP\Machine\X64\{8150E344-BDCC-4EE2-B5EÔÇª 7.5.2.16111                    
Microsoft MPI (10.1.12498.18)            Microsoft.msmpi                          10.1.12498.18    10.1.12498.52 winget
AWS Command Line Interface v2            Amazon.AWSCLI                            2.34.52.0        2.34.53       winget
Microsoft Azure Authoring Tools - v2.9.7 ARP\Machine\X64\{90462BD2-DF5B-449C-A40ÔÇª 2.9.8999.45                    
NVIDIA Nsight Compute 2025.3.1           ARP\Machine\X64\{958FF0E3-7837-4106-B52ÔÇª 25.3.1.0                       
WebP Codec for Windows 0.19              ARP\Machine\X64\{9D2F4EB8-98AD-4C8B-A0CÔÇª 0.19.9                         
Revo Uninstaller 2.4.5                   RevoUninstaller.RevoUninstaller          2.4.5                          winget
Microsoft SQL Server 2016 LocalDB        ARP\Machine\X64\{A418D94A-2814-49E8-A83ÔÇª 13.1.4001.0                    
```

### WSL distros

```text
    N A M E                             S T A T E                       V E R S I O N 
 
 *   U b u n t u - 2 2 . 0 4             S t o p p e d                   2 
 
     d o c k e r - d e s k t o p         S t o p p e d                   2 
 
 
```

## Suggested backup.ps1 changes

Review before applying. Sensitive paths should only go to encrypted backups.

```powershell
Copy-BackupItem -Source "%APPDATA%\texstudio" -RootName "user-preferences"
Copy-BackupItem -Source "%APPDATA%\pgAdmin" -RootName "user-preferences"
Copy-BackupItem -Source "%USERPROFILE%\.codex" -RootName "user-preferences"
Copy-BackupItem -Source "%USERPROFILE%\.ipython" -RootName "user-preferences"
Copy-BackupItem -Source "%USERPROFILE%\.jupyter" -RootName "user-preferences"
Copy-BackupItem -Source "%APPDATA%\NuGet\NuGet.Config" -RootName "user-preferences"
Copy-BackupItem -Source "%APPDATA%\pdm" -RootName "user-preferences"
Copy-BackupItem -Source "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -RootName "user-preferences"
Copy-BackupItem -Source "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" -RootName "user-preferences"
```

## Suggested inventory commands

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\dev-setup" | Out-Null
if (Get-Command code -ErrorAction SilentlyContinue) { code --list-extensions | Sort-Object | Set-Content "$env:USERPROFILE\dev-setup\vscode-extensions.txt" -Encoding UTF8 }
if (Get-Command pyenv -ErrorAction SilentlyContinue) { pyenv versions | Set-Content "$env:USERPROFILE\dev-setup\pyenv-versions.txt" -Encoding UTF8 }
if (Get-Command pdm -ErrorAction SilentlyContinue) { pdm --version | Set-Content "$env:USERPROFILE\dev-setup\pdm-version.txt" -Encoding UTF8 }
if (Get-Command gh -ErrorAction SilentlyContinue) { gh auth status 2>&1 | Set-Content "$env:USERPROFILE\dev-setup\gh-auth-status.txt" -Encoding UTF8 }
```

## Caution

- Do not upload this report publicly if -IncludeSensitiveDetails was used.
- Backups containing SSH, cloud CLI, rclone, Docker, database, VPN, WinAuth, or AI assistant auth state should be encrypted.
- Avoid restoring large app state blindly across Windows versions; prefer explicit import/export when available.
