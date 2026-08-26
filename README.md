# orien-config

> Personal Linux configuration, machine snapshots, and migration notes.

Private repository for my CachyOS + Hyprland setup, managed with **chezmoi**.

The important design choice here is that this is **not** a blind copy of `$HOME` or `/etc`. The repository records what is worth preserving, while keeping runtime state, credentials, and hardware-specific assumptions separated from the portable parts.

---

## Repository layout

```text
orien-config/
├── dot_config/             # chezmoi-managed user configuration
├── dot_local/              # personal scripts
├── dot_gitconfig           # Git configuration
├── dot_zshrc               # Zsh configuration
├── dot_zshenv              # Zsh environment
├── packages/               # package inventory + notes
├── machine/                # machine-specific system snapshots
└── README.md
```

### `dot_*` — user configuration

This is the configuration that is useful to preserve as part of my personal environment:

- Zsh and Git
- Ghostty, Starship, Fastfetch, Cava, Yazi
- Neovim
- Swappy
- Keyd user mappings
- Spotify / Spicetify configuration
- Caelestia / Hyprland personal overrides
- personal screenshot scripts

**Important:** not every file under `dot_config/` is universally portable. In particular, the Caelestia / Hyprland overrides contain current machine and desktop-stack assumptions such as monitor names, NVIDIA environment settings, and the current Caelestia integration. Those should be adapted rather than blindly copied when moving to another desktop setup (for example, Omarchy).

### `machine/` — hardware/system snapshot

`machine/` preserves system-level configuration for this Lenovo Legion machine, including:

- Legion power/profile configuration
- Legion audio kernel/module quirks
- global Keyd device configuration
- kernel module loading
- systemd services and timers
- logind configuration
- Ollama service configuration

These files are **reference snapshots**, not a generic cross-machine install layer.

See [`machine/README.md`](machine/README.md) before applying anything from this directory.

### `packages/` — what is installed

```text
packages/
├── pacman-explicit.txt   # explicitly installed packages
├── aur.txt               # foreign / AUR packages
└── README.md             # package and migration notes
```

These are inventories, not yet an automated bootstrap script.

---

## What is intentionally not here

The repository deliberately avoids copying application/runtime state wholesale.

Examples:

- `~/.config/zen/` — browser migration is a separate task
- `~/.config/spotify/prefs` — account/session state
- caches, histories, databases, cookies, and similar runtime data
- `~/Programs/` — personal coding projects
- old migration/back-up directories
- unused personal systemd units
- unreliable/unused configuration such as the old Zellij setup

The rule is simple: **preserve configuration, not accidental state.**

---

## Current migration philosophy

This repository exists first as a **known-good recovery snapshot**.

It is intentionally *not* a one-command rebuild system yet.

When the machine eventually moves to another OS or desktop stack, the process should be:

```text
fresh OS / desktop
        ↓
install required packages
        ↓
restore the genuinely portable user config
        ↓
adapt desktop-specific config
        ↓
apply machine-specific hardware fixes
        ↓
migrate application-specific state selectively
        ↓
verify
```

That separation is intentional. It prevents a migration from recreating every workaround that accumulated on the previous installation.

---

## Current status

Captured and backed up:

- portable user configuration
- current Caelestia / Hyprland personal configuration
- Legion machine-level snapshots
- pacman and AUR package inventories
- Git history
- private GitHub remote

Intentionally deferred:

- full bootstrap / reinstall automation
- Zen migration
- further desktop cosmetic experimentation

Those can be added when there is an actual migration to perform.

---

## Tooling

The user configuration is managed with [chezmoi](https://www.chezmoi.io/).

The repository itself is a normal Git repository hosted privately on GitHub.

Remote:

```text
Deepnar/orien-config
```

---

## Git history

The repository is built in layers so the history explains what was captured and why:

```text
Initial chezmoi snapshot
        ↓
Add machine-specific configuration
        ↓
README / documentation improvements
        ↓
future migration or automation work
```

---

## License

Personal configuration. Use or adapt at your own risk; some files are specific to my hardware and current desktop stack.
